unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Classes, System.IOUtils, System.Types, Vcl.StdCtrls, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.WinXCtrls,
  Data.Win.ADODB, Data.db, SynSQLite3, SynSQLite3Static, SynCommons, db.uCommon;

type
  TfrmNTFSFiles = class(TForm)
    tmrSearchStart: TTimer;
    lvData: TListView;
    lblTip: TLabel;
    tmrSearchStop: TTimer;
    tmrGetFileFullNameStart: TTimer;
    srchbxFile: TSearchBox;
    ADOCNN: TADOConnection;
    btnReSearch: TButton;
    procedure tmrSearchStartTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvDataData(Sender: TObject; Item: TListItem);
    procedure tmrSearchStopTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tmrGetFileFullNameStartTimer(Sender: TObject);
    procedure btnReSearchClick(Sender: TObject);
    procedure srchbxFileInvokeSearch(Sender: TObject);
  private
    FintStartTime             : Cardinal;
    FlstAllDrives             : TStringList;
    FintCount                 : Cardinal;
    FintSearchDriveThreadCount: Integer;
    FstrSqlite3DBFileName     : String;
    FstrSqlWhere              : String;
    FDatabase                 : TSQLDataBase;
    { ���� Sqlite3 ���ݿ� }
    procedure CreateSqlite3DB;
    { ��ʼ�������������ļ� }
    procedure SearchDrivesFiles;
    { ��ʼ���������б� }
    procedure DrawDataItem;
  protected
    { ���������ļ��������� }
    procedure SearchDriveFileFinished(var msg: TMessage); message WM_SearchDriveFileFinished;
    { ��ȡ�ļ�ȫ·������ }
    procedure GetFileFullNameFinished(var msg: TMessage); message WM_GetFileFullNameFinished;
  end;

procedure db_ShowDllForm_Plugins(var frm: TFormClass; var strParentModuleName, strModuleName: PAnsiChar); stdcall;

implementation

{$R *.dfm}

uses uThreadSearchDrive, uThreadGetFileFullName;

procedure db_ShowDllForm_Plugins(var frm: TFormClass; var strParentModuleName, strModuleName: PAnsiChar); stdcall;
begin
  frm                     := TfrmNTFSFiles;
  strParentModuleName     := 'ϵͳ����';
  strModuleName           := 'NTFS �ļ�����';
  Application.Handle      := GetMainFormApplication.Handle;
  Application.Icon.Handle := GetMainFormApplication.Icon.Handle;
end;

{ ��ʼ���������б� }
procedure TfrmNTFSFiles.DrawDataItem;
begin
  if FstrSqlWhere = '' then
  begin
    lvData.Items.Count := FDatabase.ExecuteNoExceptionInt64(RawUTF8('select count(*) from ' + c_strResultTableName));
  end
  else
  begin
    { ������ѯ��ʱ�� }
    FDatabase.ExecuteNoException(RawUTF8('create table ' + c_strSearchTempTableName + ' as select * from ' + c_strResultTableName + ' where ' + FstrSqlWhere));
    lvData.Items.Count := FDatabase.ExecuteNoExceptionInt64(RawUTF8('select count(*) from ' + c_strSearchTempTableName));
  end;

  srchbxFile.Enabled  := True;
  btnReSearch.Enabled := True;
  lblTip.Visible      := False;
  Screen.Cursor       := crArrow;
end;

{ ��ʼ��ȡ�ļ�ȫ·������ }
procedure TfrmNTFSFiles.tmrGetFileFullNameStartTimer(Sender: TObject);
begin
  tmrGetFileFullNameStart.Enabled := False;
  lblTip.Caption                  := '���ڻ�ȡ�ļ�ȫ·�������Ժ򡤡���������';
  lblTip.Left                     := (lblTip.Parent.Width - lblTip.Width) div 2;
end;

procedure TfrmNTFSFiles.tmrSearchStartTimer(Sender: TObject);
begin
  tmrSearchStart.Enabled := False;

  { ������ݿ��ļ����ڣ�ֱ��ʹ�ã��Ͳ��ڽ���ȫ��ɨ���� }
  FstrSqlite3DBFileName := ChangeFileExt(GetDllFullFileName, '.db');
  if FileExists(FstrSqlite3DBFileName) then
  begin
    FDatabase           := TSQLDataBase.Create(FstrSqlite3DBFileName);
    srchbxFile.Visible  := True;
    btnReSearch.Visible := True;
    DrawDataItem;
    Exit;
  end;

  { ��ʼ�������������ļ� }
  SearchDrivesFiles;
end;

procedure TfrmNTFSFiles.FormDestroy(Sender: TObject);
begin
  if FDatabase <> nil then
  begin
    FDatabase.DBClose;
    FDatabase.Free;
    FDatabase := nil;
  end;

  if FlstAllDrives <> nil then
    FlstAllDrives.Free;
end;

procedure TfrmNTFSFiles.btnReSearchClick(Sender: TObject);
begin
  btnReSearch.Visible := False;
  srchbxFile.Visible  := False;
  lvData.Items.Count  := 0;
  lblTip.Caption      := '�������������Ժ򡤡���������';
  lblTip.Visible      := True;

  { ��ʼ�������������ļ� }
  SearchDrivesFiles;
end;

{ ���� Sqlite3 ���ݿ� }
procedure TfrmNTFSFiles.CreateSqlite3DB;
const
  c_strCreateDriveTable = 'CREATE TABLE NTFS ([ID] INTEGER PRIMARY KEY, [Drive] VARCHAR(1), [FileID_HI] INTEGER NULL, [FileID_LO] INTEGER NULL, [FilePID_HI] INTEGER NULL, [FilePID_LO] INTEGER NULL, [FileName] VARCHAR (255), [FullName] VARCHAR (255));';
