unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,
  Dialogs, StdCtrls, Grids, XLSRelCells5, XLSPivotTables5, XLSSheetData5,
  XLSReadWriteII5, ComCtrls;

type
  TForm1 = class(TForm)
    btnClose: TButton;
    btnCreateData: TButton;
    btnCreatePivotTable: TButton;
    btnCreatePivotTableResult: TButton;
    Button1: TButton;
    dlgSave: TSaveDialog;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button4: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCreateDataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCreatePivotTableClick(Sender: TObject);
    procedure btnCreatePivotTableResultClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    FXLS       : TXLSReadWriteII5;
    FPivotSheet: TXLSWorkSheet;
    FPivot     : TXLSPivotTable;
    FSrcRef    : TXLSRelCells;
    FDstRef    : TXLSRelCells;

    procedure CreateSampleData;
    procedure CreatePivotTableObj;
    procedure CreatePivotTableResult;
    procedure SetFields;
    procedure SetFilter;
    procedure SetFunction;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

const SAMPLE_REC_COUNT = 1000;

type TSamplePet = record
     Name: string;
     Price: double;
     AveWeight: double;
     end;

const SamplePets: array [0..5] of TSamplePet = (
(Name: 'Guinea pig'; Price: 25.0; AveWeight: 1.8),
(Name: 'Cat'; Price: 850.0; AveWeight: 3.4),
(Name: 'Mouse'; Price: 2.0; AveWeight: 0.05),
(Name: 'Quokka'; Price: 230.0; AveWeight: 2.8),
(Name: 'Musk rat'; Price: 75.0; AveWeight: 3.7),
(Name: 'Lemming'; Price: 14.0; AveWeight: 0.12));

const SampleCountries: array[0..6] of string = ('Australia','Norway','Afghanistan','Uganda','Malta','France','China');
const SampleReseller: array[0..4] of string = ('Alpha','Beta','Gamma','Delta','Epsilon');


{$R *.dfm}

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnCreateDataClick(Sender: TObject);
begin
  CreateSampleData;
end;

procedure TForm1.CreateSampleData;
var
  i: integer;
  p: integer;
  n: integer;
  d: TDateTime;
begin
  RandSeed := 100;

  FXLS[0].AsString[0,0] := 'Order No.';
  FXLS[0].AsString[1,0] := 'Date';
  FXLS[0].AsString[2,0] := 'Product';
  FXLS[0].AsString[3,0] := 'Ammount';
  FXLS[0].AsString[4,0] := 'Weight';
  FXLS[0].AsString[5,0] := 'Country';
  FXLS[0].AsString[6,0] := 'Tasty';
  FXLS[0].AsString[7,0] := 'Reseller';

  d := Date - (SAMPLE_REC_COUNT / 10);

  for i := 1 to SAMPLE_REC_COUNT do begin
    p := Random(Length(SamplePets));
    n := Random(90) + 11;
    d := d + Int(Random(4) / 3);

    FXLS[0].AsInteger[0,i] := i * 1000;
    FXLS[0].AsDateTime[1,i] := d;
    FXLS[0].AsString[2,i] := SamplePets[p].Name;
    FXLS[0].AsFloat[3,i] := SamplePets[p].Price * n;
    FXLS[0].AsFloat[4,i] := SamplePets[p].AveWeight * (Random(200) / 100) * n;
//    FXLS[0].AsFloat[3,i] := i;
//    FXLS[0].AsFloat[4,i] := 10 * i;
    FXLS[0].AsString[5,i] := SampleCountries[Random(Length(SampleCountries))];
    FXLS[0].AsBoolean[6,i] := Boolean(Random(2));
    FXLS[0].AsString[7,i] := SampleReseller[Random(Length(SampleReseller))];
  end;

  FXLS.CalcDimensions;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FXLS := TXLSReadWriteII5.Create(Nil);

  dlgSave.Filter := XLSExcelFilesFilter;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FXLS.Free;
end;

procedure TForm1.btnCreatePivotTableClick(Sender: TObject);
begin
  CreatePivotTableObj;
end;

procedure TForm1.CreatePivotTableObj;
begin
  FSrcRef := FXLS[0].CreateRelativeCells(0,0,FXLS[0].LastCol,FXLS[0].LastRow);

  FXLS.Add;

  FPivotSheet := FXLS[FXLS.Count - 1];

  FPivotSheet.CalcDimensions;

  FDstRef := FPivotSheet.CreateRelativeCells(0,2);

  FPivot := FPivotSheet.PivotTables.CreateTable(FSrcRef,FDstRef);
end;

procedure TForm1.CreatePivotTableResult;
begin
  FPivot.Make;

  FPivotSheet.CalcDimensions;
end;

procedure TForm1.btnCreatePivotTableResultClick(Sender: TObject);
begin
  CreatePivotTableResult;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  dlgSave.FileName := FXLS.Filename;
  if dlgSave.Execute then begin
    FXLS.Filename := dlgSave.FileName;
    FXLS.Write;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SetFilter;
end;

procedure TForm1.SetFilter;
begin
  // Filter on field #5 (country). Add all values (countries) that shall be
  // included in the report.
  FPivot.Fields[5].Filter.Add('Australia');
  FPivot.Fields[5].Filter.Add('Uganda');
  FPivot.Fields[5].Filter.Add('France');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  SetFunction;
end;

procedure TForm1.SetFunction;
begin
  FPivot.DataValues[0].Func := xpfCount;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  SetFields;
end;

procedure TForm1.SetFields;
begin
  // Tasty
  FPivot.RowLabels.Add(FPivot.Fields[6]);
  // Country
  FPivot.RowLabels.Add(FPivot.Fields[5]);
  // Product
  FPivot.ColumnLabels.Add(FPivot.Fields[2]);
  // Ammount
//  FPivot.DataValues.Add(FPivot.Fields[3]);
  // Weight
  FPivot.DataValues.Add(FPivot.Fields[4]);
end;

end.
