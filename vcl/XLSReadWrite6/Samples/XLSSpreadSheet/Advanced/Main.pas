unit Main;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, XPMan, ExtCtrls, StdCtrls, StdActns, IniFiles,
  ActnList, ImgList, Math, XLSSynPdf, Xc12Utils5, XLSUtils5, XLSCellMMU5, XLSNames5,
  XSSIEDocProps, XLSFormattedObj5, Xc12DataStyleSheet5,
  XLSBook2, XBookComponent2, XLSSheetData5, XBookUtils2, XBookPrint2, XLSExportCSV5,
  FrmFormatCells, FrmColor, FrmSelPages, FrmExpHTML, FrmPrntPreview,
  FrmPgSetup, Menus, System.Actions, System.ImageList;

type
  TFileAwareMenuItem = class(TMenuItem)
  private
    FFileName: string;
  public
    property FileName: string read FFileName write FFilename;
  end;

  TMRU = class
  private
    FParent: array of TMenuItem;
    FMenuItemStart: array of TMenuItem;
    FMenuItemFinish: array of TMenuItem;
    FMenuCount: Integer;
    FIniFilename: string;
    FMRUFileNames: TStringList;
    FAction: TAction;

    function GetCount: Integer;
    function GetItem(Index: Integer): string;
    procedure SetAction(Value: TAction);
    procedure Read;
    procedure Write;
    procedure UpdateMenu;
  public
    constructor Create(const IniFilename: string);
    destructor Destroy; override;
    procedure RegisterBoundingMenuItems(Start, Finish: TMenuItem);
    procedure Add(const FileName: string);
    procedure Delete(ItemNum: Integer);
    property Count: Integer read GetCount;
    property Action: TAction read FAction write SetAction;
    property Items[Index: Integer]: string read GetItem; default;
  end;

