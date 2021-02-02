unit FrmExpHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,

  Xc12Utils5, XLSReadWriteII5, XLSExport5, XLSExportHTML5,

  StdCtrls, CheckLst;

type
  TfrmExportHTML = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    clbSheets: TCheckListBox;
    cbSimpleExport: TCheckBox;
    cbComments: TCheckBox;
    cbImages: TCheckBox;
    cbHyperlinks: TCheckBox;
    cbSeparateFiles: TCheckBox;
    cbWriteImages: TCheckBox;
    cbExportAll: TCheckBox;
    edArea: TEdit;
    dlgOpen: TOpenDialog;
    ExportHTML: TXLSExportHTML5;
    Button1: TButton;
    Button2: TButton;
    procedure cbSeparateFilesClick(Sender: TObject);
    procedure cbSimpleExportClick(Sender: TObject);
    procedure cbImagesClick(Sender: TObject);
    procedure cbExportAllClick(Sender: TObject);
  private
    procedure FillSheets;
    procedure SetOptions;
    procedure DoExport(const AFilename: string);
  public
    procedure Execute(AXLS: TXLSReadWriteII5; const AFilename: string);
  end;

var
  frmExportHTML: TfrmExportHTML;

implementation

{$R *.dfm}

{ TfrmExportHTML }

procedure TfrmExportHTML.Execute(AXLS: TXLSReadWriteII5; const AFilename: string);
begin
  ExportHTML.XLS := AXLS;
  FillSheets;

  ShowModal;

  if ModalResult = mrOk then
    DoExport(AFilename);
end;

procedure TfrmExportHTML.FillSheets;
var
  i: integer;
begin
  clbSheets.Clear;

  for i := 0 to ExportHTML.XLS.Count - 1 do begin
    clbSheets.Items.Add(ExportHTML.XLS[i].Name);
    clbSheets.Checked[i] := True;
  end;
end;

procedure TfrmExportHTML.SetOptions;
begin
  ExportHTML.HTMLOPtions := [];

  if cbComments.Checked then
    ExportHTML.HTMLOPtions := ExportHTML.HTMLOPtions + [xeohComments];
  if cbImages.Checked then
    ExportHTML.HTMLOPtions := ExportHTML.HTMLOPtions + [xeohImages];
  if cbWriteImages.Checked then
    ExportHTML.HTMLOPtions := ExportHTML.HTMLOPtions + [xeohWriteImages];
  if cbHyperlinks.Checked then
    ExportHTML.HTMLOPtions := ExportHTML.HTMLOPtions + [xeohHyperlinks];
end;

procedure TfrmExportHTML.cbSeparateFilesClick(Sender: TObject);
begin
  SetOptions;
end;

procedure TfrmExportHTML.cbSimpleExportClick(Sender: TObject);
begin
  ExportHTML.SimpleExport := cbSimpleExport.Checked;

  cbComments.Enabled := not cbSimpleExport.Checked;
  cbImages.Enabled := not cbSimpleExport.Checked;
  cbWriteImages.Enabled := not cbSimpleExport.Checked and cbImages.Checked;
  cbHyperlinks.Enabled := not cbSimpleExport.Checked;
end;

procedure TfrmExportHTML.cbImagesClick(Sender: TObject);
begin
  cbWriteImages.Enabled := cbImages.Checked;
end;

procedure TfrmExportHTML.cbExportAllClick(Sender: TObject);
begin
  edArea.Enabled := not cbExportAll.Checked;
end;

procedure TfrmExportHTML.DoExport(const AFilename: string);
var
  i: integer;
  SelectedSheets: array of integer;
  C1,R1,C2,R2: integer;
begin
  for i := 0 to clbSheets.Items.Count - 1 do begin
    if clbSheets.Checked[i] then begin
      SetLength(SelectedSheets,Length(SelectedSheets) + 1);
      SelectedSheets[High(SelectedSheets)] := i;
    end;
  end;

  // If not all sheets are selected. By default all sheets are exported.
  if Length(SelectedSheets) <  clbSheets.Items.Count then
    ExportHTML.Sheets(SelectedSheets);

  if not cbExportAll.Checked and AreaStrToColRow(edArea.Text,C1,R1,C2,R2) then begin
    ExportHTML.Col1 := C1;
    ExportHTML.Row1 := R1;
    ExportHTML.Col2 := C2;
    ExportHTML.Row2 := R2;
  end;

  ExportHTML.Filename := AFilename;
  ExportHTML.Write;
end;

end.
