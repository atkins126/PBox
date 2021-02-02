unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XLSReadWriteII5, Grids, IniFiles, Xc12Utils5,
  XLSSheetData5, XPMan;

type TDoubleArray = array of double;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    btnRead: TButton;
    btnWrite: TButton;
    edReadFilename: TEdit;
    edWriteFilename: TEdit;
    btnDlgOpen: TButton;
    btnDlgSave: TButton;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    Button1: TButton;
    Grid: TStringGrid;
    btnAddCells: TButton;
    XLS: TXLSReadWriteII5;
    XPManifest1: TXPManifest;
    procedure btnCloseClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnDlgOpenClick(Sender: TObject);
    procedure btnDlgSaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddCellsClick(Sender: TObject);
  private
    procedure AddCells;

    procedure ReadCells;
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

procedure TfrmMain.btnReadClick(Sender: TObject);
begin
  XLS.Filename := edReadFilename.Text;
  XLS.Read;

  ReadCells;
end;

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XLS.Filename := edWriteFilename.Text;
  XLS.Write;
end;

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

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.ReadCells;
var
  C,R: integer;
  Ref: string;
  Cnt: integer;
  vError: TXc12CellError;
  CellType: TXLSCellType;
begin
  Cnt := 0;
  XLS[0].CalcDimensions;
  for R := XLS[0].FirstRow to XLS[0].LastRow do begin
    for C := XLS[0].FirstCol to XLS[0].LastCol do begin
      CellType := XLS[0].CellType[C,R];
      if CellType <> xctNone then begin
        Ref := ColRowToRefStr(C,R);

        Grid.Cells[0,Cnt + 1] := Ref;

        case CellType of
          xctBlank         : begin
            Grid.Cells[1,Cnt + 1] := 'Blank';
          end;
          xctBoolean       : begin
            Grid.Cells[1,Cnt + 1] := 'Boolean';
            if XLS[0].AsBoolean[C,R] then
              Grid.Cells[2,Cnt + 1] := 'TRUE'
            else
              Grid.Cells[2,Cnt + 1] := 'FALSE';
          end;
          xctError         : begin
            Grid.Cells[1,Cnt + 1] := 'Error';
            vError := XLS[0].AsError[C,R];
            Grid.Cells[2,Cnt + 1] := Xc12CellErrorNames[vError];
          end;
          xctString        : begin
            Grid.Cells[1,Cnt + 1] := 'String';
            Grid.Cells[2,Cnt + 1] := XLS[0].AsString[C,R];
          end;
          xctFloat         : begin
            Grid.Cells[1,Cnt + 1] := 'Float';
            Grid.Cells[2,Cnt + 1] := FloatToStr(XLS[0].AsFloat[C,R]);
          end;
          xctFloatFormula  : begin
            Grid.Cells[1,Cnt + 1] := 'Formula, float';
            Grid.Cells[2,Cnt + 1] := FloatToStr(XLS[0].AsFloat[C,R]);
            Grid.Cells[3,Cnt + 1] := XLS[0].AsFormula[C,R]
          end;
          xctStringFormula : begin
            Grid.Cells[1,Cnt + 1] := 'Formula, string';
            Grid.Cells[2,Cnt + 1] := XLS[0].AsString[C,R];
            Grid.Cells[3,Cnt + 1] := XLS[0].AsFormula[C,R]
          end;
          xctBooleanFormula: begin
            Grid.Cells[1,Cnt + 1] := 'Formula, boolean';
            if XLS[0].AsBoolean[C,R] then
              Grid.Cells[2,Cnt + 1] := 'TRUE'
            else
              Grid.Cells[2,Cnt + 1] := 'FALSE';
            Grid.Cells[3,Cnt + 1] := XLS[0].AsFormula[C,R]
          end;
          xctErrorFormula  : begin
            Grid.Cells[1,Cnt + 1] := 'Formula, error';
            vError := XLS[0].AsError[C,R];
            Grid.Cells[2,Cnt + 1] := Xc12CellErrorNames[vError];
            Grid.Cells[3,Cnt + 1] := XLS[0].AsFormula[C,R]
          end;
        end;

        Inc(Cnt);
        if Cnt > Grid.RowCount then
          Exit;
      end;
    end;
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

  Grid.Cells[0,0] := 'Refrence';
  Grid.Cells[1,0] := 'Cell type';
  Grid.Cells[2,0] := 'Value';
  Grid.Cells[3,0] := 'Formula';
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

procedure TfrmMain.btnAddCellsClick(Sender: TObject);
begin
  AddCells;

  ReadCells;
end;

procedure TfrmMain.AddCells;
begin
  // Column and row references are zero-relative. Cell A1 have column 0 and row 0.

  // Add a float value in cell A1
  XLS[0].AsFloat[0,0] := 125;
  // Cell references can also be given as a string when using the AsXXXRef properties.
  XLS[0].AsFloatRef['A2'] := 250;

  // Inserting a float values in column B, starting at row 4 and continuing to row 6.
  // The array argument can be of any size.
  XLS[0].InsertFloatColValues(0,3,[10,20,30]);

  XLS[0].AsString[1,0] := 'Hello, world';
  XLS[0].AsStringRef['B2'] := 'Hello again';

  XLS[0].InsertStringColValues(1,3,['One','Two','Three']);

  XLS[0].AsBoolean[2,0] := True;
  XLS[0].AsBooleanRef['C2'] := False;

  // Adding Excel error values.
  XLS[0].AsError[2,0] := errDiv0;
  XLS[0].AsErrorRef['C2'] := errNA;

  // Adding values as variants.
  XLS[0].AsVariant[3,0] := 'Oink!';
  XLS[0].AsVariantRef['D2'] := 750.25;

  // Inserting a float values in Row 11, starting at col A and continuing to col C.
  // The array argument can be of any size.
  XLS[0].InsertFloatRowValues(0,10,[100,200,300]);

  XLS[0].InsertFloatRowValues(5,10,[1000,2000,3000]);

  // Inserting values as a variant array. The values can be numeric, string or boolean.
  // Error values are not possible as delphi will translate the error type to
  // an integer value.
  XLS[0].InsertRowValues(0,11,[1,'Two',True]);

  XLS[0].InsertColValues(6,0,[1,'Two',True]);

  // Add formulas. Formuas are entered as text strings in the same syntax as
  // in Excel.
  XLS[0].AsFormula[4,0] := 'SUM(A10:H11)';
  // Set the result of the formula (this value is wrong).
  XLS[0].AsNumFormulaValue[4,0] := 5000;
  XLS[0].AsFormulaRef['E2'] := 'MAX(A10:H11)*100';


  // Calculate the workbook. This will replace the above wrong formula result
  // with the correct value.
  // This os only of importance when working with the file in the component,
  // or possible if the file is exported to another software that don't calculate
  // formulas.
  // When the file is opened in Excel, the formulas will be recalculated.
  XLS.Calculate;

  XLS[0].CalcDimensions;
end;

end.
