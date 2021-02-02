object frmPageSetup: TfrmPageSetup
  Left = 647
  Top = 140
  BorderStyle = bsDialog
  Caption = 'Page setup'
  ClientHeight = 303
  ClientWidth = 626
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
  object Label8: TLabel
    Left = 267
    Top = 9
    Width = 122
    Height = 13
    Caption = 'Page breaks (cell ref, A1)'
  end
  object Label9: TLabel
    Left = 464
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Paper size'
  end
  object Label10: TLabel
    Left = 464
    Top = 68
    Width = 37
    Height = 13
    Caption = 'Options'
  end
  object Panel2: TPanel
    Left = 12
    Top = 16
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
      Left = 6
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
    object Label7: TLabel
      Left = 6
      Top = 4
      Width = 73
      Height = 14
      Caption = 'Margins, cm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edMarginTop: TEdit
      Left = 85
      Top = 37
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edMarginBottom: TEdit
      Left = 85
      Top = 167
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edMarginRight: TEdit
      Left = 164
      Top = 103
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edMarginLeft: TEdit
      Left = 6
      Top = 103
      Width = 73
      Height = 21
      TabOrder = 3
    end
  end
  object lbPageBreaks: TListBox
    Left = 267
    Top = 55
    Width = 121
    Height = 182
    ItemHeight = 13
    TabOrder = 1
  end
  object edPageBreak: TEdit
    Left = 267
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnAddPageBrk: TButton
    Left = 394
    Top = 26
    Width = 35
    Height = 25
    Caption = 'Add'
    TabOrder = 3
    OnClick = btnAddPageBrkClick
  end
  object cbPaperSize: TComboBox
    Left = 464
    Top = 28
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object cbOptLeftToRight: TCheckBox
    Left = 464
    Top = 92
    Width = 97
    Height = 17
    Caption = 'Left to right'
    TabOrder = 5
  end
  object cbOptPotrait: TCheckBox
    Left = 464
    Top = 116
    Width = 97
    Height = 17
    Caption = 'Potrait'
    TabOrder = 6
  end
  object cbOptNoColor: TCheckBox
    Left = 464
    Top = 140
    Width = 97
    Height = 17
    Caption = 'No color'
    TabOrder = 7
  end
  object cbOptDraftQuality: TCheckBox
    Left = 464
    Top = 164
    Width = 97
    Height = 17
    Caption = 'Draft quality'
    TabOrder = 8
  end
  object cbOptNotes: TCheckBox
    Left = 464
    Top = 188
    Width = 97
    Height = 17
    Caption = 'Notes'
    TabOrder = 9
  end
  object cbOptRowColHeadings: TCheckBox
    Left = 464
    Top = 212
    Width = 153
    Height = 17
    Caption = 'Row and column headings'
    TabOrder = 10
  end
  object cbOptGridlines: TCheckBox
    Left = 464
    Top = 236
    Width = 97
    Height = 17
    Caption = 'Gridlines'
    TabOrder = 11
  end
  object Button1: TButton
    Left = 444
    Top = 268
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 12
  end
  object Button2: TButton
    Left = 536
    Top = 268
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 13
  end
end
