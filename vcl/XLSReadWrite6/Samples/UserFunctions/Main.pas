unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, ShellApi, XPMan,
  // XLSReadWriteII5 units
  XLSSheetData5, XLSReadWriteII5, XLSEvaluate5, XLSEvaluateFmla5, Xc12Utils5, Xc12Manager5;

// ************************************************************************
// ******* USER FUNCTIONS SAMPLE                                    *******
// ******* Open the file TestUserFunctions.xlsx and click           *******
// ******* Calculate.                                               *******
// ************************************************************************

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    btnRead: TButton;
    edReadFilename: TEdit;
    btnDlgOpen: TButton;
    dlgSave: TSaveDialog;
    XLS: TXLSReadWriteII5;
    btnCalculate: TButton;
    XPManifest1: TXPManifest;
    dlgOPen: TOpenDialog;
    btnWrite: TButton;
    edWriteFilename: TEdit;
    btnDlgSave: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnDlgOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure XLSUserFunction(const AName: WideString; AData: TXLSUserFuncData);
    procedure btnCalculateClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnDlgSaveClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
  private
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnDlgOpenClick(Sender: TObject);
begin
  dlgSave.FileName := edReadFilename.Text;
  if dlgSave.Execute then
    edReadFilename.Text := dlgSave.FileName;
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

// !!! IMPORTANT !!! XLSReadWriteII has also an OnFunction event. This event
// is however not used and is only there for not causing errors when the
// component is updated.
//
// XLSUserFunction handles the OnUserFunction event. This event is fired when
// the calculation engine encounters a function that is not a standrad excel
// function.
// The AName parameter is the name of the function, in uppercase.
// AData is a TXLSUserFuncData object with the following methods and properties:
//
//     Number of arguments in the function.
//     function  ArgCount: integer;
//
//     The dimension of a cell reference argument.
//     AIndex is the argument index.
//     ACol1 = First column.
//     ARow1 = First row.
//     ACol2 = Last column. Same as ACol1 if the argument is a single cell.
//     ARow2 = Last row. Same as ARow1 if the argument is a single cell.
//     procedure Dimensions(const AIndex: integer; out ACol1,ARow1,ACol2,ARow2: integer);
//
//     Type of cell reference
//     AIndex is the argument index.
//     TXLSFormulaRefType can be:
//     xfrtNone = Argument is not a reference. Use the AsXXX properties to read the value.
//     xfrtRef = Argument is a single cell reference. Use the AsXXX properties to read the value.
//               The Dimension method can be used to get the cell position.
//     xfrtArea = Argument is an area cell reference. Use the AreaAsXXX properties to read the value.
//               The Dimension method can be used to get the area.
//     xfrtXArea = Argument is an external reference (worksheet).
//     property RefType[Index: integer]: TXLSFormulaRefType read GetRefType;
//
//     Type of argument (cell tyle). This property has only meaning if the
//     argument is a single cell.
//     AIndex is the argument index.
//     TXLSFormulaValueType can be:
//     xfvtFloat = Cell is a floating point value cell.
//     xfvtBoolean = Cell is a boolean value cell.
//     xfvtError = Cell is an error value cell.
//     xfvtString = Cell is a string value cell.
//     property ArgType[Index: integer]: TXLSFormulaValueType read GetArgType;
//
//     Number of columns in the argument. Most usefull if the argument is an array constant.
//     property Cols[Index: integer]: integer read GetCols;
//
//     Number of rows in the argument. Most usefull if the argument is an array constant.
//     property Rows[Index: integer]: integer read GetRows;
//
//     Returns the argument as a boolean value.
//     AIndex is the argument index.
//     If the argument not is a value or a single cell, there will be an exception.
//     Is the value not a boolean cell or value, False is returned.
//     property AsBoolean[Index: integer]: boolean read GetAsBoolean;
//
//     Returns the argument as a floating point value.
//     AIndex is the argument index.
//     If the argument not is a value or a single cell, there will be an exception.
//     Is the value not a float cell or value, zero is returned.
//     property AsFloat[Index: integer]: double read GetAsFloat;
//
//     Returns the argument as a string value.
//     AIndex is the argument index.
//     If the argument not is a value or a single cell, there will be an exception.
//     Is the value not a string cell or value, a empty string is returned.
//     property AsString[Index: integer]: AxUCString read GetAsString;
//
//     Returns the argument as an error value.
//     AIndex is the argument index.
//     If the argument not is a value or a single cell, there will be an exception.
//     Is the value not an error cell, errNA is returned.
//     property AsError[Index: integer]: TXc12CellError read GetAsError;
//
//     Returns the value of an area or array constant argument.
//     AIndex is the argument index.
//     ACol is the column.
//     ARow is the row.
//     If the argument not is an area or an array constant, there will be an exception.
//     Is the value not a boolean value, False is returned.
//     property AreaAsBoolean[Index,ACol,ARow: integer]: boolean read GetAreaAsBoolean;
//
//     Returns the value of an area or array constant argument.
//     AIndex is the argument index.
//     ACol is the column.
//     ARow is the row.
//     If the argument not is an area or an array constant, there will be an exception.
//     Is the value not a floating point value, zero is returned.
//     property AreaAsFloat[Index,ACol,ARow: integer]: double read GetAreaAsFloat;
//
//     Returns the value of an area or array constant argument.
//     AIndex is the argument index.
//     ACol is the column.
//     ARow is the row.
//     If the argument not is an area or an array constant, there will be an exception.
//     Is the value not a string value, A empty string is returned.
//     property AreaAsString[Index,ACol,ARow: integer]: AxUCString read GetAreaAsString;
//
//     Returns the value of an area or array constant argument.
//     AIndex is the argument index.
//     ACol is the column.
//     ARow is the row.
//     If the argument not is an area or an array constant, there will be an exception.
//     Is the value not an error value, errNA is returned.
//     property AreaAsError[Index,ACol,ARow: integer]: TXc12CellError read GetAreaAsError;
//
//     Sets the result as a boolean value.
//     property ResultAsBoolean: boolean write SetResultAsBoolean;
//
//     Sets the result as a floating point value.
//     property ResultAsFloat: double write SetResultAsFloat;
//
//     Sets the result as a string value.
//     property ResultAsString: AxUCString write SetResultAsString;
//
//     Sets the result as an error value.
//     property ResultAsError: TXc12CellError write SetResultAsError;

