unit db.MainForm;

interface

uses
  Winapi.Windows, Winapi.IpTypes, System.SysUtils, System.Classes, System.IniFiles, System.UITypes, System.StrUtils, System.Math, System.ImageList,
  Vcl.Graphics, Vcl.Buttons, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ImgList,
  db.uBaseForm, db.uCommon;

type
  TfrmPBox = class(TdbBaseForm)
    clbrPModule: TCoolBar;
    tlbPModule: TToolBar;
    pnlBottom: TPanel;
    pnlTime: TPanel;
    lblTime: TLabel;
    pnlIP: TPanel;
    lblIP: TLabel;
    bvlIP: TBevel;
    pnlWeb: TPanel;
    lblWeb: TLabel;
    bvlWeb: TBevel;
    pnlLogin: TPanel;
    lblLogin: TLabel;
    bvlModule02: TBevel;
    pgcAll: TPageControl;
    tsButton: TTabSheet;
    imgButtonBack: TImage;
    pnlModuleDialog: TPanel;
    pnlModuleDialogTitle: TPanel;
    imgSubModuleClose: TImage;
    tsList: TTabSheet;
    imgListBack: TImage;
    tsDll: TTabSheet;
    imgDllFormBack: TImage;
    pmFuncMenu: TPopupMenu;
    mniFuncMenuConfig: TMenuItem;
    mniFuncMenuMoney: TMenuItem;
    mniFuncMenuLine01: TMenuItem;
    mniFuncMenuAbout: TMenuItem;
    ilMainMenu: TImageList;
    mmMainMenu: TMainMenu;
    tmrDateTime: TTimer;
    pmAdapterList: TPopupMenu;
    ilPModule: TImageList;
    pmTray: TPopupMenu;
    mniTrayShowForm: TMenuItem;
    mniTrayLine01: TMenuItem;
    mniTrayExit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure mniFuncMenuConfigClick(Sender: TObject);
    procedure mniFuncMenuMoneyClick(Sender: TObject);
    procedure mniFuncMenuAboutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lblIPClick(Sender: TObject);
    procedure lblTimeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgSubModuleCloseClick(Sender: TObject);
    procedure imgSubModuleCloseMouseEnter(Sender: TObject);
    procedure imgSubModuleCloseMouseLeave(Sender: TObject);
    procedure mniTrayShowFormClick(Sender: TObject);
    procedure mniTrayExitClick(Sender: TObject);
  private
    FListDll  : THashedStringList;
    FintBakRow: Integer;
    { 设置默认界面 }
    procedure ReadConfigUI(const bSize: Boolean = True);
    { 加载所有的 DLL 和 EXE 到列表 }
    procedure LoadAllPlugins(var lstDll: THashedStringList);
    { 创建模块功能菜单 }
    procedure CreateMenu(listDll: THashedStringList);
    { 创建显示界面 }
    procedure CreateDisplayUI;
    procedure CreateDisplayUI_Menu;   // 菜单模式
    procedure CreateDisplayUI_Button; // 按钮模式
    procedure CreateDisplayUI_List;   // 列表模式
    { 创建界面 }
    procedure ReCreate(const bSize: Boolean = True);
    { 系统参数配置 }
    procedure OnSysConfig(Sender: TObject);
    { 销毁 DLL / EXE 窗体 }
    procedure FreeAllDllForm(const bExit: Boolean = False);
    procedure OnMenuItemClick(Sender: TObject);
    procedure OnAdapterDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
    procedure OnAdapterIPClick(Sender: TObject);
    procedure FreeModuleMenu;
    procedure OnParentModuleButtonClick(Sender: TObject);
    { 参数恢复默认值 }
    procedure FillDefaultValue;
    { 创建显示所有子模块对话框窗体 }
    procedure CreateSubModulesFormDialog(const strPModuleName: string); overload;
    procedure CreateSubModulesFormDialog(const mmItem: TMenuItem); overload;
    { 列表显示风格，创建子模块 DLL 窗体 }
    procedure OnSubModuleButtonClick(Sender: TObject);
    { 销毁分栏式界面 }
    procedure FreeListViewSubModule;
    { 获取垂直位置最大间隔 }
    function GetMaxInstance: Integer;
    { 分栏式显示时，当鼠标进入 label 时 }
    procedure OnSubModuleMouseEnter(Sender: TObject);
    { 分栏式显示时，当鼠标离开 label 时 }
    procedure OnSubModuleMouseLeave(Sender: TObject);
    { 创建子模块 DLL 模块 }
    procedure OnSubModuleListClick(Sender: TObject);
    procedure CreateDllForm(const intMenuItemIndex: Integer);
    procedure CreateDllForm_Delphi(const strDllFileName: String);
    procedure CreateDllForm_VCDLL(const strDllFileName: String);
    procedure CreateDllForm_imgEXE(const strDllFileName: String);
    { Delphi DLL 窗体销毁 }
    procedure OnDelphiDllFormClose(Sender: TObject; var Action: TCloseAction);
    { Image EXE 窗体销毁 }
    procedure OnEXEFormClose(Sender: TObject);
    { DLL/EXE 窗体销毁之后，恢复界面 }
    procedure DllFormCloseRestoreUI;
    { VC DLG DLL Form 窗体销毁 }
    procedure OnVCDLGDllFormClose(Sender: TObject);
  end;

