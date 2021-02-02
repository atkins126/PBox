object frmMain: TfrmMain
  Left = 563
  Top = 129
  Width = 1063
  Height = 780
  Caption = 'Pivot Table Interactive Sample'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1047
    Height = 41
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 92
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Create data'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 176
      Top = 8
      Width = 101
      Height = 25
      Caption = 'Create pivot table'
      TabOrder = 2
      OnClick = Button3Click
    end
    object btnEditPivot: TButton
      Left = 284
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Edit pivot table'
      Enabled = False
      TabOrder = 3
      OnClick = btnEditPivotClick
    end
    object Button4: TButton
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Open...'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save...'
      TabOrder = 5
      OnClick = Button5Click
    end
  end
  object XLSGrid: TXLSGrid
    Left = 0
    Top = 41
    Width = 1047
    Height = 679
    HeaderColor = 16248036
    GridlineColor = 15062992
    Align = alClient
    ColCount = 32
    DefaultColWidth = 68
    DefaultRowHeight = 20
    DoubleBuffered = False
    RowCount = 255
    Options = [goFixedVertLine, goFixedHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
    TabOrder = 1
    OnSelectCell = XLSGridSelectCell
    ColWidths = (
      21
      63
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68
      68)
  end
  object dlgOpen: TOpenDialog
    Left = 40
    Top = 72
  end
  object dlgSave: TSaveDialog
    Left = 80
    Top = 72
  end
end
