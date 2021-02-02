object frmPBox: TfrmPBox
  Left = 0
  Top = 0
  Caption = 'frmPBox'
  ClientHeight = 726
  ClientWidth = 1176
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object clbrPModule: TCoolBar
    Left = 0
    Top = 0
    Width = 1176
    Height = 24
    AutoSize = True
    Bands = <
      item
        Control = tlbPModule
        ImageIndex = -1
        MinHeight = 24
        Width = 1174
      end>
    EdgeInner = esNone
    EdgeOuter = esNone
    object tlbPModule: TToolBar
      Left = 11
      Top = 0
      Width = 1165
      Height = 24
      ButtonHeight = 24
      ButtonWidth = 43
      Caption = 'tlbPModule'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ShowCaptions = True
      TabOrder = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 701
    Width = 1176
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlBottom'
    Color = 15109422
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    ShowCaption = False
    TabOrder = 1
    object pnlTime: TPanel
      Left = 952
      Top = 0
      Width = 224
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlDateTime'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      object lblTime: TLabel
        Left = 10
        Top = 4
        Width = 8
        Height = 15
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = lblTimeClick
      end
    end
    object pnlIP: TPanel
      Left = 799
      Top = 0
      Width = 153
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlIP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 1
      object lblIP: TLabel
        Left = 14
        Top = 4
        Width = 8
        Height = 15
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = lblIPClick
      end
      object bvlIP: TBevel
        Left = 151
        Top = 0
        Width = 2
        Height = 25
        Align = alRight
        ExplicitLeft = 118
      end
    end
    object pnlWeb: TPanel
      Left = 484
      Top = 0
      Width = 315
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlWeb'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 2
      object lblWeb: TLabel
        Left = 7
        Top = 4
        Width = 8
        Height = 15
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object bvlWeb: TBevel
        Left = 313
        Top = 0
        Width = 2
        Height = 25
        Align = alRight
        ExplicitLeft = 118
      end
    end
    object pnlLogin: TPanel
      Left = 0
      Top = 0
      Width = 484
      Height = 25
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlIP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 3
      object lblLogin: TLabel
        Left = 4
        Top = 4
        Width = 8
        Height = 15
        Font.Charset = GB2312_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object bvlModule02: TBevel
        Left = 482
        Top = 0
        Width = 2
        Height = 25
        Align = alRight
        ExplicitLeft = 128
      end
    end
  end
  object pgcAll: TPageControl
    Left = 0
    Top = 24
    Width = 1176
    Height = 677
    ActivePage = tsButton
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    Style = tsFlatButtons
    TabOrder = 2
    object tsButton: TTabSheet
      Caption = 'tsButton'
      object imgButtonBack: TImage
        Left = 0
        Top = 0
        Width = 1168
        Height = 646
        Align = alClient
        ExplicitLeft = 32
        ExplicitTop = 48
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object pnlModuleDialog: TPanel
        Left = 215
        Top = 104
        Width = 654
        Height = 385
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'pnlModuleDialog'
        Color = clWhite
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        ShowCaption = False
        TabOrder = 0
        object pnlModuleDialogTitle: TPanel
          Left = 0
          Top = 0
          Width = 652
          Height = 45
          Align = alTop
          Caption = 'pnlModuleDialogTitle'
          Color = 9916930
          Font.Charset = GB2312_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = #24494#36719#38597#40657
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            652
            45)
          object imgSubModuleClose: TImage
            Left = 616
            Top = 7
            Width = 32
            Height = 32
            Anchors = [akTop, akRight]
            Transparent = True
            OnClick = imgSubModuleCloseClick
            OnMouseEnter = imgSubModuleCloseMouseEnter
            OnMouseLeave = imgSubModuleCloseMouseLeave
          end
        end
      end
    end
    object tsList: TTabSheet
      Caption = 'tsList'
      ImageIndex = 1
      object imgListBack: TImage
        Left = 0
        Top = 0
        Width = 1168
        Height = 646
        Align = alClient
        Stretch = True
        ExplicitLeft = 248
        ExplicitTop = 176
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object tsDll: TTabSheet
      Caption = 'tsDll'
      ImageIndex = 2
      object imgDllFormBack: TImage
        Left = 0
        Top = 0
        Width = 1168
        Height = 646
        Align = alClient
        Stretch = True
        ExplicitLeft = 360
        ExplicitTop = 216
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
  end
  object pmFuncMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 100
    Top = 383
    object mniFuncMenuConfig: TMenuItem
      Caption = #37197#32622
      OnClick = mniFuncMenuConfigClick
    end
    object mniFuncMenuMoney: TMenuItem
      Caption = #25424#21161
      OnClick = mniFuncMenuMoneyClick
    end
    object mniFuncMenuLine01: TMenuItem
      Caption = '-'
    end
    object mniFuncMenuAbout: TMenuItem
      Caption = #20851#20110
      OnClick = mniFuncMenuAboutClick
    end
  end
  object ilMainMenu: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 96
    Top = 154
  end
  object mmMainMenu: TMainMenu
    AutoHotkeys = maManual
    AutoMerge = True
    Images = ilMainMenu
    Left = 96
    Top = 262
  end
  object tmrDateTime: TTimer
    OnTimer = tmrDateTimeTimer
    Left = 92
    Top = 332
  end
  object pmAdapterList: TPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    Left = 100
    Top = 455
  end
  object ilPModule: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 96
    Top = 100
  end
  object pmTray: TPopupMenu
    AutoHotkeys = maManual
    Left = 96
    Top = 216
    object mniTrayShowForm: TMenuItem
      Caption = #26174#31034
      OnClick = mniTrayShowFormClick
    end
    object mniTrayLine01: TMenuItem
      Caption = '-'
    end
    object mniTrayExit: TMenuItem
      Caption = #36864#20986
      OnClick = mniTrayExitClick
    end
  end
end
