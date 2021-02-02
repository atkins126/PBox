unit FrmPrntPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XLSBook2, XBookPrint2;

type
  TfrmPrintPreview = class(TForm)
    XPP: TXLSBookPrintPreview;
    Panel1: TPanel;
    btnClose: TButton;
    btnPrint: TButton;
    lblPages: TLabel;
    btnPrevPage: TButton;
    lblPage: TLabel;
    btnNextPage: TButton;
    procedure btnPrevPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Execute(AXSS: TXLSSpreadSheet);
  end;

implementation

{$R *.dfm}

{ TfrmPrintPreview }

procedure TfrmPrintPreview.Execute(AXSS: TXLSSpreadSheet);
begin
  XPP.XSS := AXSS;

  XPP.Execute;

  lblPages.Caption := 'Pages: ' + IntToStr(XPP.PageCount);

  ShowModal;
end;

procedure TfrmPrintPreview.btnPrevPageClick(Sender: TObject);
begin
  if XPP.CurrPage > 0 then
    XPP.CurrPage := XPP.CurrPage - 1;
  lblPage.Caption := IntToStr(XPP.CurrPage + 1);
end;

procedure TfrmPrintPreview.btnNextPageClick(Sender: TObject);
begin
  if XPP.CurrPage < (XPP.PageCount - 1) then
    XPP.CurrPage := XPP.CurrPage + 1;
  lblPage.Caption := IntToStr(XPP.CurrPage + 1);
end;

end.