var
  frmPBox: TfrmPBox;

implementation

{$R *.dfm}

uses db.uCreateDelphiDllForm, db.uCreateEXEForm, db.uCreateVCDllForm, db.ConfigForm, db.DonateForm, db.AboutForm;

procedure TfrmPBox.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  FListDll      := THashedStringList.Create;
  OnConfig      := OnSysConfig;
  TrayIconPMenu := pmTray;

  for I := 0 to pgcAll.PageCount - 1 do
  begin
    pgcAll.Pages[I].TabVisible := False;
  end;
  LoadButtonBmp(imgSubModuleClose, 'Close', 0);

  { 显示 时间 }
  tmrDateTime.OnTimer(nil);

  { 显示 IP }
  lblIP.Caption := GetCurrentAdapterIP;

  { 创建界面 }
  ReCreate;
end;

procedure TfrmPBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAllDllForm(True);
end;

procedure TfrmPBox.FormDestroy(Sender: TObject);
begin
  FreeModuleMenu;
  FListDll.Free;
end;

function EnumChildFunc(hDllForm: THandle; hParentHandle: THandle): Boolean; stdcall;
var
  rctClient: TRect;
begin
  Result := True;

  { 判断是否是 DLL 的窗体句柄 }
  if GetParent(hDllForm) = 0 then
  begin
    { 更改 DLL 窗体大小 }
    GetWindowRect(hParentHandle, rctClient);
    SetWindowPos(hDllForm, hParentHandle, 0, 0, rctClient.Width, rctClient.Height, SWP_NOZORDER + SWP_NOACTIVATE);
  end;
end;

procedure TfrmPBox.FormResize(Sender: TObject);
begin
  { 对话框模式时 }
  if GetShowStyle = 1 then
  begin
    if Assigned(pnlModuleDialog) then
    begin
      pnlModuleDialog.Left := (pnlModuleDialog.Parent.Width - pnlModuleDialog.Width) div 2;
      if Assigned(Sender) then
        pnlModuleDialog.Top := (pnlModuleDialog.Parent.Height - pnlModuleDialog.Height) div 2
      else
        pnlModuleDialog.Top := (pnlModuleDialog.Parent.Height - 19 - pnlModuleDialog.Height) div 2;
    end;
  end;

  { 有 DLL/EXE 窗体时，更改 DLL 窗体大小 }
  if (Assigned(pgcAll)) and (Assigned(tsDll)) and (pgcAll.ActivePage = tsDll) then
  begin
    EnumChildWindows(Handle, @EnumChildFunc, tsDll.Handle);
  end;

  { 列表模式时 }
  if GetShowStyle = 2 then
  begin
    if pgcAll.ActivePage = tsList then
    begin
      CreateDisplayUI_List;
    end;
  end;
end;

{ 销毁 DLL / EXE 窗体 }
procedure TfrmPBox.FreeAllDllForm(const bExit: Boolean);
begin
  { EXE 程序存在 }
  FreeExeForm;

  { Delphi DLL 程序存在 }
  FreeDelphiDllForm;

  { VC DLG DLL 程序存在 }
  FreeVCDllForm(bExit);
end;

{ 销毁分栏式界面 }
procedure TfrmPBox.FreeListViewSubModule;
var
  I: Integer;
begin
  if not Assigned(tsList) then
    Exit;

  for I := tsList.ComponentCount - 1 downto 0 do
  begin
    if tsList.Components[I] is TLabel then
    begin
      TLabel(tsList.Components[I]).Free;
    end
    else if tsList.Components[I] is TImage then
    begin
      if TImage(tsList.Components[I]).Name = '' then
      begin
        TImage(tsList.Components[I]).Free;
      end;
    end;
  end;
end;

