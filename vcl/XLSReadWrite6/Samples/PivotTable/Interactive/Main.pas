unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Tabs, XLSGrid5, XLSReadWriteII5, Grids, FormSelectArea,
  XLSRelCells5, XLSPivotTables5, FormPivotTable, XLSSheetData5;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    XLSGrid: TXLSGrid;
    Button2: TButton;
    Button3: TButton;
    btnEditPivot: TButton;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure XLSGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnEditPivotClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    FSrcRef       : TXLSRelCells;
    FFrmPivotTable: TfrmPivotTable;

    procedure TryEditPivotTable(ACol,ARow: integer);
    procedure CreateSampleData;
    procedure PivotTableChanged(ASender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

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

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.CreateSampleData;
var
  i: integer;
  p: integer;
  n: integer;
  d: TDateTime;
begin
  RandSeed := 100;

  XLSGrid.XLS[0].AsString[0,0] := 'Order No.';
  XLSGrid.XLS[0].AsString[1,0] := 'Date';
  XLSGrid.XLS[0].AsString[2,0] := 'Product';
  XLSGrid.XLS[0].AsString[3,0] := 'Ammount';
  XLSGrid.XLS[0].AsString[4,0] := 'Weight';
  XLSGrid.XLS[0].AsString[5,0] := 'Country';
  XLSGrid.XLS[0].AsString[6,0] := 'Tasty';
  XLSGrid.XLS[0].AsString[7,0] := 'Reseller';

  d := Date - (SAMPLE_REC_COUNT / 10);

  for i := 1 to SAMPLE_REC_COUNT do begin
    p := Random(Length(SamplePets));
    n := Random(90) + 11;
    d := d + Int(Random(4) / 3);

    XLSGrid.XLS[0].AsInteger[0,i] := i * 1000;
    XLSGrid.XLS[0].AsDateTime[1,i] := d;
    XLSGrid.XLS[0].AsString[2,i] := SamplePets[p].Name;
    XLSGrid.XLS[0].AsFloat[3,i] := SamplePets[p].Price * n;
    XLSGrid.XLS[0].AsFloat[4,i] := SamplePets[p].AveWeight * (Random(200) / 100) * n;
//    XLSGrid.XLS[0].AsFloat[3,i] := i;
//    XLSGrid.XLS[0].AsFloat[4,i] := 10 * i;
    XLSGrid.XLS[0].AsString[5,i] := SampleCountries[Random(Length(SampleCountries))];
    XLSGrid.XLS[0].AsBoolean[6,i] := Boolean(Random(2));
    XLSGrid.XLS[0].AsString[7,i] := SampleReseller[Random(Length(SampleReseller))];
  end;

  FSrcRef.SetArea(0,0,7,SAMPLE_REC_COUNT);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  CreateSampleData;
  XLSGrid.XLSChanged;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  dlgOpen.Filter := XLSExcelFilesFilter;
  dlgSave.Filter := XLSExcelFilesFilter;

  FSrcRef := XLSGrid.XLS[0].CreateRelativeCells;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
//  FSrcRef.Free;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  Sheet : TXLSWorksheet;
  PFrm  : TfrmPivotTable;
  Pivot : TXLSPivotTable;
  DstRef: TXLSRelCells;
begin
  if TfrmSelectArea.Create(Self).Execute(FSrcRef) then begin
    XLSGrid.XLS.Add;

    Sheet := XLSGrid.XLS[XLSGrid.XLS.Count - 1];

    DstRef := Sheet.CreateRelativeCells(0,2);

    Pivot := Sheet.PivotTables.CreateTable(FSrcRef,DstRef);

    XLSGrid.XLS.SelectedTab := Sheet.Index;

    PFrm := TfrmPivotTable.Create(Self);
    Pfrm.Execute(Pivot,Left + XLSGrid.Width - Pfrm.Width,Top,PivotTableChanged);
  end;
end;

procedure TfrmMain.PivotTableChanged(ASender: TObject);
begin
  XLSGrid.XLSChanged;
end;

procedure TfrmMain.XLSGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  btnEditPivot.Enabled := XLSGrid.Sheet.PivotTables.Hit(ACol - 1,ARow - 1) <> Nil;
end;

procedure TfrmMain.btnEditPivotClick(Sender: TObject);
begin
  TryEditPivotTable(XLSGrid.Col - 1,XLSGrid.Row - 1);
end;

procedure TfrmMain.TryEditPivotTable(ACol, ARow: integer);
var
  Pivot: TXLSPivotTable;
begin
  if FindComponent('FrmPivotTable') = Nil then begin
    Pivot := XLSGrid.Sheet.PivotTables.Hit(ACol,ARow);

    if Pivot <> Nil then begin
      FFrmPivotTable := TfrmPivotTable.Create(Self);
      FFrmPivotTable.Execute(Pivot,Left + XLSGrid.Width - FFrmPivotTable.Width,Top,PivotTableChanged);
    end;
  end;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  dlgOpen.FileName := XLSGrid.XLS.Filename;

  if dlgOpen.Execute then begin
    XLSGrid.XLS.Filename := dlgOpen.FileName;
    XLSGrid.XLS.Read;
  end;
end;

procedure TfrmMain.Button5Click(Sender: TObject);
begin
  dlgSave.FileName := XLSGrid.XLS.Filename;

  if dlgSave.Execute then begin
    XLSGrid.XLS.Filename := dlgSave.FileName;
    XLSGrid.XLS.Write;
  end;
end;

end.
