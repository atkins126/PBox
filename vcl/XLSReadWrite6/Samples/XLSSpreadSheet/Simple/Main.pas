unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XBookComponent2, XLSBook2, XPMan, IniFiles,
  Xc12Utils5, XLSCellMMU5;

type
  TfrmMain = class(TForm)
    XSS: TXLSSpreadSheet;
    Panel1: TPanel;
    btnClose: TButton;
    btnRead: TButton;
    XPManifest1: TXPManifest;
    btnWrite: TButton;
    edFilename: TEdit;
    Button3: TButton;
    dlgOpen: TOpenDialog;
    edFormula: TEdit;
    lblCell: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure XSSCellChanged(Sender: TObject; Col, Row: Integer);
    procedure btnWriteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  S: string;
  Ini: TIniFile;
begin
  XSS.XLS.Errors.SaveToList := True;

  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    edFilename.Text := Ini.ReadString('Files','Read','');
  finally
    Ini.Free;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  S: string;
  Ini: TIniFile;
begin
  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    Ini.WriteString('Files','Read',edFilename.Text);
  finally
    Ini.Free;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  dlgOpen.FileName := edFilename.Text;
  if dlgOpen.Execute then
    edFilename.Text := dlgOpen.FileName;
end;

procedure TfrmMain.btnReadClick(Sender: TObject);
begin
  XSS.Filename := edFilename.Text;
  XSS.Read;
end;

procedure TfrmMain.XSSCellChanged(Sender: TObject; Col, Row: Integer);
var
  CellType: TXLSCellType;
begin
  lblCell.Caption := ColRowToRefStr(Col,Row);

  CellType := XSS.XLSSheet.CellType[Col,Row];
  if CellType in XLSCellTypeFormulas then begin
    if XSS.XLSSheet.FormulaType[Col,Row] in [xcftArray,xcftArrayChild97,xcftArrayChild] then
      edFormula.Text := '{=' + XSS.XLSSheet.AsFormula[Col,Row] + '}'
    else if XSS.XLSSheet.FormulaType[Col,Row] in [xcftDataTable,xcftDataTableChild] then
      edFormula.Text := '{=' + XSS.XLSSheet.AsFormula[Col,Row] + '}'
    else
      edFormula.Text := '=' + XSS.XLSSheet.AsFormula[Col,Row];
  end
  else
    edFormula.Text := XSS.XLSSheet.AsString[Col,Row];
end;

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XSS.Write;
end;

end.
