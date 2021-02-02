object frmMain: TfrmMain
  Left = 353
  Top = 142
  Width = 665
  Height = 581
  Caption = 'Db Read Sample'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    649
    543)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 506
    Top = 12
    Width = 80
    Height = 13
    Caption = 'Include filelds'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 506
    Top = 224
    Width = 80
    Height = 13
    Caption = 'Exclude fileds'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 508
    Top = 32
    Width = 123
    Height = 57
    AutoSize = False
    Caption = 
      'Fields enterd here are included from the table. If no names are ' +
      'given, all fields are included.'
    WordWrap = True
  end
  object Label4: TLabel
    Left = 508
    Top = 244
    Width = 123
    Height = 33
    AutoSize = False
    Caption = 'Fileld enterd here are excluded from the table.'
    WordWrap = True
  end
  object Grid: TDrawGrid
    Left = 0
    Top = 0
    Width = 498
    Height = 543
    Align = alLeft
    ColCount = 32
    DefaultRowHeight = 16
    RowCount = 1024
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goThumbTracking]
    TabOrder = 0
    OnDrawCell = GridDrawCell
  end
  object Button1: TButton
    Left = 510
    Top = 426
    Width = 123
    Height = 25
    Caption = 'Read'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 532
    Top = 544
    Width = 125
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object lbIncl: TListBox
    Left = 503
    Top = 120
    Width = 131
    Height = 97
    ItemHeight = 13
    TabOrder = 3
  end
  object lbExcl: TListBox
    Left = 505
    Top = 308
    Width = 127
    Height = 97
    ItemHeight = 13
    Items.Strings = (
      'Graphic')
    TabOrder = 4
  end
  object edIncl: TEdit
    Left = 504
    Top = 96
    Width = 83
    Height = 21
    TabOrder = 5
  end
  object Button3: TButton
    Left = 594
    Top = 96
    Width = 41
    Height = 21
    Caption = 'Add'
    TabOrder = 6
    OnClick = Button3Click
  end
  object edExcl: TEdit
    Left = 506
    Top = 284
    Width = 83
    Height = 21
    TabOrder = 7
  end
  object Button4: TButton
    Left = 593
    Top = 284
    Width = 41
    Height = 21
    Caption = 'Add'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 510
    Top = 455
    Width = 123
    Height = 25
    Caption = 'Save to Excel file...'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 512
    Top = 508
    Width = 121
    Height = 25
    Caption = 'Close'
    TabOrder = 10
    OnClick = Button6Click
  end
  object Table: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'biolife.db'
    Left = 100
    Top = 24
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.10.06a'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 100
    Top = 72
  end
  object XLSDbRead: TXLSDbRead5
    Column = 0
    Dataset = Table
    IncludeFieldnames = True
    IndentDetailTables = True
    ReadDetailTables = True
    FormatCells = False
    Row = 0
    Sheet = 0
    XLS = XLS
    Left = 100
    Top = 124
  end
  object XPManifest1: TXPManifest
    Left = 104
    Top = 184
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 104
    Top = 232
  end
end
