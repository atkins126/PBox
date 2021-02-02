unit FrmSelPages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmSelectPages = class(TForm)
    rbAll: TRadioButton;
    rbSelect: TRadioButton;
    udFrom: TUpDown;
    edFrom: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edTo: TEdit;
    udTo: TUpDown;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    function Execute(var APageFrom,APageTo: integer): boolean;
  end;

implementation

{$R *.dfm}

{ TfrmSelectPages }

function TfrmSelectPages.Execute(var APageFrom, APageTo: integer): boolean;
begin
  if (APageFrom >= 0) and (APageTo >= 0) and (APageTo < 1000000) then begin
    udFrom.Position := APageFrom;
    udTo.Position := APageTo;
  end;

  ShowModal;

  Result := ModalResult = mrOk;

  if Result and rbSelect.Checked then begin
    APageFrom := udFrom.Position;
    APageTo := udTo.Position;
  end;
end;

end.