type
  TfrmMain = class(TForm)
    XPManifest: TXPManifest;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    cbFontName: TComboBox;
    ToolButton1: TToolButton;
    cbFontSize: TComboBox;
    Button1: TButton;
    il16x16: TImageList;
    ActionList: TActionList;
    acFontBold: TAction;
    acFontItalic: TAction;
    acFontUnderline: TAction;
    acAlignLeft: TAction;
    acAlignCenter: TAction;
    acAlignRight: TAction;
    acFileNew: TAction;
    acFileSave: TAction;
    acFileOpen: TFileOpen;
    acFileSaveAs: TFileSaveAs;
    acExit: TAction;
    acCellColor: TAction;
    acFontColor: TAction;
    acMergaAndCenter: TAction;
    acBorderNoBorders: TAction;
    acBorderThinTop: TAction;
    acBorderThinBottom: TAction;
    acBorderThinLeft: TAction;
    acBorderThinRight: TAction;
    acBorder: TAction;
    acFormatCells: TAction;
    acExportPDF: TFileSaveAs;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    btnTest1: TButton;
    btnTest2: TButton;
    XSS: TXLSSpreadSheet;
    edCell: TEdit;
    cbCell: TComboBox;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    Export1: TMenuItem;
    PDF1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    popSheet: TPopupMenu;
    Formatcells1: TMenuItem;
    HTML1: TMenuItem;
    CSV1: TMenuItem;
    acExportHTML: TFileSaveAs;
    acExportCSV: TFileSaveAs;
    Recentfiles1: TMenuItem;
    mnuMRU1: TMenuItem;
    mnuMRU2: TMenuItem;
    acMRU: TAction;
    acPrint: TAction;
    acPrintPreview: TAction;
    N3: TMenuItem;
    Printpreview1: TMenuItem;
    Print1: TMenuItem;
    acPageSetup: TAction;
    Pagesetup1: TMenuItem;
    popBorders: TPopupMenu;
    Left1: TMenuItem;
    Right1: TMenuItem;
    op1: TMenuItem;
    Bottom1: TMenuItem;
    acBorderOutline: TAction;
    acBorderInside: TAction;
    Outline1: TMenuItem;
    Inside1: TMenuItem;
    Noborders1: TMenuItem;
    acSortAZ: TAction;
    acSortZA: TAction;
    Sort1: TMenuItem;
    AtoZ1: TMenuItem;
    ZtoA1: TMenuItem;
    procedure acExitExecute(Sender: TObject);
    procedure acAlignLeftExecute(Sender: TObject);
    procedure acAlignCenterExecute(Sender: TObject);
    procedure acAlignRightExecute(Sender: TObject);
    procedure acCellColorExecute(Sender: TObject);
    procedure acExportPDFAccept(Sender: TObject);
    procedure acFileOpenAccept(Sender: TObject);
    procedure acFontBoldExecute(Sender: TObject);
    procedure acFontColorExecute(Sender: TObject);
    procedure acFontItalicExecute(Sender: TObject);
    procedure acFontUnderlineExecute(Sender: TObject);
    procedure acFormatCellsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure XSSAfterSheetChange(ASender: TObject; const AValue: Integer);
    procedure XSSCellChanged(Sender: TObject; Col, Row: Integer);
    procedure XSSEditorClose(Sender: TObject; var Value: Boolean);
    procedure XSSEditorDisableFmt(Sender: TObject);
    procedure XSSIECharFormatChanged(Sender: TObject);
    procedure XSSSelectionChanged(Sender: TObject);
    procedure cbFontNameSelect(Sender: TObject);
    procedure cbFontSizeSelect(Sender: TObject);
    procedure acMergaAndCenterExecute(Sender: TObject);
    procedure acExportHTMLAccept(Sender: TObject);
    procedure acExportCSVAccept(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure acMRUExecute(Sender: TObject);
    procedure acFileNewExecute(Sender: TObject);
    procedure acPrintPreviewExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acPageSetupExecute(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure acFileSaveExecute(Sender: TObject);
    procedure acBorderExecute(Sender: TObject);
    procedure acBorderNoBordersExecute(Sender: TObject);
    procedure acBorderThinTopExecute(Sender: TObject);
    procedure acBorderThinBottomExecute(Sender: TObject);
    procedure acBorderThinLeftExecute(Sender: TObject);
    procedure acBorderThinRightExecute(Sender: TObject);
    procedure acBorderOutlineExecute(Sender: TObject);
    procedure acBorderInsideExecute(Sender: TObject);
    procedure XSSNotification(Sender: TObject;
      Notification: TXBookNotification);
    procedure acSortAZExecute(Sender: TObject);
    procedure acSortZAExecute(Sender: TObject);
    procedure acFileSaveAsBeforeExecute(Sender: TObject);
  private
    FMRU: TMRU;
    FFontXc12Color: TXc12Color;

    procedure Setup;
    procedure UpdateCellText(const ACol,ARow: integer);
    procedure UpdateCellName(const ACol,ARow: integer);
    procedure UpdateCellFormat(const ACol,ARow: integer);
    procedure EnableFmtControls(AEnable: boolean);
    procedure SetFontName(const AName: string);
    procedure SetFontSize(const ASize: double);
    procedure EnableActions;
    procedure ExportOnPrintPDF(ASender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

const MRUSize=9;

constructor TMRU.Create(const IniFilename: string);
begin
  inherited Create;
  FIniFilename := IniFilename;
  FMRUFileNames := TStringList.Create;
  Read;
end;

destructor TMRU.Destroy;
begin
  Write;
  FreeAndNil(FMRUFileNames);
  inherited;
end;

procedure TMRU.RegisterBoundingMenuItems(Start, Finish: TMenuItem);
begin
  inc(FMenuCount);
  SetLength(FParent, FMenuCount);
  SetLength(FMenuItemStart, FMenuCount);
  SetLength(FMenuItemFinish, FMenuCount);

  FMenuItemStart[FMenuCount-1] := Start;
  FMenuItemFinish[FMenuCount-1] := Finish;
  Assert(Start.Parent=Finish.Parent);
  FParent[FMenuCount-1] := Start.Parent;

  UpdateMenu;
end;

procedure TMRU.UpdateMenu;
var
  i, j: Integer;
  FileName: string;
  NewMenuItem: TFileAwareMenuItem;
begin
  for i := 0 to FMenuCount-1 do begin
    j := FMenuItemStart[i].MenuIndex+1;
    while j<FMenuItemFinish[i].MenuIndex do begin
      FParent[i][j].Free;
    end;
    for j := 0 to Count-1 do begin
      NewMenuItem := TFileAwareMenuItem.Create(FMenuItemStart[i].Owner);
      NewMenuItem.Action := Action;
      NewMenuItem.FileName := FMRUFileNames[j];
      FileName := NewMenuItem.FileName;
      NewMenuItem.Caption := Format('&%d. %s', [j+1, FileName]);
      FParent[i].Insert(FMenuItemFinish[i].MenuIndex, NewMenuItem);
    end;
    FMenuItemStart[i].Visible := (Count>0) and (FMenuItemStart[i].MenuIndex>0);
    FMenuItemFinish[i].Visible := (FMenuItemFinish[i].MenuIndex<FParent[i].Count-1);
  end;
end;

procedure TMRU.Read;
var
  i: Integer;
  s: string;
  Ini: TIniFile;
begin
  if FileExists(FIniFilename) then begin
    Ini := TIniFile.Create(FIniFilename);
    try
      FMRUFileNames.Clear;
      for i := 0 to MRUSize-1 do begin
        s := Ini.ReadString('MRUFiles','MRU' + IntToStr(i + 1),'');
        if s<>'' then begin
          FMRUFileNames.Add(s);
        end;
      end;
    finally
      Ini.Free;
    end;
    UpdateMenu;
  end;
end;

procedure TMRU.Write;
var
  i: Integer;
  ValueName: string;
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FIniFilename);
  try
    for i := 0 to MRUSize-1 do begin
      ValueName := 'MRU' + IntToStr(i+1);
      if i<Count then begin
        Ini.WriteString('MRUFiles',ValueName, FMRUFileNames.Strings[i]);
      end
      else begin
        if Ini.ReadString('MRUFiles',ValueName,'') <> '' then begin
          Ini.DeleteKey('MRUFiles',ValueName);
        end;
      end;
    end;
  finally
    Ini.Free;
  end;
end;

function TMRU.GetCount: Integer;
begin
  Result := Min(FMRUFileNames.Count, MRUSize);
end;

function TMRU.GetItem(Index: Integer): string;
begin
  Result := FMRUFileNames[Index];
end;

procedure TMRU.SetAction(Value: TAction);
begin
  if Value<>FAction then begin
    FAction := Value;
    UpdateMenu;
  end;
end;

procedure TMRU.Add(const FileName: string);
var
  i, Index: Integer;
begin
  Index := -1;
  for i := 0 to FMRUFileNames.Count-1 do begin
    if FileName = FMRUFileNames[i] then begin
      Index := i;
      break;
    end;
  end;

  if Index<>-1 then begin
    FMRUFileNames.Move(Index, 0);
  end else begin
    FMRUFileNames.Insert(0, FileName);
    if FMRUFileNames.Count>MRUSize then begin
      FMRUFileNames.Delete(FMRUFileNames.Count-1);
    end;
  end;

  UpdateMenu;
  Write;
end;

procedure TMRU.Delete(ItemNum: Integer);
begin
  FMRUFileNames.Delete(ItemNum);
  UpdateMenu;
end;

procedure TfrmMain.acExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.EnableFmtControls(AEnable: boolean);
begin
  acFontBold.Enabled := AEnable;
  acFontItalic.Enabled := AEnable;
  cbFontSize.Enabled := AEnable;
  cbFontName.Enabled := AEnable;
  acFontUnderline.Enabled := AEnable;
  acFontColor.Enabled := AEnable;
end;

procedure TfrmMain.UpdateCellFormat(const ACol, ARow: integer);
var
  Cell: TXLSFormattedCell;
begin
  Cell := XSS.XLSSheet.CellFormat[ACol,ARow];
  cbFontName.Text := Cell.FontName;
  cbFontSize.Text := FloatToStr(Cell.FontSize);
  acFontBold.Checked := xfsBold in Cell.FontStyle;
  acFontItalic.Checked := xfsItalic in Cell.FontStyle;
  acFontUnderline.Checked := Cell.FontUnderline = xulSingle;
  FFontXc12Color := Cell.FontColor;
//  FFontXc12Color := Cell.FontColorXc12;

  acAlignLeft.Checked := Cell.HorizAlignment = chaLeft;
  acAlignCenter.Checked := Cell.HorizAlignment = chaCenter;
  acAlignRight.Checked := Cell.HorizAlignment = chaRight;

//    btnAlignVertTop.Down := Cell.VertAlignment = cvaTop;
//    btnAlignVertMiddle.Down := Cell.VertAlignment = cvaCenter;
//    btnAlignVertBottom.Down := Cell.VertAlignment = cvaBottom;
end;

procedure TfrmMain.UpdateCellName(const ACol, ARow: integer);
var
  Name: TXLSName;
begin
  Name := XSS.XLS.Names.Hit(XSS.XLSSheet.Index,ACol,ARow);
  if Name <> Nil then
    cbCell.Text := Name.Name
  else
    cbCell.Text := ColRowToRefStr(ACol,ARow);
end;

procedure TfrmMain.UpdateCellText(const ACol, ARow: integer);
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

procedure TfrmMain.acAlignLeftExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtAlignHorizLeft,True);
end;

procedure TfrmMain.acAlignCenterExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtAlignHorizCenter,True);
end;

