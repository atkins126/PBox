object frmName: TfrmName
  Left = 0
  Top = 0
  Caption = 'Edit Name'
  ClientHeight = 244
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  DesignSize = (
    316
    244)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object Label2: TLabel
    Left = 12
    Top = 40
    Width = 33
    Height = 13
    Caption = 'Scope:'
  end
  object Label3: TLabel
    Left = 12
    Top = 68
    Width = 49
    Height = 13
    Caption = 'Comment:'
  end
  object Label4: TLabel
    Left = 12
    Top = 186
    Width = 49
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Refers to:'
  end
  object btnCancel: TButton
    Left = 233
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object btnOk: TButton
    Left = 149
    Top = 211
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object edName: TEdit
    Left = 72
    Top = 8
    Width = 235
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object cbScope: TComboBox
    Left = 72
    Top = 36
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
  end
  object memComment: TMemo
    Left = 72
    Top = 64
    Width = 235
    Height = 111
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object edRefersTo: TEdit
    Left = 72
    Top = 182
    Width = 235
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
  end
end
