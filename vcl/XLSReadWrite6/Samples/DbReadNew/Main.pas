unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReadWriteII5, DB, StdCtrls, Grids, XLSDbRead5,
  XLSSheetData5, XPMan, Datasnap.DBClient;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Grid: TDrawGrid;
    Button1: TButton;
    Button2: TButton;
    lbIncl: TListBox;
    lbExcl: TListBox;
    edIncl: TEdit;
    Button3: TButton;
    edExcl: TEdit;
    Button4: TButton;
    Button5: TButton;
    XLS: TXLSReadWriteII5;
    XLSDbRead: TXLSDbRead5;
    Button6: TButton;
    dlgSave: TSaveDialog;
    DB: TClientDataSet;
    DBFirstName: TStringField;
    DBLastName: TStringField;
    DBCompany: TStringField;
    DBAddress: TStringField;
    DBCity: TStringField;
    DBState: TStringField;
    DBZip: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure XLSDbReadDbColumn(Sender: TObject; var AColumn: Integer);
  private
    function ColToText(Col: integer): string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Grid.ColWidths[0] := 30;
end;

procedure TfrmMain.GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  S: string;
begin
  if (ACol > 0) and (ARow > 0) then begin
    S := XLS[0].AsFmtString[ACol - 1,ARow - 1];
    if S <> '' then
      Grid.Canvas.TextRect(Rect,Rect.Left + 2,Rect.Top + 2,S);
  end
  else if (ACol <> 0) then begin
    S := ColToText(ACol - 1);
    Grid.Canvas.TextRect(Rect,Rect.Left + (Rect.Right - Rect.Left) div 2 - (Grid.Canvas.TextWidth(S) div 2),Rect.Top + 2,S);
  end
  else if (ARow <> 0) then
    Grid.Canvas.TextRect(Rect,Rect.Left + 2,Rect.Top + 2,IntToStr(ARow));
end;

procedure TfrmMain.XLSDbReadDbColumn(Sender: TObject; var AColumn: Integer);
begin
  // Swap columns 0 and 1.
  case AColumn of
    0: AColumn := 1;
    1: AColumn := 0;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  lbIncl.Items.Add(edIncl.Text);
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  lbExcl.Items.Add(edExcl.Text);
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  XLS.Clear;
  XLS[0].Columns[5].NumberFormat := '# ##0.00';
  // if you get an exception here, set DB.FileName to the file Addresses.cds in the sample dir.
  Db.Active := True;
  XLSDbRead.IncludeFields.Assign(lbIncl.Items);
  XLSDbRead.ExcludeFields.Assign(lbExcl.Items);
  XLSDbRead.Read;
  Grid.Invalidate;
end;

procedure TfrmMain.Button5Click(Sender: TObject);
var
  S: string;
begin
  if dlgSave.Execute then begin
    XLS.Filename := dlgSave.Filename;
    XLS.Write;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  Close;
end;

function TfrmMain.ColToText(Col: integer): string;
var
  S: string;
begin
  if (Col div 26) > 0 then
    S := Char(Ord('A') + (Col div 26) - 1)
  else
    S := '';
  Result := S + Char(Ord('A') + (Col mod 26));
end;

procedure TfrmMain.Button6Click(Sender: TObject);
begin
  Close;
end;

end.
