unit fmKeywordStatUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, display_service, aliasform;

type
  TfmKeywordStat = class(TForm)
    DBGridEh1: TDBGridEh;
    fdqStatKW: TFDQuery;
    fdqStatKWdate_: TWideStringField;
    fdqStatKWnn: TLargeintField;
    dsStatKW: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKeywordStat: TfmKeywordStat;

implementation

{$R *.dfm}

procedure TfmKeywordStat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  fmKeywordStat:=nil

end;

procedure TfmKeywordStat.FormCreate(Sender: TObject);
begin
  fdqStatKW.Open();

end;

end.
