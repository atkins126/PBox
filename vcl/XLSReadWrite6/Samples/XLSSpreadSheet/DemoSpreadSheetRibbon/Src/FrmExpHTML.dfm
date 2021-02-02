object frmExportHTML: TfrmExportHTML
  Left = 1049
  Top = 142
  BorderStyle = bsDialog
  Caption = 'Export to HTML'
  ClientHeight = 351
  ClientWidth = 565
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
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 81
    Height = 13
    Caption = 'Sheets to export'
  end
  object Label2: TLabel
    Left = 180
    Top = 40
    Width = 357
    Height = 13
    Caption = 
      'Will only write cell values without any formatting, pictures, co' +
      'mments, etc.'
  end
  object Label3: TLabel
    Left = 180
    Top = 140
    Width = 143
    Height = 13
    Caption = 'Include in exported HTML file:'
  end
  object Label4: TLabel
    Left = 200
    Top = 288
    Width = 70
    Height = 13
    Caption = 'Cells to export'
  end
  object Label5: TLabel
    Left = 180
    Top = 92
    Width = 302
    Height = 13
    Caption = 'The separate files will have the same name as the sheet name.'
  end
  object clbSheets: TCheckListBox
    Left = 4
    Top = 32
    Width = 169
    Height = 273
    ItemHeight = 13
    TabOrder = 0
  end
  object cbSimpleExport: TCheckBox
    Left = 180
    Top = 56
    Width = 97
    Height = 17
    Caption = 'Simple export. '
    TabOrder = 1
    OnClick = cbSimpleExportClick
  end
  object cbComments: TCheckBox
    Left = 180
    Top = 156
    Width = 97
    Height = 17
    Caption = 'Comments'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object cbImages: TCheckBox
    Left = 180
    Top = 180
    Width = 97
    Height = 17
    Caption = 'Images'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = cbImagesClick
  end
  object cbHyperlinks: TCheckBox
    Left = 180
    Top = 228
    Width = 97
    Height = 17
    Caption = 'Hyperlinks'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object cbSeparateFiles: TCheckBox
    Left = 180
    Top = 108
    Width = 229
    Height = 17
    Caption = 'Write sheets to separate files.'
    TabOrder = 5
    OnClick = cbSeparateFilesClick
  end
  object cbWriteImages: TCheckBox
    Left = 200
    Top = 204
    Width = 113
    Height = 17
    Caption = 'Write image files'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object cbExportAll: TCheckBox
    Left = 180
    Top = 264
    Width = 97
    Height = 17
    Caption = 'Export all cells'
    Checked = True
    State = cbChecked
    TabOrder = 7
    OnClick = cbExportAllClick
  end
  object edArea: TEdit
    Left = 272
    Top = 284
    Width = 77
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = 'A1:H20'
  end
  object Button1: TButton
    Left = 468
    Top = 316
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object Button2: TButton
    Left = 372
    Top = 316
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 10
  end
  object dlgOpen: TOpenDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx|All files (*.*)|*.*'
    Left = 324
    Top = 140
  end
  object ExportHTML: TXLSExportHTML5
    Options = []
    Col1 = -1
    Col2 = -1
    FileExtension = 'htm'
    Row1 = -1
    Row2 = -1
    WriteOnlyTables = False
    SimpleExport = False
    HTMLOPtions = [xeohComments, xeohImages, xeohWriteImages, xeohHyperlinks]
    TABLE.BordeWidth = 0
    TABLE.CellPadding = 0
    TABLE.CellSpacing = 0
    Left = 524
    Top = 140
  end
end
