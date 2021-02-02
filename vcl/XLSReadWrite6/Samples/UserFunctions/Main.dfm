object frmMain: TfrmMain
  Left = 509
  Top = 131
  Width = 576
  Height = 167
  Caption = 'User Functions Sample'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
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
    Width = 560
    Height = 125
    Align = alTop
    TabOrder = 0
    object btnClose: TButton
      Left = 8
      Top = 82
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnRead: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Read'
      TabOrder = 0
      OnClick = btnReadClick
    end
    object edReadFilename: TEdit
      Left = 89
      Top = 10
      Width = 408
      Height = 21
      TabOrder = 2
    end
    object btnDlgOpen: TButton
      Left = 503
      Top = 8
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = btnDlgOpenClick
    end
    object btnCalculate: TButton
      Left = 88
      Top = 82
      Width = 121
      Height = 25
      Caption = 'Calculate'
      TabOrder = 4
      OnClick = btnCalculateClick
    end
    object btnWrite: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Write'
      TabOrder = 5
      OnClick = btnWriteClick
    end
    object edWriteFilename: TEdit
      Left = 89
      Top = 42
      Width = 408
      Height = 21
      TabOrder = 6
    end
    object btnDlgSave: TButton
      Left = 503
      Top = 40
      Width = 28
      Height = 25
      Caption = '...'
      TabOrder = 7
      OnClick = btnDlgSaveClick
    end
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 336
    Top = 84
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.20.02'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    OnUserFunction = XLSUserFunction
    Left = 404
    Top = 84
  end
  object XPManifest1: TXPManifest
    Left = 480
    Top = 84
  end
  object dlgOPen: TOpenDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 264
    Top = 84
  end
end
