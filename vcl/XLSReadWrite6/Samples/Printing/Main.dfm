object frmMain: TfrmMain
  Left = 367
  Top = 164
  Width = 682
  Height = 436
  Caption = 'Printing'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    666
    398)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 115
    Width = 55
    Height = 13
    Caption = 'Print footer'
  end
  object Label2: TLabel
    Left = 20
    Top = 88
    Width = 59
    Height = 13
    Caption = 'Print header'
  end
  object Label8: TLabel
    Left = 267
    Top = 141
    Width = 122
    Height = 13
    Caption = 'Page breaks (cell ref, A1)'
  end
  object Label9: TLabel
    Left = 464
    Top = 144
    Width = 49
    Height = 13
    Caption = 'Paper size'
  end
  object Label10: TLabel
    Left = 464
    Top = 200
    Width = 37
    Height = 13
    Caption = 'Options'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 666
    Height = 69
    Align = alTop
    TabOrder = 0
    DesignSize = (
      666
      69)
    object btnWrite: TButton
      Left = 4
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Write'
      TabOrder = 0
      OnClick = btnWriteClick
    end
    object edWriteFilename: TEdit
      Left = 85
      Top = 9
      Width = 530
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object btnDlgSave: TButton
      Left = 617
      Top = 7
      Width = 28
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 2
      OnClick = btnDlgSaveClick
    end
    object Button1: TButton
      Left = 4
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 85
      Top = 36
      Width = 136
      Height = 25
      Caption = 'Copy values to XLS'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object edHeader: TEdit
    Left = 85
    Top = 85
    Width = 556
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object edFooter: TEdit
    Left = 85
    Top = 112
    Width = 556
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 12
    Top = 148
    Width = 249
    Height = 221
    BevelOuter = bvNone
    TabOrder = 3
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
    Top = 187
    Width = 121
    Height = 182
    ItemHeight = 13
    Items.Strings = (
      'E10'
      'E30'
      'E40')
    TabOrder = 4
  end
  object edPageBreak: TEdit
    Left = 267
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object btnAddPageBrk: TButton
    Left = 394
    Top = 158
    Width = 35
    Height = 25
    Caption = 'Add'
    TabOrder = 6
    OnClick = btnAddPageBrkClick
  end
  object cbPaperSize: TComboBox
    Left = 464
    Top = 160
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
  end
  object cbOptLeftToRight: TCheckBox
    Left = 464
    Top = 224
    Width = 97
    Height = 17
    Caption = 'Left to right'
    TabOrder = 8
  end
  object cbOptPotrait: TCheckBox
    Left = 464
    Top = 248
    Width = 97
    Height = 17
    Caption = 'Potrait'
    TabOrder = 9
  end
  object cbOptNoColor: TCheckBox
    Left = 464
    Top = 272
    Width = 97
    Height = 17
    Caption = 'No color'
    TabOrder = 10
  end
  object cbOptDraftQuality: TCheckBox
    Left = 464
    Top = 296
    Width = 97
    Height = 17
    Caption = 'Draft quality'
    TabOrder = 11
  end
  object cbOptNotes: TCheckBox
    Left = 464
    Top = 320
    Width = 97
    Height = 17
    Caption = 'Notes'
    TabOrder = 12
  end
  object cbOptRowColHeadings: TCheckBox
    Left = 464
    Top = 344
    Width = 153
    Height = 17
    Caption = 'Row and column headings'
    TabOrder = 13
  end
  object cbOptGridlines: TCheckBox
    Left = 464
    Top = 368
    Width = 97
    Height = 17
    Caption = 'Gridlines'
    TabOrder = 14
  end
  object dlgSave: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 412
    Top = 196
  end
  object XLS: TXLSReadWriteII5
    ComponentVersion = '5.10.06a'
    Version = xvExcel2007
    DirectRead = False
    DirectWrite = False
    Left = 412
    Top = 240
  end
  object XPManifest1: TXPManifest
    Left = 412
    Top = 284
  end
end
