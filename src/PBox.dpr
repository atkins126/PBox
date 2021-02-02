program PBox;
{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

uses
  Vcl.Forms,
  Data.Win.ADODB,
  db.uCommon in 'db.uCommon.pas',
  db.LoginForm in 'db.LoginForm.pas' {frmLogin} ,
  db.MainForm in 'db.MainForm.pas' {frmPBox};

{$R *.res}

var
  strLoginName: String = '';

begin
  OnlyRunOneInstance;
  g_ADOCNN := TADOConnection.Create(nil);
  try
    CheckLoginForm(strLoginName);
    Application.Initialize;
    ReportMemoryLeaksOnShutdown   := True;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmPBox, frmPBox);
    frmPBox.lblLogin.Caption := strLoginName;
    Application.Run;
  finally
    g_ADOCNN.Free;
  end;

end.
