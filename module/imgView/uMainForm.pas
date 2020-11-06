unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.ToolWin, db.uCommon;

type
  TfrmImageView = class(TForm)
    scrlbxImage: TScrollBox;
    img1: TImage;
    tmrImageMove: TTimer;
    pgcAll: TPageControl;
    tsBrowse: TTabSheet;
    tsView: TTabSheet;
    clbrBrowse: TCoolBar;
    tlbBrowse: TToolBar;
    mmBrowse: TMainMenu;
    mniFile1: TMenuItem;
    mniEdit1: TMenuItem;
    mniOpen1: TMenuItem;
    mniCopy1: TMenuItem;
    mmView: TMainMenu;
    mni1: TMenuItem;
    mni2: TMenuItem;
    mni3: TMenuItem;
    mni4: TMenuItem;
    tlbView: TToolBar;
    procedure img1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure img1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure img1StartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure tmrImageMoveTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPT: TPoint;
  public
    { Public declarations }
  end;

procedure db_ShowDllForm_Plugins(var frm: TFormClass; var strParentModuleName, strModuleName: PAnsiChar); stdcall;

implementation

{$R *.dfm}

procedure db_ShowDllForm_Plugins(var frm: TFormClass; var strParentModuleName, strModuleName: PAnsiChar); stdcall;
begin
  frm                     := TfrmImageView;
  strParentModuleName     := '图形图像';
  strModuleName           := '图像查看器';
  Application.Handle      := GetMainFormApplication.Handle;
  Application.Icon.Handle := GetMainFormApplication.Icon.Handle;
end;

procedure TfrmImageView.FormCreate(Sender: TObject);
begin
  pgcAll.Pages[0].TabVisible := False;
  pgcAll.Pages[1].TabVisible := False;
  pgcAll.ActivePageIndex     := 0;
end;

procedure TfrmImageView.img1DragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TfrmImageView.img1EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  tmrImageMove.Enabled := False;
end;

procedure TfrmImageView.img1StartDrag(Sender: TObject; var DragObject: TDragObject);
begin
  tmrImageMove.Enabled := True;
  FPT                  := Mouse.CursorPos;
end;

procedure TfrmImageView.tmrImageMoveTimer(Sender: TObject);
var
  pt    : TPoint;
  dx, dy: Integer;
begin
  pt := Mouse.CursorPos;
  dx := (FPT.X - pt.X) * 5 div 2; // 2.5 倍速
  dy := (FPT.Y - pt.Y) * 5 div 2; // 2.5 倍速

  if Abs(dx) >= 5 then
    scrlbxImage.HorzScrollBar.Position := scrlbxImage.HorzScrollBar.Position + Trunc(dx * 2.0);
  if Abs(dy) >= 5 then
    scrlbxImage.VertScrollBar.Position := scrlbxImage.VertScrollBar.Position + Trunc(dy * 2.0);

  FPT := pt; // 记录鼠标最后的位置
end;

end.
