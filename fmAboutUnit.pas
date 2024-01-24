unit fmAboutUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TfmAbout = class(TForm)
    Image1: TImage;
    lbTop: TLabel;
    lbCoo: TLabel;
    lbMain: TLabel;
    lbWebLabel: TLabel;
    lburl: TLabel;
    edVersion: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure lburlClick(Sender: TObject);
    procedure lburlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lburlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

{$R *.dfm}

uses shellapi;

procedure TfmAbout.lburlClick(Sender: TObject);
begin
    ShellExecute(GetDesktopWindow(), 'open', PChar(lburl.Caption), nil, nil, SW_SHOW);

end;

procedure TfmAbout.lburlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    lburl.Font.Color := clRed;
  inherited

end;

procedure TfmAbout.lburlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    lburl.Font.Color := clPurple;
  inherited

end;

end.
