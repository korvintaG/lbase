unit fmNoteStatUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, display_service, aliasform;

type
  TfmNoteStat = class(TForm)
    DBGridEh1: TDBGridEh;
    fdqStatNote: TFDQuery;
    fdqStatNotedate_: TWideStringField;
    fdqStatNotenn: TLargeintField;
    dsStatNote: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNoteStat: TfmNoteStat;

implementation

{$R *.dfm}

procedure TfmNoteStat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  fmNoteStat:=nil

end;

procedure TfmNoteStat.FormCreate(Sender: TObject);
begin
  fdqStatNote.Open();

end;

end.
