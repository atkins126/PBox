unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UIRibbon, UIRibbonForm, UIRibbonCommands, RibbonMarkupSpreadSheet,
  System.Actions, System.UITypes, Vcl.ActnList, XLSBook2, Vcl.StdActns, FrmFormatCells,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, XBookComponent2, XLSFormattedObj5,
  Xc12DataStyleSheet5, XLSUtils5, XBookPrint2, FormPageSetup, FrmNames, XLSNames5,
  FrmSelPages, FrmExpHTML, XLSSynPDF, Xc12Utils5, XSSIEKeys, XLSCellMMU5, FrmDebugFmla, XLSExportCSV5,
  XLSCmdFormat5, Vcl.Menus, XLSSheetData5, XLSRelCells5, XLSPivotTables5, FormSelectArea,
  XLSReadWriteII5, XLSDrawing5, FormTextBox, xpgParseChart, FrmEditName,
  Vcl.ExtActns;


const MRU_MAX = 10;

type
  TfmrMain = class(TUIRibbonForm)
    ActionList: TActionList;
    acClose: TAction;
    acFontUnderline: TAction;
    acFontItalic: TAction;
    acFontBold: TAction;
    acFontColor: TAction;
    acCellColor: TAction;
    acDebugT1: TAction;
    acDebugT2: TAction;
    acDebugT3: TAction;
    acLastFile: TAction;
    acFileOpen: TFileOpen;
    acFileNew: TAction;
    acFileSave: TAction;
    acFileSaveAs: TFileSaveAs;
    XSSPP: TXLSBookPrintPreview;
    acPrintPreview: TAction;
    acPrintPreviewClose: TAction;
    acPrintPreviewPagePrev: TAction;
    acPrintPreviewPageNext: TAction;
    acPrintPageSetup: TAction;
    acPrintPrint: TAction;
    acPrintQuickPrint: TAction;
    acExportHTML: TFileSaveAs;
    acExportPDF: TFileSaveAs;
    acExportCSV: TFileSaveAs;
    Panel: TPanel;
    cbCell: TComboBox;
    edCell: TEdit;
    XSS: TXLSSpreadSheet;
    acFormulaDebug: TAction;
    acFontName: TAction;
    acFontSize: TAction;
    acFontInc: TAction;
    acFontDec: TAction;
    acCopy: TAction;
    acCut: TAction;
    acPaste: TAction;
    acFmlaNameManager: TAction;
    popSheet: TPopupMenu;
    Formatcells1: TMenuItem;
    Sort1: TMenuItem;
    AtoZ1: TMenuItem;
    ZtoA1: TMenuItem;
    acFormatCells: TAction;
    acSortAZ: TAction;
    acSortZA: TAction;
    acAlignTop: TAction;
    acAlignMiddle: TAction;
    acAlignBottom: TAction;
    acAlignLeft: TAction;
    acAlignCenter: TAction;
    acAlignRight: TAction;
    acIndentInc: TAction;
    acIndentDec: TAction;
    acWrapText: TAction;
    acMergeAndCenter: TAction;
    acMergeCells: TAction;
    acUnMergeCells: TAction;
    acInsertPivotTable: TAction;
    acInsertChartBar: TAction;
    acInsertTextBox: TAction;
    acSampleDataChart: TAction;
    acSampleDataPivot: TAction;
    acSampleDataCells: TAction;
    acInsertPicture: TOpenPicture;
    acInsertChartLine: TAction;
    acInsertChartPie: TAction;
    acInsertChartArea: TAction;
    acInsertChartScatter: TAction;
    acInsertChartDoughnut: TAction;
    acInsertChartBubble: TAction;
    acInsertChartRadar: TAction;
    acFormulaShow: TAction;
    acFmlaDefineName: TAction;
    acFormatCellBorders: TAction;
    dlgPrinter: TPrinterSetupDialog;
    procedure XSSCellChanged(Sender: TObject; Col, Row: Integer);
    procedure acFontBoldExecute(Sender: TObject);
    procedure acFileOpenAccept(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acFileNewExecute(Sender: TObject);
    procedure acFileSaveExecute(Sender: TObject);
    procedure acFileSaveAsAccept(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acPrintPreviewExecute(Sender: TObject);
    procedure acPrintPreviewCloseExecute(Sender: TObject);
    procedure acPrintPreviewPageNextExecute(Sender: TObject);
    procedure acPrintPreviewPagePrevExecute(Sender: TObject);
    procedure acPrintPageSetupExecute(Sender: TObject);
    procedure acPrintPrintExecute(Sender: TObject);
    procedure acPrintQuickPrintExecute(Sender: TObject);
    procedure acExportHTMLAccept(Sender: TObject);
    procedure acExportPDFAccept(Sender: TObject);
    procedure acExportCSVAccept(Sender: TObject);
    procedure acDebugT3Execute(Sender: TObject);
    procedure acFormulaDebugExecute(Sender: TObject);
    procedure acFontNameExecute(Sender: TObject);
    procedure acFontSizeExecute(Sender: TObject);
    procedure acFontIncExecute(Sender: TObject);
    procedure acFontDecExecute(Sender: TObject);
    procedure acFontItalicExecute(Sender: TObject);
    procedure acFontUnderlineExecute(Sender: TObject);
    procedure acFontColorExecute(Sender: TObject);
    procedure acCopyExecute(Sender: TObject);
    procedure acCutExecute(Sender: TObject);
    procedure acPasteExecute(Sender: TObject);
    procedure acFmlaNameManagerExecute(Sender: TObject);
    procedure acFormatCellsExecute(Sender: TObject);
    procedure acSortAZExecute(Sender: TObject);
    procedure acSortZAExecute(Sender: TObject);
    procedure acAlignTopExecute(Sender: TObject);
    procedure acAlignMiddleExecute(Sender: TObject);
    procedure acAlignBottomExecute(Sender: TObject);
    procedure acAlignLeftExecute(Sender: TObject);
    procedure acAlignCenterExecute(Sender: TObject);
    procedure acAlignRightExecute(Sender: TObject);
    procedure acIndentIncExecute(Sender: TObject);
    procedure acIndentDecExecute(Sender: TObject);
    procedure acWrapTextExecute(Sender: TObject);
    procedure acMergeAndCenterExecute(Sender: TObject);
    procedure acMergeCellsExecute(Sender: TObject);
    procedure acUnMergeCellsExecute(Sender: TObject);
    procedure PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure acInsertPivotTableExecute(Sender: TObject);
    procedure acSampleDataChartExecute(Sender: TObject);
    procedure acSampleDataPivotExecute(Sender: TObject);
    procedure acSampleDataCellsExecute(Sender: TObject);
    procedure acInsertPictureAccept(Sender: TObject);
    procedure acInsertTextBoxExecute(Sender: TObject);
    procedure acInsertChartBarExecute(Sender: TObject);
    procedure acInsertChartLineExecute(Sender: TObject);
    procedure acInsertChartPieExecute(Sender: TObject);
    procedure acInsertChartScatterExecute(Sender: TObject);
    procedure acInsertChartAreaExecute(Sender: TObject);
    procedure acInsertChartDoughnutExecute(Sender: TObject);
    procedure acInsertChartBubbleExecute(Sender: TObject);
    procedure acInsertChartRadarExecute(Sender: TObject);
    procedure acFormulaShowExecute(Sender: TObject);
    procedure acFmlaDefineNameExecute(Sender: TObject);
    procedure acFormatCellBordersExecute(Sender: TObject);
private
protected
    FCmdFontUnderline: TUICommandBoolean;
    FCmdFontBold     : TUICommandBoolean;
    FCmdFontItalic   : TUICommandBoolean;
    FCmdMRU          : TUICommandRecentItems;
    FCmdFontName     : TUICommandCollection;
    FCmdFontSize     : TUICommandCollection;
    FCmdFontColor    : TUICommandColorAnchor;
    FCmdCellColor    : TUICommandColorAnchor;
    FCmdAlignTop     : TUICommandBoolean;
    FCmdAlignMiddle  : TUICommandBoolean;
    FCmdAlignBottom  : TUICommandBoolean;
    FCmdAlignLeft    : TUICommandBoolean;
    FCmdAlignCenter  : TUICommandBoolean;
    FCmdAlignRight   : TUICommandBoolean;
    FCmdWrapText     : TUICommandBoolean;

    procedure LoadMRU;
    procedure SaveMRU;
    procedure UpdateMRU(const AFilename: AxUCString);
    procedure UpdateCaption;
    procedure UpdateCellFormat(const ACol,ARow: integer);
    procedure UpdateCellName(const ACol,ARow: integer);
    procedure UpdateCellText(const ACol,ARow: integer);

    procedure ErrorEvent(ASender: TObject; ALevel: TXLSErrorLevel; AText: string);

    procedure ExportOnPrintPDF(ASender: TObject);

    procedure FillFontNames;
    procedure FillFontSizes;

    procedure ExecuteFmtRotate(const Args: TUICommandActionEventArgs);

    procedure CommandCreated(const Sender: TUIRibbon; const Command: TUICommand); override;
    procedure CommandFontColorExecute(const Args: TUICommandColorEventArgs);
    procedure CommandCellColorExecute(const Args: TUICommandColorEventArgs);
    procedure CommandCellBorderPresetExecute(const Args: TUICommandActionEventArgs);
    procedure CommandRecentItemsSelect(const Command: TUICommandRecentItems; const Verb: TUICommandVerb; const ItemIndex: Integer; const Properties: TUICommandExecutionProperties);

    procedure DoPassword(Sender: TObject; var Password: AxUCString);

    procedure InsertPivotTable(ACol, ARow: integer);
    procedure InsertChart(AChart,ACol,ARow: integer);
public
    { Public declarations }
  end;

var
  fmrMain: TfmrMain;

implementation

{$R *.dfm}
{$R '..\Ribbon\RibbonMarkupSpreadSheet.res'}

{ TForm1 }

procedure TfmrMain.CommandCellBorderPresetExecute(const Args: TUICommandActionEventArgs);
begin
  if Args.Verb = cvExecute then begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);

    XSS.XLS.CmdFormat.Border.Style := cbsThin;
    case Args.Command.CommandId of
      CmdBorderBottom            : XSS.XLS.CmdFormat.Border.Side[cbsBottom] := True;
      CmdBorderTop               : XSS.XLS.CmdFormat.Border.Side[cbsTop] := True;
      CmdBorderLeft              : XSS.XLS.CmdFormat.Border.Side[cbsLeft] := True;
      CmdBorderRight             : XSS.XLS.CmdFormat.Border.Side[cbsRight] := True;
      CmdBorderNoBorder          : XSS.XLS.CmdFormat.Border.Preset(cbspNone);
      CmdBorderAllBorders        : XSS.XLS.CmdFormat.Border.Preset(cbspOutlineAndInside);
      CmdBorderOutsideBorders    : XSS.XLS.CmdFormat.Border.Preset(cbspOutline);
      CmdBorderThickBoxBorder    : begin
        XSS.XLS.CmdFormat.Border.Style := cbsThick;
        XSS.XLS.CmdFormat.Border.Preset(cbspOutline);
      end;
      CmdBorderBottomDouble      : begin
        XSS.XLS.CmdFormat.Border.Style := cbsDouble;
        XSS.XLS.CmdFormat.Border.Side[cbsBottom] := True;
      end;
      CmdBorderThickBottom       : begin
        XSS.XLS.CmdFormat.Border.Style := cbsThick;
        XSS.XLS.CmdFormat.Border.Side[cbsBottom] := True;
      end;
      CmdBorderTopAndBottom      : begin
        XSS.XLS.CmdFormat.Border.Side[cbsTop] := True;
        XSS.XLS.CmdFormat.Border.Side[cbsBottom] := True;
      end;
      CmdBorderTopAndThickBottom : begin
        XSS.XLS.CmdFormat.Border.Side[cbsTop] := True;
        XSS.XLS.CmdFormat.Border.Style := cbsThick;
        XSS.XLS.CmdFormat.Border.Side[cbsBottom] := True;
      end;
      CmdBorderTopAndDoubleBottom: begin
        XSS.XLS.CmdFormat.Border.Side[cbsTop] := True;
        XSS.XLS.CmdFormat.Border.Style := cbsDouble;
        XSS.XLS.CmdFormat.Border.Side[cbsBottom] := True;
      end;
    end;

    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.CommandCellColorExecute(const Args: TUICommandColorEventArgs);
begin
  if XSS.XSSSheet.InplaceEditor = Nil then begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    XSS.XLS.CmdFormat.Fill.BackgroundColor.TColor := FCmdCellColor.Color;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.CommandFontColorExecute(const Args: TUICommandColorEventArgs);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then begin
    XSS.XSSSheet.InplaceEditor.CHP.Color := FCmdFontColor.Color;
    XSS.XSSSheet.InplaceEditor.Command(axcFormatCHP);
  end
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    XSS.XLS.CmdFormat.Font.Color.TColor := FCmdFontColor.Color;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.CommandCreated(const Sender: TUIRibbon; const Command: TUICommand);
begin
  inherited;

  case Command.CommandId of
    CmdFileNew       : TUICommandAction(Command).ActionLink.Action := acFileNew;
    CmdFileOpen      : TUICommandAction(Command).ActionLink.Action := acFileOpen;
    CmdFileSave      : TUICommandAction(Command).ActionLink.Action := acFileSave;
    CmdFileSaveAs    : TUICommandAction(Command).ActionLink.Action := acFileSaveAs;
    CmdFileSaveAsHTML: TUICommandAction(Command).ActionLink.Action := acExportHTML;
    CmdFileSaveAsPDF : TUICommandAction(Command).ActionLink.Action := acExportPDF;
    CmdFileSaveAsCSV : TUICommandAction(Command).ActionLink.Action := acExportCSV;

    CmdFileClose    : TUICommandAction(Command).ActionLink.Action := acClose;

    CmdFilePrintPrint   : TUICommandAction(Command).ActionLink.Action := acPrintPrint;
    CmdFilePrintMore    : TUICommandAction(Command).ActionLink.Action := acPrintPrint;
    CmdFilePrintQuick   : TUICommandAction(Command).ActionLink.Action := acPrintQuickPrint;
    CmdFilePrintPreview : TUICommandAction(Command).ActionLink.Action := acPrintPreview;
    CmdPrintPreviewClose: TUICommandAction(Command).ActionLink.Action := acPrintPreviewClose;
    CmdPrintPageNext    : TUICommandAction(Command).ActionLink.Action := acPrintPreviewPageNext;
    CmdPrintPagePrev    : TUICommandAction(Command).ActionLink.Action := acPrintPreviewPagePrev;
    CmdPrintPageSetup   : TUICommandAction(Command).ActionLink.Action := acPrintPageSetup;

    CmdFontBold     : begin
      FCmdFontBold := Command as TUICommandBoolean;
      FCmdFontBold.ActionLink.Action := acFontBold;
    end;
    CmdFontItalic   : begin
      FCmdFontItalic := Command as TUICommandBoolean;
      FCmdFontItalic.ActionLink.Action := acFontItalic;
    end;
    CmdFontUnderline: begin
      FCmdFontUnderline := Command as TUICommandBoolean;
      FCmdFontUnderline.ActionLink.Action := acFontUnderline;
    end;
    CmdFontUDouble  : begin
//      TUICommandAction(Command).OnExecute := CommandExecute;
    end;
    CmdFontSize     : begin
      FCmdFontSize := TUICommandCollection(Command);
      FCmdFontSize.RepresentativeString := '8888';
      FCmdFontSize.ActionLink.Action := acFontSize;
      FillFontSizes;
    end;
    CmdFontName     : begin
      FCmdFontName := TUICommandCollection(Command);
      FCmdFontName.ActionLink.Action := acFontName;
      FillFontNames;
    end;
    CmdFontColor    : begin
      FCmdFontColor := TUICommandColorAnchor(Command);
      FCmdFontColor.OnExecute := CommandFontColorExecute;
    end;
    CmdIncFont      : TUICommandAction(Command).ActionLink.Action := acFontInc;
    CmdDecFont      : TUICommandAction(Command).ActionLink.Action := acFontDec;

    CmdFillColor    : begin
      FCmdCellColor := TUICommandColorAnchor(Command);
      FCmdCellColor.OnExecute := CommandCellColorExecute;
    end;

    CmdBorderBottom..CmdBorderTopAndDoubleBottom: begin
      TUICommandAction(Command).OnExecute := CommandCellBorderPresetExecute;
    end;

    CmdAlignVertTop    : begin
      FCmdAlignTop := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acAlignTop;
    end;
    CmdAlignVertMiddle : begin
      FCmdAlignMiddle := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acAlignMiddle;
    end;
    CmdAlignVertBottom : begin
      FCmdAlignBottom := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acAlignBottom;
    end;
    CmdALignHoriztLeft : begin
      FCmdAlignLeft := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acAlignLeft;
    end;
    CmdAlignHorizCenter: begin
      FCmdAlignCenter := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acAlignCenter;
    end;
    CmdAlignHorizRight : begin
      FCmdAlignRight := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acAlignRight;
    end;

    CmdAlignRotCounterClock,  //  45
    CmdAlignRotClockwise,     // -45
    CmdAlignRotVerticalText,  //  ??
    CmdAlignRotTextUp,        //  90
    CmdAlignRotTextDown:      // -90
     TUICommandAction(Command).OnExecute := ExecuteFmtRotate;

    CmdIndentInc     : TUICommandAction(Command).ActionLink.Action := acIndentInc;
    CmdIndentDec     : TUICommandAction(Command).ActionLink.Action := acIndentDec;

    CmdAlignWrapText : begin
      FCmdWrapText := Command as TUICommandBoolean;
      TUICommandAction(Command).ActionLink.Action := acWrapText;
    end;

    CmdAlignMegeAndCenter: TUICommandAction(Command).ActionLink.Action := acMergeAndCenter;
    CmdAlignMergeCells   : TUICommandAction(Command).ActionLink.Action := acMergeCells;
    CmdAlignUnMergeCells : TUICommandAction(Command).ActionLink.Action := acUnMergeCells;

    CmdBorderMoreBorders : TUICommandAction(Command).ActionLink.Action := acFormatCellBorders;

    CmdRecentItems   : begin
      FCmdMRU := TUICommandRecentItems(Command);
      FCmdMRU.OnSelect := CommandRecentItemsSelect;
      LoadMRU;
    end;

    CmdFormulaDebug        : TUICommandAction(Command).ActionLink.Action := acFormulaDebug;
    CmdFmlaDefineName      : TUICommandAction(Command).ActionLink.Action := acFmlaDefineName;
    CmdFmlaNameManager     : TUICommandAction(Command).ActionLink.Action := acFmlaNameManager;
    CmdFormulaShowFormulas : TUICommandAction(Command).ActionLink.Action := acFormulaShow;

    CmdCopy                : TUICommandAction(Command).ActionLink.Action := acCopy;
    CmdCut                 : TUICommandAction(Command).ActionLink.Action := acCut;
    CmdPaste               : TUICommandAction(Command).ActionLink.Action := acPaste;

    CmdInsertItemPivotTable: TUICommandAction(Command).ActionLink.Action := acInsertPivotTable;
    CmdInsertItemPicture   : TUICommandAction(Command).ActionLink.Action := acInsertPicture;
    CmdInsertItemTextBox   : TUICommandAction(Command).ActionLink.Action := acInsertTextBox;

    CmdInsertChartBar      : TUICommandAction(Command).ActionLink.Action := acInsertChartBar;
    CmdInsertChartLine     : TUICommandAction(Command).ActionLink.Action := acInsertChartLine;
    CmdInsertChartPie      : TUICommandAction(Command).ActionLink.Action := acInsertChartPie;
    CmdInsertChartScatter  : TUICommandAction(Command).ActionLink.Action := acInsertChartScatter;
    CmdInsertChartArea     : TUICommandAction(Command).ActionLink.Action := acInsertChartArea;
    CmdInsertChartDoughnut : TUICommandAction(Command).ActionLink.Action := acInsertChartDoughnut;
    CmdInsertChartBubble   : TUICommandAction(Command).ActionLink.Action := acInsertChartBubble;
    CmdInsertChartRadar    : TUICommandAction(Command).ActionLink.Action := acInsertChartRadar;

    CmdSampleDataChart: TUICommandAction(Command).ActionLink.Action := acSampleDataChart;
    CmdSampleDataPivot: TUICommandAction(Command).ActionLink.Action := acSampleDataPivot;
    CmdSampleDataCells: TUICommandAction(Command).ActionLink.Action := acSampleDataCells;

    CmdDebug_T1      : TUICommandAction(Command).ActionLink.Action := acDebugT1;
    CmdDebug_T2      : TUICommandAction(Command).ActionLink.Action := acDebugT2;
    CmdDebug_T3      : TUICommandAction(Command).ActionLink.Action := acDebugT3;

    CmdTest_LastFile: TUICommandAction(Command).ActionLink.Action := acLastFile;
  end;
end;

procedure TfmrMain.CommandRecentItemsSelect(const Command: TUICommandRecentItems; const Verb: TUICommandVerb; const ItemIndex: Integer; const Properties: TUICommandExecutionProperties);
var
  S: string;
begin
  if Verb = cvExecute then begin
    S := TUIRecentItem(Command.Items[ItemIndex]).Description;
    XSS.Filename := S;
    XSS.Read;
    UpdateMRU(S);
    UpdateCaption;
  end;
end;

procedure TfmrMain.DoPassword(Sender: TObject; var Password: AxUCString);
begin
  Password := InputBox('Password','Password for workbook',Password);
end;

procedure TfmrMain.ErrorEvent(ASender: TObject; ALevel: TXLSErrorLevel; AText: string);
begin
  // Don't show errors while editing formulas.
  if XSS.XSSSheet.InplaceEditor = Nil then
    MessageDlg(AText,mtError,[mbOk],0);
end;

procedure TfmrMain.ExecuteFmtRotate(const Args: TUICommandActionEventArgs);
begin
  if Args.Verb = cvExecute then begin
    case Args.Command.CommandId of
      CmdAlignRotCounterClock: XSS.Command(xsscFmtRotate,45);
      CmdAlignRotClockwise   : XSS.Command(xsscFmtRotate,-45);
//      CmdAlignRotVerticalText: XSS.Command(xsscFmtRotate,45);
      CmdAlignRotTextUp      : XSS.Command(xsscFmtRotate,90);
      CmdAlignRotTextDown    : XSS.Command(xsscFmtRotate,-90);
    end;
  end;
end;

procedure TfmrMain.ExportOnPrintPDF(ASender: TObject);
var
  i: integer;
  PDF: TPdfDocumentGDI;
  Data: TXLSPDFData;
begin
  Data := TXLSPDFData(ASender);
  PDF := TPdfDocumentGDI.Create;
  try
    PDF.SaveToStreamDirectBegin(Data.Stream);
    for i := Data.Page1 to Data.Page2 do begin
       Data.Printer.Paginate(i);
       PDF.AddPage;
       Data.Printer.Metafile.Width := Round((Data.Printer.PaperWidth * 1000) / 25.4);
       Data.Printer.Metafile.Height := Round((Data.Printer.PaperHeight * 1000) / 25.4);
       PDF.VCLCanvas.Draw(Data.XMarg,Data.YMarg,Data.Printer.Metafile);
       PDF.SaveToStreamDirectPageFlush;
    end;
     PDF.SaveToStreamDirectEnd;
  finally
    PDF.Free;
  end;
end;

procedure TfmrMain.FillFontNames;
var
  i   : integer;
  List: TStringList;
  Item: TUIGalleryCollectionItem;
begin
  List := TStringList.Create;
  try
    GetAvailableFonts(List);
    List.Sort;

    for i := 0 to List.Count - 1 do begin
      Item := TUIGalleryCollectionItem.Create(List[i]);
      FCmdFontName.Items.Add(Item);
    end;

  finally
    List.Free;
  end;
end;

procedure TfmrMain.FillFontSizes;
const
  FontSizes: array[0..15] of string = ('8','9','10','11','12','14','16','18','20','22','24','26','28','36','48','72');
var
  i   : integer;
  Item: TUIGalleryCollectionItem;
begin
  for i := 0 to High(FontSizes) do begin
    Item := TUIGalleryCollectionItem.Create(FontSizes[i]);
    FCmdFontSize.Items.Add(Item);
  end;
end;

procedure TfmrMain.FormCreate(Sender: TObject);
begin
  acInsertPicture.Dialog.Filter := XLSPictureFilesFilter;

  XSSPP.Visible := False;
  XSS.XLS.Manager.Errors.OnError := ErrorEvent;
  XSS.XLS.OnPassword := DoPassword;
  UpdateCaption;
end;

procedure TfmrMain.FormDestroy(Sender: TObject);
begin
  SaveMRU;
end;

procedure TfmrMain.InsertChart(AChart, ACol, ARow: integer);
var
  RCells: TXLSRelCells;
  CSpace: TCT_ChartSpace;
begin
  RCells := XSS.XLSSheet.CreateRelativeCells;
  try
    RCells.SetArea(0,0,4,4);

    CSpace := Nil;

    case AChart of
      0: CSpace := XSS.XLSSheet.Drawing.Charts.MakeBarChart(RCells,ACol,ARow,True);
      1: CSpace := XSS.XLSSheet.Drawing.Charts.MakeLineChart(RCells,ACol,ARow);
      2: CSpace := XSS.XLSSheet.Drawing.Charts.MakeAreaChart(RCells,ACol,ARow);
      3: XSS.XLSSheet.Drawing.Charts.MakeBubbleChart(RCells,ACol,ARow);
      4: CSpace := XSS.XLSSheet.Drawing.Charts.MakeDoughnutChart(RCells,ACol,ARow);
      5: begin
        RCells.ColCount := 1;
        CSpace := XSS.XLSSheet.Drawing.Charts.MakePieChart(RCells,ACol,ARow);
      end;
      6: CSpace := XSS.XLSSheet.Drawing.Charts.MakeRadarChart(RCells,ACol,ARow);
      7: CSpace := XSS.XLSSheet.Drawing.Charts.MakeScatterChart(RCells,ACol,ARow);
      else
         CSpace := XSS.XLSSheet.Drawing.Charts.MakeBarChart(RCells,ACol,ARow,True);
    end;

    if CSpace <> Nil then begin
      CSpace.Chart.CreateDefaultLegend;
      CSpace.Chart.Legend.Create_LegendPos;
    end;

  finally
    RCells.Free;
  end;

  XSS.InvalidateSheet;
end;

procedure TfmrMain.InsertPivotTable(ACol, ARow: integer);
var
  SrcRef: TXLSRelCells;
  DstRef: TXLSRelCells;
  Sheet : TXLSWorkSheet;
  PivTbl: TXLSPivotTable;
begin
  if XSS.XLSSheet.SelectedAreas.Count = 1 then begin
    SrcRef := XSS.XLSSheet.CreateRelativeCells(XSS.XLSSheet.SelectedAreas.Last.AsRect);
    if XSS.XLSSheet.SelectedAreas.Last.IsColumns then
      SrcRef.Row2 := SrcRef.LastNonBlankRow - 1;

    if TfrmSelectArea.Create(Self).Execute(SrcRef) then begin
      XSS.XLS.Add;

      Sheet := XSS.XLS[XSS.XLS.Count - 1];

      Sheet.CalcDimensions;

      DstRef := Sheet.CreateRelativeCells(ACol,ARow);

      PivTbl := Sheet.PivotTables.CreateTable(SrcRef,DstRef);

      XSS.SetSheet(XSS.XLS.Count - 1);

      PivTbl.Make;

      Sheet.SelectedAreas.CursorCell(ACol,ARow);

      XSS.InvalidateAndReloadSheet;

      XSS.XSSSheet.ShowPivotForm;
    end
    else
      SrcRef.Free;
  end;
end;

procedure TfmrMain.LoadMRU;
var
  i: integer;
  S: string;
  Item: TUIRecentItem;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  try
    for i := 1 to MRU_MAX do begin
      S := Ini.ReadString('MRU','File' + IntToStr(i),'');
      if S = '' then
        Exit;
      Item := TUIRecentItem.Create;
      Item.LabelText := S;
      FCmdMRU.Items.Add(Item);
    end;
    FCmdMRU.OnSelect := CommandRecentItemsSelect;
  finally
    Ini.Free
  end;
end;

procedure TfmrMain.PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
//
end;

procedure TfmrMain.acAlignBottomExecute(Sender: TObject);
begin
  FCmdAlignTop.Checked := False;
  FCmdAlignMiddle.Checked := False;
  XSS.Command(xsscFmtAlignVertBottom);
end;

procedure TfmrMain.acAlignCenterExecute(Sender: TObject);
begin
  FCmdAlignLeft.Checked := False;
  FCmdAlignRight.Checked := False;
  XSS.Command(xsscFmtAlignHorizCenter);
end;

procedure TfmrMain.acAlignLeftExecute(Sender: TObject);
begin
  FCmdAlignCenter.Checked := False;
  FCmdAlignRight.Checked := False;
  XSS.Command(xsscFmtAlignHorizLeft);
end;

procedure TfmrMain.acAlignMiddleExecute(Sender: TObject);
begin
  FCmdAlignTop.Checked := False;
  FCmdAlignBottom.Checked := False;
  XSS.Command(xsscFmtAlignVertMiddle);
end;

procedure TfmrMain.acAlignRightExecute(Sender: TObject);
begin
  FCmdAlignLeft.Checked := False;
  FCmdAlignCenter.Checked := False;
  XSS.Command(xsscFmtAlignHorizRight);
end;

procedure TfmrMain.acAlignTopExecute(Sender: TObject);
begin
  FCmdAlignMiddle.Checked := False;
  FCmdAlignBottom.Checked := False;
  XSS.Command(xsscFmtAlignVertTop);
end;

procedure TfmrMain.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmrMain.acCopyExecute(Sender: TObject);
begin
  XSS.Command(xsscEditCopy);
end;

procedure TfmrMain.acCutExecute(Sender: TObject);
begin
  XSS.Command(xsscEditCut);
end;

procedure TfmrMain.acDebugT3Execute(Sender: TObject);
begin
  XSS.XLS[0].Columns.SetColWidth(2, 2, 5000);
  XSS.XLS[0].Columns.SetColWidth(4, 4, 7000);
  XSS.XLS[0].Columns.SetColWidth(2, 2, 5000);
  XSS.XLS[0].Columns.SetColWidth(4, 4, 7000);

  XSS.InvalidateAndReloadSheet;
end;

procedure TfmrMain.acExportCSVAccept(Sender: TObject);
begin
  // If only one cell is selected, export the entire sheet.
  if (XSS.XLSSheet.SelectedAreas.Count = 1) and (XSS.XLSSheet.SelectedAreas[0].CellCount = 1) then
    ExportCSV(XSS.XLS,XSS.XLSSheet.Index,';','"',[],acExportCSV.Dialog.FileName)
  // Export the selected cells.
  else
    ExportCSV(XSS.XLS,XSS.XLSSheet.Index,';','"',[ecoSelection],acExportCSV.Dialog.FileName);
end;

procedure TfmrMain.acExportHTMLAccept(Sender: TObject);
begin
  TfrmExportHTML.Create(Application).Execute(XSS.XLS,acExportHTML.Dialog.FileName);
end;

procedure TfmrMain.acExportPDFAccept(Sender: TObject);
var
  P1,P2: integer;
  Print: TXLSBookPrint;
begin
  P1 := -1;
  P2 := -1;
  if TfrmSelectPages.Create(Application).Execute(P1,P2) then begin
    Print := TXLSBookPrint.Create(Nil);
    Print.OnPrintPDF := ExportOnPrintPDF;
    try
      Print.XSS := XSS;
      if (P1 >= 0) and (P2 >= 0) then begin
        Print.FirstPage := P1;
        Print.LastPage := P2;
      end;
      Print.ExportToPDF(acExportPDF.Dialog.FileName);
    finally
      Print.Free;
    end;
  end;
end;

procedure TfmrMain.acFileNewExecute(Sender: TObject);
begin
  XSS.Clear;
end;

procedure TfmrMain.acFileOpenAccept(Sender: TObject);
begin
  XSS.Filename := acFileOpen.Dialog.FileName;
  XSS.Read;
  UpdateMRU(acFileOpen.Dialog.FileName);
  UpdateCaption;
end;

procedure TfmrMain.acFileSaveAsAccept(Sender: TObject);
begin
  XSS.Filename := acFileSaveAs.Dialog.FileName;
  XSS.Write;
  UpdateCaption;
end;

procedure TfmrMain.acFileSaveExecute(Sender: TObject);
begin
  if XSS.Filename = '' then
    acFileSaveAs.Execute
  else
    XSS.Write;
end;

procedure TfmrMain.acFmlaDefineNameExecute(Sender: TObject);
begin
  TfrmName.Create(Self).Execute(XSS.XLS,XSS.XLSSheet,Nil);
end;

procedure TfmrMain.acFmlaNameManagerExecute(Sender: TObject);
begin
  TfrmNameManager.Create(Self).Execute(XSS.XLS);
end;

procedure TfmrMain.acFontBoldExecute(Sender: TObject);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then
    XSS.XSSSheet.InplaceEditor.Command(axcFormatBold)
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    if FCmdFontBold.Checked then
      XSS.XLS.CmdFormat.Font.Style := XSS.XLS.CmdFormat.Font.Style + [xfsBold]
    else
      XSS.XLS.CmdFormat.Font.Style := XSS.XLS.CmdFormat.Font.Style - [xfsBold];
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acFontColorExecute(Sender: TObject);
begin
//
end;

procedure TfmrMain.acFontDecExecute(Sender: TObject);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then begin
    if XSS.XSSSheet.InplaceEditor.CHP.Size >= 2 then begin
      XSS.XSSSheet.InplaceEditor.CHP.Size := XSS.XSSSheet.InplaceEditor.CHP.Size - 1;
      XSS.XSSSheet.InplaceEditor.Command(axcFormatCHP);
    end;
  end
  else begin
    if XSS.XLS.CmdFormat.Font.Size >= 2 then begin
      XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
      XSS.XLS.CmdFormat.Font.Size := XSS.XLS.CmdFormat.Font.Size - 1;
      XSS.XLS.CmdFormat.Apply;
      XSS.InvalidateSheet;
    end;
  end;
end;

procedure TfmrMain.acFontIncExecute(Sender: TObject);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then begin
    XSS.XSSSheet.InplaceEditor.CHP.Size := XSS.XSSSheet.InplaceEditor.CHP.Size + 1;
    XSS.XSSSheet.InplaceEditor.Command(axcFormatCHP);
  end
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    XSS.XLS.CmdFormat.Font.Size := XSS.XLS.CmdFormat.Font.Size + 1;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acFontItalicExecute(Sender: TObject);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then
    XSS.XSSSheet.InplaceEditor.Command(axcFormatItalic)
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    if FCmdFontItalic.Checked then
      XSS.XLS.CmdFormat.Font.Style := XSS.XLS.CmdFormat.Font.Style + [xfsItalic]
    else
      XSS.XLS.CmdFormat.Font.Style := XSS.XLS.CmdFormat.Font.Style - [xfsItalic];
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acFontNameExecute(Sender: TObject);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then begin
    XSS.XSSSheet.InplaceEditor.CHP.FontName := FCmdFontName.Text;
    XSS.XSSSheet.InplaceEditor.Command(axcFormatCHP);
  end
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    XSS.XLS.CmdFormat.Font.Name := FCmdFontName.Text;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acFontSizeExecute(Sender: TObject);
var
  Sz: double;
begin
  Sz := StrToFloatDef(FCmdFontSize.Text,0);
  if Sz <= 0 then
    Exit;

  if XSS.XSSSheet.InplaceEditor <> Nil then begin
    XSS.XSSSheet.InplaceEditor.CHP.Size := Sz;
    XSS.XSSSheet.InplaceEditor.Command(axcFormatCHP);
  end
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    XSS.XLS.CmdFormat.Font.Size := Sz;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acFontUnderlineExecute(Sender: TObject);
begin
  if XSS.XSSSheet.InplaceEditor <> Nil then
    XSS.XSSSheet.InplaceEditor.Command(axcFormatUnderline)
  else begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    if FCmdFontUnderline.Checked then
      XSS.XLS.CmdFormat.Font.Underline := xulSingle
    else
      XSS.XLS.CmdFormat.Font.Underline := xulNone;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acFormatCellBordersExecute(Sender: TObject);
begin
  TfrmFmtCells.Create(Self).Execute(XSS,3);
end;

procedure TfmrMain.acFormatCellsExecute(Sender: TObject);
begin
  if TfrmFmtCells.Create(Application).Execute(XSS) then
    XSS.InvalidateSheet;
end;

procedure TfmrMain.acFormulaDebugExecute(Sender: TObject);
var
  CellType: TXLSCellType;
begin
  CellType := XSS.XLSSheet.CellType[XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow];
  if CellType in XLSCellTypeFormulas then
    TfrmDebugFormula.Create(Application).Execute(XSS.XLS.Manager,XSS.XLSSheet.Index,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acFormulaShowExecute(Sender: TObject);
begin
  if soShowFormulas in XSS.XLSSheet.Options then
    XSS.XLSSheet.Options := XSS.XLSSheet.Options - [soShowFormulas]
  else
    XSS.XLSSheet.Options := XSS.XLSSheet.Options + [soShowFormulas];

  XSS.InvalidateSheet;
end;

procedure TfmrMain.acIndentDecExecute(Sender: TObject);
var
  Indent: integer;
begin
  Indent := XSS.XLSSheet.Cell[XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow].Indent - 1;
  if Indent >= 0 then begin
    XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
    XSS.XLS.CmdFormat.Alignment.Indent := Indent;
    XSS.XLS.CmdFormat.Apply;
    XSS.InvalidateSheet;
  end;
end;

procedure TfmrMain.acIndentIncExecute(Sender: TObject);
var
  Indent: integer;
begin
  Indent := XSS.XLSSheet.Cell[XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow].Indent + 1;

  XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
  XSS.XLS.CmdFormat.Alignment.Indent := Indent;
  XSS.XLS.CmdFormat.Apply;

  XSS.InvalidateSheet;
end;

procedure TfmrMain.acInsertChartAreaExecute(Sender: TObject);
begin
  InsertChart(2,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartBarExecute(Sender: TObject);
begin
  InsertChart(0,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartBubbleExecute(Sender: TObject);
begin
  InsertChart(3,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartDoughnutExecute(Sender: TObject);
begin
  InsertChart(4,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartLineExecute(Sender: TObject);
begin
  InsertChart(1,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartPieExecute(Sender: TObject);
begin
  InsertChart(5,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartRadarExecute(Sender: TObject);
begin
  InsertChart(6,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertChartScatterExecute(Sender: TObject);
begin
  InsertChart(7,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow);
end;

procedure TfmrMain.acInsertPictureAccept(Sender: TObject);
begin
  XSS.XLSSheet.Drawing.InsertImage(acInsertPicture.Dialog.FileName,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow,0,0);

  XSS.InvalidateSheet;
end;

procedure TfmrMain.acInsertPivotTableExecute(Sender: TObject);
begin
  InsertPivotTable(0,2);
end;

procedure TfmrMain.acInsertTextBoxExecute(Sender: TObject);
var
  S : AxUCString;
  TB: TXLSDrawingTextBox;
begin
  S := '';

  if TfrmTextBox.Create(Self).Execute(S) then begin
    TB := XSS.XLSSheet.Drawing.InsertTextBox(S,XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow,XSS.XLSSheet.SelectedAreas.ActiveCol + 3,XSS.XLSSheet.SelectedAreas.ActiveRow + 5);

    XSS.InvalidateAndReloadSheet;
  end;
end;

procedure TfmrMain.acMergeAndCenterExecute(Sender: TObject);
begin
  XSS.Command(xsscMergeCells);
  XSS.Command(xsscFmtAlignHorizCenter);
end;

procedure TfmrMain.acMergeCellsExecute(Sender: TObject);
begin
  XSS.Command(xsscMergeCells);
end;

procedure TfmrMain.acPasteExecute(Sender: TObject);
begin
  XSS.Command(xsscEditPaste);
end;

procedure TfmrMain.acPrintPageSetupExecute(Sender: TObject);
begin
  if TFrmPageSetup.Create(Self).Exceute(XSS.XLSSheet) then begin
    XSSPP.Execute;
    XSSPP.Paint;
  end;
end;

procedure TfmrMain.acPrintPreviewCloseExecute(Sender: TObject);
begin
  Ribbon.SetApplicationModes([0]);
  Panel.Visible := True;
  XSSPP.Visible := False;
end;

procedure TfmrMain.acPrintPreviewExecute(Sender: TObject);
begin
  Ribbon.SetApplicationModes([1]);
  Panel.Visible := False;
  XSSPP.Visible := True;
  XSSPP.Execute;
end;

procedure TfmrMain.acPrintPreviewPageNextExecute(Sender: TObject);
begin
  if XSSPP.CurrPage < (XSSPP.PageCount - 1) then
    XSSPP.CurrPage := XSSPP.CurrPage + 1;
end;

procedure TfmrMain.acPrintPreviewPagePrevExecute(Sender: TObject);
begin
  if XSSPP.CurrPage > 0 then
    XSSPP.CurrPage := XSSPP.CurrPage - 1;
end;

procedure TfmrMain.acPrintPrintExecute(Sender: TObject);
var
  P1,P2: integer;
  Print: TXLSBookPrint;
begin
  if not dlgPrinter.Execute then
    Exit;

  P1 := -1;
  P2 := -1;
  if TfrmSelectPages.Create(Application).Execute(P1,P2) then begin
    Print := TXLSBookPrint.Create(Nil);
    try
      Print.XSS := XSS;
      if (P1 >= 0) and (P2 >= 0) then begin
        Print.FirstPage := P1;
        Print.LastPage := P2;
      end;
      Print.Print;
    finally
      Print.Free;
    end;
  end;
end;

procedure TfmrMain.acPrintQuickPrintExecute(Sender: TObject);
var
  Print: TXLSBookPrint;
begin
  Print := TXLSBookPrint.Create(Nil);
  try
    Print.XSS := XSS;
    Print.Print;
  finally
    Print.Free;
  end;
end;

procedure TfmrMain.acSampleDataCellsExecute(Sender: TObject);
var
  c,r: integer;
begin
  for r := 0 to 5 do begin
    for c := 0 to 9 do
      XSS.XLSSheet.AsString[c,r] := 'Cell ' + ColRowToRefStr(c,r);
  end;

  XSS.InvalidateSheet;
end;

procedure TfmrMain.acSampleDataChartExecute(Sender: TObject);
var
  c,r: integer;
begin
  for c := 0 to 4 do
    XSS.XLSSheet.AsString[c,0] := 'Serie ' + IntToStr(c + 1);

  for r := 1 to 5 do begin
    for c := 0 to 4 do
      XSS.XLSSheet.AsFloat[c,r] := Random(101);
  end;

  XSS.InvalidateSheet;
end;

procedure TfmrMain.acSampleDataPivotExecute(Sender: TObject);
const REC_COUNT = 10000;

type TPet = record
     Name: string;
     Price: double;
     AveWeight: double;
     end;

const Pets: array [0..5] of TPet = (
(Name: 'Guinea pig'; Price: 25.0; AveWeight: 1.8),
(Name: 'Cat'; Price: 850.0; AveWeight: 3.4),
(Name: 'Mouse'; Price: 2.0; AveWeight: 0.05),
(Name: 'Quokka'; Price: 230.0; AveWeight: 2.8),
(Name: 'Musk rat'; Price: 75.0; AveWeight: 3.7),
(Name: 'Lemming'; Price: 14.0; AveWeight: 0.12));

const Countries: array[0..6] of string = ('Australia','Norway','Afghanistan','Uganda','Malta','France','China');
const Reseller: array[0..4] of string = ('Högdan','Bölgar','Gnyffa','Pomperipossa','Kvalster');

var
  i: integer;
  p: integer;
  n: integer;
  d: TDateTime;
begin
  RandSeed := 100;

  XSS.XLS[0].AsString[0,0] := 'Order No.';
  XSS.XLS[0].AsString[1,0] := 'Date';
  XSS.XLS[0].AsString[2,0] := 'Product';
  XSS.XLS[0].AsString[3,0] := 'Ammount';
  XSS.XLS[0].AsString[4,0] := 'Weight';
  XSS.XLS[0].AsString[5,0] := 'Country';
  XSS.XLS[0].AsString[6,0] := 'Tasty';
  XSS.XLS[0].AsString[7,0] := 'Reseller';

  d := Date - (REC_COUNT / 10);

  for i := 1 to REC_COUNT do begin
    p := Random(Length(Pets));
    n := Random(90) + 11;
    d := d + Int(Random(4) / 3);

    XSS.XLS[0].AsInteger[0,i] := i * 1000;
    XSS.XLS[0].AsDateTime[1,i] := d;
    XSS.XLS[0].AsString[2,i] := Pets[p].Name;
    XSS.XLS[0].AsFloat[3,i] := Pets[p].Price * n;
    XSS.XLS[0].AsFloat[4,i] := Pets[p].AveWeight * (Random(200) / 100) * n;
    XSS.XLS[0].AsString[5,i] := Countries[Random(Length(Countries))];
    XSS.XLS[0].AsBoolean[6,i] := Boolean(Random(2));
    XSS.XLS[0].AsString[7,i] := Reseller[Random(Length(Reseller))];
  end;

  XSS.InvalidateSheet;
end;

procedure TfmrMain.acSortAZExecute(Sender: TObject);
begin
  XSS.XLSSheet.Sort(True,False);
  XSS.InvalidateSheet;
end;

procedure TfmrMain.acSortZAExecute(Sender: TObject);
begin
  XSS.XLSSheet.Sort(False,False);
  XSS.InvalidateSheet;
end;

procedure TfmrMain.acUnMergeCellsExecute(Sender: TObject);
begin
  XSS.Command(xsscUnMergeCells);
end;

procedure TfmrMain.acWrapTextExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtWrapText,not XSS.XLSSheet.Cell[XSS.XLSSheet.SelectedAreas.ActiveCol,XSS.XLSSheet.SelectedAreas.ActiveRow].WrapText);
end;

procedure TfmrMain.SaveMRU;
var
  i: integer;
  Ini: TIniFile;
begin
  if FCmdMRU <> Nil then begin
    Ini := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    try
      for i := 0 to FCmdMRU.Items.Count - 1 do
        Ini.WriteString('MRU','File' + IntToStr(i + 1),TUIRecentItem(FCmdMRU.Items[i]).Description);
    finally
      Ini.Free;
    end;
  end;
end;

procedure TfmrMain.UpdateCaption;
begin
  if XSS.Filename <> '' then
    Caption := 'XLSSpreadSheet Demo - ' + ExtractFilename(XSS.Filename)
  else
    Caption := 'XLSSpreadSheet Demo';
end;

procedure TfmrMain.UpdateCellFormat(const ACol, ARow: integer);
var
  Cell: TXLSFormattedCell;
begin
  Cell := XSS.XLSSheet.CellFormat[ACol,ARow];

  FCmdFontName.Text := Cell.FontName;
  FCmdFontSize.Text := FloatToStr(Cell.FontSize);
  FCmdFontBold.Checked := xfsBold in Cell.FontStyle;
  FCmdFontItalic.Checked := xfsItalic in Cell.FontStyle;
  FCmdFontUnderline.Checked := Cell.FontUnderline = xulSingle;

//  if Cell.FontColor.ColorType = exctAuto then
//    FCmdFontColor.ColorType := ctAutomatic
//  else
//    FCmdFontColor.Color := Cell.FontColor.ARGB;
//
//  if Cell.FillPatternForeColor.ColorType = exctAuto then
//    FCmdCellColor.ColorType := ctAutomatic
//  else
//    FCmdCellColor.Color := Cell.FillPatternForeColor.ARGB;

//  FFontXc12Color := Cell.FontColor;
//  FFontXc12Color := Cell.FontColorXc12;

//  acAlignLeft.Checked := Cell.HorizAlignment = chaLeft;
//  acAlignCenter.Checked := Cell.HorizAlignment = chaCenter;
//  acAlignRight.Checked := Cell.HorizAlignment = chaRight;

  FCmdAlignTop.Checked := False;
  FCmdAlignMiddle.Checked := False;
  FCmdAlignBottom.Checked := False;

  FCmdAlignLeft.Checked := False;
  FCmdAlignCenter.Checked := False;
  FCmdAlignRight.Checked := False;

  FCmdAlignTop.Checked := Cell.VertAlignment = cvaTop;
  FCmdAlignMiddle.Checked := Cell.VertAlignment = cvaCenter;
  FCmdAlignBottom.Checked := Cell.VertAlignment = cvaBottom;

  FCmdAlignLeft.Checked := Cell.HorizAlignment in [chaLeft,chaGeneral];
  FCmdAlignCenter.Checked := Cell.HorizAlignment = chaCenter;
  FCmdAlignRight.Checked := Cell.HorizAlignment = chaRight;

  FCmdWraptext.Checked := Cell.WrapText;
end;

procedure TfmrMain.UpdateCellName(const ACol, ARow: integer);
var
  Name: TXLSName;
begin
  Name := XSS.XLS.Names.Hit(XSS.XLSSheet.Index,ACol,ARow);
  if Name <> Nil then
    cbCell.Text := Name.Name
  else
    cbCell.Text := ColRowToRefStr(ACol,ARow);
end;

procedure TfmrMain.UpdateCellText(const ACol, ARow: integer);
var
  CellType: TXLSCellType;
begin
  CellType := XSS.XLSSheet.CellType[ACol,ARow];
  if CellType in XLSCellTypeFormulas then begin
    if XSS.XLSSheet.FormulaType[ACol,ARow] in [xcftArray,xcftArrayChild97,xcftArrayChild] then
      edCell.Text := '{=' + XSS.XLSSheet.AsFormula[ACol,ARow] + '}'
    else if XSS.XLSSheet.FormulaType[ACol,ARow] in [xcftDataTable,xcftDataTableChild] then
      edCell.Text := '{=' + XSS.XLSSheet.AsFormula[ACol,ARow] + '}'
    else
      edCell.Text := '=' + XSS.XLSSheet.AsFormula[ACol,ARow];
  end
  else
    edCell.Text := XSS.XLSSheet.AsString[ACol,ARow];
end;

procedure TfmrMain.UpdateMRU(const AFilename: AxUCString);
var
  i: integer;
  S: AxUCString;
  Item: TUIRecentItem;
begin
  Item := TUIRecentItem.Create;
  Item.LabelText := AFilename;
  for i := 0 to FCmdMRU.Items.Count - 1 do begin
    if SameText(AFilename,TUIRecentItem(FCmdMRU.Items[i]).Description) then begin
      if i > 0 then begin
        S := TUIRecentItem(FCmdMRU.Items[i]).Description;
        FCmdMRU.Items.Delete(i);
        FCmdMRU.Items.Insert(0,Item);
      end;
      Exit;
    end;
  end;
  FCmdMRU.Items.Insert(0,Item);
end;

procedure TfmrMain.XSSCellChanged(Sender: TObject; Col, Row: Integer);
begin
  UpdateCellName(Col,Row);
  UpdateCellText(Col,Row);
  UpdateCellFormat(Col,Row);
end;

end.
