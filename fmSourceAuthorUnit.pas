unit fmSourceAuthorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.Mask, DBLookupEh, display_service, aliasform;

type
  TfmSourceAuthor = class(TForm)
    gbExistingAuthor: TGroupBox;
    lbExistingAuthor: TLabel;
    dblAuthor: TDBLookupComboboxEh;
    btAddAuthor: TButton;
    gbNewAuthor: TGroupBox;
    lbNewAuthor: TLabel;
    dbeNewAuthor: TDBEditEh;
    btAddNewAuthor: TButton;
    fdqAuthorToAdd: TFDQuery;
    fdqAuthorToAddid: TFDAutoIncField;
    fdqAuthorToAddname: TWideMemoField;
    fdqAuthorToAddnotes: TWideMemoField;
    dsAuthorToAdd: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAddAuthorClick(Sender: TObject);
    procedure btAddNewAuthorClick(Sender: TObject);
  private
    { Private declarations }
    source_id:longint;
    dbgrideh:tDbGridEh;
  public
    { Public declarations }
    constructor CreateData(source_id_:longint;dbgrideh_:tDbGridEh;
                 AOwner: TComponent);
    function AddAuthor(aid_:longint):boolean;
  end;

var
  fmSourceAuthor: TfmSourceAuthor;

implementation

{$R *.dfm}

uses
  extend_dialog, extend_data,
  dmdataunit;

procedure TfmSourceAuthor.btAddAuthorClick(Sender: TObject);
begin
  if AddAuthor(dblAuthor.KeyValue) then
    close

end;

procedure TfmSourceAuthor.btAddNewAuthorClick(Sender: TObject);
var
  oldds_:TDataSource;
  aid_:longint;
  cnt_:integer;
begin
  if null2str(dbeNewAuthor.Text)='' then begin
    msgerror('Поле [Автор] не может быть пустым!');
    exit
  end;
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from author where ru_lower(name)=ru_lower(:NN)',[dbeNewAuthor.Text]);
  if cnt_=1 then begin
    if not AddAuthor(dm.sqlc.ExecSQLScalar('select id from author where ru_lower(name)=ru_lower(:NN)',[dbeNewAuthor.Text])) then
      exit
  end
  else begin
    dm.sqlc.ExecSQL('insert into author (name, date_time_create) values(:NN,:DD)',[dbeNewAuthor.Text,Now]);
    aid_:=dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
    if not AddAuthor(aid_) then
      exit;
  end;

  close;

end;

constructor TfmSourceAuthor.CreateData(source_id_:longint;dbgrideh_:tDbGridEh;
                 AOwner: TComponent);
begin
  createWithAlias(AOwner,'fmSourceAuthor');
  source_id:=source_id_;
  dbgrideh:=dbgrideh_;
  fdqAuthorToAdd.Params.ParamValues['SID']:=source_id;
  fdqAuthorToAdd.open
end;


procedure TfmSourceAuthor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  fmSourceAuthor:=nil;

end;

function TfmSourceAuthor.AddAuthor(aid_:longint):boolean;
var
  oldds_:TDataSource;
  cnt_:integer;
begin
    cnt_:=DM.sqlc.ExecSQLScalar('select count(*) from source_author where source_id='+inttostr(source_id)+' and author_id='+inttostr(aid_));
    if cnt_<>0 then begin
      msgerror('Нельзя добавить уже существущего автора!');
      Result:=false;
    end
    else begin
      dm.sqlc.ExecSQL('insert into source_author(source_id, author_id) values (:SID,:AID)',[source_id,aid_]);
      if dbgrideh<>nil  then begin
        dbgrideh.DataSource.DataSet.Refresh;
      end;
      Result:=true;
    end;

end;


end.