procedure TfrmMain.acAlignRightExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtAlignHorizRight,True);
end;

procedure TfrmMain.acCellColorExecute(Sender: TObject);
var
  Frm: TfrmSelectColor;
begin
  Frm := TfrmSelectColor.Create(Application);
  if Frm.Execute then
    XSS.Command(xsscFmtCellColor,Frm.Color);
end;

procedure TfrmMain.acExportPDFAccept(Sender: TObject);
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

procedure TfrmMain.acFileOpenAccept(Sender: TObject);
begin
  XSS.Filename := acFileOpen.Dialog.FileName;
  XSS.Read;

  FMRU.Add(XSS.Filename);
end;

procedure TfrmMain.acFontBoldExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtFontBold,True);
end;

procedure TfrmMain.acFontColorExecute(Sender: TObject);
var
  Frm: TfrmSelectColor;
begin
  Frm := TfrmSelectColor.Create(Application);
  if Frm.Execute then
    XSS.Command(xsscFmtFontColor,Frm.Color);
end;

procedure TfrmMain.acFontItalicExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtFontItalic,True);
end;

procedure TfrmMain.acFontUnderlineExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtFontUnderline,True);
end;

procedure TfrmMain.acFormatCellsExecute(Sender: TObject);
begin
  if TfrmFmtCells.Create(Application).Execute(XSS) then
    XSS.InvalidateSheet;
