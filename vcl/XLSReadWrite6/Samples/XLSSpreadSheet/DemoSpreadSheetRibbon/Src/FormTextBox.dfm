object frmTextBox: TfrmTextBox
  Left = 0
  Top = 0
  Caption = 'Text Box'
  ClientHeight = 212
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    389
    212)
  PixelsPerInch = 96
  TextHeight = 13
  object memText: TMemo
    Left = 0
    Top = 0
    Width = 389
    Height = 173
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 4
    Top = 180
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 308
    Top = 180
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
