object frmMain: TfrmMain
  Left = 732
  Top = 156
  Width = 689
  Height = 400
  Caption = 'Simple named cells'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 110
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 671
    Height = 139
    Align = alTop
    TabOrder = 0
    object btnRead: TButton
      Left = 10
      Top = 10
      Width = 92
      Height = 31
      Caption = 'Read'
      TabOrder = 0
      OnClick = btnReadClick
    end
    object btnWrite: TButton
      Left = 10
      Top = 44
      Width = 92
      Height = 31
      Caption = 'Write'
      TabOrder = 3
      OnClick = btnWriteClick
    end
    object edReadFilename: TEdit
      Left = 110
      Top = 12
      Width = 502
      Height = 24
      TabOrder = 1
    end
    object edWriteFilename: TEdit
      Left = 110
      Top = 46
      Width = 502
      Height = 24
      TabOrder = 4
    end
    object btnDlgOpen: TButton
      Left = 619
      Top = 10
      Width = 35
      Height = 31
      Caption = '...'
      TabOrder = 2
      OnClick = btnDlgOpenClick
    end
    object btnDlgSave: TButton
      Left = 619
      Top = 43
      Width = 35
      Height = 31
      Caption = '...'
      TabOrder = 5
      OnClick = btnDlgSaveClick
    end
    object btnAddNames: TButton
      Left = 111
      Top = 101
      Width = 92
      Height = 31
      Caption = 'Add Names'
      TabOrder = 7
      OnClick = btnAddNamesClick
    end
    object btnClose: TButton
      Left = 10
      Top = 101
      Width = 92
      Height = 31
      Caption = 'Close'
      TabOrder = 6
      OnClick = btnCloseClick
    end
    object Button1: TButton
      Left = 522
      Top = 101
      Width = 132
      Height = 31
      Caption = 'Open in Excel'
      TabOrder = 8
      OnClick = Button1Click
    end
    object btnFindName: TButton
      Left = 212
      Top = 101
      Width = 92
      Height = 31
      Caption = 'Find Name'
      TabOrder = 9
      OnClick = btnFindNameClick
    end
  end
  object lbNames: TListBox
    Left = 0
    Top = 139
    Width = 671
    Height = 218
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 1
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 480
    Top = 168
  end
  object XPManifest: TXPManifest
    Left = 480
    Top = 124
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.20.15'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 420
    Top = 124
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 420
    Top = 168
  end
end