procedure TfrmPBox.FreeModuleMenu;
var
  I, J: Integer;
begin
  mmMainMenu.AutoMerge := False;
  for I                := mmMainMenu.Items.Count - 1 downto 0 do
  begin
    for J := mmMainMenu.Items.Items[I].Count - 1 downto 0 do
    begin
      mmMainMenu.Items.Items[I].Items[J].Free;
    end;
    mmMainMenu.Items.Items[I].Free;
  end;
  mmMainMenu.Items.Clear;
  mmMainMenu.AutoMerge := False;
end;

procedure TfrmPBox.mniFuncMenuAboutClick(Sender: TObject);
begin
  ShowAboutForm;
end;

procedure TfrmPBox.mniFuncMenuConfigClick(Sender: TObject);
begin
  if ShowConfigForm(FListDll) then
  begin
    FreeAllDllForm;
    ReCreate(False);
  end;
end;

procedure TfrmPBox.mniFuncMenuMoneyClick(Sender: TObject);
begin
  ShowDonateForm;
end;

procedure TfrmPBox.mniTrayExitClick(Sender: TObject);
begin
  CloseToTray := False;
  Close;
end;

procedure TfrmPBox.mniTrayShowFormClick(Sender: TObject);
begin
  MainTrayIcon.OnDblClick(nil);
end;

{ 系统参数配置 }
procedure TfrmPBox.OnSysConfig(Sender: TObject);
var
  img: TImage;
  pt : TPoint;
begin
  img  := TImage(Sender);
  pt.X := Left + img.Left + 8;
  pt.Y := Top + img.Top + img.Height;
  pmFuncMenu.Popup(pt.X, pt.Y);
end;

