unit FormPageSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Xc12Utils5, XLSSheetData5;

type
  TfrmPageSetup = class(TForm)
    PageControl: TPageControl;
    tsPage: TTabSheet;
    tsMargins: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edMarginTop: TEdit;
    edMarginBottom: TEdit;
    edMarginRight: TEdit;
    edMarginLeft: TEdit;
    Label1: TLabel;
    rbPortrait: TRadioButton;
    rbLandscape: TRadioButton;
    Label2: TLabel;
    cbPaperSize: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
    FSheet: TXLSWorkSheet;

    procedure LoadSettings;
    procedure SaveSettings;
  public
    function Exceute(ASheet: TXLSWorkSheet): boolean;
  end;

var
  frmPageSetup: TfrmPageSetup;

implementation

{$R *.dfm}

function TfrmPageSetup.Exceute(ASheet: TXLSWorkSheet): boolean;
var
  i: TXc12PaperSize;
begin
  FSheet := ASheet;

  for i := Low(TXc12PaperSize) to High(TXc12PaperSize) do
    cbPaperSize.Items.Add(Xc12PaperSizeNames[i]);

  LoadSettings;

  ShowModal;

  Result := MOdalResult = mrOk;

  if Result then
    SaveSettings;
end;

procedure TfrmPageSetup.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage := tsPage;
end;

procedure TfrmPageSetup.LoadSettings;
begin
  rbPortrait.Checked := psoPortrait in FSheet.PrintSettings.Options;
  rbLandscape.Checked := not (psoPortrait in FSheet.PrintSettings.Options);

  cbPaperSize.ItemIndex := Integer(FSheet.PrintSettings.PaperSize);

  edMarginLeft.Text := Format('%.1f',[FSheet.PrintSettings.MarginLeftCM]);
  edMarginRight.Text := Format('%.1f',[FSheet.PrintSettings.MarginRightCM]);
  edMarginTop.Text := Format('%.1f',[FSheet.PrintSettings.MarginTopCM]);
  edMarginBottom.Text := Format('%.1f',[FSheet.PrintSettings.MarginBottomCM]);
end;

procedure TfrmPageSetup.SaveSettings;
begin
  if rbPortrait.Checked then
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options + [psoPortrait]
  else
    FSheet.PrintSettings.Options := FSheet.PrintSettings.Options - [psoPortrait];

  FSheet.PrintSettings.PaperSize := TXc12PaperSize(cbPaperSize.ItemIndex);

  FSheet.PrintSettings.MarginLeftCM := StrToFloatDef(edMarginLeft.Text,FSheet.PrintSettings.MarginLeftCM);
  FSheet.PrintSettings.MarginRightCM := StrToFloatDef(edMarginRight.Text,FSheet.PrintSettings.MarginRightCM);
  FSheet.PrintSettings.MarginTopCM := StrToFloatDef(edMarginTop.Text,FSheet.PrintSettings.MarginTopCM);
  FSheet.PrintSettings.MarginBottomCM := StrToFloatDef(edMarginBottom.Text,FSheet.PrintSettings.MarginBottomCM);
end;

end.
