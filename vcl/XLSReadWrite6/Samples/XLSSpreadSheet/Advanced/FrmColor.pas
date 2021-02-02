unit FrmColor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExcelColorPicker, StdCtrls,
  Xc12Utils5;

type
  TfrmSelectColor = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ecpTheme: TExcelColorPicker;
    ecpStandard: TExcelColorPicker;
    Label1: TLabel;
    Label2: TLabel;
  private
    function GetColor: TXc12Color;
    { Private declarations }
  public
    function Execute: boolean;

    property Color: TXc12Color read GetColor;
  end;

implementation

{$R *.dfm}

{ TfrmSelectColor }

function TfrmSelectColor.Execute: boolean;
begin
  ShowModal;

  Result := ModalResult = mrOk;
end;

function TfrmSelectColor.GetColor: TXc12Color;
begin
  Result := ecpTheme.ExcelColor;
end;

end.
