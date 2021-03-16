unit db.uBaseForm;

interface

uses Winapi.Windows, Winapi.Messages, System.Classes, System.SysUtils, System.StrUtils, System.Math, System.IniFiles, Vcl.Menus, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, Vcl.ExtCtrls, JvComponentBase, JvDragDrop, db.uCommon;

type
  TdbBaseForm = class(TForm)
  private
    FOnConfig                  : TNotifyEvent;
    FTopPanel                  : TPanel;
    FbMouseDown                : Boolean;
    FPT                        : TPoint;
    FbtnConfig                 : TImage;
    FbtnMin                    : TImage;
    FbtnMax                    : TImage;
    FbtnClose                  : TImage;
    FTrayIcon                  : TTrayIcon;
    FTrayIconPMenu             : TPopupMenu;
    FbMaxForm                  : Boolean;
    FTitleString               : string;
    FintOldTop, FintOldLeft    : Integer;
    FintOldWidth, FintOldHeight: Integer;
    Fjvdrgdrp                  : TJvDragDrop;
    FMulScreenPos              : Boolean;
    FbCloseToTray              : Boolean;
    procedure pnlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pnlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pnlDBLClick(Sender: TObject);
    procedure OnSysBtnMouseEnter(Sender: TObject);
    procedure OnSysBtnMouseLeave(Sender: TObject);
    procedure OnSysBtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OnSysBtnCloseClick(Sender: TObject);
    procedure OnSysBtnMaxClick(Sender: TObject);
    procedure OnSysBtnMinClick(Sender: TObject);
    procedure OnSysBtnConfigClick(Sender: TObject);
    procedure FormMaxSize; overload;
    procedure FormMaxSize(const bMul: Boolean); overload;
    procedure FormRestoreSize;
    procedure SetTitleString(const Value: string);
    procedure SetMulScreenPos(const Value: Boolean);
    function GetCloseToTray: Boolean;
    procedure SetCloseToTray(const Value: Boolean);
    procedure TrayIconDblClick(Sender: TObject);
    function GetTrayIconPMenu: TPopupMenu;
    procedure SetTrayIconPMenu(const Value: TPopupMenu);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure OnFileDrop(Sender: TObject; hwnd: THandle);
  public
    procedure LoadButtonBmp(btn: TImage; const strResName: String; const intIndex: Integer);
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property OnConfig: TNotifyEvent read FOnConfig write FOnConfig;
    property TitleString: string Read FTitleString write SetTitleString;
    property MulScreenPos: Boolean read FMulScreenPos write SetMulScreenPos;
    property CloseToTray: Boolean read GetCloseToTray write SetCloseToTray;
    property MainTrayIcon: TTrayIcon read FTrayIcon;
    property TrayIconPMenu: TPopupMenu read GetTrayIconPMenu write SetTrayIconPMenu;
    property MaxForm: Boolean read FbMaxForm;
  end;

{$R *.res}

implementation

{ TdbBaseForm }

procedure TdbBaseForm.LoadButtonBmp(btn: TImage; const strResName: String; const intIndex: Integer);
var
  bmp      : TBitmap;
  bmpButton: TBitmap;
  memBMP   : TResourceStream;
begin
  memBMP    := TResourceStream.Create(HInstance, 'SYSBUTTON_' + strResName, RT_RCDATA);
  bmp       := TBitmap.Create;
  bmpButton := TBitmap.Create;
  try
    bmp.LoadFromStream(memBMP);;
    bmpButton.Width  := bmp.Width div 3;
    bmpButton.Height := bmp.Height;
    bmpButton.Canvas.CopyRect(bmpButton.Canvas.ClipRect, bmp.Canvas, Rect(c_intButtonWidth * intIndex, 0, c_intButtonWidth * intIndex + bmpButton.Width, bmpButton.Height));
    btn.Picture.Bitmap.Assign(bmpButton);
  finally
    memBMP.Free;
    bmpButton.Free;
    bmp.Free;
  end;
end;

