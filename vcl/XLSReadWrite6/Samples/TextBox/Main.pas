unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReadWriteII5, StdCtrls, ExtCtrls, IniFiles, XLSComment5,
  XLSDrawing5, Xc12Utils5, XLSSheetData5, XPMan;

// *****************************************************************************
// *************************** About Text boxes ********************************
// *****************************************************************************
// *** The text in a text box is stored in paragraphs which in turn stores   ***
// *** the text in text runs. A paragraph is a string of text that ends with ***
// *** a line break (carrige return). A text run is a part of a paragraph    ***
// *** where the text has same properties (bold, underline, typeface etc).   ***
// ***                                                                       ***
// *** Edit part of text in text boxes.                                      ***
// *** Don't try to do that. Even if all the text properties looks the same  ***
// *** in Excel, the text may still be splitted up in text runs for reasons  ***
// *** that not are known to humans. It will be very complicated to keep     ***
// *** track of all text runs.                                               ***
// *** You can use the PlainText property to read or write all text of the   ***
// *** text box. If you want to change the text in a text box, replace all   ***
// *** text.                                                                 ***
// *****************************************************************************
  
type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnRead: TButton;
    btnWrite: TButton;
    edReadFilename: TEdit;
    edWriteFilename: TEdit;
    btnDlgOpen: TButton;
    btnDlgSave: TButton;
    cbTextBoxes: TComboBox;
    btnAdd1: TButton;
    btnAdd2: TButton;
    btnClose: TButton;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    XLS: TXLSReadWriteII5;
    btnAdd3: TButton;
    memText: TMemo;
    XPManifest1: TXPManifest;
    procedure btnCloseClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
    procedure btnDlgOpenClick(Sender: TObject);
    procedure btnDlgSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAdd1Click(Sender: TObject);
    procedure btnAdd2Click(Sender: TObject);
    procedure btnAdd3Click(Sender: TObject);
    procedure cbTextBoxesCloseUp(Sender: TObject);
  private
    procedure ReadTextBoxes;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnReadClick(Sender: TObject);
begin
  XLS.Filename := edReadFilename.Text;
  XLS.Read;

  ReadTextBoxes;
end;

procedure TfrmMain.btnWriteClick(Sender: TObject);
begin
  XLS.Filename := edWriteFilename.Text;
  XLS.Write;
end;

procedure TfrmMain.btnDlgOpenClick(Sender: TObject);
begin
  dlgOpen.FileName := edReadFilename.Text;
  if dlgOpen.Execute then
    edReadFilename.Text := dlgOpen.FileName;
end;

procedure TfrmMain.btnDlgSaveClick(Sender: TObject);
begin
  dlgSave.FileName := edWriteFilename.Text;
  if dlgSave.Execute then
    edWriteFilename.Text := dlgSave.FileName;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  S: string;
  Ini: TIniFile;
begin
  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    edReadFilename.Text := Ini.ReadString('Files','Read','');
    edWriteFilename.Text := Ini.ReadString('Files','Write','');
  finally
    Ini.Free;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
var
  S: string;
  Ini: TIniFile;
begin
  S := ChangeFileExt(Application.ExeName,'.ini');
  Ini := TIniFile.Create(S);
  try
    Ini.WriteString('Files','Read',edReadFilename.Text);
    Ini.WriteString('Files','Write',edWriteFilename.Text);
  finally
    Ini.Free;
  end;
end;

procedure TfrmMain.ReadTextBoxes;
var
  i: integer;
  TB: TXLSDrawingTextBox;
begin
  cbTextBoxes.Clear;

  for i := 0 to XLS[0].Drawing.TextBoxes.Count - 1 do begin
    TB := XLS[0].Drawing.TextBoxes[i];
    cbTextBoxes.Items.Add(AreaToRefStr(TB.Col1,TB.Row1,TB.Col2,TB.Row2));
  end;
  if cbTextBoxes.Items.Count > 0 then begin
    cbTextBoxes.ItemIndex := 0;
    memText.Lines.Text := XLS[0].Drawing.TextBoxes[0].PlainText;
  end;
end;

procedure TfrmMain.btnAdd1Click(Sender: TObject);
begin
  // Simplest possible text box. Font properies will be the default of Excel.

  if True then
    XLS[0].Drawing.InsertTextBox('Hello, Mars #1',2,10,5,15)
  else
    // The position can also be a string with a cell area.
    XLS[0].Drawing.InsertTextBox('Hello, Mars #1','C11:F16');

  ReadTextBoxes;
