object frmPageSetup: TfrmPageSetup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Page Setup'
  ClientHeight = 327
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 4
    Top = 0
    Width = 425
    Height = 289
    ActivePage = tsPage
    TabOrder = 0
    object tsPage: TTabSheet
      Caption = 'Page'
      ExplicitTop = 20
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 54
        Height = 13
        Caption = 'Orientation'
      end
      object Label2: TLabel
        Left = 8
        Top = 88
        Width = 49
        Height = 13
        Caption = 'Paper size'
      end
      object rbPortrait: TRadioButton
        Left = 8
        Top = 44
        Width = 61
        Height = 17
        Caption = 'Portrait'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbLandscape: TRadioButton
        Left = 128
        Top = 44
        Width = 73
        Height = 17
        Caption = 'Landscape'
        TabOrder = 1
      end
      object cbPaperSize: TComboBox
        Left = 8
        Top = 104
        Width = 197
        Height = 21
        Style = csDropDownList
        TabOrder = 2
      end
    end
    object tsMargins: TTabSheet
      Caption = 'Margins'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object Panel2: TPanel
        Left = 4
        Top = 8
        Width = 249
        Height = 221
        BevelOuter = bvNone
        TabOrder = 0
        object Shape1: TShape
          Left = 85
          Top = 64
          Width = 73
          Height = 97
        end
        object Label3: TLabel
          Left = 30
          Top = 84
          Width = 19
          Height = 13
          Caption = 'Left'
        end
        object Label4: TLabel
          Left = 164
          Top = 84
          Width = 25
          Height = 13
          Caption = 'Right'
        end
        object Label5: TLabel
          Left = 85
          Top = 18
          Width = 18
          Height = 13
          Caption = 'Top'
        end
        object Label6: TLabel
          Left = 85
          Top = 194
          Width = 34
          Height = 13
          Caption = 'Bottom'
        end
        object edMarginTop: TEdit
          Left = 85
          Top = 37
          Width = 50
          Height = 21
          TabOrder = 0
        end
        object edMarginBottom: TEdit
          Left = 85
          Top = 167
          Width = 50
          Height = 21
          TabOrder = 1
        end
        object edMarginRight: TEdit
          Left = 164
          Top = 103
          Width = 50
          Height = 21
          TabOrder = 2
        end
        object edMarginLeft: TEdit
          Left = 30
          Top = 103
          Width = 50
          Height = 21
          TabOrder = 3
        end
      end
    end
  end
  object Button1: TButton
    Left = 352
    Top = 296
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button2: TButton
    Left = 268
    Top = 296
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
end
