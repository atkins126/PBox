unit FrmPgSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls,

  Xc12Utils5, XLSSheetData5, XLSReadWriteII5, XBookUtils2;

type
  TfrmPageSetup = class(TForm)
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edMarginTop: TEdit;
    edMarginBottom: TEdit;
    edMarginRight: TEdit;
    edMarginLeft: TEdit;
    lbPageBreaks: TListBox;
    edPageBreak: TEdit;
    btnAddPageBrk: TButton;
    cbPaperSize: TComboBox;
    cbOptLeftToRight: TCheckBox;
    cbOptPotrait: TCheckBox;
    cbOptNoColor: TCheckBox;
    cbOptDraftQuality: TCheckBox;
    cbOptNotes: TCheckBox;
    cbOptRowColHeadings: TCheckBox;
    cbOptGridlines: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure btnAddPageBrkClick(Sender: TObject);
  private
    FXLS: TXLSReadWriteII5;
    FSheet: TXLSWorksheet;

    procedure Prepare;
    procedure SaveSettings;
  public
    procedure Execute(AXLS: TXLSReadWriteII5; ASheet: TXLSWorksheet);
  end;

implementation

{$R *.dfm}

procedure TfrmPageSetup.btnAddPageBrkClick(Sender: TObject);
var
  S: string;
  C,R: integer;
begin
  S := Uppercase(edPageBreak.Text);

  if RefStrToColRow(S,C,R) and (lbPageBreaks.Items.IndexOf(S) < 0) then
    lbPageBreaks.Items.Add(S);
end;

procedure TfrmPageSetup.Execute(AXLS: TXLSReadWriteII5; ASheet: TXLSWorksheet);
begin
  FXLS := AXLS;
  FSheet := ASheet;

  Prepare;

  ShowModal;

  if ModalResult = mrOk then
    SaveSettings;
end;

procedure TfrmPageSetup.Prepare;
var
  i: TXc12PaperSize;
begin
  edMarginLeft.Text := Format('%.2f',[FSheet.PrintSettings.MarginLeftCM]);
  edMarginRight.Text := Format('%.2f',[FSheet.PrintSettings.MarginRightCM]);
  edMarginTop.Text := Format('%.2f',[FSheet.PrintSettings.MarginTopCM]);
  edMarginBottom.Text := Format('%.2f',[FSheet.PrintSettings.MarginBottomCM]);

  for i := Low(TXc12PaperSize) to High(TXc12PaperSize) do
    cbPaperSize.Items.Add(PaperSizeNames[i]);

  cbPaperSize.ItemIndex := Integer(FSheet.PrintSettings.PaperSize);

  cbOptLeftToRight.Checked    := psoLeftToRight in FSheet.PrintSettings.Options;
  cbOptPotrait.Checked        := psoPortrait in FSheet.PrintSettings.Options;
  cbOptNoColor.Checked        := psoNoColor in FSheet.PrintSettings.Options;
  cbOptDraftQuality.Checked   := psoDraftQuality in FSheet.PrintSettings.Options;
  cbOptNotes.Checked          := psoNotes in FSheet.PrintSettings.Options;
  cbOptRowColHeadings.Checked := psoRowColHeading in FSheet.PrintSettings.Options;
  cbOptGridlines.Checked      := psoGridlines in FSheet.PrintSettings.Options;
end;

procedure TfrmPageSetup.SaveSettings;
var
  i: integer;
  S: string;
  C,R: integer;
begin
//  FSheet.PrintSettings.HeaderFooter.OddHeader := edHeader.Text;
//  FSheet.PrintSettings.HeaderFooter.OddFooter := edFooter.Text;
  FSheet.PrintSettings.MarginLeftCM := StrToFloatDef(edMarginLeft.Text,FSheet.PrintSettings.MarginLeftCM);
  FSheet.PrintSettings.MarginRightCM := StrToFloatDef(edMarginRight.Text,FSheet.PrintSettings.MarginRightCM);
  FSheet.PrintSettings.MarginTopCM := StrToFloatDef(edMarginTop.Text,FSheet.PrintSettings.MarginTopCM);
  FSheet.PrintSettings.MarginBottomCM := StrToFloatDef(edMarginBottom.Text,FSheet.PrintSettings.MarginBottomCM);

  for i := 0 to lbPageBreaks.Items.Count - 1 do begin
    S := lbPageBreaks.Items[i];

    if RefStrToColRow(S,C,R) then begin
      if FSheet.PrintSettings.VertPagebreaks.Find(C) = Nil then
        FSheet.PrintSettings.VertPagebreaks.Add(C);
      if FSheet.PrintSettings.HorizPagebreaks.Find(R) = Nil then
        FSheet.PrintSettings.HorizPagebreaks.Add(R);
    end;
  end;

  FSheet.PrintSettings.PaperSize := TXc12PaperSize(cbPaperSize.ItemIndex);

  if cbOptLeftToRight.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoLeftToRight];
  if cbOptPotrait.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoPortrait];
  if cbOptNoColor.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoNoColor];
  if cbOptDraftQuality.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoDraftQuality];
  if cbOptNotes.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoNotes];
  if cbOptRowColHeadings.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoRowColHeading];
  if cbOptGridlines.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoGridlines];
end;

end.
