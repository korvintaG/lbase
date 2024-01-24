unit fmNoteTypeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.Mask, DBLookupEh, display_service, aliasform;

type
  TfmNoteType = class(TForm)
    gbAddExists: TGroupBox;
    lbChoose: TLabel;
    dblStrucItem: TDBLookupComboboxEh;
    btAddStrucItem: TButton;
    gbAddNew: TGroupBox;
    lbAddNew: TLabel;
    dbeNewStrucItem: TDBEditEh;
    btAddNewStrucItem: TButton;
    fdqNoteTypeToAdd: TFDQuery;
    fdqNoteTypeToAddid: TFDAutoIncField;
    fdqNoteTypeToAddname: TWideMemoField;
    dsNoteTypeToAdd: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAddStrucItemClick(Sender: TObject);
    procedure btAddNewStrucItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    note_id:longint;
    dsNoteType:TDataSet;
    dbgrideh:tDbGridEh;
    constructor CreateData(note_id_:longint;dsNoteType_:TDataSet; dbgrideh_:tDbGridEh;
                 AOwner: TComponent);
    function AddStrucItem(siid_:longint):boolean;
  end;

var
  fmNoteType: TfmNoteType;

implementation

{$R *.dfm}

uses dmDataUnit, extend_dialog, extend_data;

procedure TfmNoteType.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmNoteType:=nil
end;

procedure TfmNoteType.btAddNewStrucItemClick(Sender: TObject);
var
  oldds_:TDataSource;
  siid_:longint;
begin
  if (null2str(dbeNewStrucItem.Text)<>'') and (null2str(dbeNewStrucItem.Text)<>' ') then begin
    if dm.sqlc.execsqlscalar('select count(*) from structure_item where name=:NN',[dbeNewStrucItem.Text])=1 then begin
      if not AddStrucItem(dm.sqlc.execsqlscalar('select id from structure_item where name=:NN',[dbeNewStrucItem.Text])) then
        exit
    end
    else begin
      dm.sqlc.ExecSQL('insert into structure_item (name) values(:NN)',[dbeNewStrucItem.Text]);
      if not AddStrucItem(dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()')) then
        exit;
    end;
    close;
  end;

end;

procedure TfmNoteType.btAddStrucItemClick(Sender: TObject);
begin
  if null2int(dblStrucItem.KeyValue)>0 then
    if AddStrucItem(dblStrucItem.KeyValue) then
      close

end;

constructor TfmNoteType.CreateData(note_id_:longint;dsNoteType_:TDataSet;dbgrideh_:tDbGridEh;AOwner: TComponent);
begin
  createWithAlias(AOwner,'fmNoteType');
  note_id:=note_id_;
  dsNoteType:=dsNotetype_;
  dbgrideh:=dbgrideh_;
  fdqNoteTypeToAdd.Params.ParamValues['NID']:=note_id;
  fdqNoteTypeToAdd.open
end;

function TfmNotetype.AddStrucItem(siid_:longint):boolean;
var
  oldds_:TDataSource;
  cnt_:integer;
begin
    cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from note_Structure_item where note_id='+inttostr(note_id)+' and Structure_Item_id='+inttostr(siid_));
    if cnt_<>0 then begin
      msgerror('Нельзя добавить уже добавленный элемент структуры!');
      Result:=false;
    end
    else begin
      dm.sqlc.ExecSQL('insert into note_Structure_item (note_id, structure_item_id) values(:NNN,:SI)',[note_id,siid_]);
      if dbgrideh<>nil  then begin
        dbgrideh.DataSource.DataSet.Refresh;
      end;

      Result:=true;
    end;
end;



end.
