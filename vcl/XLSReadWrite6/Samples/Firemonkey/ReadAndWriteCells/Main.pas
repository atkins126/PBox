unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  XLSSheetData5, XLSReadWriteII5, FMX.Edit, System.Rtti, FMX.Layouts, FMX.Grid,
  FMX.ListBox, IniFiles, Math;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    btnSheet: TButton;
    edFilenameRead: TEdit;
    Button3: TButton;
    dlgOpen: TOpenDialog;
    Grid: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    StringColumn11: TStringColumn;
    StringColumn12: TStringColumn;
    StringColumn13: TStringColumn;
    StringColumn14: TStringColumn;
    StringColumn15: TStringColumn;
    StringColumn16: TStringColumn;
    Label1: TLabel;
    cbSheets: TComboBox;
    edFilenameWrite: TEdit;
    btnWrite: TButton;
    Button2: TButton;
    dlgSave: TSaveDialog;
    XLS: TXLSReadWriteII5;
    procedure Button1Click(Sender: TObject);
    procedure btnSheetClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbSheetsClosePopup(Sender: TObject);
    procedure GridEditingDone(Sender: TObject; const Col, Row: Integer);
    procedure btnWriteClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure SetupGrid;
    procedure FillSheetNames;
    procedure FillGrid(ASheet: integer);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XLS.Filename := edFilenameWrite.Text;
  XLS.Write;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  dlgSave.FileName := edFilenameWrite.Text;
  if dlgSave.Execute then
    edFilenameWrite.Text := dlgSave.FileName;
end;

procedure TfrmMain.btnSheetClick(Sender: TObject);
begin
  XLS.Filename := edFilenameRead.Text;
  XLS.Read;

  FillSheetNames;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  dlgOpen.FileName := edFilenameRead.Text;
  if dlgOpen.Execute then
    edFilenameRead.Text := dlgOpen.FileName;
end;

procedure TfrmMain.cbSheetsClosePopup(Sender: TObject);
begin
  FillGrid(cbSheets.ItemIndex);
end;

procedure TfrmMain.FillGrid(ASheet: integer);
var
  C,R: integer;
  Sheet: TXLSWorkSheet;
begin
  Sheet := XLS[ASheet];

  for R := 0 to Min(Grid.RowCount - 1,Sheet.LastRow) do begin
    for C := 0 to Min(Grid.ColumnCount - 1,Sheet.LastCol) do begin
      Grid.Cells[C,R] := Sheet.AsString[C,R];
    end;
  end;
  Grid.Repaint;
end;

procedure TfrmMain.FillSheetNames;
var
  i: integer;
begin
  cbSheets.Clear;

  for i := 0 to XLS.Count - 1 do
    cbSheets.Items.Add(XLS[i].Name);
  cbSheets.ItemIndex := 0;

  FillGrid(cbSheets.ItemIndex);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create('Baboon.ini');
  try
    edFilenameRead.Text := Ini.ReadString('Files','Read','');
    edFilenameWrite.Text := Ini.ReadString('Files','Write','');
  finally
    Ini.Free;
  end;

  SetupGrid;

  FillSheetNames;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create('Baboon.ini');
  try
    Ini.WriteString('Files','Read',edFilenameRead.Text);
    Ini.WriteString('Files','Write',edFilenameWrite.Text);
  finally
    Ini.Free;
  end;
end;

procedure TfrmMain.GridEditingDone(Sender: TObject; const Col, Row: Integer);
begin
  XLS[cbSheets.ItemIndex].AsString[Col,Row] := Grid.Cells[Col,Row];
end;

procedure TfrmMain.SetupGrid;
var
  C: integer;
begin
  for C := 0 to Grid.ColumnCount - 1 do
    Grid.Columns[C].Header := Char(Ord('A') + C);
end;

end.
