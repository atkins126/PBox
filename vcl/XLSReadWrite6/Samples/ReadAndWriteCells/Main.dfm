object frmMain: TfrmMain
  Left = 736
  Top = 163
  Width = 691
  Height = 567
  Caption = 'Read and write cells'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 675
    Height = 97
    Align = alTop
    TabOrder = 0
    object btnRead: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Read'
      TabOrder = 0
      OnClick = btnReadClick
    end
    object btnWrite: TButton
      Left = 8
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Write'
      TabOrder = 1
      OnClick = btnWriteClick
    end
    object edReadFilename: TEdit
      Left = 89
      Top = 10
      Width = 408
      Height = 21
      TabOrder = 2
    end
    object edWriteFilename: TEdit
      Left = 89
      Top = 37
      Width = 408
      Height = 21
      TabOrder = 3
    end
    object btnDlgOpen: TButton
      Left = 503
      Top = 8
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 4
      OnClick = btnDlgOpenClick
    end
    object btnDlgSave: TButton
      Left = 503
      Top = 35
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 5
      OnClick = btnDlgSaveClick
    end
    object Button1: TButton
      Left = 8
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 6
      OnClick = Button1Click
    end
    object btnAddCells: TButton
      Left = 88
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Add cells'
      TabOrder = 7
      OnClick = btnAddCellsClick
    end
  end
  object Grid: TStringGrid
    Left = 0
    Top = 97
    Width = 675
    Height = 432
    Align = alClient
    ColCount = 4
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 101
    TabOrder = 1
    ColWidths = (
      64
      65
      163
      261)
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files |*.xlsx;*.xlsm;*.xls;*.xlm|All files (*.*)|*.*'
    Left = 132
    Top = 100
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel files|*.xlsx;*.xls|All files (*.*)|*.*'
    Left = 72
    Top = 100
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.20.48'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 100
    Top = 148
  end
  object XPManifest1: TXPManifest
    Left = 184
    Top = 152
  end
end
