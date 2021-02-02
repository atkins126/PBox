object frmDebugFormula: TfrmDebugFormula
  Left = 0
  Top = 0
  Caption = 'Debug Formula'
  ClientHeight = 230
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  DesignSize = (
    926
    230)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 14
    Caption = 'Formula:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 29
    Height = 14
    Caption = 'Now:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNow: TLabel
    Left = 85
    Top = 33
    Width = 22
    Height = 14
    Caption = '(...)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 52
    Width = 37
    Height = 14
    Caption = 'Result:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblResult: TLabel
    Left = 85
    Top = 53
    Width = 22
    Height = 14
    Caption = '(...)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 4
    Top = 199
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 4
    Top = 72
    Width = 29
    Height = 25
    Caption = '<<'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 48
    Top = 72
    Width = 31
    Height = 25
    Caption = '>>'
    TabOrder = 2
    OnClick = Button3Click
  end
  object lbStack: TListBox
    Left = 85
    Top = 72
    Width = 160
    Height = 152
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 3
  end
  object edFormula: TEdit
    Left = 85
    Top = 5
    Width = 833
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnMouseDown = edFormulaMouseDown
  end
  object lbFormulas: TListBox
    Left = 251
    Top = 72
    Width = 667
    Height = 150
    Style = lbOwnerDrawFixed
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 5
    OnDrawItem = lbFormulasDrawItem
    OnMeasureItem = lbFormulasMeasureItem
  end
  object Button4: TButton
    Left = 4
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Copy formulas'
    TabOrder = 6
    OnClick = Button4Click
  end
end
