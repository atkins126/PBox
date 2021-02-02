unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XLSReadWriteII5, ExtCtrls, StdCtrls, ComCtrls, XLSSheetData5,
  Xc12Utils5, BIFF_DrawingObjChart5, XPMan;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    edFilename: TEdit;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Title: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Button2: TButton;
    cbLegend: TCheckBox;
    cb3D: TCheckBox;
    edTitle: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    cbLineMarkers: TComboBox;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Button15: TButton;
    edPictFile: TEdit;
    Button16: TButton;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    shpColor1: TShape;
    shpColor2: TShape;
    Label5: TLabel;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    cbGradientStyle: TComboBox;
    Memo2: TMemo;
    TabSheet4: TTabSheet;
    Button20: TButton;
    Memo3: TMemo;
    TabSheet5: TTabSheet;
    Button21: TButton;
    Memo4: TMemo;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    dlgFont: TFontDialog;
    XLS: TXLSReadWriteII5;
    XPManifest1: TXPManifest;
    Label7: TLabel;
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFontA: TFont;
    FFontB: TFont;

    FGradientColor1,FGradientColor2: TXc12IndexColor;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button6Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';

    PlotArea.ChartType := xctArea;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button5Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';
    Series[0].HasDefDataPoint := True;
    Series[0].DefDataPoint.AreaFormat.ForegroundColor := xc28;

    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;

    PlotArea.Frame.AreaFormat.ForegroundColor := xc27;
    TChartStyleBarColumn(PlotArea.ChartStyle).IsBar := True;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button7Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';
    Series[0].Values2 := 'Sheet1!$B$1:$B$10';

    PlotArea.ChartType := xctBubble;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
    TChartStyleScatter(PlotArea.ChartStyle).IsBubble := True;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    // Change the color of the second bar
    with Series[0].DataPoints.Add do begin
      PointIndex := 2;
      AreaFormat.ForegroundColor := xcYellow;
    end;

  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button8Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';
    Series[0].Geomtery := sigCylinder;

    PlotArea.HasLegend := cbLegend.Checked;
    // Cylinder charts are always 3D
    PlotArea.Is3D := True;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button9Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';

    PlotArea.ChartType := xctPie;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
    PlotArea.ChartStyle.VaryColors := True;
    TChartStylePie(PlotArea.ChartStyle).DonutHole := 50;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button10Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';

    PlotArea.ChartType := xctLine;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;

    if cbLineMarkers.ItemIndex = 0 then begin
      Series[0].HasDefDataPoint := True;
      Series[0].DefDataPoint.MarkerFormat.MarkerStyle := TChartMarkerStyle(cbLineMarkers.ItemIndex);
    end
    else begin
      Series[0].HasDefDataPoint := True;
      Series[0].DefDataPoint.MarkerFormat.MarkerStyle := TChartMarkerStyle(cbLineMarkers.ItemIndex);
    end;

    Series[0].DefDataPoint.LineFormat.LineWeight := clwWide;
    Series[0].DefDataPoint.LineFormat.LineColor := xc28;
    Series[0].DefDataPoint.LineFormat.Automatic := False;

  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button11Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$3';

    PlotArea.ChartType := xctPie;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
    PlotArea.ChartStyle.VaryColors := True;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button12Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';

    PlotArea.ChartType := xctRadar;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;

end;

procedure TfrmMain.Button13Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';
    Series[0].Category := 'Sheet1!$B$1:$B$10';

    PlotArea.ChartType := xctScatter;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button22Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$B$3:$E$3';
    Series[0].Category := 'Sheet1!$B$2:$E$2';

    with Series.Add do begin
      Series[Series.Count - 1].Values := 'Sheet1!$B$5:$E$5';
      Series[Series.Count - 1].Category := 'Sheet1!$B$4:$E$4';
    end;
    with Series.Add do begin
      Series[Series.Count - 1].Values := 'Sheet1!$B$7:$E$7';
      Series[Series.Count - 1].Category := 'Sheet1!$B$6:$E$6';
    end;
    with Series.Add do begin
      Series[Series.Count - 1].Values := 'Sheet1!$B$9:$E$9';
      Series[Series.Count - 1].Category := 'Sheet1!$B$8:$E$8';
    end;

    PlotArea.ChartType := xctScatter;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button14Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    Series[0].Values := 'Sheet1!$A$1:$A$10';
    Series.Add;
    Series[1].Values := 'Sheet1!$B$1:$B$10';
    Series.Add;
    Series[2].Values := 'Sheet1!$C$1:$C$10';
    Series.Add;
    Series[3].Values := 'Sheet1!$D$1:$D$10';
    Series.Add;
    Series[4].Values := 'Sheet1!$E$1:$E$10';

    PlotArea.ChartType := xctSurface;
    PlotArea.HasLegend := cbLegend.Checked;
    PlotArea.Is3D := cb3D.Checked;
    DefaultTextA.Font.Assign(FFontA);
    DefaultTextB.Font.Assign(FFontB);

    PlotArea.Frame.AreaFormat.ForegroundColor := xcPaleGreen;
  end;
  if edTitle.Text <> '' then begin
    with XLS.BIFF[0].Charts[0].Labels.Add(cltTitle) do begin
      Text := edTitle.Text;
    end;
  end;