procedure TfrmMain.XLSUserFunction(const AName: WideString; AData: TXLSUserFuncData);
var
  i: integer;
  V: double;
  C,R: integer;
  C1,R1,C2,R2: integer;
begin
  if AData.ArgCount >= 1 then begin

    if AName = 'TEST_NUM_1ARG' then begin
      if AData.ArgType[0] = xfvtFloat then
        AData.ResultAsFloat := AData.AsFloat[0] * 5;
    end

    else if AName = 'TEST_NUM_5ARG' then begin
      V := 0;
      for i := 0 to AData.ArgCount - 1 do begin
        if AData.ArgType[0] = xfvtFloat then
          V := V + AData.AsFloat[i] * 5;
      end;
      AData.ResultAsFloat := V;
    end

    else if AName = 'TEST_STR_1ARG' then begin
      if AData.ArgType[0] = xfvtString then
        AData.ResultAsString := 'The pig says ' + AData.AsString[0];
    end

    else if AName = 'TEST_BOOL_1ARG' then begin
      if AData.ArgType[0] = xfvtBoolean then
        AData.ResultAsBoolean := not AData.AsBoolean[0];
    end

    else if AName = 'TEST_REF_1ARG' then begin
      if AData.ArgType[0] = xfvtFloat then
        AData.ResultAsFloat := AData.AsFloat[0] * 5;
    end

    else if AName = 'TEST_REF_5ARG' then begin
      V := 0;
      for i := 0 to AData.ArgCount - 1 do begin
        if AData.ArgType[0] = xfvtFloat then
          V := V + AData.AsFloat[i] * 5;
      end;
      AData.ResultAsFloat := V;
    end

    else if AName = 'TEST_AREA_1ARG' then begin
      V := 0;
      AData.Dimensions(0,C1,R1,C2,R2);
      for R := R1 to R2 do begin
        for C := C1 to C2 do begin
          V := V + AData.AreaAsFloat[0,C,R] * 10;
        end;
      end;
      AData.ResultAsFloat := V;
    end

    else if AName = 'TEST_AREA_4ARG' then begin
      V := 0;
      for i := 0 to AData.ArgCount - 1 do begin
        AData.Dimensions(i,C1,R1,C2,R2);
        for R := R1 to R2 do begin
          for C := C1 to C2 do begin
            V := V + AData.AreaAsFloat[i,C,R] * 10;
          end;
        end;
      end;
      AData.ResultAsFloat := V;
    end

    else if AName = 'TEST_ARRAY' then begin
      V := 0;
      for R := 0 to AData.Rows[0] - 1 do begin
        for C := 0 to AData.Cols[0] - 1 do begin
          V := V + AData.AreaAsFloat[0,C,R] * 10;
        end;
      end;
      AData.ResultAsFloat := V;
    end

    else if AName = 'TEST_MIXED' then begin
      V := 0;
      for i := 0 to AData.ArgCount - 1 do begin
        case AData.RefType[i] of
          xfrtNone: begin
            case AData.ArgType[i] of
              xfvtFloat  : V := V + AData.AsFloat[i] * 10;
              xfvtBoolean: if AData.AsBoolean[i] then V := V + 125;
              xfvtError  : ;
              xfvtString : V := V + StrToFloatDef(AData.AsString[i],0);
            end;
          end;
          xfrtRef : V := V + AData.AsFloat[i] * 10;
          xfrtArea: begin
            AData.Dimensions(i,C1,R1,C2,R2);
            for R := R1 to R2 do begin
              for C := C1 to C2 do
                V := V + AData.AreaAsFloat[i,C,R] * 10;
            end;
          end;
        end;
      end;
      AData.ResultAsFloat := V;
    end;

  end;
end;

procedure TfrmMain.btnCalculateClick(Sender: TObject);
begin
  XLS.Calculate;
end;

procedure TfrmMain.btnReadClick(Sender: TObject);
begin
  XLS.Filename := edReadFilename.Text;
  XLS.Read;
end;

procedure TfrmMain.btnDlgSaveClick(Sender: TObject);
begin
  dlgOpen.FileName := edWriteFilename.Text;
  if dlgOpen.Execute then
    edWriteFilename.Text := dlgOpen.FileName;
end;

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XLS.Filename := edWriteFilename.Text;
  XLS.Write;
end;

end.