end;

procedure TfrmMain.Setup;
var
  i: integer;
begin
  GetAvailableFonts(cbFontName.Items);
  cbFontName.Sorted := True;

  for i := 0 to High(XSSDefaultFontSizes) do
    cbFontSize.Items.Add(IntToStr(XSSDefaultFontSizes[i]));
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Setup;

  FMRU := TMRU.Create(ChangeFileExt(Application.ExeName,'.ini'));
  FMRU.RegisterBoundingMenuItems(mnuMRU1,mnuMRU2);
  FMRU.Action := acMRU;
end;

procedure TfrmMain.XSSAfterSheetChange(ASender: TObject; const AValue: Integer);
begin
  cbCell.Clear;
  XSS.XLS.Names.ToStrings(XSS.XLSSheet.Index,cbCell.Items,True);
end;

procedure TfrmMain.XSSCellChanged(Sender: TObject; Col, Row: Integer);
begin
  UpdateCellName(Col,Row);
  UpdateCellText(Col,Row);
  UpdateCellFormat(Col,Row);
end;

procedure TfrmMain.XSSEditorClose(Sender: TObject; var Value: Boolean);
begin
  EnableFmtControls(True);
end;

procedure TfrmMain.XSSEditorDisableFmt(Sender: TObject);
begin
  EnableFmtControls(False);
end;

procedure TfrmMain.XSSIECharFormatChanged(Sender: TObject);
begin
  acFontBold.Checked := XSS.XSSSheet.InplaceEditor.CHP.Bold;
  acFontItalic.Checked := XSS.XSSSheet.InplaceEditor.CHP.Italic;
  cbFontSize.Text := FloatToStr(XSS.XSSSheet.InplaceEditor.CHP.Size);
  cbFontName.Text := XSS.XSSSheet.InplaceEditor.CHP.FontName;
  acFontUnderline.Checked := XSS.XSSSheet.InplaceEditor.CHP.Underline = XSSIEDocProps.axcuSingle;
//  shpColor.Brush.Color := XSS.XSSSheet.InplaceEditor.CHP.Color;
end;

procedure TfrmMain.XSSSelectionChanged(Sender: TObject);
var
  i: integer;
  S: string;
begin
  S := '';
  for i := 0 to XSS.XLSSheet.SelectedAreas.Count - 1 do
    S := S + XSS.XLSSheet.SelectedAreas[i].AsString + ',';
  cbCell.Text := Copy(S,1,Length(S) - 1);
end;

procedure TfrmMain.SetFontName(const AName: string);
begin
  XSS.Command(xsscFmtFontName,AName);
end;

procedure TfrmMain.cbFontNameSelect(Sender: TObject);
begin
  SetFontName(cbFontName.Text);