end;

procedure TfrmMain.Button23Click(Sender: TObject);
begin
  dlgFont.Font.Assign(FFontA);
  if dlgFont.Execute then
    FFontA.Assign(dlgFont.Font);
end;

procedure TfrmMain.Button24Click(Sender: TObject);
begin
  dlgFont.Font.Assign(FFontB);
  if dlgFont.Execute then
    FFontB.Assign(dlgFont.Font);
end;

procedure TfrmMain.Button16Click(Sender: TObject);
begin
  dlgOpen.FileName := edPictFile.Text;
  if dlgOpen.Execute then
    edPictFile.Text := dlgOpen.FileName;
end;

procedure TfrmMain.Button15Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    PlotArea.Frame.HasFillEffects := True;
    PlotArea.Frame.FillEffects.FillEffectPicture(edPictFile.Text);
    PlotArea.ChartStyle.Legend.HasFrame := True;
    PlotArea.ChartStyle.Legend.Frame.HasFillEffects := True;
    PlotArea.ChartStyle.Legend.Frame.FillEffects.FillEffectPicture(edPictFile.Text);
  end;
end;

procedure TfrmMain.Button18Click(Sender: TObject);
begin
//  if TfrmExcelColorSelect.Create(Application).Execute(FGradientColor1) then
//    shpColor1.Brush.Color := ExcelColorPalette[Integer(FGradientColor1)];
end;

procedure TfrmMain.Button19Click(Sender: TObject);
begin
//  if TfrmExcelColorSelect.Create(Application).Execute(FGradientColor2) then
//    shpColor2.Brush.Color := ExcelColorPalette[Integer(FGradientColor2)];
end;

procedure TfrmMain.Button17Click(Sender: TObject);
begin
  XLS.BIFF[0].Charts.Clear;
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    PlotArea.Frame.HasFillEffects := True;
    PlotArea.Frame.FillEffects.FillEffectGradient(FGradientColor1,FGradientColor2,TGradientFillStyle(cbGradientStyle.ItemIndex));
    PlotArea.ChartStyle.Legend.HasFrame := True;
    PlotArea.ChartStyle.Legend.Frame.HasFillEffects := True;
    PlotArea.ChartStyle.Legend.Frame.FillEffects.FillEffectGradient(FGradientColor1,FGradientColor2,TGradientFillStyle(cbGradientStyle.ItemIndex));
  end;
end;

procedure TfrmMain.Button20Click(Sender: TObject);
var
  i: integer;
begin
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    for i := 0 to 9 do begin
      with Series[0].DataPoints.Add do begin
        PointIndex := i;
        AreaFormat.ForegroundColor := TXc12IndexColor(Random(High(Xc12IndexColorPalette)));
      end;
    end;
  end;
end;

procedure TfrmMain.Button21Click(Sender: TObject);
var
  i: integer;
begin
  with XLS.BIFF[0].AddChart do begin
    Col1 := 5;
    Col2 := 11;
    for i := 0 to 9 do begin
      with Labels.Add(cltDataPoint) do begin
        DataPointIndex := i;
        Text := ShortMonthNames[i + 1];
      end;
    end;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  dlgSave.FileName := edFilename.Text;
  if dlgSave.Execute then
    edFilename.Text := dlgSave.FileName;
end;

procedure TfrmMain.Button4Click(Sender: TObject);
begin
  XLS.Filename := edFilename.Text;
  XLS.Write;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: integer;
begin
  XLS.Version := xvExcel97;

  cbLineMarkers.ItemIndex := 1;
  FFontA := TFont.Create;
  FFontB := TFont.Create;
  Randomize;
  PageControl1.ActivePage := TabSheet1;
  FGradientColor1 := xcWhite;
  FGradientColor2 := xcGray50;
  shpColor1.Brush.Color := Xc12IndexColorPalette[Integer(FGradientColor1)];
  shpColor2.Brush.Color := Xc12IndexColorPalette[Integer(FGradientColor2)];
  cbGradientStyle.ItemIndex := 0;
  for i := 0 to 9 do begin
    XLS[0].AsFloat[0,i] := Random(100);
    XLS[0].AsFloat[1,i] := Random(100);
    XLS[0].AsFloat[2,i] := Random(100);
    XLS[0].AsFloat[3,i] := Random(100);
    XLS[0].AsFloat[4,i] := Random(100);
  end;
end;

end.
