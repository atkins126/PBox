unit FormTextBox;

interface

uses
  Winapi.Windows, Winapi.Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, XLSUtils5, Vcl.StdCtrls;

type
  TfrmTextBox = class(TForm)
    memText: TMemo;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    function Execute(var AText: AxUCString): boolean;
  end;

implementation

{$R *.dfm}

{ TfrmTextBox }

function TfrmTextBox.Execute(var AText: AxUCString): boolean;
begin
  memText.Lines.Text := AText;

  ShowModal;

  Result := ModalResult = mrOk;

  if Result then
    AText := memText.Lines.Text;
end;

end.
