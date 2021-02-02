object frmNameManager: TfrmNameManager
  Left = 0
  Top = 0
  Caption = 'Name Manager'
  ClientHeight = 407
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  DesignSize = (
    607
    407)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 328
    Width = 49
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Refers to:'
  end
  object lvNames: TListView
    Left = 8
    Top = 40
    Width = 590
    Height = 285
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Name'
        Width = 110
      end
      item
        Caption = 'Value'
        Width = 100
      end
      item
        Caption = 'Refers To'
        Width = 150
      end
      item
        Caption = 'Scope'
        Width = 100
      end
      item
        Caption = 'Comment'
        Width = 100
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvNamesChange
    OnChanging = lvNamesChanging
    OnDblClick = lvNamesDblClick
  end
  object btnNew: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object btnEdit: TButton
    Left = 92
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnDelete: TButton
    Left = 176
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnEditUndo: TButton
    Left = 8
    Top = 344
    Width = 25
    Height = 21
    Anchors = [akLeft, akBottom]
    Caption = 'X'
    TabOrder = 5
    OnClick = btnEditUndoClick
  end
  object btnEditOk: TButton
    Left = 40
    Top = 344
    Width = 25
    Height = 21
    Anchors = [akLeft, akBottom]
    Caption = 'V'
    TabOrder = 6
    OnClick = btnEditOkClick
  end
  object btnClose: TButton
    Left = 523
    Top = 376
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 7
  end
  object edEdit: TEdit
    Left = 72
    Top = 344
    Width = 526
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
  end
end