constructor TdbBaseForm.Create(AOwner: TComponent);
begin
  inherited;

  ChangeWindowMessageFilter(WM_DROPFILES, MSGFLT_ADD);
  ChangeWindowMessageFilter(WM_COPYDATA, MSGFLT_ADD);
  ChangeWindowMessageFilter(WM_COPYGLOBALDATA, MSGFLT_ADD);

  { 提升权限 }
  EnableDebugPrivilege('SeDebugPrivilege', True);
  EnableDebugPrivilege('SeSecurityPrivilege', True);

  BorderStyle    := bsNone;
  DoubleBuffered := True;

  FTopPanel                  := TPanel.Create(nil);
  FTopPanel.Parent           := Self;
  FTopPanel.ShowCaption      := True;
  FTopPanel.Caption          := GetTitleText;
  FTopPanel.Font.Name        := '微软雅黑';
  FTopPanel.Font.Style       := [fsbold];
  FTopPanel.Font.Color       := clWhite;
  FTopPanel.Font.Size        := 20;
  FTopPanel.Align            := alTop;
  FTopPanel.Height           := 80;
  FTopPanel.Color            := RGB(46, 141, 230);
  FTopPanel.ParentColor      := False;
  FTopPanel.ParentBackground := False;
  FTopPanel.BevelOuter       := bvNone;
  FTopPanel.OnMouseDown      := pnlMouseDown;
  FTopPanel.OnMouseUp        := pnlMouseUp;
  FTopPanel.OnMouseMove      := pnlMouseMove;
  FTopPanel.OnDblClick       := pnlDBLClick;

  FbtnClose              := TImage.Create(FTopPanel);
  FbtnClose.Parent       := FTopPanel;
  FbtnClose.Top          := 2;
  FbtnClose.Left         := FbtnClose.Parent.Width - 1 * c_intButtonWidth - 2;
  FbtnClose.AutoSize     := True;
  FbtnClose.Transparent  := False;
  FbtnClose.Hint         := '关闭';
  FbtnClose.ShowHint     := True;
  FbtnClose.Tag          := 0;
  FbtnClose.OnMouseEnter := OnSysBtnMouseEnter;
  FbtnClose.OnMouseLeave := OnSysBtnMouseLeave;
  FbtnClose.OnMouseDown  := OnSysBtnMouseDown;
  FbtnClose.OnClick      := OnSysBtnCloseClick;
  FbtnClose.Anchors      := [akRight, akTop];
  LoadButtonBmp(FbtnClose, 'CLOSE', 0);

  FbtnMax              := TImage.Create(FTopPanel);
  FbtnMax.Parent       := FTopPanel;
  FbtnMax.Top          := 2;
  FbtnMax.AutoSize     := True;
  FbtnMax.Left         := FbtnMax.Parent.Width - 2 * c_intButtonWidth - 2;
  FbtnMax.Transparent  := False;
  FbtnMax.Hint         := '最大化';
  FbtnMax.ShowHint     := True;
  FbtnMax.Tag          := 1;
  FbtnMax.OnMouseEnter := OnSysBtnMouseEnter;
  FbtnMax.OnMouseLeave := OnSysBtnMouseLeave;
  FbtnMax.OnMouseDown  := OnSysBtnMouseDown;
  FbtnMax.OnClick      := OnSysBtnMaxClick;
  FbtnMax.Anchors      := [akRight, akTop];
  LoadButtonBmp(FbtnMax, 'MAX', 0);

  FbtnMin              := TImage.Create(FTopPanel);
  FbtnMin.Parent       := FTopPanel;
  FbtnMin.Top          := 2;
  FbtnMin.AutoSize     := True;
  FbtnMin.Left         := FbtnMin.Parent.Width - 3 * c_intButtonWidth - 2;
  FbtnMin.Transparent  := False;
  FbtnMin.Hint         := '最小化';
  FbtnMin.ShowHint     := True;
  FbtnMin.Tag          := 2;
  FbtnMin.OnMouseEnter := OnSysBtnMouseEnter;
  FbtnMin.OnMouseLeave := OnSysBtnMouseLeave;
  FbtnMin.OnMouseDown  := OnSysBtnMouseDown;
  FbtnMin.OnClick      := OnSysBtnMinClick;
  FbtnMin.Anchors      := [akRight, akTop];
  LoadButtonBmp(FbtnMin, 'MINI', 0);

  FbtnConfig              := TImage.Create(FTopPanel);
  FbtnConfig.Parent       := FTopPanel;
  FbtnConfig.Top          := 2;
  FbtnConfig.AutoSize     := True;
  FbtnConfig.Left         := FbtnConfig.Parent.Width - 4 * c_intButtonWidth - 2;
  FbtnConfig.Transparent  := False;
  FbtnConfig.Hint         := '配置';
  FbtnConfig.ShowHint     := True;
  FbtnConfig.Tag          := 3;
  FbtnConfig.OnMouseEnter := OnSysBtnMouseEnter;
  FbtnConfig.OnMouseLeave := OnSysBtnMouseLeave;
  FbtnConfig.OnMouseDown  := OnSysBtnMouseDown;
  FbtnConfig.OnClick      := OnSysBtnConfigClick;
  FbtnConfig.Anchors      := [akRight, akTop];
  LoadButtonBmp(FbtnConfig, 'CONFIG', 0);

  { 初始化成员变量 }
  FbMaxForm            := False;
  FTrayIcon            := TTrayIcon.Create(nil);
  FTrayIcon.Visible    := True;
  FTrayIcon.Hint       := c_strTitle;
  FTrayIcon.Icon       := Application.Icon;
  FTrayIcon.OnDblClick := TrayIconDblClick;

  Fjvdrgdrp                    := TJvDragDrop.Create(Self);
  Fjvdrgdrp.AcceptDrag         := True;
  Fjvdrgdrp.DropTarget         := Self;
  Fjvdrgdrp.AllowDropElevation := True;
  Fjvdrgdrp.OnDrop             := OnFileDrop;
