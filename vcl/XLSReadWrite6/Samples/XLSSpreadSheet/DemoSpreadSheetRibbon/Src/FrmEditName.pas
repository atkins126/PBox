unit FrmEditName;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Xc12Utils5, Xc12DataWorkbook5, XLSUtils5, XLSNames5, XLSSheetData5, XLSReadWriteII5;

type
  TfrmName = class(TForm)
    btnCancel: TButton;
    btnOk: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edName: TEdit;
    cbScope: TComboBox;
    memComment: TMemo;
    edRefersTo: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FXLS: TXLSReadWriteII5;
    FEditName: TXc12DefinedName;

    procedure FillSheets;
    function SaveName: boolean;
  public
    function Execute(AXLS: TXLSReadWriteII5; ASheet: TXLSWorksheet; AName: TXc12DefinedName): boolean;
  end;

implementation

{$R *.dfm}

{ TfrmName }

function TfrmName.Execute(AXLS: TXLSReadWriteII5; ASheet: TXLSWorksheet; AName: TXc12DefinedName): boolean;
var
  i: integer;
begin
  FXLS := AXLS;
  FEditName := AName;

  FillSheets;

  cbScope.Enabled := FEditName = Nil;
  if FEditName <> Nil then begin
    edName.Text := FEditName.Name;
    memComment.Lines.Text := FEditName.Comment;
    edRefersTo.Text := TXLSName(FEditName).Definition;
  end
  else if (ASheet <> Nil) and (ASheet.SelectedAreas.Count > 0) then
    edRefersTo.Text := ASheet.Name + '!' + ASheet.SelectedAreas.Last.AsStringAbs;

  ShowModal;

  Result := ModalResult = mrOk;
end;

procedure TfrmName.FillSheets;
var
  i: integer;
begin
  cbScope.Items.Add('Workbook');

  for i := 0 to FXLS.Count - 1 do
    cbScope.Items.Add(FXLS[i].Name);

  if (FEditName <> Nil) and (FEditName.LocalSheetId >= 0) and (FEditName.LocalSheetId < cbScope.Items.Count) then
    cbScope.ItemIndex := FEditName.LocalSheetId + 1
  else
    cbScope.ItemIndex := 0;
end;

procedure TfrmName.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (ModalResult = mrOk) and not SaveName then
    Action := caNone
  else
    Action := caFree;
end;

function TfrmName.SaveName: boolean;
var
  S: AxUCString;
  Name: TXLSName;
begin
  Result := False;
  S := Trim(edName.Text);
  if S = '' then
    MessageDlg('Name is missing.',mtError,[mbOk],0)
  else if not (S[1] in ['a'..'z','A'..'Z']) then
    MessageDlg('Name must start with a letter or underscore.',mtError,[mbOk],0)
  else if (FEditName = Nil) and (FXLS.Names.Find(S) <> Nil) then
    MessageDlg('Name "' + S + '" is allready defined.',mtError,[mbOk],0)
  else if (FEditName <> Nil) and not SameText(S,FEditName.Name) and (FXLS.Names.Find(S) <> Nil) then
    MessageDlg('Name "' + S + '" is allready defined.',mtError,[mbOk],0)
  else begin
    if FEditName <> Nil then begin
      Name := TXLSName(FEditName);
      if S <> Name.Name then
        Name.Name := S;
      Name.Comment := memComment.Text;
      Name.Definition := edRefersTo.Text;
    end
    else begin
      if cbScope.ItemIndex > 0 then
        Name := FXLS.Names.Add(S,edRefersTo.Text,cbScope.ItemIndex - 1)
      else
        Name := FXLS.Names.Add(S,edRefersTo.Text);
      Name.Comment := memComment.Text;
    end;
    Result := True;
  end;
end;

end.
