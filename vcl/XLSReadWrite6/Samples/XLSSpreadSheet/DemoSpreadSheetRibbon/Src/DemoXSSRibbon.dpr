program DemoXSSRibbon;



uses
  Vcl.Forms,
  Main in 'Main.pas' {fmrMain},
  FrmNames in 'FrmNames.pas' {frmNameManager},
  FrmEditName in 'FrmEditName.pas' {frmName},
  FormPageSetup in 'FormPageSetup.pas' {frmPageSetup},
  FrmSelPages in 'FrmSelPages.pas' {frmSelectPages},
  FrmExpHTML in 'FrmExpHTML.pas' {frmExportHTML},
  FrmDebugFmla in 'FrmDebugFmla.pas' {frmDebugFormula},
  RibbonMarkupSpreadSheet in '..\Ribbon\RibbonMarkupSpreadSheet.pas',
  FormTextBox in 'FormTextBox.pas' {frmTextBox},
  UIRibbon in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\UIRibbon.pas',
  UIRibbonActions in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\UIRibbonActions.pas',
  UIRibbonApi in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\UIRibbonApi.pas',
  UIRibbonCommands in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\UIRibbonCommands.pas',
  UIRibbonForm in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\UIRibbonForm.pas',
  UIRibbonUtils in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\UIRibbonUtils.pas',
  WinApiEx in 'C:\Users\Josef Stalin\Documents\Embarcadero\Studio\19.0\CatalogRepository\RibbonFramework-1.2\Lib\WinApiEx.pas',
  FrmFormatCells in '..\..\..\..\SrcXLS\Forms\FrmFormatCells.pas' {frmFmtCells};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmrMain, fmrMain);
  Application.CreateForm(TfrmExportHTML, frmExportHTML);
  Application.Run;
end.
