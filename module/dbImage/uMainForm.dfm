object frmImageView: TfrmImageView
  Left = 0
  Top = 0
  Caption = #22270#20687#27983#35272#26597#30475#22120' v1.0'
  ClientHeight = 630
  ClientWidth = 1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcAll: TPageControl
    Left = 0
    Top = 56
    Width = 1089
    Height = 574
    ActivePage = tsBrowse
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    Style = tsButtons
    TabOrder = 0
    object tsBrowse: TTabSheet
      Caption = 'tsBrowse'
    end
    object tsView: TTabSheet
      Caption = 'tsView'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 547
      object scrlbxImage: TScrollBox
        Left = 0
        Top = 0
        Width = 1081
        Height = 543
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Align = alClient
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        object img1: TImage
          Left = 0
          Top = 0
          Width = 60
          Height = 60
          AutoSize = True
          DragCursor = crSizeAll
          DragMode = dmAutomatic
          OnDragOver = img1DragOver
          OnEndDrag = img1EndDrag
          OnStartDrag = img1StartDrag
        end
      end
    end
  end
  object clbrBrowse: TCoolBar
    Left = 0
    Top = 0
    Width = 1089
    Height = 56
    AutoSize = True
    Bands = <
      item
        Control = tlbBrowse
        ImageIndex = -1
        Width = 1083
      end
      item
        Control = tlbView
        ImageIndex = -1
        Visible = False
        Width = 1083
      end>
    object tlbBrowse: TToolBar
      Left = 9
      Top = 0
      Width = 1076
      Height = 25
      ButtonHeight = 21
      ButtonWidth = 25
      Caption = 'tlbBrowse'
      Menu = mmBrowse
      ShowCaptions = True
      TabOrder = 0
    end
    object tlbView: TToolBar
      Left = 9
      Top = 27
      Width = 1076
      Height = 25
      ButtonHeight = 21
      ButtonWidth = 25
      Caption = 'tlbView'
      Menu = mmView
      ShowCaptions = True
      TabOrder = 1
      Visible = False
    end
  end
  object tmrImageMove: TTimer
    Enabled = False
    Interval = 30
    OnTimer = tmrImageMoveTimer
    Left = 56
    Top = 92
  end
  object mmBrowse: TMainMenu
    Left = 224
    Top = 120
    object mniFile1: TMenuItem
      Caption = 'File'
      object mniOpen1: TMenuItem
        Caption = 'Open'
      end
    end
    object mniEdit1: TMenuItem
      Caption = 'Edit'
      object mniCopy1: TMenuItem
        Caption = 'Copy'
      end
    end
  end
  object mmView: TMainMenu
    Left = 224
    Top = 120
    object mni1: TMenuItem
      Caption = 'File'
      object mni2: TMenuItem
        Caption = 'Open'
      end
    end
    object mni3: TMenuItem
      Caption = 'Edit'
      object mni4: TMenuItem
        Caption = 'Copy'
      end
    end
  end
end
