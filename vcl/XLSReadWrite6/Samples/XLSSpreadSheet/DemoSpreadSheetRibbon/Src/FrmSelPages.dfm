object frmSelectPages: TfrmSelectPages
  Left = 1258
  Top = 68
  BorderStyle = bsDialog
  Caption = 'Select pages'
  ClientHeight = 142
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 100
    Top = 60
    Width = 28
    Height = 13
    Caption = 'From:'
  end
  object Label2: TLabel
    Left = 200
    Top = 60
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object rbAll: TRadioButton
    Left = 20
    Top = 28
    Width = 65
    Height = 17
    Caption = 'All'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object rbSelect: TRadioButton
    Left = 20
    Top = 56
    Width = 65
    Height = 17
    Caption = 'Page(s)'
    TabOrder = 1
  end
  object udFrom: TUpDown
    Left = 173
    Top = 56
    Width = 16
    Height = 21
    Associate = edFrom
    TabOrder = 2
  end
  object edFrom: TEdit
    Left = 136
    Top = 56
    Width = 37
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object edTo: TEdit
    Left = 220
    Top = 56
    Width = 37
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object udTo: TUpDown
    Left = 257
    Top = 56
    Width = 16
    Height = 21
    Associate = edTo
    TabOrder = 5
  end
  object Button1: TButton
    Left = 104
    Top = 104
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 6
  end
  object Button2: TButton
    Left = 196
    Top = 104
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
end
