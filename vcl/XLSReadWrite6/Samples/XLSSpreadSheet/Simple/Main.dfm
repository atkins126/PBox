object frmMain: TfrmMain
  Left = 313
  Top = 124
  Width = 999
  Height = 812
  Caption = 'XLSSpreadSheet'
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
  object XSS: TXLSSpreadSheet
    Left = 0
    Top = 69
    Width = 983
    Height = 705
    ComponentVersion = '1.01.00'
    ReadOnly = False
    SkinStyle = xssExcel2007
    OnCellChanged = XSSCellChanged
    Align = alClient
    UseDockManager = False
    TabOrder = 0
    TabStop = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 983
    Height = 69
    Align = alTop
    TabOrder = 1
    DesignSize = (
      983
      69)
    object lblCell: TLabel
      Left = 4
      Top = 44
      Width = 77
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'A1'
    end
    object btnClose: TButton
      Left = 4
      Top = 8
      Width = 75
      Height = 21
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnRead: TButton
      Left = 164
      Top = 8
      Width = 75
      Height = 21
      Caption = 'Read'
      TabOrder = 1
      OnClick = btnReadClick
    end
    object btnWrite: TButton
      Left = 84
      Top = 8
      Width = 75
      Height = 21
      Caption = 'Write'
      TabOrder = 2
      OnClick = btnWriteClick
    end
    object edFilename: TEdit
      Left = 248
      Top = 8
      Width = 397
      Height = 21
      TabOrder = 3
    end
    object Button3: TButton
      Left = 684
      Top = 8
      Width = 25
      Height = 21
      Caption = '...'
      TabOrder = 4
      OnClick = Button3Click
    end
    object edFormula: TEdit
      Left = 88
      Top = 39
      Width = 883
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
  end
  object XPManifest1: TXPManifest
    Left = 52
    Top = 216
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel files|*.xlsx;*.xls|All files (*.*)|*.*'
    Left = 52
    Top = 176
  end
end