end;

procedure TfrmMain.btnAdd2Click(Sender: TObject);
var
  TB: TXLSDrawingTextBox;
  Editor: TXLSDrawingEditorTextBox;
begin
  // Add a text box.
  TB := XLS[0].Drawing.TextBoxes.Add;

  // Set the position.
  if True then begin
    // Left column
    TB.Col1 := 6;
    // Offset within the column, in percent of the column width. Default is zero.
    TB.Col1Offs := 0.25;
    // Top row.
    TB.Row1 := 10;
    // Offset within the row, in percent of the row height. Default is zero.
    TB.Row1Offs := 0.1;
    // Right column
    TB.Col2 := 9;
    TB.Row2 := 15;
  end
  else
    // Position can also be a text string with the area.
    TB.SetArea('G11:J16');

  // Create an editor for editing the text. This is not required if you just
  // want to set the text, you can then use: TB.PlainText := 'My text';
  Editor := XLS[0].Drawing.EditTextBox(TB);
  try
    // Set the default font size.
    // Font properies in text runs are inherited from the previous text run,
    // and the first text run uses the properties of the DefaultFont.
    Editor.Body.DefaultFont.Size := 12;

    // Set the text.
    Editor.Body.PlainText := 'Hello, Mars #2';
  finally
    Editor.Free;
  end;

  ReadTextBoxes;
end;

procedure TfrmMain.btnAdd3Click(Sender: TObject);
var
  TB: TXLSDrawingTextBox;
  EditorTextBox: TXLSDrawingEditorTextBox;
  EditorShape: TXLSDrawingEditorShape;
  Para: TXLSDrwTextPara;
  Run: TXLSDrwTextRun;
begin
  // Add a text box
  TB := XLS[0].Drawing.TextBoxes.Add;

  // Set the position.
  TB.Col1 := 10;
  TB.Row1 := 10;
  TB.Col2 := 13;
  TB.Row2 := 15;

  // Create an editor for editing the text. This is not required if you just
  // want to set the text, you can the use: TB.PlainText := 'My text';
  EditorTextBox := XLS[0].Drawing.EditTextBox(TB);
  try
    // Set properties of the default font.
    EditorTextBox.Body.DefaultFont.Size := 10;
    EditorTextBox.Body.DefaultFont.Name := 'Courier New';
    EditorTextBox.Body.DefaultFont.Bold := True;

    // Add a paragraph.
    Para := EditorTextBox.Body.Paras.Add;
    // Set the text. Using PlainText is easier that adding a text run.
    Para.PlainText := 'Hello, Mars # 3';
    // Any properties of the paragraph must be set after PlainText is assigned
    // as this will clear the content of the paragraph.
    Para.Align := xdtaCentre;

    // Add one more paragraph.
    Para := EditorTextBox.Body.Paras.Add;
    // Add a text run.
    Run := Para.AddText('Greatings from Earth! ');
    // Make sure that there is a font. By default is Font is Nil as the
    // DefaultFont property (or the previous font) is used.
    Run.AddFont;

    // Set font properties.
    Run.Font.Size := 14;
    Run.Font.Color := clRed;

    // Add another text run.
    Run := Para.AddText('Are you green?');
    // Make sure that there is a font.
    Run.AddFont;
    // Set font properties.
    Run.Font.Color := clGreen;
  finally
    EditorTextBox.Free;
  end;

  // Create an editor for the drawing shape properties.
  // A drawing shape is the graphic object that the text is displayed in.
  EditorShape := XLS[0].Drawing.EditShape(TB);
  try
    // Make sure that there is a Line property. The line is the border line
    // around the text box.
    EditorShape.ShapeProperies.HasLine := True;
    // Set the line width, in points.
    EditorShape.ShapeProperies.Line.Width := 8;

    // Set the fill of the text box.
    EditorShape.ShapeProperies.Fill.FillType := xdftSolid;
    EditorShape.ShapeProperies.Fill.AsSolid.Color.AsTColor := clInfoBk;
  finally
    EditorShape.Free;
  end;

  ReadTextBoxes;
end;

procedure TfrmMain.cbTextBoxesCloseUp(Sender: TObject);
var
  i: integer;
begin
  i := cbTextBoxes.ItemIndex;
  if i >= 0 then
    memText.Lines.Text := XLS[0].Drawing.TextBoxes[i].PlainText;
end;

end.