end;

destructor TdbBaseForm.Destroy;
begin
  FTrayIcon.Visible := False;
  FbtnConfig.Free;
  FbtnMin.Free;
  FbtnMax.Free;
  FbtnClose.Free;
  FTopPanel.Free;
  FTrayIcon.Free;
  Fjvdrgdrp.Free;
  inherited;
end;

function EnumChildFunc(hDllForm: THandle; hParentHandle: THandle): Boolean; stdcall;
begin
  Result := True;

  { 判断是否是 DLL 的窗体句柄 }
  if GetParent(hDllForm) = 0 then
  begin
    PostMessage(hDllForm, WM_DROPFILES, hParentHandle, 0);
  end;
end;

procedure TdbBaseForm.OnFileDrop(Sender: TObject; hwnd: THandle);
begin
  { 必须有创建的 DLL 窗体存在 }
  if TPageControl(FindComponent('pgcAll')).ActivePageIndex <> 2 then
    Exit;

  { EXE 文件，接收鼠标拖放消息 }
  if Application.MainForm.Tag <> 0 then
  begin
    EnumChildWindows(Handle, @EnumChildFunc, hwnd);
  end;
end;

procedure TdbBaseForm.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FbMaxForm then
    Exit;

  if Button = mbLeft then
    FbMouseDown := True;
  GetCursorPos(FPT);
end;

procedure TdbBaseForm.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  pt: TPoint;
begin
  inherited;

  if FbMaxForm then
    Exit;

  if not FbMouseDown then
    Exit;

  GetCursorPos(pt);
  Left := Left + (pt.X - FPT.X);
  Top  := Top + (pt.Y - FPT.Y);
  FPT  := pt;
end;

procedure TdbBaseForm.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FbMaxForm then
    Exit;

  FbMouseDown := False;
end;

function GetSysButonType(img: TImage): String;
begin
  if img.Tag = 0 then
    Result := 'CLOSE'
  else if img.Tag = 1 then
    Result := 'MAX'
  else if img.Tag = 2 then
    Result := 'MINI'
  else
    Result := 'CONFIG';
end;

