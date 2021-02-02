unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, IniFiles,
  Controls, Forms, Dialogs, Xc12Utils5, XLSReadWriteII5, XLSSheetData5,
  StdCtrls, ExtCtrls, XPMan;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    btnWrite: TButton;
    edWriteFilename: TEdit;
    btnDlgSave: TButton;
    Button1: TButton;
    dlgSave: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    edHeader: TEdit;
    edFooter: TEdit;
    Button2: TButton;
    Panel2: TPanel;
    Shape1: TShape;
    edMarginTop: TEdit;
    edMarginBottom: TEdit;
    edMarginRight: TEdit;
    edMarginLeft: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbPageBreaks: TListBox;
    edPageBreak: TEdit;
    Label8: TLabel;
    btnAddPageBrk: TButton;
    XLS: TXLSReadWriteII5;
    cbPaperSize: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    cbOptLeftToRight: TCheckBox;
    cbOptPotrait: TCheckBox;
    cbOptNoColor: TCheckBox;
    cbOptDraftQuality: TCheckBox;
    cbOptNotes: TCheckBox;
    cbOptRowColHeadings: TCheckBox;
    cbOptGridlines: TCheckBox;
    XPManifest1: TXPManifest;
    procedure btnWriteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDlgSaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnAddPageBrkClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

const PaperSizeNames: array[0..68] of string = (
  'None', 'Letter', 'LetterSmall', 'Tabloid', 'Ledger', 'Legal', 'Statement',
  'Executive', 'A3', 'A4', 'A4Small', 'A5', 'B4', 'B5', 'Folio', 'Quarto',
  '10X14', '11X17', 'Note', 'Env9', 'Env10', 'Env11', 'Env12', 'Env14',
  'CSheet', 'DSheet', 'ESheet', 'EnvDL', 'EnvC5', 'EnvC3', 'EnvC4', 'EnvC6',
  'EnvC65', 'EnvB4', 'EnvB5', 'EnvB6', 'EnvItaly', 'EnvMonarch', 'EnvPersonal',
  'FanfoldUS', 'FanfoldStdGerman', 'FanfoldLglGerman', 'ISO_B4', 'JapanesePostcard',
  '9X11', '10X11', '15X11', 'EnvInvite', 'Reserved48', 'Reserved49', 'LetterExtra',
  'LegalExtra', 'TabloidExtra', 'A4Extra', 'LetterTransverse', 'A4Transverse',
  'LetterExtraTransverse', 'APlus', 'BPlus', 'LetterPlus', 'A4Plus', 'A5Transverse',
  'B5transverse', 'A3Extra', 'A5Extra', 'B5Extra', 'A2', 'A3Transverse', 'A3ExtraTransverse');



{$R *.dfm}

procedure TfrmMain.btnAddPageBrkClick(Sender: TObject);
var
  S: string;
  C,R: integer;
begin
  S := Uppercase(edPageBreak.Text);

  if RefStrToColRow(S,C,R) and (lbPageBreaks.Items.IndexOf(S) < 0) then
    lbPageBreaks.Items.Add(S);
end;

procedure TfrmMain.btnDlgSaveClick(Sender: TObject);
begin
  dlgSave.FileName := edWriteFilename.Text;
  if dlgSave.Execute then
    edWriteFilename.Text := dlgSave.FileName;
end;

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XLS.Filename := edWriteFilename.Text;
  XLS.Write;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  i: integer;
  S: string;
  C,R: integer;
begin
  XLS[0].AsString[1,1] := 'Hello, world';

  XLS[0].PrintSettings.HeaderFooter.OddHeader := edHeader.Text;
  XLS[0].PrintSettings.HeaderFooter.OddFooter := edFooter.Text;
  XLS[0].PrintSettings.MarginLeftCM := StrToFloatDef(edMarginLeft.Text,XLS[0].PrintSettings.MarginLeftCM);
  XLS[0].PrintSettings.MarginRightCM := StrToFloatDef(edMarginRight.Text,XLS[0].PrintSettings.MarginRightCM);
  XLS[0].PrintSettings.MarginTopCM := StrToFloatDef(edMarginTop.Text,XLS[0].PrintSettings.MarginTopCM);
  XLS[0].PrintSettings.MarginBottomCM := StrToFloatDef(edMarginBottom.Text,XLS[0].PrintSettings.MarginBottomCM);

  for i := 0 to lbPageBreaks.Items.Count - 1 do begin
    S := lbPageBreaks.Items[i];

    if RefStrToColRow(S,C,R) then begin
      if XLS[0].PrintSettings.VertPagebreaks.Find(C) = Nil then
        XLS[0].PrintSettings.VertPagebreaks.Add(C);
      if XLS[0].PrintSettings.HorizPagebreaks.Find(R) = Nil then
        XLS[0].PrintSettings.HorizPagebreaks.Add(R);
    end;
  end;

  XLS[0].PrintSettings.PaperSize := TXc12PaperSize(cbPaperSize.ItemIndex);

  if cbOptLeftToRight.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoLeftToRight];
  if cbOptPotrait.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoPortrait];
  if cbOptNoColor.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoNoColor];
  if cbOptDraftQuality.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoDraftQuality];
  if cbOptNotes.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoNotes];
  if cbOptRowColHeadings.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoRowColHeading];
  if cbOptGridlines.Checked then
    XLS[0].PrintSettings.Options := XLS[0].PrintSettings.Options + [psoGridlines];
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: integer;
  S: string;
  V: double;
  Ini: TIniFile;
begin
  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    edWriteFilename.Text := Ini.ReadString('Files','Write','');
  finally
    Ini.Free;
  end;

  V := 2.00;
  edMarginLeft.Text := Format('%.2f',[V]);
  edMarginRight.Text := Format('%.2f',[V]);
  edMarginTop.Text := Format('%.2f',[V]);
  edMarginBottom.Text := Format('%.2f',[V]);

  for i := 0 to High(PaperSizeNames) do
    cbPaperSize.Items.Add(PaperSizeNames[i]);

  cbPaperSize.ItemIndex := Integer(XLS.DefaultPaperSize);

  cbOptLeftToRight.Checked    := psoLeftToRight in XLS[0].PrintSettings.Options;
  cbOptPotrait.Checked        := psoPortrait in XLS[0].PrintSettings.Options;
  cbOptNoColor.Checked        := psoNoColor in XLS[0].PrintSettings.Options;
  cbOptDraftQuality.Checked   := psoDraftQuality in XLS[0].PrintSettings.Options;
  cbOptNotes.Checked          := psoNotes in XLS[0].PrintSettings.Options;
  cbOptRowColHeadings.Checked := psoRowColHeading in XLS[0].PrintSettings.Options;
  cbOptGridlines.Checked      := psoGridlines in XLS[0].PrintSettings.Options;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  S: string;
  Ini: TIniFile;
begin
  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    Ini.WriteString('Files','Write',edWriteFilename.Text);
  finally
    Ini.Free;
  end;
end;

end.