procedure TfrmPBox.tmrDateTimeTimer(Sender: TObject);
const
  WeekDay: array [1 .. 7] of String = ('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
var
  strWebDownSpeed, strWebUpSpeed: String;
begin
  lblTime.Caption := DateTimeToStr(Now) + ' ' + WeekDay[DayOfWeek(Now)];
  GetWebSpeed(strWebDownSpeed, strWebUpSpeed);
  lblWeb.Caption := Format('下载↓：%s  上传↑：%s', [strWebDownSpeed, strWebUpSpeed]);
end;

{ 创建界面 }
procedure TfrmPBox.ReCreate(const bSize: Boolean);
begin
  { 参数恢复默认值 }
  FillDefaultValue;

  { 设置默认界面 }
  ReadConfigUI(bSize);

  { 加载所有的 DLL 和 EXE 到列表 }
  LoadAllPlugins(FListDll);

  { 创建模块功能菜单 }
  CreateMenu(FListDll);

  { 创建显示界面 }
  CreateDisplayUI;
end;

{ 设置默认界面 }
procedure TfrmPBox.ReadConfigUI(const bSize: Boolean = True);
var
  bShowImage  : Boolean;
  strImageBack: String;
begin
  TitleString := GetTitleText;
  with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  begin
    TitleString    := ReadString(c_strIniUISection, 'Title', c_strTitle);
    MulScreenPos   := ReadBool(c_strIniUISection, 'MulScreen', False);
    FormStyle      := TFormStyle(Integer(ReadBool(c_strIniUISection, 'OnTop', False)) * 3);
    CloseToTray    := ReadBool(c_strIniUISection, 'CloseMini', False);
    pnlWeb.Visible := ReadBool(c_strIniUISection, 'ShowWebSpeed', False);
    bShowImage     := ReadBool(c_strIniUISection, 'showbackimage', False);
    strImageBack   := ReadString(c_strIniUISection, 'filebackimage', '');
    if (bShowImage) and (Trim(strImageBack) <> '') and (FileExists(strImageBack)) then
    begin
      imgDllFormBack.Picture.LoadFromFile(strImageBack);
      imgButtonBack.Picture.LoadFromFile(strImageBack);
      imgListBack.Picture.LoadFromFile(strImageBack);
    end
    else
    begin
      imgDllFormBack.Picture.Assign(nil);
      imgButtonBack.Picture.Assign(nil);
      imgListBack.Picture.Assign(nil);
    end;
    Free;
  end;
end;

{ 参数恢复默认值 }
procedure TfrmPBox.FillDefaultValue;
var
  I: Integer;
begin
  FListDll.Clear;
  ilMainMenu.Clear;
  ilPModule.Clear;
  FintBakRow              := 0;
  clbrPModule.Visible     := False;
  pnlModuleDialog.Visible := False;
  FreeModuleMenu;
  FreeListViewSubModule;

  for I := tlbPModule.ButtonCount - 1 downto 0 do
  begin
    tlbPModule.Buttons[I].Free;
  end;
  tlbPModule.Images := nil;
  tlbPModule.Height := 30;
  tlbPModule.Menu   := nil;
end;

{ 加载所有的 DLL 和 EXE 到列表 }
procedure TfrmPBox.LoadAllPlugins(var lstDll: THashedStringList);
begin
  { 扫描 DLL 文件，读取 Plugins 目录 }
  LoadAllPlugins_Dll(lstDll, ilMainMenu);

  { 扫描 EXE 文件，读取 配置 文件 }
  LoadAllPlugins_EXE(lstDll, ilMainMenu);

  { 排序模块 }
  SortModuleList(lstDll);
end;

procedure TfrmPBox.OnMenuItemClick(Sender: TObject);
begin
  FreeAllDllForm;
  CreateDllForm(TMenuItem(Sender).Tag);
end;

{ 创建模块功能菜单 }
procedure TfrmPBox.CreateMenu(listDll: THashedStringList);
var
  I             : Integer;
  strInfo       : String;
  strPModuleName: String;
  strSModuleName: String;
  mmPM          : TMenuItem;
  mmSM          : TMenuItem;
  intIconIndex  : Integer;
begin
  for I := 0 to listDll.Count - 1 do
  begin
    strInfo        := listDll.ValueFromIndex[I];
    strPModuleName := strInfo.Split([';'])[0];
    strSModuleName := strInfo.Split([';'])[1];
    intIconIndex   := StrToInt(strInfo.Split([';'])[4]);

    { 如果父菜单不存在，创建父菜单 }
    mmPM := mmMainMenu.Items.Find(string(strPModuleName));
    if mmPM = nil then
    begin
      mmPM         := TMenuItem.Create(mmMainMenu);
      mmPM.Caption := string((strPModuleName));
      mmMainMenu.Items.Add(mmPM);
    end;

    { 创建子菜单 }
    mmSM            := TMenuItem.Create(mmPM);
    mmSM.Caption    := string((strSModuleName));
    mmSM.Tag        := I;
    mmSM.ImageIndex := intIconIndex;
    mmSM.OnClick    := OnMenuItemClick;
    mmPM.Add(mmSM);
  end;
end;

{ 创建显示所有子模块对话框窗体 }
procedure TfrmPBox.CreateSubModulesFormDialog(const mmItem: TMenuItem);
const
  c_intCols         = 5;
  c_intButtonWidth  = 128;
  c_intButtonHeight = 64;
  c_intMiniTop      = 2;
  c_intMiniLeft     = 2;
  c_intHorSpace     = 2;
  c_intVerSpace     = 2;
var
  arrSB   : array of TSpeedButton;
  I, Count: Integer;
begin
  { 释放先前创建的按钮 }
  Count := pnlModuleDialog.ComponentCount;
  if Count > 0 then
  begin
    for I := Count - 1 downto 0 do
    begin
      if pnlModuleDialog.Components[I] is TSpeedButton then
      begin
        TSpeedButton(pnlModuleDialog.Components[I]).Free;
      end;
    end;
  end;

  { 创建新的子模块按钮 }
  SetLength(arrSB, mmItem.Count);
  for I := 0 to mmItem.Count - 1 do
  begin
    arrSB[I]            := TSpeedButton.Create(pnlModuleDialog);
    arrSB[I].Parent     := pnlModuleDialog;
    arrSB[I].Caption    := mmItem.Items[I].Caption;
    arrSB[I].Width      := c_intButtonWidth;
    arrSB[I].Height     := c_intButtonHeight;
    arrSB[I].GroupIndex := 1;
    arrSB[I].Flat       := True;
    arrSB[I].Top        := pnlModuleDialogTitle.Height + c_intMiniTop + (c_intCols + c_intButtonHeight + c_intVerSpace) * (I div c_intCols);
    arrSB[I].Left       := c_intMiniLeft + (c_intButtonWidth + c_intHorSpace) * (I mod c_intCols);
    arrSB[I].Tag        := mmItem.Items[I].Tag;
    arrSB[I].OnClick    := OnSubModuleButtonClick;
    ilMainMenu.GetBitmap(mmItem.Items[I].ImageIndex, arrSB[I].Glyph);
  end;
  pnlModuleDialog.Visible := True;
end;

{ 创建显示所有子模块对话框窗体 }
procedure TfrmPBox.CreateSubModulesFormDialog(const strPModuleName: string);
var
  I: Integer;
begin
  for I := 0 to mmMainMenu.Items.Count - 1 do
  begin
    if CompareText(mmMainMenu.Items.Items[I].Caption, strPModuleName) = 0 then
    begin
      CreateSubModulesFormDialog(mmMainMenu.Items.Items[I]);
      Break;
    end;
  end;
end;

{ 创建显示界面 }
procedure TfrmPBox.CreateDisplayUI;
var
  intShowStyle: Integer;
begin
  intShowStyle := GetShowStyle;
  case intShowStyle of
    0:
      CreateDisplayUI_Menu;
    1:
      CreateDisplayUI_Button;
    2:
      CreateDisplayUI_List;
  end;
end;

procedure TfrmPBox.OnSubModuleButtonClick(Sender: TObject);
var
  I, J         : Integer;
  mmItem       : TMenuItem;
  strPMouleName: string;
  strSMouleName: string;
begin
  mmItem := nil;

  strSMouleName := TSpeedButton(Sender).Caption;
  for I         := 0 to tlbPModule.ButtonCount - 1 do
  begin
    if tlbPModule.Components[I] is TToolButton then
    begin
      if TToolButton(tlbPModule.Components[I]).Down then
      begin
        strPMouleName := TToolButton(tlbPModule.Components[I]).Caption;
        Break;
      end;
    end;
  end;

  for I := 0 to mmMainMenu.Items.Count - 1 do
  begin
    if SameText(mmMainMenu.Items.Items[I].Caption, strPMouleName) then
    begin
      for J := 0 to mmMainMenu.Items.Items[I].Count - 1 do
      begin
        if SameText(mmMainMenu.Items.Items[I].Items[J].Caption, strSMouleName) then
        begin
          mmItem := mmMainMenu.Items.Items[I].Items[J];
          Break;
        end;
      end;
    end;
  end;

  pnlModuleDialog.Visible := True;
  if mmItem <> nil then
    OnMenuItemClick(mmItem);
end;

procedure TfrmPBox.OnParentModuleButtonClick(Sender: TObject);
var
  I             : Integer;
  strPMdouleName: string;
begin
  pgcAll.ActivePageIndex := 0;
  for I                  := 0 to tlbPModule.ButtonCount - 1 do
  begin
    tlbPModule.Buttons[I].Down := False;
  end;
  TToolButton(Sender).Down     := True;
  strPMdouleName               := TToolButton(Sender).Caption;
  pnlModuleDialogTitle.Caption := strPMdouleName;

  { 销毁 DLL / EXE 窗体 }
  FreeAllDllForm;

  { 创建显示所有子模块对话框窗体 }
  CreateSubModulesFormDialog(strPMdouleName);
end;

{ 创建显示界面 --- 按钮模式 }
procedure TfrmPBox.CreateDisplayUI_Button;
var
  tmpTB          : TToolButton;
  I              : Integer;
  strIconFilePath: String;
  strIconFileName: String;
  icoPModule     : TIcon;
begin
  tlbPModule.Images := ilPModule;
  tlbPModule.Height := 58;

  { 获取所有父模块图标 }
  for I := 0 to mmMainMenu.Items.Count - 1 do
  begin
    with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
    begin
      strIconFilePath := mmMainMenu.Items.Items[I].Caption + '_ICON';
      strIconFileName := ExtractFilePath(ParamStr(0)) + 'plugins\icon\' + ReadString(c_strIniModuleSection, strIconFilePath, '');
      Free;
    end;

    if FileExists(strIconFileName) then
    begin
      icoPModule := TIcon.Create;
      try
        icoPModule.LoadFromFile(strIconFileName);
        ilPModule.AddIcon(icoPModule);
      finally
        icoPModule.Free;
      end;
    end;
  end;

  for I := mmMainMenu.Items.Count - 1 downto 0 do
  begin
    tmpTB            := TToolButton.Create(tlbPModule);
    tmpTB.Parent     := tlbPModule;
    tmpTB.Caption    := mmMainMenu.Items.Items[I].Caption;
    tmpTB.ImageIndex := I;
    tmpTB.OnClick    := OnParentModuleButtonClick;
  end;
  clbrPModule.Visible    := True;
  pgcAll.ActivePageIndex := 0;
  pnlModuleDialog.Left   := (pnlModuleDialog.Parent.Width - pnlModuleDialog.Width) div 2;
  pnlModuleDialog.Top    := (pnlModuleDialog.Parent.Height - pnlModuleDialog.Height) div 2
end;

{ 分栏式显示时，创建子模块 DLL 模块 }
procedure TfrmPBox.OnSubModuleListClick(Sender: TObject);
var
  intTag: Integer;
  I, J  : Integer;
  mmItem: TMenuItem;
begin
  mmItem := nil;
  intTag := TLabel(Sender).Tag;
  for I  := 0 to mmMainMenu.Items.Count - 1 do
  begin
    for J := 0 to mmMainMenu.Items.Items[I].Count - 1 do
    begin
      if mmMainMenu.Items.Items[I].Items[J].Tag = intTag then
      begin
        mmItem := mmMainMenu.Items.Items[I].Items[J];
        Break;
      end;
    end;
  end;

  if mmItem <> nil then
    OnMenuItemClick(mmItem);
end;

{ 分栏式显示时，当鼠标进入 label 时 }
procedure TfrmPBox.OnSubModuleMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := RGB(0, 0, 255);
  TLabel(Sender).Font.Style := TLabel(Sender).Font.Style + [fsUnderline];
end;

{ 分栏式显示时，当鼠标离开 label 时 }
procedure TfrmPBox.OnSubModuleMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := RGB(51, 153, 255);
  TLabel(Sender).Font.Style := TLabel(Sender).Font.Style - [fsUnderline];
end;

{ 获取垂直位置最大间隔 }
function TfrmPBox.GetMaxInstance: Integer;
var
  intMax               : Integer;
  arrInt               : array of Integer;
  I                    : Integer;
  intLabelPModuleHeight: Integer;
  intLabelSModuleHeight: Integer;
begin
  { 取最多行的模块个数 }
  SetLength(arrInt, mmMainMenu.Items.Count);
  for I := 0 to mmMainMenu.Items.Count - 1 do
  begin
    arrInt[I] := mmMainMenu.Items.Items[I].Count;
  end;
  intMax := MaxIntValue(arrInt);

  intLabelPModuleHeight := GetLabelHeight('宋体', 17);
  intLabelSModuleHeight := GetLabelHeight('宋体', 12);

  Result := (intLabelSModuleHeight + c_intBetweenVerticalDistance * 2) * (Ifthen(intMax mod 3 = 0, 0, 1) + intMax div 3) + intLabelPModuleHeight;
end;

procedure TfrmPBox.imgSubModuleCloseClick(Sender: TObject);
var
  I: Integer;
begin
  pnlModuleDialog.Visible := False;
  for I                   := 0 to tlbPModule.ButtonCount - 1 do
  begin
    tlbPModule.Buttons[I].Down := False;
  end;
end;

procedure TfrmPBox.imgSubModuleCloseMouseEnter(Sender: TObject);
begin
  { 列表显示风格，关闭按钮状态 }
  LoadButtonBmp(imgSubModuleClose, 'Close', 1);
end;

procedure TfrmPBox.imgSubModuleCloseMouseLeave(Sender: TObject);
begin
  { 列表显示风格，关闭按钮状态 }
  LoadButtonBmp(imgSubModuleClose, 'Close', 0);
end;

procedure TfrmPBox.lblIPClick(Sender: TObject);
var
  lstAdapter : TList;
  I          : Integer;
  AdapterInfo: PIP_ADAPTER_INFO;
  strIP      : String;
  strGate    : String;
  strName    : String;
  mmItem     : TMenuItem;
  pt         : TPoint;
begin
  lstAdapter := TList.Create;
  try
    GetAdapterInfo(lstAdapter);
    if lstAdapter.Count > 0 then
    begin
      pmAdapterList.Items.Clear;
      for I := 0 to lstAdapter.Count - 1 do
      begin
        AdapterInfo       := PIP_ADAPTER_INFO(lstAdapter.Items[I]);
        strIP             := string(AdapterInfo^.IpAddressList.IpAddress.S);
        strGate           := string(AdapterInfo^.GatewayList.IpAddress.S);
        strName           := string(AdapterInfo^.Description);
        mmItem            := TMenuItem.Create(pmAdapterList);
        mmItem.Caption    := Format('IP: ' + '%-16s Gate: %-16s Name: %-80s', [strIP, strGate, strName]);
        mmItem.OnDrawItem := OnAdapterDrawItem;
        mmItem.OnClick    := OnAdapterIPClick;
        pmAdapterList.Items.Add(mmItem);
      end;
      if pmAdapterList.Items.Count > 1 then
      begin
        pt.X := pnlIP.Left + Left;
        pt.Y := Top + Height + 2;
        pmAdapterList.Popup(pt.X, pt.Y);
      end;
    end;
  finally
    lstAdapter.Free;
  end;
end;

procedure TfrmPBox.lblTimeClick(Sender: TObject);
begin
  WinExec(PAnsiChar('rundll32.exe Shell32.dll,Control_RunDLL intl.cpl,,/p:"date"'), SW_SHOW);
end;

{ 创建显示界面 --- 列表模式 }
procedure TfrmPBox.CreateDisplayUI_List;
var
  I                     : Integer;
  arrParentModuleLabel  : array of TLabel;
  arrParentModuleImage  : array of TImage;
  arrSubModuleLabel     : array of array of TLabel;
  intRow                : Integer;
  strPModuleIconFileName: string;
  strPModuleIconFilePath: string;
  J                     : Integer;
begin
  intRow := Ifthen(MaxForm, 5, 3);
  if FintBakRow = intRow then
    Exit;

  { 销毁分栏式界面 }
  FreeListViewSubModule;
  FintBakRow := intRow;

  clbrPModule.Visible := False;
  pgcAll.ActivePage   := tsList;
  SetLength(arrParentModuleLabel, mmMainMenu.Items.Count);
  SetLength(arrParentModuleImage, mmMainMenu.Items.Count);
  SetLength(arrSubModuleLabel, mmMainMenu.Items.Count);
  for I := 0 to mmMainMenu.Items.Count - 1 do
  begin
    SetLength(arrSubModuleLabel[I], mmMainMenu.Items[I].Count);
  end;

  for I := 0 to mmMainMenu.Items.Count - 1 do
  begin
    { 创建父模块文本 }
    arrParentModuleLabel[I]            := TLabel.Create(tsList);
    arrParentModuleLabel[I].Parent     := tsList;
    arrParentModuleLabel[I].Caption    := mmMainMenu.Items[I].Caption;
    arrParentModuleLabel[I].Font.Name  := '宋体';
    arrParentModuleLabel[I].Font.Size  := 17;
    arrParentModuleLabel[I].Font.Style := [fsBold];
    arrParentModuleLabel[I].Font.Color := RGB(0, 174, 29);
    arrParentModuleLabel[I].Left       := 40 + 400 * (I mod intRow);
    arrParentModuleLabel[I].Top        := GetMaxInstance * (I div intRow);

    { 创建父模块图标 }
    arrParentModuleImage[I]         := TImage.Create(tsList);
    arrParentModuleImage[I].Parent  := tsList;
    arrParentModuleImage[I].Height  := 32;
    arrParentModuleImage[I].Width   := 32;
    arrParentModuleImage[I].Stretch := True;
    arrParentModuleImage[I].Left    := arrParentModuleLabel[I].Left - 40;
    arrParentModuleImage[I].Top     := arrParentModuleLabel[I].Top - 2;
    with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
    begin
      strPModuleIconFilePath := ReadString(c_strIniModuleSection, arrParentModuleLabel[I].Caption + '_ICON', '');
      strPModuleIconFileName := ExtractFilePath(ParamStr(0)) + 'plugins\icon\' + strPModuleIconFilePath;
      if FileExists(strPModuleIconFileName) then
        arrParentModuleImage[I].Picture.LoadFromFile(strPModuleIconFileName);
      Free;
    end;

    { 创建子模块文本 }
    for J := 0 to Length(arrSubModuleLabel[I]) - 1 do
    begin
      arrSubModuleLabel[I, J]            := TLabel.Create(tsList);
      arrSubModuleLabel[I, J].Parent     := tsList;
      arrSubModuleLabel[I, J].Caption    := mmMainMenu.Items[I].Items[J].Caption;
      arrSubModuleLabel[I, J].Font.Name  := '宋体';
      arrSubModuleLabel[I, J].Font.Size  := 12;
      arrSubModuleLabel[I, J].Font.Style := [fsBold];
      arrSubModuleLabel[I, J].Font.Color := RGB(51, 153, 255);
      arrSubModuleLabel[I, J].Cursor     := crHandPoint;
      if J mod 3 = 0 then
        arrSubModuleLabel[I, J].Left := arrParentModuleLabel[I].Left + 2
      else
        arrSubModuleLabel[I, J].Left       := arrSubModuleLabel[I, J - 1].Left + arrSubModuleLabel[I, J - 1].Width + 10;
      arrSubModuleLabel[I, J].Top          := arrParentModuleLabel[I].Top + GetLabelHeight('宋体', 17) + c_intBetweenVerticalDistance + (GetLabelHeight('宋体', 12) + c_intBetweenVerticalDistance) * (J div 3);
      arrSubModuleLabel[I, J].Tag          := mmMainMenu.Items[I].Items[J].Tag;
      arrSubModuleLabel[I, J].OnMouseEnter := OnSubModuleMouseEnter;
      arrSubModuleLabel[I, J].OnMouseLeave := OnSubModuleMouseLeave;
      arrSubModuleLabel[I, J].OnClick      := OnSubModuleListClick;
    end;
  end;
end;

{ 创建显示界面 --- 菜单模式 }
procedure TfrmPBox.CreateDisplayUI_Menu;
begin
  tlbPModule.Menu      := mmMainMenu;
  mmMainMenu.AutoMerge := True;
  tlbPModule.Height    := 24;
  clbrPModule.Visible  := True;
end;

{ DLL/EXE 窗体销毁之后，恢复界面 }
procedure TfrmPBox.DllFormCloseRestoreUI;
begin
  if GetShowStyle = 1 then
    pgcAll.ActivePage := tsButton
  else if GetShowStyle = 2 then
    pgcAll.ActivePage := tsList;
end;

procedure TfrmPBox.OnAdapterDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin
  ACanvas.Font.Name := '宋体';
  ACanvas.Font.Size := 11;
  ACanvas.TextOut(ARect.Left, ARect.Top, (Sender as TMenuItem).Caption);
end;

procedure TfrmPBox.OnAdapterIPClick(Sender: TObject);
var
  strText       : string;
  strIP         : String;
  strName       : String;
  strIniFileName: String;
begin
  strText       := (Sender as TMenuItem).Caption;
  strIP         := Trim(LeftStr(strText, 19));
  strIP         := RightStr(strIP, Length(strIP) - 3);
  lblIP.Caption := strIP;

  strName        := Trim(RightStr(strText, Length(strText) - 42));
  strName        := RightStr(strName, Length(strName) - 6);
  strIniFileName := ChangeFileExt(ParamStr(0), '.ini');
  with TIniFile.Create(strIniFileName) do
  begin
    WriteString('Network', 'AdapterName', strName);
    Free;
  end;
end;

{ Delphi DLL 窗体销毁 }
procedure TfrmPBox.OnDelphiDllFormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  { Delphi DLL 窗体销毁之后，恢复界面 }
  DllFormCloseRestoreUI;
end;

{ PE EXE 窗体销毁 }
procedure TfrmPBox.OnEXEFormClose(Sender: TObject);
begin
  { PE EXE 窗体销毁之后，恢复界面 }
  DllFormCloseRestoreUI;
end;

{ VC DLG DLL Form 窗体销毁 }
procedure TfrmPBox.OnVCDLGDllFormClose(Sender: TObject);
begin
  { VC DLG DLL 窗体销毁之后，恢复界面 }
  DllFormCloseRestoreUI;
end;

procedure TfrmPBox.CreateDllForm_Delphi(const strDllFileName: String);
begin
  PBoxRun_DelphiDll(strDllFileName, FListDll.Values[strDllFileName], tsDll, OnDelphiDllFormClose);
end;

procedure TfrmPBox.CreateDllForm_imgEXE(const strDllFileName: String);
begin
  PBoxRun_IMAGE_EXE(strDllFileName, FListDll.Values[strDllFileName], tsDll, OnEXEFormClose);
end;

procedure TfrmPBox.CreateDllForm_VCDLL(const strDllFileName: String);
begin
  PBoxRun_VCDll(strDllFileName, FListDll.Values[strDllFileName], tsDll, OnVCDLGDllFormClose);
end;

procedure TfrmPBox.CreateDllForm(const intMenuItemIndex: Integer);
var
  LangType: TLangStyle;
begin
  SetDllDirectory(PChar(ExtractFilePath(ParamStr(0)) + 'plugins'));
  LangType := TLangStyle(StrToInt(FListDll.ValueFromIndex[intMenuItemIndex].Split([';'])[5]));
  case LangType of
    lsDelphiDll:
      CreateDllForm_Delphi(FListDll.Names[intMenuItemIndex]);
    lsVCDLGDll:
      CreateDllForm_VCDLL(FListDll.Names[intMenuItemIndex]);
    lsVCMFCDll:
      CreateDllForm_VCDLL(FListDll.Names[intMenuItemIndex]);
    lsQTDll:
      CreateDllForm_VCDLL(FListDll.Names[intMenuItemIndex]);
    lsEXE:
      CreateDllForm_imgEXE(FListDll.Names[intMenuItemIndex]);
  end;
end;

end.
