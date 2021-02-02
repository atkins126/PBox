unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPMan, ShellApi, IniFiles,

  Xc12Utils5, XLSUtils5, XLSNames5, XLSSheetData5, XLSReadWriteII5;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    btnRead: TButton;
    btnWrite: TButton;
    edReadFilename: TEdit;
    edWriteFilename: TEdit;
    btnDlgOpen: TButton;
    btnDlgSave: TButton;
    btnAddNames: TButton;
    btnClose: TButton;
    Button1: TButton;
    dlgSave: TSaveDialog;
    XPManifest: TXPManifest;
    XLS: TXLSReadWriteII5;
    dlgOpen: TOpenDialog;
    btnFindName: TButton;
    lbNames: TListBox;
    procedure btnDlgOpenClick(Sender: TObject);
    procedure btnDlgSaveClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddNamesClick(Sender: TObject);
    procedure btnFindNameClick(Sender: TObject);
  private
    procedure ReadNames;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDlgOpenClick(Sender: TObject);
begin
  dlgOpen.FileName := edReadFilename.Text;
  if dlgOpen.Execute then
    edReadFilename.Text := dlgOpen.FileName;
end;

procedure TfrmMain.btnDlgSaveClick(Sender: TObject);
begin
  dlgSave.FileName := edWriteFilename.Text;
  if dlgSave.Execute then
    edWriteFilename.Text := dlgSave.FileName;
end;

procedure TfrmMain.btnReadClick(Sender: TObject);
begin
  XLS.Filename := edReadFilename.Text;
  XLS.Read;

  ReadNames;
end;

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XLS.Filename := edWriteFilename.Text;
  XLS.Write;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  ShellExecuteA(Handle,'open', 'excel.exe',PAnsiChar(AnsiString(edWriteFilename.Text)), nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.ReadNames;
var
  i: integer;
  Name: TXLSName;
begin
  lbNames.Clear;
  for i := 0 to XLS.Names.Count - 1 do begin
    Name := XLS.Names[i];
    if Name.BuiltIn = bnNone then
      lbNames.Items.Add(Name.Name + ': ' + XLS.Names[i].Definition);
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
    Ini.WriteString('Files','Read',edReadFilename.Text);
    Ini.WriteString('Files','Write',edWriteFilename.Text);
  finally
    Ini.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  S: string;
  Ini: TIniFile;
begin
  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    edReadFilename.Text := Ini.ReadString('Files','Read','');
    edWriteFilename.Text := Ini.ReadString('Files','Write','');
  finally
    Ini.Free;
  end;

end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnAddNamesClick(Sender: TObject);
var
  R: integer;
begin
  // Add some sample values.
  for R := 0 to 9 do
    XLS[0].AsFloat[1,R] := Random(1000);

  // function Add(const AName,ASheetName: AxUCString; const ACol,ARow: integer): TXLSName;
  // Add a name that is a single cell, $B$2.
  XLS.Names.Add('Name1','Sheet1',1,1);

  // function  Add(const AName,ASheetName: AxUCString; const ACol1,ARow1,ACol2,ARow2: integer): TXLSName;
  // Add a name that is an area, $B$1:$B$10
  XLS.Names.Add('Name2','Sheet1',1,0,1,9);

  // function  Add(const AName,ADefinition: AxUCString): TXLSName; overload;
  // Add a name where the definition is an expression.
  // When creating names as expressions, its important that all cell/area
  // references are absolute. If not, the result is very unpredictable when
  // the name is used.
  XLS.Names.Add('Name3','Sheet1!$B$1');
  // Add another name as an expression.
  XLS.Names.Add('Name4','Sheet1!$B$1:$B$10');
  // The expression can be any valid formula.
  XLS.Names.Add('Name5','SUM(Sheet1!$B$1:$B$10)*100');

  // Use the names.
  XLS[0].AsFormula[3,0] := 'Name1';
  XLS[0].AsFormula[3,1] := 'Name2';
  XLS[0].AsFormula[3,2] := 'Name3';
  XLS[0].AsFormula[3,3] := 'Name4';
  XLS[0].AsFormula[3,4] := 'Name5';

  // Calculate the workbook.
  XLS.Calculate;

  ReadNames;
end;

procedure TfrmMain.btnFindNameClick(Sender: TObject);
var
  S: AxUCString;
  Name: TXLSName;
begin
  // The name to search for.
  S := 'Name2';

  // Result is a TXLSName object.
  Name := XLS.Names.Find(S);
  // if not Nil, the name is found.
  if Name <> Nil then
    ShowMessage('Name "' + Name.Name + '" found. Definition: ' + Name.Definition)
  else
    ShowMessage('Name "' + S + '" not found.');
end;

end.
