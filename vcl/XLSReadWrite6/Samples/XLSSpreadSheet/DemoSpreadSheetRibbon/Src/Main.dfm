object fmrMain: TfmrMain
  Left = 0
  Top = 0
  Caption = 'fmrMain'
  ClientHeight = 822
  ClientWidth = 1165
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object XSSPP: TXLSBookPrintPreview
    Left = 0
    Top = 0
    Width = 1165
    Height = 822
    XSS = XSS
    Align = alClient
    DoubleBuffered = True
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 1165
    Height = 822
    Align = alClient
    TabOrder = 1
    OnMouseMove = PanelMouseMove
    DesignSize = (
      1165
      822)
    object cbCell: TComboBox
      Left = 4
      Top = 4
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object edCell: TEdit
      Left = 180
      Top = 4
      Width = 977
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object XSS: TXLSSpreadSheet
      Left = 1
      Top = 28
      Width = 1163
      Height = 793
      Cursor = crCross
      ComponentVersion = '3.00.07'
      ReadOnly = False
      SkinStyle = xssExcel2013
      OnCellChanged = XSSCellChanged
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      UseDockManager = False
      PopupMenu = popSheet
      TabOrder = 2
      TabStop = True
    end
  end
  object ActionList: TActionList
    Left = 124
    Top = 64
    object acClose: TAction
      Caption = 'Close'
      OnExecute = acCloseExecute
    end
    object acFontUnderline: TAction
      Category = 'Format'
      Caption = 'Underline'
      OnExecute = acFontUnderlineExecute
    end
    object acFontItalic: TAction
      Category = 'Format'
      Caption = 'Italic'
      OnExecute = acFontItalicExecute
    end
    object acFontBold: TAction
      Category = 'Format'
      Caption = 'Bold'
      OnExecute = acFontBoldExecute
    end
    object acFontColor: TAction
      Category = 'Format'
      Caption = 'Color'
      OnExecute = acFontColorExecute
    end
    object acCellColor: TAction
      Category = 'Format'
      Caption = 'Cell Color'
    end
    object acDebugT1: TAction
      Caption = 'T1'
    end
    object acDebugT2: TAction
      Caption = 'T2'
    end
    object acDebugT3: TAction
      Caption = 'T3'
      OnExecute = acDebugT3Execute
    end
    object acLastFile: TAction
      Caption = 'Last File'
    end
    object acFileOpen: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Dialog.Filter = 'Excel files|*.xls;*.xlsx;*.xlm;*.xlsm|All files|*.*'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
      OnAccept = acFileOpenAccept
    end
    object acFileNew: TAction
      Category = 'File'
      Caption = 'New'
      OnExecute = acFileNewExecute
    end
    object acFileSave: TAction
      Category = 'File'
      Caption = 'Save'
      OnExecute = acFileSaveExecute
    end
    object acFileSaveAs: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Filter = 'Excel files|*.xls;*.xlsx|All files|*.*'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
      OnAccept = acFileSaveAsAccept
    end
    object acPrintPreview: TAction
      Category = 'Print'
      Caption = 'Preview'
      OnExecute = acPrintPreviewExecute
    end
    object acPrintPreviewClose: TAction
      Category = 'Print'
      Caption = 'Close'
      OnExecute = acPrintPreviewCloseExecute
    end
    object acPrintPreviewPagePrev: TAction
      Category = 'Print'
      Caption = 'Previous Page'
      OnExecute = acPrintPreviewPagePrevExecute
    end
    object acPrintPreviewPageNext: TAction
      Category = 'Print'
      Caption = 'Next Page'
      OnExecute = acPrintPreviewPageNextExecute
    end
    object acPrintPageSetup: TAction
      Category = 'Print'
      Caption = 'Page Setup'
      OnExecute = acPrintPageSetupExecute
    end
    object acPrintPrint: TAction
      Category = 'Print'
      Caption = 'Print'
      OnExecute = acPrintPrintExecute
    end
    object acPrintQuickPrint: TAction
      Category = 'Print'
      Caption = 'Quick Print'
      OnExecute = acPrintQuickPrintExecute
    end
    object acExportHTML: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Filter = 'HTML Files (*.htm)|*.htm|All Files (*.*)|*.*'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
      OnAccept = acExportHTMLAccept
    end
    object acExportPDF: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Filter = 'PDF Files (*.pdf)|*.pdf|All Files (*.*)|*.*'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
      OnAccept = acExportPDFAccept
    end
    object acExportCSV: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Filter = 'CSV Files (*.csv)|*.csv|All Files (*.*)|*.*'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
      OnAccept = acExportCSVAccept
    end
    object acFormulaDebug: TAction
      Category = 'Formula'
      Caption = 'Debug'
      OnExecute = acFormulaDebugExecute
    end
    object acFontName: TAction
      Category = 'Format'
      Caption = 'Font Name'
      OnExecute = acFontNameExecute
    end
    object acFontSize: TAction
      Category = 'Format'
      Caption = 'Size'
      OnExecute = acFontSizeExecute
    end
    object acFontInc: TAction
      Category = 'Format'
      Caption = 'Increase size'
      OnExecute = acFontIncExecute
    end
    object acFontDec: TAction
      Category = 'Format'
      Caption = 'Decrease size'
      OnExecute = acFontDecExecute
    end
    object acCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
      OnExecute = acCopyExecute
    end
    object acCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
      OnExecute = acCutExecute
    end
    object acPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
      OnExecute = acPasteExecute
    end
    object acFmlaNameManager: TAction
      Category = 'Formula'
      Caption = 'Name Manager'
      OnExecute = acFmlaNameManagerExecute
    end
    object acFormatCells: TAction
      Category = 'Format'
      Caption = 'Format Cells...'
      OnExecute = acFormatCellsExecute
    end
    object acSortAZ: TAction
      Category = 'SortFilter'
      Caption = 'Sort A to Z'
      OnExecute = acSortAZExecute
    end
    object acSortZA: TAction
      Category = 'SortFilter'
      Caption = 'Sort Z to A'
      OnExecute = acSortZAExecute
    end
    object acAlignTop: TAction
      Category = 'Alignment'
      Caption = 'Align Top'
      OnExecute = acAlignTopExecute
    end
    object acAlignMiddle: TAction
      Category = 'Alignment'
      Caption = 'Align Middle'
      OnExecute = acAlignMiddleExecute
    end
    object acAlignBottom: TAction
      Category = 'Alignment'
      Caption = 'Align Bottom'
      OnExecute = acAlignBottomExecute
    end
    object acAlignLeft: TAction
      Category = 'Alignment'
      Caption = 'Align Left'
      OnExecute = acAlignLeftExecute
    end
    object acAlignCenter: TAction
      Category = 'Alignment'
      Caption = 'Align Center'
      OnExecute = acAlignCenterExecute
    end
    object acAlignRight: TAction
      Category = 'Alignment'
      Caption = 'Align Right'
      OnExecute = acAlignRightExecute
    end
    object acIndentInc: TAction
      Category = 'Alignment'
      Caption = 'Increase Indent'
      OnExecute = acIndentIncExecute
    end
    object acIndentDec: TAction
      Category = 'Alignment'
      Caption = 'Decrease Indent'
      OnExecute = acIndentDecExecute
    end
    object acWrapText: TAction
      Category = 'Alignment'
      Caption = 'Wrap Text'
      OnExecute = acWrapTextExecute
    end
    object acMergeAndCenter: TAction
      Category = 'Alignment'
      Caption = 'Merge and Center'
      OnExecute = acMergeAndCenterExecute
    end
    object acMergeCells: TAction
      Category = 'Alignment'
      Caption = 'Merge Cells'
      OnExecute = acMergeCellsExecute
    end
    object acUnMergeCells: TAction
      Category = 'Alignment'
      Caption = 'Unmerge Cells'
      OnExecute = acUnMergeCellsExecute
    end
    object acInsertPivotTable: TAction
      Category = 'Insert'
      Caption = 'Pivot Table'
      OnExecute = acInsertPivotTableExecute
    end
    object acInsertPicture: TOpenPicture
      Category = 'Insert'
      Caption = 'Picture'
      Hint = 'Open Picture'
      ShortCut = 16463
      OnAccept = acInsertPictureAccept
    end
    object acInsertTextBox: TAction
      Category = 'Insert'
      Caption = 'Text Box'
      OnExecute = acInsertTextBoxExecute
    end
    object acInsertChartBar: TAction
      Category = 'Insert'
      Caption = 'Bar'
      OnExecute = acInsertChartBarExecute
    end
    object acInsertChartLine: TAction
      Category = 'Insert'
      Caption = 'Line'
      OnExecute = acInsertChartLineExecute
    end
    object acInsertChartPie: TAction
      Category = 'Insert'
      Caption = 'Pie'
      OnExecute = acInsertChartPieExecute
    end
    object acInsertChartScatter: TAction
      Category = 'Insert'
      Caption = 'Scatter'
      OnExecute = acInsertChartScatterExecute
    end
    object acInsertChartArea: TAction
      Category = 'Insert'
      Caption = 'Area'
      OnExecute = acInsertChartAreaExecute
    end
    object acInsertChartDoughnut: TAction
      Category = 'Insert'
      Caption = 'Doughnut'
      OnExecute = acInsertChartDoughnutExecute
    end
    object acInsertChartBubble: TAction
      Category = 'Insert'
      Caption = 'Bubble'
      OnExecute = acInsertChartBubbleExecute
    end
    object acInsertChartRadar: TAction
      Category = 'Insert'
      Caption = 'Radar'
      OnExecute = acInsertChartRadarExecute
    end
    object acSampleDataChart: TAction
      Category = 'Insert'
      Caption = 'Chart'
      OnExecute = acSampleDataChartExecute
    end
    object acSampleDataPivot: TAction
      Category = 'Insert'
      Caption = 'Pivot Table'
      OnExecute = acSampleDataPivotExecute
    end
    object acSampleDataCells: TAction
      Category = 'Insert'
      Caption = 'Cells'
      OnExecute = acSampleDataCellsExecute
    end
    object acFormulaShow: TAction
      Category = 'Formula'
      Caption = 'Show Formulas'
      OnExecute = acFormulaShowExecute
    end
    object acFmlaDefineName: TAction
      Category = 'Formula'
      Caption = 'Define Name'
      OnExecute = acFmlaDefineNameExecute
    end
    object acFormatCellBorders: TAction
      Category = 'Format'
      Caption = 'More borders...'
      OnExecute = acFormatCellBordersExecute
    end
  end
  object popSheet: TPopupMenu
    Left = 192
    Top = 64
    object Formatcells1: TMenuItem
      Action = acFormatCells
    end
    object Sort1: TMenuItem
      Caption = 'Sort'
      object AtoZ1: TMenuItem
        Action = acSortAZ
      end
      object ZtoA1: TMenuItem
        Action = acSortZA
      end
    end
  end
  object dlgPrinter: TPrinterSetupDialog
    Left = 264
    Top = 64
  end
end
