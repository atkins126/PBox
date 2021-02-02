unit FrmDebugFmla;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, XLSFmlaDebugger5, Xc12Manager5,
  Vcl.StdCtrls, Vcl.ExtCtrls, XLSUtils5, Clipbrd;

type
  TfrmDebugFormula = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    lbStack: TListBox;
    Label2: TLabel;
    lblNow: TLabel;
    edFormula: TEdit;
    lbFormulas: TListBox;
    Label3: TLabel;
    lblResult: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure lbFormulasDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbFormulasMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure edFormulaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);
  private
    FManager   : TXc12Manager;
    FSheetIndex: integer;
    FCol       : integer;
    FRow       : integer;
    FDebugger  : TFmlaDebugger;

    procedure Debug;
    procedure PaintCurrent;
  public
    procedure Execute(AManager: TXc12Manager; ASheetIndex,ACol,ARow: integer);
  end;

implementation

{$R *.dfm}

{ TfrmDebugFormula }

procedure TfrmDebugFormula.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDebugFormula.Button2Click(Sender: TObject);
begin
  if not FDebugger.AtFirst then begin
    FDebugger.MovePrev;
    Debug;
  end;
end;

procedure TfrmDebugFormula.Button3Click(Sender: TObject);
begin
  if not FDebugger.AtLast then begin
    FDebugger.MoveNext;
    Debug;
  end;
end;

procedure TfrmDebugFormula.Button4Click(Sender: TObject);
begin
  Clipboard.AsText := FDebugger.Formulas.Text;
end;

procedure TfrmDebugFormula.Debug;
begin
  edFormula.Repaint;
  lbStack.Items.Assign(FDebugger.Stack);
  lblNow.Caption := FDebugger.LastEval;
  lblResult.Caption := FDebugger.LastResult;
  PaintCurrent;
end;

procedure TfrmDebugFormula.edFormulaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  n: integer;
begin
  n := FDebugger.StepsToPos(edFormula.SelStart + 1);
  if n > 0 then begin
    FDebugger.MoveSteps(n);
    Debug;
  end;
end;

procedure TfrmDebugFormula.Execute(AManager: TXc12Manager; ASheetIndex,ACol,ARow: integer);
begin
  FManager := AManager;
  FSheetIndex := ASheetIndex;
  FCol := ACol;
  FRow := ARow;

  FDebugger := TFmlaDebugger.Create(FManager,FSheetIndex,FCol,FRow);
  lbFormulas.Items.Assign(FDebugger.Formulas);
  edFormula.Text := FDebugger.Formula;

  ShowModal;
end;

procedure TfrmDebugFormula.FormDestroy(Sender: TObject);
begin
  FDebugger.Free;
end;

procedure TfrmDebugFormula.lbFormulasDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Canvas: TControlCanvas;
  LB: TListBox;
  S1,S2: string;
begin
  LB := TListBox(Control);
  Canvas := TControlCanvas.Create;
  try
    Canvas.Control := LB;
    Canvas.Font.Assign(LB.Font);

    S1 := LB.Items[Index];
    S2 := SplitAtChar(#9,S1);

    if odSelected in State then begin
      Canvas.Pen.Color := clNavy;
      Canvas.Brush.Color := clNavy;
      Canvas.Font.Color := clWhite;
    end
    else begin
      Canvas.Pen.Color := clWhite;
      Canvas.Brush.Color := clWhite;
      Canvas.Font.Color := clBlack;
    end;

    Canvas.TextOut(Rect.Left,Rect.Top,S2);
    Canvas.TextOut(Rect.Left + 100,Rect.Top,S1);
  finally
    Canvas.Free;
  end;
end;

procedure TfrmDebugFormula.lbFormulasMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
begin
  Height := 13;
end;

procedure TfrmDebugFormula.PaintCurrent;
var
  S: string;
  x1,x2: integer;
  p1,p2: integer;
  Canvas: TControlCanvas;
begin
  if FDebugger.CurrItem = Nil then
    Exit;

  p1 := FDebugger.CurrItem.P1;
  p2 := FDebugger.CurrItem.P2;
  Canvas := TControlCanvas.Create;
  try
    Canvas.Control := edFormula;
    Canvas.Font.Assign(edFormula.Font);

    S := Copy(edFormula.Text,1,p1 - 1);
    x1 := Canvas.TextWidth(S);
    S := Copy(edFormula.Text,1,p2);
    x2 := Canvas.TextWidth(S);

    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Color := clRed;

    Canvas.Rectangle(x1,0,x2 + 1,edFormula.Height - 4);
  finally
    Canvas.Free;
  end;
end;

end.
