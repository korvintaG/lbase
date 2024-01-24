unit fmNoteSourceUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls,
  extend_data,
  Vcl.Mask, DBLookupEh, display_service, aliasform;

type
  TfmNoteSource = class(TForm)
    lbSource: TLabel;
    lbStoc: TLabel;
    lbPageFrom: TLabel;
    dblSource: TDBLookupComboboxEh;
    btSave: TButton;
    dblStoc: TDBLookupComboboxEh;
    dbnPageFrom: TDBNumberEditEh;
    fdqNoteSource: TFDQuery;
    fdqNoteSourceid: TFDAutoIncField;
    fdqNoteSourcenote_id: TIntegerField;
    fdqNoteSourcesource_id: TIntegerField;
    fdqNoteSourcestoc_id: TIntegerField;
    fdqNoteSourcePage_from: TFloatField;
    fdqNoteSourcePage_to: TFloatField;
    fdqNoteSourceorder_: TIntegerField;
    dsNoteSource: TDataSource;
    fdqSource: TFDQuery;
    fdqSourceid: TFDAutoIncField;
    fdqSourcename: TWideMemoField;
    fdqSourcenotes: TWideMemoField;
    fdqSourceauthors: TWideMemoField;
    fdqSourcefullname: TWideMemoField;
    fdqSourcesource_type_id: TIntegerField;
    fdqSourcedate_time_create: TDateTimeField;
    fdqSourcethemes: TWideMemoField;
    fdqSourcenote_show_mode: TIntegerField;
    dsSource: TDataSource;
    dsSTOC_Tmp: TDataSource;
    fdqSTOC_Tmp: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideMemoField1: TWideMemoField;
    fdqSTOC_Tmporder_: TIntegerField;
    procedure dblSourceChange(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }
    set_focus_pnum:boolean;
  public
    { Public declarations }
    source_id:longint;
    DBMode:TDBMode;
    constructor CreateWithData(id_,note_id_,Source_id_, stoc_id_:longint; DBMode_:TDBMode;AOwner: TComponent);
  end;

var
  fmNoteSource: TfmNoteSource;

implementation

{$R *.dfm}

uses dmDataUnit;




procedure TfmNoteSource.btSaveClick(Sender: TObject);
begin
  fdqNoteSource.Post;
  if dbmode=dbinsert then
    dm.sqlc.ExecSQL('update note_source set order_=id where id=:II',[dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()')]);
  close

end;

constructor TfmNoteSource.CreateWithData(id_,note_id_,Source_id_, stoc_id_:longint; DBMode_:TDBMode;AOwner: TComponent);
begin
  set_focus_pnum:=false;
  CreateWithAlias(AOwner,'fmNoteSource');
  fdqSource.Open();
  Source_id:=Source_id_;
  DBMode:=DBMode_;
  if dbmode=dbinsert then begin
    //if (source_id<=0) and (null2int(.dblSource.KeyValue)>0) then source_id:=fmmain.dblSource.KeyValue;
    fdqNoteSource.Params.ParamValues['INS']:=1;
    fdqNoteSource.Params.ParamValues['IID']:=0;
    fdqNoteSource.open;
    fdqNoteSource.insert;
    fdqNoteSource['source_id']:=source_id;
    fdqNoteSource['stoc_id']:=stoc_id_;
    fdqNoteSource['note_id']:=note_id_;
  end
  else begin
    //fmnoteedit.fdqNotesource.Edit;
    fdqNoteSource.Params.ParamValues['INS']:=0;
    fdqNoteSource.Params.ParamValues['IID']:=id_;
    fdqNoteSource.open;
    set_focus_pnum:=true;
  end;

  if Source_id>0 then begin
    //dblsource.KeyValue:=source_id;
    dm.recreate_source_stoc(Source_id, fdqStoc_tmp);

  end;
end;

procedure TfmNoteSource.dblSourceChange(Sender: TObject);
begin
  Source_id:=null2int(dblSource.KeyValue);
  if Source_id>0 then begin
    //dblsource.KeyValue:=source_id;
    dm.recreate_source_stoc(Source_id, fdqSTOC_tmp);

  end;

end;

end.
