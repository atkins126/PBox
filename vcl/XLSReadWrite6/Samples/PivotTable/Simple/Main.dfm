object frmMain: TfrmMain
  Left = 563
  Top = 129
  Width = 368
  Height = 259
  Caption = 'Pivot Table Simple'
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
  object Label1: TLabel
    Left = 36
    Top = 132
    Width = 42
    Height = 13
    Caption = 'Filename'
  end
  object Label2: TLabel
    Left = 8
    Top = 28
    Width = 18
    Height = 24
    Caption = '1.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 18
    Height = 24
    Caption = '2.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 100
    Width = 18
    Height = 24
    Caption = '3.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClose: TButton
    Left = 32
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object btnCreateData: TButton
    Left = 32
    Top = 28
    Width = 140
    Height = 25
    Caption = 'Create sample data'
    TabOrder = 0
    OnClick = btnCreateDataClick
  end
  object btnCreatePivotTable: TButton
    Left = 32
    Top = 64
    Width = 140
    Height = 25
    Caption = 'Create pivot table'
    TabOrder = 1
    OnClick = btnCreatePivotTableClick
  end
  object btnSaveFile: TButton
    Left = 32
    Top = 100
    Width = 140
    Height = 25
    Caption = 'Save file'
    TabOrder = 2
    OnClick = btnSaveFileClick
  end
  object edFilename: TEdit
    Left = 36
    Top = 148
    Width = 277
    Height = 21
    TabOrder = 3
    Text = 'd:\xtemp\wtest.xlsx'
  end
  object Button1: TButton
    Left = 316
    Top = 148
    Width = 25
    Height = 21
    Caption = '...'
    TabOrder = 5
    OnClick = Button1Click
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files|*.xlsx|All files|*.*'
    Left = 112
    Top = 184
  end
end
