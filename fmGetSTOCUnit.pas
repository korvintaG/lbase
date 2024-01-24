unit fmGetSTOCUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls,
  Vcl.Mask, DBLookupEh, aliasform, extend_data;

type
  TfmGetSTOC = class(TForm)
    lbSource: TLabel;
    lbStoc: TLabel;
    lbPageFrom: TLabel;
    dblSource: TDBLookupComboboxEh;
    btSave: TButton;
    dblStoc: TDBLookupComboboxEh;
    dbnPageFrom: TDBNumberEditEh;
    fdqSource: TFDQuery;
    fdqSourceid: TFDAutoIncField;
    fdqSourcename: TWideMemoField;
    fdqSourcenotes: TWideMemoField;
    fdqSourcefullname: TWideMemoField;
    fdqSourcesource_type_id: TIntegerField;
    fdqSourcedate_time_create: TDateTimeField;
    fdqSourcenote_show_mode: TIntegerField;
    dsSource: TDataSource;
    dsSTOC_Tmp: TDataSource;
    fdqSTOC_Tmp: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideMemoField1: TWideMemoField;
    fdqSTOC_Tmporder_: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure dblSourceChange(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    source_id,stoc_id:longint;
    is_mine:integer; // =0,1,-1
    { Public declarations }
    constructor CreateWithData(source_id_,stoc_id_:longint;AOwner: TComponent;is_mine_:integer);
  end;

var
  fmGetSTOC: TfmGetSTOC;

implementation

{$R *.dfm}

uses dmDataUnit, extend_dialog, lcb_unit;

procedure TfmGetSTOC.btSaveClick(Sender: TObject);
begin
  if null2int(dblSource.KeyValue)<=0 then begin
    msgerror('Обязательно нужно означить хотя бы источник/проект!');
    modalresult:=mrNone
  end;

  stoc_id:=null2int(dblStoc.KeyValue);
end;

constructor TfmGetSTOC.CreateWithData(source_id_,stoc_id_:longint;AOwner: TComponent;is_mine_:integer);
begin
  source_id:=source_id_;
  STOC_id:=STOC_id_;
  is_mine:=is_mine_;
  inherited CreateWithAlias(AOwner,'fmGetSTOC');

end;


procedure TfmGetSTOC.dblSourceChange(Sender: TObject);
begin
  Source_id:=null2int(dblSource.KeyValue);
  if Source_id>0 then begin
    dm.recreate_source_stoc(Source_id, fdqSTOC_tmp);

  end;

end;

procedure TfmGetSTOC.FormCreate(Sender: TObject);
var
  where_sql:string;
begin
  case is_mine of
  0,1: where_sql:=' where is_mine='+inttostr(is_mine)+' ';
  else
    where_sql:='  ';
  end;

  fdqSource.SQL.Text:=format(fdqSource.SQL.Text,[where_sql]);
  lcb.log(fdqSource.SQL.Text);
  fdqSource.open;
  if source_id>0 then begin
    fdqsource.Locate('id',source_id,[]);
    dblSourceChange(sender);
    if stoc_id>0 then
      fdqSTOC_Tmp.Locate('id',stoc_id,[]);
  end;
  lbPageFrom.Visible:=is_mine<>1;
  dbnPageFrom.Visible:=is_mine<>1;

end;

end.
