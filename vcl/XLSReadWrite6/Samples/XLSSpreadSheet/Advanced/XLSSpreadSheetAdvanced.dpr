program XLSSpreadSheetAdvanced;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  FrmColor in 'FrmColor.pas' {frmSelectColor},
  FrmSelPages in 'FrmSelPages.pas' {frmSelectPages},
  FrmExpHTML in 'FrmExpHTML.pas' {frmExportHTML},
  FrmPrntPreview in 'FrmPrntPreview.pas' {frmPrintPreview},
  FrmPgSetup in 'FrmPgSetup.pas' {frmPageSetup},
  FrmFormatCells in 'FrmFormatCells.pas' {frmFmtCells};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
