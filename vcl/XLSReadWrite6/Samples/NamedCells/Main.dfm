object frmMain: TfrmMain
  Left = 744
  Top = 127
  Width = 754
  Height = 738
  Caption = 'Sample Named Cells'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
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
    Width = 736
    Height = 139
    Align = alTop
    TabOrder = 0
    object btnRead: TButton
      Left = 10
      Top = 10
      Width = 92
      Height = 23
      Caption = 'Read'
      TabOrder = 0
      OnClick = btnReadClick
    end
    object btnWrite: TButton
      Left = 10
      Top = 44
      Width = 92
      Height = 25
      Caption = 'Write'
      TabOrder = 3
      OnClick = btnWriteClick
    end
    object edReadFilename: TEdit
      Left = 110
      Top = 12
      Width = 502
      Height = 21
      TabOrder = 1
    end
    object edWriteFilename: TEdit
      Left = 110
      Top = 46
      Width = 502
      Height = 21
      TabOrder = 4
    end
    object btnDlgOpen: TButton
      Left = 619
      Top = 10
      Width = 35
      Height = 23
      Caption = '...'
      TabOrder = 2
      OnClick = btnDlgOpenClick
    end
    object btnDlgSave: TButton
      Left = 619
      Top = 43
      Width = 35
      Height = 26
      Caption = '...'
      TabOrder = 5
      OnClick = btnDlgSaveClick
    end
    object btnAddName: TButton
      Left = 110
      Top = 101
      Width = 92
      Height = 28
      Caption = 'Edit Name'
      TabOrder = 7
      OnClick = btnAddNameClick
    end
    object btnEditName: TButton
      Left = 209
      Top = 101
      Width = 93
      Height = 28
      Caption = 'Add Name'
      TabOrder = 8
      OnClick = btnEditNameClick
    end
    object btnClose: TButton
      Left = 10
      Top = 101
      Width = 92
      Height = 28
      Caption = 'Close'
      TabOrder = 6
      OnClick = btnCloseClick
    end
    object Button1: TButton
      Left = 598
      Top = 101
      Width = 132
      Height = 31
      Caption = 'Open in Excel'
      TabOrder = 10
      OnClick = Button1Click
    end
    object btnNameValues: TButton
      Left = 325
      Top = 101
      Width = 112
      Height = 28
      Caption = 'Name Values'
      TabOrder = 9
      OnClick = btnNameValuesClick
    end
  end
  object lvNames: TListView
    Left = 0
    Top = 139
    Width = 736
    Height = 556
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 185
      end
      item
        Caption = 'Value'
        Width = 185
      end
      item
        Caption = 'Referes To'
        Width = 185
      end
      item
        Caption = 'Scope'
        Width = 185
      end
      item
        Caption = 'Comment'
        Width = 123
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.20.15'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 592
    Top = 24
  end
  object XPManifest: TXPManifest
    Left = 652
    Top = 24
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 592
    Top = 68
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 652
    Top = 68
  end
end
