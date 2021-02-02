object frmMain: TfrmMain
  Left = 313
  Top = 124
  Width = 563
  Height = 401
  Caption = 'Text boxes'
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
    Width = 547
    Height = 125
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 70
      Width = 54
      Height = 13
      Caption = 'Text boxes'
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
    object cbTextBoxes: TComboBox
      Left = 89
      Top = 67
      Width = 164
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnCloseUp = cbTextBoxesCloseUp
    end
    object btnAdd1: TButton
      Left = 89
      Top = 94
      Width = 75
      Height = 25
      Caption = 'Add 1'
      TabOrder = 7
      OnClick = btnAdd1Click
    end
    object btnAdd2: TButton
      Left = 170
      Top = 94
      Width = 75
      Height = 25
      Caption = 'Add 2'
      TabOrder = 8
      OnClick = btnAdd2Click
    end
    object btnClose: TButton
      Left = 8
      Top = 94
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 9
      OnClick = btnCloseClick
    end
    object btnAdd3: TButton
      Left = 250
      Top = 94
      Width = 75
      Height = 25
      Caption = 'Add 3'
      TabOrder = 10
      OnClick = btnAdd3Click
    end
  end
  object memText: TMemo
    Left = 0
    Top = 125
    Width = 547
    Height = 238
    Align = alClient
    TabOrder = 1
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 380
    Top = 140
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 320
    Top = 140
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.10.06a'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 438
    Top = 140
  end
  object XPManifest1: TXPManifest
    Left = 500
    Top = 140
  end
end
