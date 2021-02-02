unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XLSUtils5, XLSSheetData5, XLSPivotTables5, XLSReadWriteII5,
  XLSRelCells5;

type
  TfrmMain = class(TForm)
    btnClose: TButton;
    btnCreateData: TButton;
    btnCreatePivotTable: TButton;
    btnSaveFile: TButton;
    Label1: TLabel;
    edFilename: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    dlgSave: TSaveDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveFileClick(Sender: TObject);
    procedure btnCreateDataClick(Sender: TObject);
    procedure btnCreatePivotTableClick(Sender: TObject);
  private
    FXLS: TXLSReadWriteII5;
  public
    procedure CreateSampleData;
    procedure CreatePivotTable;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  dlgSave.FileName := edFilename.Text;
  if dlgSave.Execute then
    edFilename.Text := dlgSave.FileName;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FXLS := TXLSReadWriteII5.Create(Nil);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FXLS.Free;
end;

procedure TfrmMain.btnSaveFileClick(Sender: TObject);
begin
  FXLS.Filename := edFilename.Text;
  FXLS.Write;
end;

procedure TfrmMain.btnCreateDataClick(Sender: TObject);
begin
  CreateSampleData;
end;

procedure TfrmMain.CreateSampleData;
const
  Pets: array[0..4] of string = ('Hamster','Guinea pig','Musk rat','Cat','Hedgehog');
  Countries: array[0..4] of string = ('Norway','Uganda','New Zeeland','North Korea','Argentina');
var
  i: integer;
begin
  FXLS[0].AsString[0,0] := 'Pet';
  FXLS[0].AsString[1,0] := 'Country';
  FXLS[0].AsString[2,0] := 'Price';

  for i := 1 to 100 do begin
    FXLS[0].AsString[0,i] := Pets[Random(Length(Pets))];
    FXLS[0].AsString[1,i] := Countries[Random(Length(Countries))];
    FXLS[0].AsFloat[2,i] := 10 + Random(100);
  end;
end;

procedure TfrmMain.btnCreatePivotTableClick(Sender: TObject);
begin
  CreatePivotTable;
end;

procedure TfrmMain.CreatePivotTable;
var
  SrcRef: TXLSRelCells;
  DstRef: TXLSRelCells;
  Sheet : TXLSWorkSheet;
  PivTbl: TXLSPivotTable;
begin
  // Create relative cells for source data.
  // For more info on relative cells, see sample.
  SrcRef := FXLS[0].CreateRelativeCells(0,0,2,100);

  // Add a sheet for the pivot table.
  FXLS.Add;

  // Pivot table sheet.
  Sheet := FXLS[FXLS.Count - 1];

  // Make sure last col and row are set.
  Sheet.CalcDimensions;

  // Create relative cells for the pivot table.
  DstRef := Sheet.CreateRelativeCells(0,2);

  // Create the pivot table. This will set the Fields property of the pivot table.
  // The pivot table takes ownership of the relative cells.
  PivTbl := Sheet.PivotTables.CreateTable(SrcRef,DstRef);

  // Set row lable to field #1 (Country).
  PivTbl.RowLabels.Add(PivTbl.Fields[1]);
  // Set column lable to field #0 (Pet).
  PivTbl.ColumnLabels.Add(PivTbl.Fields[0]);
  // Set data lable to field #2 (Price).
  PivTbl.DataValues.Add(PivTbl.Fields[2]);

  // Make the table. This will calculate the table
  PivTbl.Make;

  FXLS.SelectedTab := 1;
end;

end.
