object Form1: TForm1
  Left = 592
  Top = 150
  Caption = 'Pivot Table Advaced Sample'
  ClientHeight = 348
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 20
    Width = 15
    Height = 23
    Caption = '1.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 56
    Width = 15
    Height = 23
    Caption = '2.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 92
    Width = 15
    Height = 23
    Caption = '3.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 48
    Top = 132
    Width = 15
    Height = 23
    Caption = '4.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 48
    Top = 172
    Width = 15
    Height = 23
    Caption = '5.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 48
    Top = 212
    Width = 15
    Height = 23
    Caption = '6.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 48
    Top = 252
    Width = 15
    Height = 23
    Caption = '7.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnClose: TButton
    Left = 80
    Top = 298
    Width = 157
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object btnCreateData: TButton
    Left = 80
    Top = 14
    Width = 157
    Height = 25
    Caption = 'Create sample data'
    TabOrder = 1
    OnClick = btnCreateDataClick
  end
  object btnCreatePivotTable: TButton
    Left = 80
    Top = 50
    Width = 157
    Height = 25
    Caption = 'Create pivot table object'
    TabOrder = 2
    OnClick = btnCreatePivotTableClick
  end
  object btnCreatePivotTableResult: TButton
    Left = 80
    Top = 206
    Width = 157
    Height = 25
    Caption = 'Create pivot table result'
    TabOrder = 3
    OnClick = btnCreatePivotTableResultClick
  end
  object Button1: TButton
    Left = 80
    Top = 248
    Width = 157
    Height = 25
    Caption = 'Save...'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 128
    Width = 157
    Height = 25
    Caption = 'Set filter'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 80
    Top = 168
    Width = 157
    Height = 25
    Caption = 'Set custom function'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 80
    Top = 88
    Width = 157
    Height = 25
    Caption = 'Set fields'
    TabOrder = 7
    OnClick = Button4Click
  end
  object dlgSave: TSaveDialog
    Left = 272
    Top = 12
  end
end