procedure TdbBaseForm.OnSysBtnCloseClick(Sender: TObject);
begin
  if FbCloseToTray then
  begin
    Hide;
    FTrayIcon.Visible := True;
    Exit;
  end;

  FTrayIcon.Visible := False;
  PostMessage(Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
end;

procedure TdbBaseForm.FormMaxSize(const bMul: Boolean);
begin
  Left := IfThen(bMul, Screen.Monitors[0].Width, 0);
  Top  := 0;
  DelayTime(c_intDelayTime);
  Width  := Screen.Width;
  Height := Screen.Height;
end;

{ 窗体最大化 }
procedure TdbBaseForm.FormMaxSize;
begin
  if Screen.MonitorCount = 1 then
    FormMaxSize(False)
  else
  begin
    if Left > Screen.Monitors[0].Width - Width div 2 then
      FormMaxSize(True)
    else
      FormMaxSize(False)
  end;
end;

procedure TdbBaseForm.FormRestoreSize;
begin
  Top  := FintOldTop;
  Left := FintOldLeft;
  DelayTime(c_intDelayTime);
  Width  := FintOldWidth;
  Height := FintOldHeight;
end;

function TdbBaseForm.GetCloseToTray: Boolean;
begin
  Result := FbCloseToTray;
end;

function TdbBaseForm.GetTrayIconPMenu: TPopupMenu;
begin
  Result := FTrayIconPMenu;
end;

procedure TdbBaseForm.OnSysBtnMaxClick(Sender: TObject);
begin
  if not FbMaxForm then
  begin
    FintOldTop    := Top;
    FintOldLeft   := Left;
    FintOldWidth  := Width;
    FintOldHeight := Height;
    FbMaxForm     := not FbMaxForm;
    FormMaxSize;
    TImage(Sender).Hint := '还原';
    LoadButtonBmp(TImage(Sender), 'RESTORE', 0);
  end
  else
  begin
    FbMaxForm := not FbMaxForm;
    FormRestoreSize;
    TImage(Sender).Hint := '最大化';
    LoadButtonBmp(TImage(Sender), 'MAX', 0);
  end;
end;

procedure TdbBaseForm.OnSysBtnMinClick(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TdbBaseForm.OnSysBtnMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (TImage(Sender).Tag = 1) and FbMaxForm then
    LoadButtonBmp(TImage(Sender), 'RESTORE', 2)
  else
    LoadButtonBmp(TImage(Sender), GetSysButonType(TImage(Sender)), 2);
end;

procedure TdbBaseForm.OnSysBtnMouseEnter(Sender: TObject);
begin
  if (TImage(Sender).Tag = 1) and FbMaxForm then
    LoadButtonBmp(TImage(Sender), 'RESTORE', 1)
  else
    LoadButtonBmp(TImage(Sender), GetSysButonType(TImage(Sender)), 1);
end;

procedure TdbBaseForm.OnSysBtnMouseLeave(Sender: TObject);
begin
  if (TImage(Sender).Tag = 1) and FbMaxForm then
    LoadButtonBmp(TImage(Sender), 'RESTORE', 0)
  else
    LoadButtonBmp(TImage(Sender), GetSysButonType(TImage(Sender)), 0);
end;

procedure TdbBaseForm.pnlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseDown(Button, Shift, X, Y);
end;

procedure TdbBaseForm.pnlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseMove(Shift, X, Y);
end;

procedure TdbBaseForm.pnlMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  MouseUp(Button, Shift, X, Y);
end;

procedure TdbBaseForm.SetCloseToTray(const Value: Boolean);
begin
  FbCloseToTray := Value;
end;

procedure TdbBaseForm.SetMulScreenPos(const Value: Boolean);
begin
  FMulScreenPos := Value;

  { 多显示屏时，显示在第二个显示器上 }
  if (FMulScreenPos) and (Screen.MonitorCount > 1) then
  begin
    MakeFullyVisible(Screen.Monitors[1]);
    Top  := (Screen.Monitors[1].Height - Height) div 2;
    Left := Screen.Monitors[1].Left + (Screen.Monitors[1].Width - Width) div 2;
  end
  else
  begin
    Position := poScreenCenter;
  end;
end;

procedure TdbBaseForm.SetTitleString(const Value: string);
begin
  FTitleString      := Value;
  Caption           := FTitleString;
  Application.Title := FTitleString;
  FTopPanel.Caption := FTitleString;
end;

procedure TdbBaseForm.SetTrayIconPMenu(const Value: TPopupMenu);
begin
  FTrayIconPMenu := Value;
  if Assigned(TrayIconPMenu) then
  begin
    FTrayIcon.PopupMenu := TrayIconPMenu;
  end;
end;

procedure TdbBaseForm.TrayIconDblClick(Sender: TObject);
begin
  if not Visible then
    Show;
end;

procedure TdbBaseForm.OnSysBtnConfigClick(Sender: TObject);
begin
  if Assigned(FOnConfig) then
    FOnConfig(FbtnConfig);
end;

procedure TdbBaseForm.pnlDBLClick(Sender: TObject);
begin
  //
end;

end.
