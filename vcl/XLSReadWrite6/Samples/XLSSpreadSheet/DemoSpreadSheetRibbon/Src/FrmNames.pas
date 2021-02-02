unit FrmNames;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.UITypes,
  Xc12Utils5, Xc12Manager5, Xc12DataWorkbook5, XLSUtils5, XLSNames5, XLSReadWriteII5,
  FrmEditName;

type
  TfrmNameManager = class(TForm)
    lvNames: TListView;
    btnNew: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    Label1: TLabel;
    btnEditUndo: TButton;
    btnEditOk: TButton;
    btnClose: TButton;
    edEdit: TEdit;
    procedure btnEditUndoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvNamesChanging(Sender: TObject; Item: TListItem; Change: TItemChange; var AllowChange: Boolean);
    procedure lvNamesChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure btnEditOkClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvNamesDblClick(Sender: TObject);
  private
    FXLS     : TXLSReadWriteII5;
    FManager : TXc12Manager;
    FEditCopy: AxUCString;
    FEditName: TXc12DefinedName;

    procedure FillNames;
    procedure EnableControls(AEnable: boolean);
    procedure SetItem(AName: TXc12DefinedName; AItem: TListItem);
    procedure SaveEdit;
  public
    procedure Execute(AXLS: TXLSReadWriteII5);
  end;

implementation

{$R *.dfm}

{ TfrmNameManager }

procedure TfrmNameManager.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Delete name "' + FEditName.Name + '"',mtConfirmation,mbYesNo,0) = mrYes then begin
    FXLS.Names.Delete(FEditName.Name);

    FillNames;
  end;
end;

procedure TfrmNameManager.btnEditClick(Sender: TObject);
begin
  Hide;
  if TfrmName.Create(Self).Execute(FXLS,Nil,FEditName) then
    FillNames;
  Show;
end;

procedure TfrmNameManager.btnEditOkClick(Sender: TObject);
begin
  SaveEdit;
end;

procedure TfrmNameManager.btnEditUndoClick(Sender: TObject);
begin
  edEdit.Text := FEditCopy;
end;

procedure TfrmNameManager.btnNewClick(Sender: TObject);
begin
  Hide;
  if TfrmName.Create(Self).Execute(FXLS,Nil,Nil) then
    FillNames;
  Show;
end;

procedure TfrmNameManager.EnableControls(AEnable: boolean);
begin
  btnEdit.Enabled := AEnable;
  btnDelete.Enabled := AEnable;
  btnEditOk.Enabled := AEnable;
  btnEditUndo.Enabled := AEnable;
  EdEdit.Enabled := AEnable;
end;

procedure TfrmNameManager.Execute(AXLS: TXLSReadWriteII5);
begin
  FXLS := AXLS;
  FManager := FXLS.Manager;

  FillNames;
  EnableControls(False);

  ShowModal;
end;

procedure TfrmNameManager.FillNames;
var
  i: integer;
  Name: TXc12DefinedName;
  Item: TListItem;
begin
  lvNames.Clear;
  for i := 0 to FManager.Workbook.DefinedNames.Count - 1 do begin
    Name := FManager.Workbook.DefinedNames[i];
    if not Name.Deleted then begin
      if Name.BuiltIn = bnNone then begin
        Item := lvNames.Items.Add;
        SetItem(Name,Item);
      end;
    end;
  end;
end;

procedure TfrmNameManager.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (Shift = []) then
    SaveEdit;
end;

procedure TfrmNameManager.lvNamesChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  EnableControls(lvNames.Selected <> Nil);
  if lvNames.Selected <> Nil then begin
    edEdit.Text := lvNames.Selected.SubItems[1];
    FEditCopy := lvNames.Selected.SubItems[1];
    FEditName := lvNames.Selected.Data;
  end
  else begin
    edEdit.Text := '';
    FEditCopy := '';
    FEditName := Nil;
  end;
end;

procedure TfrmNameManager.lvNamesChanging(Sender: TObject; Item: TListItem; Change: TItemChange; var AllowChange: Boolean);
begin
  if (edEdit.Text <> '') and (edEdit.Text <> FEditCopy) and (FEditName <> Nil) then begin
    if MessageDlg('Do you want to save the changes you made to the name reference?',mtInformation,mbYesNo,0) = mrYes then
      SaveEdit;
    edEdit.Text := '';
    FEditCopy := '';
    FEditName := Nil;
  end;
end;

procedure TfrmNameManager.lvNamesDblClick(Sender: TObject);
begin
  if btnEdit.Enabled then
    btnEdit.Click;
end;

procedure TfrmNameManager.SaveEdit;
begin
  if (lvNames.Selected <> Nil) and (FEditName <> Nil) then begin
    TXLSName(FEditName).Definition := Copy(edEdit.Text,2,MAXINT);
    SetItem(FEditName,lvNames.Selected);
    FEditCopy := edEdit.Text;
  end;
end;

procedure TfrmNameManager.SetItem(AName: TXc12DefinedName; AItem: TListItem);
begin
  AItem.Data := AName;
  AItem.Caption := AName.Name;
  AItem.SubItems.Clear;
  case AName.SimpleName of
    xsntNone : AItem.SubItems.Add('{...}');
    xsntRef  : AItem.SubItems.Add(FXLS[AName.SheetIndex].AsString[AName.Col1,AName.Row1]);
    xsntArea : AItem.SubItems.Add(FXLS[AName.SheetIndex].AsArray[AName.Col1,AName.Row1,AName.Col2,AName.Row2,255]);
    xsntError: AItem.SubItems.Add('#REF!');
  end;
  AItem.SubItems.Add('=' + TXLSName(AName).Definition);
  if AName.LocalSheetId >= 0 then
    AItem.SubItems.Add(FManager.Worksheets[AName.LocalSheetId].Name)
  else
    AItem.SubItems.Add('Workbook');
  AItem.SubItems.Add(AName.Comment);
end;

end.