var
  bExistDB: Boolean;
begin
  FstrSqlWhere := '';
  bExistDB     := FileExists(FstrSqlite3DBFileName);
  FDatabase    := TSQLDataBase.Create(FstrSqlite3DBFileName);
  FDatabase.ExecuteNoException('PRAGMA synchronous = OFF');             // �ر�дͬ�����ӿ�д���ٶ�
  if bExistDB then                                                      // ������ݿ��Ѿ�����
  begin                                                                 //
    FDatabase.ExecuteNoException('DROP TABLE NTFS');                    // ɾ����
    FDatabase.ExecuteNoException('DROP TABLE ' + c_strResultTableName); // ɾ����
  end;                                                                  //
  FDatabase.ExecuteNoException(c_strCreateDriveTable);                  // ������ṹ

  { �������񣬼ӿ�д���ٶ� }
  FDatabase.TransactionBegin();
end;

{ ��ʼ�������������ļ� }
procedure TfrmNTFSFiles.SearchDrivesFiles;
var
  strDrive: String;
  lstDrive: System.Types.TStringDynArray;
  sysFlags: DWORD;
  strNTFS : array [0 .. 255] of Char;
  intLen  : DWORD;
  I       : Integer;
begin
  { �������ݿ� }
  CreateSqlite3DB;

  { ��ʼ����Ա���� }
  FintCount                  := 0;
  FintSearchDriveThreadCount := 0;
  FlstAllDrives              := TStringList.Create;
  lblTip.Visible             := True;

  { ������ NTFS �����̷����뵽�������б� }
  lstDrive := TDirectory.GetLogicalDrives;
  for strDrive in lstDrive do
  begin
    if not GetVolumeInformation(PChar(strDrive), nil, 0, nil, intLen, sysFlags, strNTFS, 256) then
      Continue;

    if not SameText(strNTFS, 'NTFS') then
      Continue;

    FlstAllDrives.Add(strDrive[1]);
  end;

  if FlstAllDrives.Count = 0 then
    Exit;

  FintSearchDriveThreadCount := FlstAllDrives.Count;
  FintStartTime              := GetTickCount;

  { ���߳��������� NTFS ���������ļ� }
  for I := 0 to FlstAllDrives.Count - 1 do
  begin
    TSearchThread.Create(AnsiChar(FlstAllDrives.Strings[I][1]), Handle, FDatabase.db);
  end;

  { ������������߳��Ƿ���� }
  tmrSearchStop.Enabled := True;
end;

{ ������������߳��Ƿ���� }
procedure TfrmNTFSFiles.tmrSearchStopTimer(Sender: TObject);
begin
  if FintSearchDriveThreadCount <> 0 then
    Exit;

  { ���������߳�ִ�н��� }
  tmrSearchStop.Enabled := False;
  FDatabase.Commit;
  lblTip.Caption                  := Format('�ϼ��ļ�(%s)��%d���ϼ���ʱ��%d��', [FlstAllDrives.DelimitedText, FintCount, (GetTickCount - FintStartTime) div 1000 - 1]);
  tmrGetFileFullNameStart.Enabled := True;

  { ���������߳̽������ٻ�ȡ�����ļ���ȫ·���ļ����� }
  TGetFileFullNameThread.Create(FlstAllDrives, Handle, FDatabase);
end;

{ ��ȡ�ļ�ȫ·������ }
procedure TfrmNTFSFiles.GetFileFullNameFinished(var msg: TMessage);
begin
  srchbxFile.Visible  := True;
  btnReSearch.Visible := True;
  lblTip.Visible      := False;
  DrawDataItem;
end;

{ ���������ļ��������� }
procedure TfrmNTFSFiles.SearchDriveFileFinished(var msg: TMessage);
begin
  Dec(FintSearchDriveThreadCount);

  FintCount      := FintCount + msg.WParam;
  lblTip.Caption := string(PChar(msg.LParam));
  lblTip.Left    := (lblTip.Parent.Width - lblTip.Width) div 2;
end;

procedure TfrmNTFSFiles.FormResize(Sender: TObject);
begin
  lblTip.Left := (lblTip.Parent.Width - lblTip.Width) div 2;
end;

{ �������� }
procedure TfrmNTFSFiles.lvDataData(Sender: TObject; Item: TListItem);
var
  strSQL      : String;
  strValue    : String;
  strTableName: String;
begin
  strTableName := IfThen(FstrSqlWhere = '', c_strResultTableName, c_strSearchTempTableName);
  strSQL       := 'select FullName from ' + strTableName + ' where RowID=' + IntToStr(Item.Index + 1);
  strValue     := UTF8ToString(FDatabase.ExecuteNoExceptionUTF8(RawUTF8(strSQL)));
  Item.Caption := Format('%.10u', [Item.Index + 1]);
  Item.SubItems.Add(strValue);
end;

procedure TfrmNTFSFiles.srchbxFileInvokeSearch(Sender: TObject);
begin
  lvData.Items.Count  := 0;
  srchbxFile.Enabled  := False;
  btnReSearch.Enabled := False;
  FDatabase.ExecuteNoException('DROP TABLE ' + c_strSearchTempTableName);
  Screen.Cursor  := crSQLWait;
  lblTip.Caption := '�������������Ժ򡤡���������';
  lblTip.Visible := True;
  DelayTime(500);

  if (System.SysUtils.Trim(srchbxFile.Text) = '') or (Length(srchbxFile.Text) < 2) then
    FstrSqlWhere := ''
  else
    FstrSqlWhere := 'FullName like ' + QuotedStr('%' + srchbxFile.Text + '%');

  DrawDataItem;
end;

end.
