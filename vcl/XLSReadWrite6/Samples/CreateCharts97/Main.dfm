object frmMain: TfrmMain
  Left = 692
  Top = 247
  BorderStyle = bsDialog
  Caption = 'Create Chart Sample'
  ClientHeight = 411
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 42
    Height = 13
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Filename'
  end
  object Label7: TLabel
    Left = 341
    Top = 33
    Width = 95
    Height = 82
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoSize = False
    Caption = 'Charts can only be craeted in Excel  97 (XLS) files.'
    WordWrap = True
  end
  object Button1: TButton
    Left = 364
    Top = 380
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edFilename: TEdit
    Left = 56
    Top = 8
    Width = 345
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    TabOrder = 1
  end
  object Button3: TButton
    Left = 404
    Top = 8
    Width = 21
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = '...'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 364
    Top = 348
    Width = 75
    Height = 25
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button4Click
  end
  object PageControl1: TPageControl
    Left = 4
    Top = 36
    Width = 325
    Height = 369
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    ActivePage = TabSheet1
    TabOrder = 4
    object TabSheet1: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Basic'
      object Label2: TLabel
        Left = 8
        Top = 12
        Width = 53
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Chart style'
      end
      object Title: TLabel
        Left = 160
        Top = 76
        Width = 20
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Title'
      end
      object Label6: TLabel
        Left = 80
        Top = 204
        Width = 38
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Markers'
      end
      object Label3: TLabel
        Left = 176
        Top = 0
        Width = 37
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Options'
      end
      object Button2: TButton
        Left = 0
        Top = 116
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Column'
        TabOrder = 6
        OnClick = Button2Click
      end
      object cbLegend: TCheckBox
        Left = 160
        Top = 24
        Width = 81
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Has legend'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cb3D: TCheckBox
        Left = 160
        Top = 48
        Width = 85
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '3D'
        TabOrder = 1
      end
      object edTitle: TEdit
        Left = 188
        Top = 72
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 2
      end
      object Button5: TButton
        Left = 0
        Top = 60
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Bar'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 0
        Top = 32
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Area'
        TabOrder = 3
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 0
        Top = 88
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Bubble'
        TabOrder = 5
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 0
        Top = 144
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Cylinder'
        TabOrder = 7
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 0
        Top = 172
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Doughnut'
        TabOrder = 8
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 0
        Top = 200
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Line'
        TabOrder = 9
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 0
        Top = 228
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Pie'
        TabOrder = 10
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 0
        Top = 256
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Radar'
        TabOrder = 11
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 0
        Top = 284
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Scatter (XY)'
        TabOrder = 12
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 0
        Top = 312
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Surface'
        TabOrder = 14
        OnClick = Button14Click
      end
      object Button22: TButton
        Left = 80
        Top = 284
        Width = 157
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Scatter (XY), multiple series'
        TabOrder = 13
        OnClick = Button22Click
      end
      object Button23: TButton
        Left = 160
        Top = 100
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Font A...'
        TabOrder = 15
        OnClick = Button23Click
      end
      object Button24: TButton
        Left = 160
        Top = 132
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Font B...'
        TabOrder = 16
        OnClick = Button24Click
      end
      object cbLineMarkers: TComboBox
        Left = 124
        Top = 200
        Width = 105
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Style = csDropDownList
        TabOrder = 17
        Items.Strings = (
          'None'
          'Square'
          'Diamond'
          'Triangle'
          'X'
          'Star'
          'Dow Jones'
          'Standard Deviation'
          'Circle'
          'Plus')
      end
    end
    object TabSheet2: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Picture'
      ImageIndex = 1
      object Label4: TLabel
        Left = 4
        Top = 8
        Width = 50
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Picture file'
      end
      object Button15: TButton
        Left = 4
        Top = 52
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Add chart'
        TabOrder = 0
        OnClick = Button15Click
      end
      object edPictFile: TEdit
        Left = 4
        Top = 24
        Width = 281
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 1
        Text = 'Pig.jpg'
      end
      object Button16: TButton
        Left = 288
        Top = 24
        Width = 25
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '...'
        TabOrder = 2
        OnClick = Button16Click
      end
      object Memo1: TMemo
        Left = 4
        Top = 84
        Width = 309
        Height = 89
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'Creates a chart with the picture file as '
          'background in the chart and legend area.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object TabSheet3: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Gradient'
      ImageIndex = 2
      object shpColor1: TShape
        Left = 84
        Top = 12
        Width = 49
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
      end
      object shpColor2: TShape
        Left = 84
        Top = 40
        Width = 49
        Height = 17
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
      end
      object Label5: TLabel
        Left = 64
        Top = 72
        Width = 67
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Gradient style'
      end
      object Button17: TButton
        Left = 4
        Top = 100
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Add chart'
        TabOrder = 0
        OnClick = Button17Click
      end
      object Button18: TButton
        Left = 136
        Top = 8
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Color 1'
        TabOrder = 1
        OnClick = Button18Click
      end
      object Button19: TButton
        Left = 136
        Top = 36
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Color 2'
        TabOrder = 2
        OnClick = Button19Click
      end
      object cbGradientStyle: TComboBox
        Left = 136
        Top = 68
        Width = 145
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Horizontal'
          'Vertical'
          'Diagonal up'
          'Diagonal down'
          'From corner'
          'From center')
      end
      object Memo2: TMemo
        Left = 0
        Top = 136
        Width = 309
        Height = 89
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'Creates a chart with gradient fill style '
          'in '
          'the chart and legend area.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object TabSheet4: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Color bar'
      ImageIndex = 3
      object Button20: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Add chart'
        TabOrder = 0
        OnClick = Button20Click
      end
      object Memo3: TMemo
        Left = 4
        Top = 84
        Width = 309
        Height = 89
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'Creates a chart with randomly colored '
          'bars.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object TabSheet5: TTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Labels'
      ImageIndex = 4
      object Button21: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Add chart'
        TabOrder = 0
        OnClick = Button21Click
      end
      object Memo4: TMemo
        Left = 4
        Top = 84
        Width = 309
        Height = 89
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'Creates a chart with labels (month names) '
          'attached to the bars.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xls)|*.xls|All files (*.*)|*.*'
    Left = 404
    Top = 36
  end
  object dlgOpen: TOpenDialog
    Filter = 
      'Picture files (*.bmp;*.jpg;*.png;*.wmf)|*.bmp;*.jpg;*.png;*.wmf|' +
      'All files (*.*)|*.*'
    Left = 400
    Top = 112
  end
  object dlgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 400
    Top = 156
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '6.00.00'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 404
    Top = 196
  end
  object XPManifest1: TXPManifest
    Left = 404
    Top = 244
  end
end