end;

procedure TfrmMain.SetFontSize(const ASize: double);
begin
  XSS.Command(xsscFmtFontSize,ASize);
end;

procedure TfrmMain.cbFontSizeSelect(Sender: TObject);
begin
  SetFontSize(StrToFloatDef(cbFontSize.Text,XSS.XLS.Font.Size));
end;

procedure TfrmMain.acMergaAndCenterExecute(Sender: TObject);
begin
  XSS.XLSSheet.MergeCells;

  XSS.XLS.CmdFormat.BeginEdit(XSS.XLSSheet);
  XSS.XLS.CmdFormat.Alignment.Horizontal := chaCenter;
  XSS.XLS.CmdFormat.Apply;
  XSS.InvalidateSheet;

  XSS.InvalidateSheet;
end;

procedure TfrmMain.acExportHTMLAccept(Sender: TObject);
begin
  TfrmExportHTML.Create(Application).Execute(XSS.XLS,acExportHTML.Dialog.FileName);
end;

procedure TfrmMain.acExportCSVAccept(Sender: TObject);
begin
  // If only one cell is selected, export the entire sheet.
  if (XSS.XLSSheet.SelectedAreas.Count = 1) and (XSS.XLSSheet.SelectedAreas[0].CellCount = 1) then
    ExportCSV(XSS.XLS,XSS.XLSSheet.Index,';','"',[],acExportCSV.Dialog.FileName)
  // Export the selected cells.
  else
    ExportCSV(XSS.XLS,XSS.XLSSheet.Index,';','"',[ecoSelection],acExportCSV.Dialog.FileName);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FMRU.Free;
end;

procedure TfrmMain.acMRUExecute(Sender: TObject);
var
  Menu: TFileAwareMenuItem;
begin
  Menu := TFileAwareMenuItem(TAction(Sender).ActionComponent);

  XSS.Filename := Menu.FileName;
  XSS.Read;
end;

procedure TfrmMain.acFileNewExecute(Sender: TObject);
begin
  XSS.Clear;
end;

procedure TfrmMain.acPrintPreviewExecute(Sender: TObject);
begin
  TfrmPrintPreview.Create(Application).Execute(XSS);
end;

procedure TfrmMain.acPrintExecute(Sender: TObject);
var
  P1,P2: integer;
  Print: TXLSBookPrint;
begin
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

procedure TfrmMain.acPageSetupExecute(Sender: TObject);
begin
  TFrmPageSetup.Create(Application).Execute(XSS.XLS,XSS.XLSSheet);
end;

procedure TfrmMain.File1Click(Sender: TObject);
begin
  EnableActions;
end;

procedure TfrmMain.EnableActions;
begin
  acFileSave.Enabled := XSS.Filename <> '';
end;

procedure TfrmMain.acFileSaveAsBeforeExecute(Sender: TObject);
begin
  XSS.Filename := acFileSaveAs.Dialog.FileName;
  XSS.Write;
end;

procedure TfrmMain.acFileSaveExecute(Sender: TObject);
begin
  XSS.Write;
end;

procedure TfrmMain.acBorderExecute(Sender: TObject);
begin
//
end;

procedure TfrmMain.acBorderNoBordersExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderNoBorder);
end;

procedure TfrmMain.acBorderThinTopExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderThinTop);
end;

procedure TfrmMain.acBorderThinBottomExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderThinBottom);
end;

procedure TfrmMain.acBorderThinLeftExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderThinLeft);
end;

procedure TfrmMain.acBorderThinRightExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderThinRight);
end;

procedure TfrmMain.acBorderOutlineExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderThinOutline);
end;

procedure TfrmMain.acBorderInsideExecute(Sender: TObject);
begin
  XSS.Command(xsscFmtBorderThinInside);
end;

procedure TfrmMain.XSSNotification(Sender: TObject; Notification: TXBookNotification);
begin
  case Notification of
    xbnCellLocked: ShowMessage('Cell is locked');
  end;
end;

procedure TfrmMain.acSortAZExecute(Sender: TObject);
begin
  XSS.XLSSheet.Sort(True,False);
  XSS.InvalidateSheet;
end;

procedure TfrmMain.acSortZAExecute(Sender: TObject);
begin
  XSS.XLSSheet.Sort(False,False);
  XSS.InvalidateSheet;
end;

procedure TfrmMain.ExportOnPrintPDF(ASender: TObject);
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

end.