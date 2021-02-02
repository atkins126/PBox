object frmPrintPreview: TfrmPrintPreview
  Left = 350
  Top = 223
  Width = 839
  Height = 906
  Caption = 'Print preview'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object XPP: TXLSBookPrintPreview
    Left = 0
    Top = 41
    Width = 823
    Height = 827
    Align = alClient
    DoubleBuffered = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 823
    Height = 41
    Align = alTop
    TabOrder = 1
    object lblPages: TLabel
      Left = 192
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Pages:'
    end
    object lblPage: TLabel
      Left = 296
      Top = 16
      Width = 21
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '1'
    end
    object btnClose: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      ModalResult = 1
      TabOrder = 0
    end
    object btnPrint: TButton
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 1
    end
    object btnPrevPage: TButton
      Left = 260
      Top = 8
      Width = 29
      Height = 25
      Caption = '<<'
      TabOrder = 2
      OnClick = btnPrevPageClick
    end
    object btnNextPage: TButton
      Left = 324
      Top = 8
      Width = 29
      Height = 25
      Caption = '>>'
      TabOrder = 3
      OnClick = btnNextPageClick
    end
  end
end
