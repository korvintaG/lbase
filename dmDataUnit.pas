unit dmDataUnit;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Phys.SQLiteWrapper, FireDAC.Phys.SQLite, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

const
  source_proj:array[0..1] of string=('source','project');

type
  TDM = class(TDataModule)
    sqlc: TFDConnection;
    sqlcshare: TFDConnection;
    procedure ge(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ru_lower(AFunc: TSQLiteFunctionInstance;
        AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure keyword_use_count(AFunc: TSQLiteFunctionInstance;
        AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure source_fullname_by_id(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure kw_mark_status(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure interest_mark_status(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure note_source_type(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure get_telegram_file(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure class_id_sort_val(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure stoc_fullname(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure keyword_classname(AFunc: TSQLiteFunctionInstance;
      AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
    procedure source_stack_add_level(src_id_:longint;stoc_id_:integer);
    procedure source_classification_add_level(is_mine_:longint;sc_id_:integer);

    // блок фильтров
    procedure fill_interest_keyword_expand;
    procedure kw_add_all_sublevel(kw_id_:longint);
    procedure kw_del_all_sublevel(kw_id_:longint);
    procedure interest_add_all_sublevel(i_id_:longint);

    procedure add_filter_keyword(f_id_,kw_id_:longint;use_type_:integer);
    procedure add_filter_interest(f_id_,i_id_:longint;use_type_:integer);
    procedure add_filter_author (f_id_:longint;use_type_:integer);
    procedure add_filter_source (f_id_:longint;use_type_:integer);
    procedure add_filter_project(f_id_:longint;use_type_:integer);

  public
    WC1 : TFDPhysSQLiteDriverLink;
    sql_func_ru_lower: TFDSQLiteFunction;
    sql_func_keyword_use_count: TFDSQLiteFunction;
    sql_func_source_fullname_by_id: TFDSQLiteFunction;
    sql_func_note_source_type: TFDSQLiteFunction;
    sql_func_kw_mark_status: TFDSQLiteFunction;
    sql_func_interest_mark_status: TFDSQLiteFunction;
    sql_func_get_telegram_file: TFDSQLiteFunction;
    sql_func_stoc_fullname: TFDSQLiteFunction;
    sql_func_keyword_classname: TFDSQLiteFunction;
    sql_func_class_id_sort_val: TFDSQLiteFunction;
    procedure CreateFunc;
    function get_source_fullname_by_id(id_:longint;show_is_mine_:integer):string;
    function get_root_toc(rid_:integer):string;
    function get_name_toc(class_id_:longint):string;
    function get_ds_id_next(ds_:TDataSet):longint;


    function Get_Ini_Int_Par(par_name_:string;def_value_:int64=0; hours_fresh_:integer=0):int64;
    procedure Set_Ini_Int_Par(par_name_:string;value_:int64);
    function Get_Ini_Str_Par(par_name_:string;def_value_:string=''; hours_fresh_:integer=0):string;
    procedure Set_Ini_Str_Par(par_name_:string;value_:string);
    procedure add_new_kw_name(name_:string;class_kw_id_:longint; var kw_id, kw_name_id:longint);
    function get_kw_by_kwn(kwn_id_:longint):longint;
    // взять основной kw_name_id по kw_id
    function get_main_kw_name_id(kw_id_:longint):longint;
    function get_source_full_root(class_id_:longint):string;
    function get_kw_full_root(class_id_:longint):string;
    function get_interest_full_root(class_id_:longint):string;

    function calc_keyword_in_sublevel(kw_class_id_:longint;type_:integer=0):integer; //Type_=0 - все, =1 - только ключевые слова, =3 - только папки
    procedure recreate_source_stoc(src_id_:longint;tmp_data_set:TDataSet);
    procedure recreate_source_classification(is_mine_:integer);
    function get_source_class_full(class_id_:longint):string;
    function check_url(url_:string; excl_source_id_:longint=0;excl_note_id_:longint=0):boolean;

    function get_source_authors(source_id_:longint; delimiter_:string=', '):string;
    function get_source_type(source_id_:longint):string;
    function get_source_keywords(source_id_:longint):string;
    function get_work_status(status_:integer):string;

    procedure FillDirInfo(tc_:TStrings; class_id_:longint; is_mine:integer);

    function calc_src_class_subdirs(sid_:longint):integer;
    function calc_src_class_subsource(class_id_:longint):integer;
    function calc_stoc_subdirs(sid_:longint):integer;
    procedure get_def_source_stoc(var source_id_, stoc_id_:longint);

    procedure Up1Level(id_:longint; table_name_, parent_col_name_:string; parent_id_:longint;
                           condition_field_name_:string='';condition_field_value_:longint=0;id_field_name_:string='id');
    procedure Down1Level(id_:longint; table_name_, parent_col_name_:string; parent_id_:longint;
                           condition_field_name_:string='';condition_field_value_:longint=0;id_field_name_:string='id');

    procedure struct_add_new_fields;
    procedure add_new_ddl_object;
    procedure RefillKWNExpanded;

    procedure recalc_keyword(kw_id_:longint); // пересчет ключевого слова (name_main, name_w_synonym)

    procedure recalc_class_name(from_kw_id_:longint); // в рекурсии считает названия классификаторного префикса/суффикса

    function get_max_stoc_order(sid_,stid_:longint):longint; // возвращает максимальное значение п/п для оглавления источника

    function keyword_delete(id_:longint):boolean; // удаление ключевого слова с проверками

    function to_filter:boolean;

    procedure add_new_service_rows;



 end;

var
  DM: TDM;
  is_recreate_source_stoc:boolean;
  is_recreate_source_classification:boolean;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  extend_data, extend_dialog, LCB_unit, fmSourceEditUnit, System.JSON, extend_diskutil;


procedure TDM.ge(Sender: TObject);
begin
  CreateFunc
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  sql_func_ru_lower.Free;
  sql_func_keyword_use_count.Free;
  sql_func_keyword_classname.Free;
  sql_func_source_fullname_by_id.Free;
  sql_func_kw_mark_status.Free;
  sql_func_interest_mark_status.Free;

  sql_func_note_source_type.Free;;
  sql_func_get_telegram_file.Free;
  sql_func_stoc_fullname.Free;
  sql_func_class_id_sort_val.Free;
end;

procedure TDM.ru_lower(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsString := AInputs[0].AsString.ToLower;
end;

procedure TDM.keyword_use_count(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  {AOutput.AsInteger := dm.sqlc.ExecSQLScalar('select count(*) from note_keyword where keyword_id=:KID',[AInputs[0].AsInteger])+
                       dm.sqlc.ExecSQLScalar('select count(*) from source_keyword where keyword_id=:KID',[AInputs[0].AsInteger])+
                       dm.sqlc.ExecSQLScalar('select count(*) from stoc_keyword where keyword_id=:KID',[AInputs[0].AsInteger])+
                       dm.sqlc.ExecSQLScalar('select count(*) from task_keyword where keyword_id=:KID',[AInputs[0].AsInteger]);}
  AOutput.AsInteger := dm.sqlc.ExecSQLScalar('select (select count(*) from note_keyword where keyword_id=:K1) + (select count(*) from source_keyword where keyword_id=:K2) + (select count(*) from stoc_keyword where keyword_id=:K3) + (select count(*) from task_keyword where keyword_id=:K4)',
                       [AInputs[0].AsInteger,AInputs[0].AsInteger,AInputs[0].AsInteger,AInputs[0].AsInteger]);
end;


procedure TDM.CreateFunc;
begin
  WC1 := TFDPhysSQLiteDriverLink.Create(nil);

  sql_func_ru_lower := TFDSQLiteFunction.Create(nil);
  sql_func_ru_lower.DriverLink := WC1;
  sql_func_ru_lower.FunctionName := 'ru_lower';
  sql_func_ru_lower.ArgumentsCount := 1;
  sql_func_ru_lower.OnCalculate := ru_lower;
  sql_func_ru_lower.Active := True;

  sql_func_keyword_use_count := TFDSQLiteFunction.Create(nil);
  sql_func_keyword_use_count.DriverLink := WC1;
  sql_func_keyword_use_count.FunctionName := 'keyword_use_count';
  sql_func_keyword_use_count.ArgumentsCount := 1;
  sql_func_keyword_use_count.OnCalculate := keyword_use_count;
  sql_func_keyword_use_count.Active := True;

  sql_func_source_fullname_by_id := TFDSQLiteFunction.Create(nil);
  sql_func_source_fullname_by_id.DriverLink := WC1;
  sql_func_source_fullname_by_id.FunctionName := 'source_fullname_by_id';
  sql_func_source_fullname_by_id.ArgumentsCount := 2;
  sql_func_source_fullname_by_id.OnCalculate := source_fullname_by_id;
  sql_func_source_fullname_by_id.Active := True;

  sql_func_kw_mark_status := TFDSQLiteFunction.Create(nil);
  sql_func_kw_mark_status.DriverLink := WC1;
  sql_func_kw_mark_status.FunctionName := 'kw_mark_status';
  sql_func_kw_mark_status.ArgumentsCount := 2;
  sql_func_kw_mark_status.OnCalculate := kw_mark_status;
  sql_func_kw_mark_status.Active := True;

  sql_func_interest_mark_status := TFDSQLiteFunction.Create(nil);
  sql_func_interest_mark_status.DriverLink := WC1;
  sql_func_interest_mark_status.FunctionName := 'interest_mark_status';
  sql_func_interest_mark_status.ArgumentsCount := 2;
  sql_func_interest_mark_status.OnCalculate := interest_mark_status;
  sql_func_interest_mark_status.Active := True;


  sql_func_note_source_type := TFDSQLiteFunction.Create(nil);
  sql_func_note_source_type.DriverLink := WC1;
  sql_func_note_source_type.FunctionName := 'note_source_type';
  sql_func_note_source_type.ArgumentsCount := 1;
  sql_func_note_source_type.OnCalculate := note_source_type;
  sql_func_note_source_type.Active := True;


  sql_func_get_telegram_file := TFDSQLiteFunction.Create(nil);
  sql_func_get_telegram_file.DriverLink := WC1;
  sql_func_get_telegram_file.FunctionName := 'get_telegram_file';
  sql_func_get_telegram_file.ArgumentsCount := 1;
  sql_func_get_telegram_file.OnCalculate := get_telegram_file;
  sql_func_get_telegram_file.Active := True;


  sql_func_class_id_sort_val := TFDSQLiteFunction.Create(nil);
  sql_func_class_id_sort_val.DriverLink := WC1;
  sql_func_class_id_sort_val.FunctionName := 'class_id_sort_val';
  sql_func_class_id_sort_val.ArgumentsCount := 1;
  sql_func_class_id_sort_val.OnCalculate := class_id_sort_val;
  sql_func_class_id_sort_val.Active := True;


  sql_func_stoc_fullname := TFDSQLiteFunction.Create(nil);
  sql_func_stoc_fullname.DriverLink := WC1;
  sql_func_stoc_fullname.FunctionName := 'stoc_fullname';
  sql_func_stoc_fullname.ArgumentsCount := 1;
  sql_func_stoc_fullname.OnCalculate := stoc_fullname;
  sql_func_stoc_fullname.Active := True;

  sql_func_keyword_classname := TFDSQLiteFunction.Create(nil);
  sql_func_keyword_classname.DriverLink := WC1;
  sql_func_keyword_classname.FunctionName := 'keyword_classname';
  sql_func_keyword_classname.ArgumentsCount := 2;
  sql_func_keyword_classname.OnCalculate := keyword_classname;
  sql_func_keyword_classname.Active := True;


end;


function TDM.get_source_fullname_by_id(id_:longint;show_is_mine_:integer):string;
var
  str_,aut_,name_:string;
  is_mine_:integer;
  fdq:TFdquery;
begin
  // id, name, is_mine
  fdq:=tFdquery.Create(nil);
  fdq.Connection:=dm.sqlc;
  fdq.SQL.Text:='select is_mine, name from source where id='+inttostr(id_);
  fdq.Open();
  if fdq.RecordCount=0 then
    result:=''
  else begin
    if fdq['is_mine']=1  then begin
      if (show_is_mine_=1) then
        Result := fdq['name']+' - [Мой проект]'
      else
        Result := fdq['name']
    end
    else begin
      name_:=fdq['name'];
      fdq.Close;
      fdq.SQL.Text:='SELECT GROUP_CONCAT(a.name) as gaa FROM source_author sa, author a WHERE source_id='+inttostr(id_)+' and author_id=a.id';
      fdq.Open();
      if (fdq.RecordCount=0) or (null2str(fdq['gaa'])='') then
        Result := name_
      else
        Result := name_+' - ['+null2str(fdq['gaa'])+']';
    end;
  end;
  fdq.Close;
  fdq.Free;
end;


procedure TDM.source_fullname_by_id(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
var
  str_,aut_,name_:string;
  is_mine_:integer;
begin
  // id
  AOutput.AsString := get_source_fullname_by_id(AInputs[0].AsInteger,AInputs[1].AsInteger)
end;

procedure TDM.note_source_type(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
var
  fdq:TFdquery;
  is_mine_:integer;
begin
  fdq:=TFdquery.Create(nil);
  fdq.Connection:=dm.sqlc;
  fdq.SQL.Text:='select s.is_mine, source_type_id from note_source ns, source s where ns.source_id=s.id and note_id='+inttostr(AInputs[0].AsInteger);
  fdq.Open();
  if fdq.RecordCount=0 then // пусто
    AOutput.AsInteger:=0
  else begin
    if fdq.RecordCount=1 then begin // один источник или проект
      if fdq['is_mine']=1 then
        AOutput.AsInteger:=1000
      else
        AOutput.AsInteger:=fdq['source_type_id'];
    end
    else begin // 2 и более
        AOutput.AsInteger:=100000
    end;
  end;
  fdq.Close;
  fdq.Free;
end;



procedure TDM.get_telegram_file(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
var
  fname:string;
  fsize:integer;
  fs:Tfilestream;
  BinaryData: TBytes;

begin
  // id
  fname:=DM.Get_Ini_Str_Par('FileStoreDir')+'\TelegramFile\'+inttostr(AInputs[0].AsInteger);
  if fileexists (fname) then begin
    fsize:=BFileSize(fname);
    // Определяем размер бинарных данных
    fs:=Tfilestream.Create(fname ,fmShareDenyWrite);
    SetLength(BinaryData, fs.Size);

    fs.ReadBuffer(BinaryData[0], fs.Size);
    AOutput.SetData(BinaryData,fs.Size, etBlob);
    fs.free;
    //AsString := get_source_fullname_by_id(AInputs[0].AsInteger,AInputs[1].AsInteger)
  end
end;


procedure TDM.stoc_fullname(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  AOutput.AsString := get_root_toc(AInputs[0].AsInteger);
end;


function TDM.get_root_toc(rid_:integer):string;
var
  id_:integer;
  name_:string;
  fdq:TFdquery;
begin
  if rid_<=0 then
    Result:=''
  else begin
    fdq:=TFdquery.Create(nil);
    fdq.Connection:=sqlc;
    fdq.SQL.Text:='select * from source_toc where id='+int2str(rid_);
    fdq.Open();
    id_:=null2int(fdq['stoc_id']);
    name_:=fdq['name'];
    fdq.Close;
    if id_<=0 then
      Result:=name_
    else begin
      Result:=get_root_toc(id_)+'\'+name_
    end;
  end;
end;


function TDM.Get_Ini_Int_Par(par_name_:string;def_value_:int64=0; hours_fresh_:integer=0):int64;
var
  cnt_:integer;
  res_:integer;
begin
  if hours_fresh_>0 then begin
    dm.sqlc.ExecSQL('delete from parameter where name=:PN and date_time_update is null',[par_name_]);
    dm.sqlc.ExecSQL('delete from parameter where name=:PN and (strftime(''%s'',''now'',''localtime'') - strftime(''%s'',date_time_update,''localtime''))>:HH',[par_name_,hours_fresh_*3600]);
  end;
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from parameter where name=:PN',[par_name_]);
  if cnt_=0 then
    dm.sqlc.ExecSQL('insert into parameter (name,int_value) values(:PN,:DV)',[par_name_,def_value_]);
  res_:=dm.sqlc.ExecSQLScalar('select int_value from parameter where name=:NN',[par_name_]);
  //lcb.Log('Get_Ini_Int_Par '+par_name_+' = '+inttostr(res_));
  Result:=res_;
end;


procedure TDM.Set_Ini_Str_Par(par_name_:string;value_:string);
var
  cnt_:integer;
begin
  //lcbs.Log('Set_Ini_Sr_Par '+par_name_+' = '+value_);
  //if (par_name_='ProjectEdit_class2') and (value_=-3) then
  //  msgerror('ggg');
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from parameter where name=:PN',[par_name_]);
  if cnt_=0 then
    dm.sqlc.ExecSQL('insert into parameter (name,str_value, date_time_update) values(:PN,:DV,:DT)',[par_name_,value_,Now])
  else
    dm.sqlc.ExecSQL('update parameter set str_value=:IV, date_time_update=:DT where name=:PN',[value_,Now,par_name_])
end;

function TDM.Get_Ini_str_Par(par_name_:string;def_value_:string=''; hours_fresh_:integer=0):string;
var
  cnt_:integer;
  res_:string;
begin
  if hours_fresh_>0 then begin
    dm.sqlc.ExecSQL('delete from parameter where name=:PN and date_time_update is null',[par_name_]);
    dm.sqlc.ExecSQL('delete from parameter where name=:PN and (strftime(''%s'',''now'',''localtime'') - strftime(''%s'',date_time_update,''localtime''))>:HH',[par_name_,hours_fresh_*3600]);
  end;
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from parameter where name=:PN',[par_name_]);
  if cnt_=0 then
    dm.sqlc.ExecSQL('insert into parameter (name,str_value) values(:PN,:DV)',[par_name_,def_value_]);
  res_:=dm.sqlc.ExecSQLScalar('select str_value from parameter where name=:NN',[par_name_]);
  //lcb.Log('Get_Ini_Str_Par '+par_name_+' = '+res_);
  Result:=res_;
end;


procedure TDM.Set_Ini_Int_Par(par_name_:string;value_:int64);
var
  cnt_:integer;
begin
  //lcbs.Log('Set_Ini_Int_Par '+par_name_+' = '+inttostr(value_));
  //if (par_name_='ProjectEdit_class2') and (value_=-3) then
  //  msgerror('ggg');
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from parameter where name=:PN',[par_name_]);
  if cnt_=0 then
    dm.sqlc.ExecSQL('insert into parameter (name,int_value, date_time_update) values(:PN,:DV,:DT)',[par_name_,value_,Now])
  else
    dm.sqlc.ExecSQL('update parameter set int_value=:IV, date_time_update=:DT where name=:PN',[value_,Now,par_name_])
end;


procedure TDM.add_new_kw_name(name_:string;class_kw_id_:longint; var kw_id, kw_name_id:longint);
var
  kw_id_,kw_name_id_:longint;
  fdq:TFdquery;
begin
  fdq:=TFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.ResourceOptions.ParamCreate := False;
  fdq.SQL.Text:='select kwn.id name_id, kw.id id from keyword kw, keyword_name kwn where class_keyword_id=:CK and kwn.keyword_id=kw.id and ru_lower(name)=ru_lower(:NM)';
  with fdq.Params.Add do begin
    name:='CK';
    DataType:=ftInteger;
    ParamType:=ptInput;
    Value:=class_kw_id_;
  end;
  with fdq.Params.Add do begin
    name:='NM';
    DataType:=ftString;
    Size:=250;
    ParamType:=ptInput;
    Value:=name_;
  end;
  fdq.Open();
  if fdq.RecordCount>0 then begin // если уже есть такое, то вернули существующее
    kw_id:=fdq['id'];
    kw_name_id:=fdq['name_id'];
    exit;
  end;
  fdq.Close;
  with fdq.Params.Add do begin
    name:='DD';
    DataType:=ftDateTime;
    ParamType:=ptInput;
    Value:=Now;
  end;
  fdq.SQL.Text:='insert into keyword (class_keyword_id,name_main, name_w_synonym,date_time_create, date_time_update, class_name_before, class_name_after) values(:CK,:NM,:NM,:DD,:DD,keyword_classname(:CK,1),keyword_classname(:CK,0) )';
  fdq.Execute();
  kw_id:=sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
  sqlc.ExecSQL('insert into keyword_name (name, keyword_id) values(:NN,:NN1)',
                        [name_,kw_id]);
  kw_name_id:=sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
  fdq.free;

end;


function TDM.get_kw_by_kwn(kwn_id_:longint):longint;
begin
  try
    result:=sqlc.ExecSQLScalar('select keyword_id from keyword_name where id=:KNID',[kwn_id_])
  except
    result:=0;
  end;
end;


procedure TDM.keyword_classname(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
var
  cnt_:integer;
  res_:string;
  function get_class(kid_:integer; way_:integer):string;
  var
    res_:string;
    cnt_:integer;
    ckid_:integer;
  begin
    res_:=null2str(sqlc.ExecSQLScalar('select ifnull(class_keyword_id,0)||''#''||name_main from keyword where id=:KID',[kid_]));
    if res_<>'' then begin
      cnt_:=pos('#',res_);
      ckid_:=str2int(copy(res_,1,cnt_-1));
      res_:=copy(res_,cnt_+1);
      if ckid_=0 then
        result:=res_
      else begin
        if way_=0 then
          result:=res_+' / '+get_class(ckid_,way_)
        else
          result:=get_class(ckid_,way_)+' / '+res_
      end;
    end
    else begin
      result:='';
    end;
  end;

begin
  if null2int(AInputs[0].AsInteger)=0 then begin
    AOutput.AsString:='';
  end
  else begin
        if null2int(AInputs[1].AsInteger)=0 then
          AOutput.AsString := ' / '+get_class(AInputs[0].AsInteger,null2int(AInputs[1].AsInteger))
        else begin
          res_ := get_class(AInputs[0].AsInteger,null2int(AInputs[1].AsInteger));
          if res_<>'' then
             res_:=res_+' / ';
          AOutput.AsString := res_;
        end;
  end;
end;


// взять основной kw_name_id по kw_id
function TDM.get_main_kw_name_id(kw_id_:longint):longint;
var
  mmo_,kwn_id_:longint;
begin
  mmo_:=sqlc.ExecSQLScalar('select min(ifnull(order_,0)) from keyword_name where keyword_id=:KW',[kw_id_]);
  kwn_id_:=sqlc.ExecSQLScalar('select min(id) from keyword_name where keyword_id=:KW and ifnull(order_,0)=:OO',[kw_id_,mmo_]);
  Result:=kwn_id_;
end;


function TDM.get_source_full_root(class_id_:longint):string;
begin
  if null2int(class_id_)=0 then
    result:=''
  else begin
    result:=get_source_full_root(sqlc.ExecSQLScalar('select ifnull(source_classification_id,0) from source_classification where id=:KID',[class_id_]))
      +'\'+sqlc.ExecSQLScalar('select name from source_classification where id=:KID',[class_id_])
  end;
end;


procedure TDm.class_id_sort_val(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
begin
  if AInputs[0].AsInteger<=0 then
    AOutput.AsInteger := AInputs[0].AsInteger
  else
    AOutput.AsInteger := 1
end;


function TDm.get_kw_full_root(class_id_:longint):string;
begin
  if null2int(class_id_)=0 then
    result:=''
  else begin
    result:=get_kw_full_root(sqlc.ExecSQLScalar('select class_keyword_id from keyword where id=:KID',[class_id_]))
      +' / '+sqlc.ExecSQLScalar('select name_main from keyword where id=:KID',[class_id_])
  end;
end;


function TDM.calc_keyword_in_sublevel(kw_class_id_:longint;type_:integer=0):integer; //Type_=0 - все, =1 - только ключевые слова, =3 - только папки
var
  s_:string;
  res_:integer;
  fdq_:TFdquery;
begin
  case type_ of
  0:s_:='';
  1:s_:=' and not exists (select * from keyword where class_keyword_id=k.id) ';
  3:s_:=' and exists (select * from keyword where class_keyword_id=k.id) ';
  end;
  res_:=sqlc.ExecSQLScalar('select count(*) from keyword k where k.class_keyword_id=:KID '+s_,[kw_class_id_]);
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.SQL.Text:='select k.*, (select count(*) from keyword where class_keyword_id=k.id) is_dir from keyword k where k.class_keyword_id='+inttostr(kw_class_id_);
  fdq_.Open();
  while not fdq_.eof do begin
    if fdq_['is_dir']>0 then
      res_:=res_+calc_keyword_in_sublevel(fdq_['id'],type_);
    fdq_.Next;
  end;
  fdq_.Close;
  fdq_.Free;
  Result:=res_;
end;


procedure TDM.recreate_source_stoc(src_id_:longint;tmp_data_set:TDataSet);
var
  tsname_:string;
begin
  if is_recreate_source_stoc then
     exit;
  is_recreate_source_stoc:=true;
  lcb.Log('recreate_source_stoc - begin');
  if tmp_data_set<>nil then
    tmp_data_set.Active:=false;
  sqlc.ExecSQL('delete from tmp_stoc');
  source_stack_add_level(src_id_,0);
  lcb.Log('  before fdqSTOC_Tmp.open');
  if tmp_data_set<>nil then
    tmp_data_set.open;
  lcb.Log('recreate_source_stoc - end');
  is_recreate_source_stoc:=false;
end;


procedure TDM.source_stack_add_level(src_id_:longint;stoc_id_:integer);
var
  fdq:TFdquery;
  tsname_,add_s_:string;
begin
  // ffd
  fdq:=TFdquery.Create(nil);
  fdq.Connection:=sqlc;
  if null2int(stoc_id_)<=0 then
    add_s_:=' and ifnull(stoc_id,0)<=0 '
  else
    add_s_:=' and ifnull(stoc_id,0)='+inttostr(stoc_id_);
  fdq.SQL.Text:='select st.* from source_toc st where source_id='+inttostr(src_id_)+' '+add_s_+' order by order_, id';
  fdq.Open;
  with fdq do
  while eof<>true do
     begin
       tsname_:=FieldByName('name').AsString;
       if null2int(FieldByName('stoc_id').AsInteger)>0 then begin
         tsname_:=get_root_toc(FieldByName('stoc_id').AsInteger)+'\'+tsname_
       end;
       sqlc.ExecSQL('insert into tmp_stoc(id, name) values(:ID,:NAME)',[FieldByName('id').AsInteger,tsname_]);
       source_stack_add_level(src_id_,FieldByName('id').AsInteger);
       Next;
     end;
  fdq.close;
  fdq.free;
end;


procedure TDM.recreate_source_classification(is_mine_:integer);
var
  tsname_:string;
begin
  if is_recreate_source_classification then
     exit;
  is_recreate_source_classification:=true;
  lcb.log('is_recreate_source_classification - begin');
  if is_mine_=0 then begin
    sqlc.ExecSQL('delete from tmp_source_classification');
    sqlc.ExecSQL('insert into tmp_source_classification(id,name) values(:II,:NN)',[0,' ']);
    source_classification_add_level(is_mine_,0);
  end
  else begin
    sqlc.ExecSQL('delete from tmp_project_classification');
    sqlc.ExecSQL('insert into tmp_project_classification(id,name) values(:II,:NN)',[0,' ']);
    source_classification_add_level(is_mine_,0);

  end;
  is_recreate_source_classification:=false;
end;


procedure TDM.source_classification_add_level(is_mine_:longint;sc_id_:integer);
var
  fdq:TFdquery;
  tsname_,add_s_:string;
begin
  // ffd
  fdq:=TFdquery.Create(nil);
  fdq.Connection:=sqlc;
  if null2int(sc_id_)<=0 then
    add_s_:=' and ifnull(source_classification_id,0)<=0 '
  else
    add_s_:=' and ifnull(source_classification_id,0)='+inttostr(sc_id_);
  fdq.SQL.Text:='select st.* from source_classification st where is_mine='+inttostr(is_mine_)+' and source_classification_id='+inttostr(sc_id_)+' '+add_s_+' order by name';
  fdq.Open;
  with fdq do
  while eof<>true do
     begin
       tsname_:=FieldByName('name').AsString;
       //if null2int(FieldByName('source_classification_id').AsInteger)>0 then begin
         tsname_:=get_source_class_full(FieldByName('source_classification_id').AsInteger)+'\'+tsname_;
       //end;
       sqlc.ExecSQL('insert into tmp_'+source_proj[is_mine_]+'_classification(id,name) values(:ID,:NAME)',[FieldByName('id').AsInteger,tsname_]);
       source_classification_add_level(is_mine_,FieldByName('id').AsInteger);
       Next;
     end;
  fdq.close;
  fdq.free;
end;


function TDM.get_source_class_full(class_id_:longint):string;
begin
  if null2int(class_id_)=0 then
    result:=''
  else begin
    result:=get_source_class_full(sqlc.ExecSQLScalar('select ifnull(source_classification_id,0) from source_classification where id=:KID',[class_id_]))
      +'\'+sqlc.ExecSQLScalar('select name from source_classification where id=:KID',[class_id_])
  end;
end;


function TDM.get_name_toc(class_id_:longint):string;
begin
  if null2int(class_id_)=0 then
    result:=''
  else begin
    result:=sqlc.ExecSQLScalar('select name from source_toc where id=:KID',[class_id_])
  end;
end;


function TDM.check_url(url_:string; excl_source_id_:longint=0;excl_note_id_:longint=0):boolean;
var
  cnt:integer;
begin
    cnt:=sqlc.ExecSQLScalar('select count(*) from source_url where url=:UUU and source_id<>:SID',[url_,excl_source_id_]);
    if cnt>0 then begin
      msgerror('Введенный Вами URL источника уже закреплен за другим источником!');
      Result:=false;
      exit;
    end;
    cnt:=sqlc.ExecSQLScalar('select count(*) from note_url where url=:UUU and note_id<>:NID',[url_,excl_note_id_]);
    if cnt>0 then begin
      msgerror('Введенный Вами URL источника уже закреплен за заметкой!');
      Result:=false;
      exit
    end;
    Result:=true;

end;


function TDM.get_ds_id_next(ds_:TDataSet):longint;
var
  id_next_:longint;
  cur_id_:longint;
  cur_dir_:integer;
begin
  cur_dir_:=ds_['is_dir'];
  cur_id_:=ds_['id'];
  ds_.Next;
  if ds_.eof then begin
   if ds_.RecordCount=1 then
      id_next_:=0
   else begin
      ds_.MoveBy(-1);
      if cur_dir_=ds_['is_dir'] then
        id_next_:=ds_['id']
      else
        id_next_:=0;
      ds_.Next; // чтобы вернуть где было
   end;
  end
  else begin
   //ds_.MoveBy(-1); // возвращаем
   //ds_.Next;
   if cur_dir_=ds_['is_dir'] then
     id_next_:=ds_['id']
   else
     id_next_:=0;
   ds_.MoveBy(-1); // чтобы вернуть как было
  end;
  Result:=id_next_;
end;

function TDM.get_source_authors(source_id_:longint; delimiter_:string=', '):string;
var
  fdq_:TFdquery;
  res_:string;
begin
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.SQL.Text:='select name from author a, source_author sa where sa.source_id='+int2str(source_id_)+' and sa.author_id=a.id order by name';
  fdq_.Open(); res_:='';
  while not fdq_.eof do begin
    if res_='' then
      res_:=fdq_['name']
    else
      res_:=res_+delimiter_+fdq_['name'];
    fdq_.Next;
  end;
  fdq_.Close;
  fdq_.Free;
  Result:=res_;
end;


function TDM.get_source_type(source_id_:longint):string;
begin
  result:=null2str(sqlc.ExecSQLScalar('select st.name from source_type st, source s where s.source_type_id=st.id and s.id=:SID',[source_id_]));
end;


function TDM.get_source_keywords(source_id_:longint):string;
var
  fdq_:TFdquery;
  res_:string;
begin
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.SQL.Text:='select name_main from keyword k, source_keyword sk where sk.source_id='+int2str(source_id_)+' and sk.keyword_id=k.id order by name_main';
  fdq_.Open(); res_:='';
  while not fdq_.eof do begin
    if res_='' then
      res_:='#'+fdq_['name_main']
    else
      res_:=res_+', #'+fdq_['name_main'];
    fdq_.Next;
  end;
  fdq_.Close;
  fdq_.Free;
  Result:=res_;
end;


function TDM.get_work_status(status_:integer):string;
begin
  case status_ of
  0:result:='Не начато';
  1:result:='В процессе';
  3:result:='Завершен';
  end;
end;


procedure TDM.FillDirInfo(tc_:TStrings; class_id_:longint; is_mine:integer);
var
  cnt_:integer;
begin
  tc_.clear;
  tc_.Add('');
  tc_.Add('Папка: '+get_source_full_root(class_id_));
  cnt_:=sqlc.ExecSQLScalar('select count(*) from source_classification where source_classification_id=:SID',[class_id_]);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число подкаталогов 1-го уровня вложенности: '+inttostr(cnt_));
  //end;
  cnt_:=sqlc.ExecSQLScalar('select count(*) from source where source_classification_id=:SID',[class_id_]);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число '+source_proj[is_mine,1]+' 1-го уровня вложенности: '+inttostr(cnt_));
  //end;
  cnt_:=dm.calc_src_class_subdirs(class_id_);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число подкаталогов всего: '+inttostr(cnt_));
  //end;
  cnt_:=dm.calc_src_class_subsource(class_id_);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число '+source_proj[is_mine,1]+' всего: '+inttostr(cnt_));
  //end;
end;


function TDM.calc_stoc_subdirs(sid_:longint):integer;
var
  fdq_:TFdquery;
  res_:integer;
begin
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.SQL.Text:='select * from source_toc where stoc_id='+int2str(sid_);
  fdq_.Open();
  res_:=0;
  while not fdq_.eof do begin
    res_:=res_+1+calc_stoc_subdirs(fdq_['id']);
    fdq_.Next;
  end;
  fdq_.Free;
  Result:=res_;
end;


function TDM.calc_src_class_subdirs(sid_:longint):integer;
var
  fdq_:TFdquery;
  res_:integer;
begin
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.SQL.Text:='select * from source_classification where source_classification_id='+int2str(sid_);
  fdq_.Open();
  res_:=0;
  while not fdq_.eof do begin
    res_:=res_+1+calc_src_class_subdirs(fdq_['id']);
    fdq_.Next;
  end;
  fdq_.Free;
  Result:=res_;
end;

function TDM.calc_src_class_subsource(class_id_:longint):integer;
var
  fdq_:TFdquery;
  res_:integer;
begin
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.SQL.Text:='select * from source_classification where source_classification_id='+int2str(class_id_);
  fdq_.Open();
  res_:=sqlc.ExecSQLScalar('select count(*) from source where source_classification_id=:SID',[class_id_]);
  while not fdq_.eof do begin
    res_:=res_+sqlc.ExecSQLScalar('select count(*) from source where source_classification_id=:SID',[fdq_['id']])+calc_src_class_subsource(fdq_['id']);
    fdq_.Next;
  end;
  fdq_.Free;
  Result:=res_;
end;



procedure TDM.get_def_source_stoc(var source_id_, stoc_id_:longint);
var
  tag_,taga_:integer;
begin
  source_id_:=0; stoc_id_:=0;
  if fmsourceEdit<>nil then begin
    source_id_:=fmsourceEdit.Source_id;
    stoc_id_:=fmsourceEdit.GetCurClass;
  end
  else begin
    if fmProjectEdit<>nil then begin
      source_id_:=fmProjectEdit.Source_id;
      stoc_id_:=fmProjectEdit.GetCurClass;
    end
  end;
end;


procedure TDM.Up1Level(id_:longint; table_name_, parent_col_name_:string; parent_id_:longint;
                           condition_field_name_:string='';condition_field_value_:longint=0;
                           id_field_name_:string='id');
var
  stoc_id_:longint;
  cnt,cur_order_,up_order_:integer;
  cond_add_:string;
  sql_:string;
begin
  if null2int(id_)<=0 then exit;
  cond_add_:=' ifnull('+parent_col_name_+',0)='+inttostr(parent_id_)+' ';
  if condition_field_name_<>'' then
    cond_add_:=cond_add_+' and '+condition_field_name_+'='+inttostr(condition_field_value_)+' ';
  sql_:='select count(*) from '+table_name_+' where '+cond_add_;
  lcb.log(sql_);
  cnt:=sqlc.ExecSQLScalar(sql_,[]);
  if cnt>1 then begin
    sql_:='update '+table_name_+' set order_=id where '+cond_add_+' and ifnull(order_,0)=0 ';
    lcb.log(sql_);
    sqlc.ExecSQL(sql_,[]);
    sql_:='select order_ from '+table_name_+' where '+id_field_name_+'='+inttostr(id_)+' and '+cond_add_;
    lcb.log(sql_);
    cur_order_:=sqlc.ExecSQLScalar(sql_,[]);
    up_order_:=null2int(sqlc.ExecSQLScalar('select max(order_) from '+table_name_+' where '+cond_add_+' and order_<:OO ',
                        [cur_order_]));
    if up_order_>0 then begin
      sqlc.ExecSQL('update '+table_name_+' set order_=:COO where '+ cond_add_+' and order_=:UOO' ,
                         [cur_order_,up_order_]);
      sqlc.ExecSQL('update '+table_name_+' set order_=:UOO where '+ cond_add_+' and '+id_field_name_+'=:NSID ',
                         [up_order_,id_]);
    end;
  end;
end;


procedure TDM.Down1Level(id_:longint; table_name_, parent_col_name_: string; parent_id_:longint;
   condition_field_name_:string='';condition_field_value_:longint=0;id_field_name_:string='id');
var
  cnt,nid:integer;
  stoc_id_:integer;
  cur_order_,down_order_:integer;
  cond_add_:string;
  sql_:string;
begin
  if null2int(id_)<=0 then exit;
  cond_add_:=' ifnull('+parent_col_name_+',0)='+inttostr(parent_id_)+' ';
  if condition_field_name_<>'' then
    cond_add_:=cond_add_+' and '+condition_field_name_+'='+inttostr(condition_field_value_)+' ';
  cnt:=sqlc.ExecSQLScalar('select count(*) from '+table_name_+' where '+cond_add_,[]);
    if cnt>1 then begin
      sqlc.ExecSQL('update '+table_name_+' set order_=id where '+cond_add_+' and ifnull(order_,0)<=0',[]);
      cur_order_:=sqlc.ExecSQLScalar('select order_ from '+table_name_+' where '+cond_add_+' and '+id_field_name_+'=:NSID',[id_]);
      down_order_:=null2int(sqlc.ExecSQLScalar('select min(order_) from '+table_name_+' where '+cond_add_+' and order_>:COO',
                            [cur_order_] ));
      if down_order_>0 then begin
        sqlc.ExecSQL('update '+table_name_+' set order_=:COO where '+cond_add_+' and order_=:DOO ',
                            [cur_order_,down_order_]);
        sqlc.ExecSQL('update '+table_name_+' set order_=:DOO where '+cond_add_+' and '+id_field_name_+'=:NSID',
                            [down_order_,id_]);
      end;
    end;
  //fdq.Refresh
end;


procedure TDM.struct_add_new_fields;
var
  ch_str_:ansistring;
  JsonArray: TJSONArray;
  ArrayElement: TJSonValue;
  RowValue: TJSonValue;
  RowItem: TJSonValue;
  table_name_,field_name_,field_type_:string;
  fdq_:TFdquery;
begin
  ch_str_:=GetStrFromAppResource('change_struct_new_fields');
  lcb.log(ch_str_);
  fdq_:=tFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  JsonArray := TJSonObject.ParseJSONValue(ch_str_) as TJSONArray;
  for ArrayElement in JsonArray do begin
     ArrayElement.TryGetValue('TABLE', table_name_);
     ArrayElement.TryGetValue('FIELD', field_name_);
     ArrayElement.TryGetValue('TYPE', field_type_);
     fdq_.SQL.Text:='PRAGMA table_info('''+table_name_+''')';
     fdq_.Open();
     if fdq_.RecordCount>0 then begin
       if not fdq_.Locate('name',field_name_,[loCaseInsensitive]) then begin
         lcb.log('Нет поля '+field_name_+' в таблице '+table_name_+', добавляем SQL-запросом!');
         fdq_.SQL.Text:='ALTER TABLE '+table_name_+' ADD COLUMN '+field_name_+' '+field_type_+';';
         lcb.log(fdq_.SQL.Text);
         fdq_.ExecSQL;
       end;
     end;
     fdq_.Close;
  end;
  fdq_.Free;
  JsonArray.Free;
end;

// пересчет ключевого слова (name_main, name_w_synonym)
procedure TDM.recalc_keyword(kw_id_:longint);
var
  new_main_:string;
  new_syn_:string;
  RootKWName:string;
  fdq_, fdqn_:TFdquery;
begin
  fdq_:=TFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdq_.ResourceOptions.ParamCreate := False;
  // правим name_main
  RootKWName:=sqlc.ExecSQLScalar('select name_main from keyword where id=:KID',[kw_id_]);
  fdq_.sql.text:='select * from keyword_name where keyword_id='+inttostr(kw_id_)+' order by ifnull(order_,0),id';
  fdq_.Open;
  if RootKWName<>fdq_['name'] then begin
    new_main_:=fdq_['name'];
    fdq_.Close;
    with fdq_.Params.Add do begin
      name:='NM';
      DataType:=ftString;
      Size:=250;
      ParamType:=ptInput;
      Value:=new_main_;
    end;
    fdq_.sql.text:='update keyword set name_main=:NM where id='+inttostr(kw_id_);
    fdq_.ExecSQL;
  end;
  new_syn_:='';
  new_syn_:=replacestr(sqlc.ExecSQLScalar('select group_concat(name) from (select name from keyword_name where keyword_id=:KID order by ifnull(order_,0), id)',[kw_id_]),
                       ',','=');
  fdq_.Params.Clear;
  with fdq_.Params.Add do begin
    name:='NM';
    DataType:=ftString;
    Size:=250;
    ParamType:=ptInput;
    Value:=new_syn_;
  end;
  fdq_.sql.text:='update keyword set name_w_synonym=:NM where id='+inttostr(kw_id_);
  fdq_.ExecSQL;
  fdq_.free;
  recalc_class_name(kw_id_);
end;


// в рекурсии считает названия классификаторного префикса/суффикса
procedure tdm.recalc_class_name(from_kw_id_:longint);
var
  fdq_, fdqu_:tFdquery;
begin
  fdq_:=tFdquery.Create(nil);
  fdqu_:=tFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  fdqu_.Connection:=sqlc;
  fdq_.SQL.Text:='select * from keyword where class_keyword_id='+inttostr(from_kw_id_);
  fdqu_.SQL.Text:='update keyword set class_name_before=keyword_classname(class_keyword_id,1),  class_name_after=keyword_classname(class_keyword_id,0) where class_keyword_id='+inttostr(from_kw_id_);
  fdqu_.Execute();
  fdq_.Open();
  while not fdq_.Eof do Begin
    recalc_class_name(fdq_['id']);
    fdq_.Next;
  end;
  fdq_.free;
  fdqu_.free;
end;


function TDM.get_max_stoc_order(sid_,stid_:longint):longint; // возвращает максимальное значение п/п для оглавления источника
var
  maxs, maxn:longint;
begin
    maxs:=0; maxn:=0;
    if dm.sqlc.ExecSQLScalar('select count(*) from source_toc where source_id=:SI and ifnull(stoc_id,0)=:SS',[sid_,stid_])>0 then
       maxs:=dm.sqlc.ExecSQLScalar('select max(ifnull(order_,0)) from source_toc where source_id=:SI and ifnull(stoc_id,0)=:SS',[sid_,stid_]);
    if dm.sqlc.ExecSQLScalar('select count(*) from note_source where source_id=:SI and ifnull(stoc_id,0)=:SS',[sid_,stid_])>0 then
       maxn:=dm.sqlc.ExecSQLScalar('select max(ifnull(order_,0)) from note_source where source_id=:SI and ifnull(stoc_id,0)=:SS',[sid_,stid_]);
    if (maxn<>0) or (maxs<>0) then begin
      if maxn>maxs then
        Result:=maxn
      else
        Result:=maxs
    end
    else
      result:=0;
end;


procedure TDM.add_new_ddl_object;
var
  ch_str_:ansistring;
  JsonArray: TJSONArray;
  ArrayElement: TJSonValue;
  RowValue: TJSonValue;
  RowItem: TJSonValue;
  type_,name_,value_:string;
  fdq_:TFdquery;
  seq_id_:longint;
  cnt_:integer;
begin
  ch_str_:=GetStrFromAppResource('add_new_object');
  lcb.log(ch_str_);
  fdq_:=tFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  JsonArray := TJSonObject.ParseJSONValue(ch_str_) as TJSONArray;
  for ArrayElement in JsonArray do begin
     ArrayElement.TryGetValue('TYPE', type_);
     ArrayElement.TryGetValue('NAME', name_);
     ArrayElement.TryGetValue('VALUE', value_);
     //lcb.log('type_='+type_+' NAME='+name_);
     //table_log('select * from sqlite_master WHERE type = "index"','name');
     //cnt_:=DM.sqlc.ExecSQLScalar('select count(*) from sqlite_master WHERE name="KW_NAME_UNI"');
     //lcb.log('cnt='+type_+inttostr(cnt_));
     if sqlc.ExecSQLScalar('select count(*) from sqlite_master WHERE type = :TT and name=:NN',[type_,name_])=0 then begin
       try
         lcb.log('Нет '+type_+' '+name_+', добавляем SQL-запросом '+value_);
         sqlc.ExecSQL(value_);
       except
         msgerror('Ошибка обновления структуры - не проходит SQL-запрос ['+value_+']! Обратитесь к программисту!');
       end;
     end;

  end;
  fdq_.Free;
  JsonArray.Free;

end;



function TDM.keyword_delete(id_:longint):boolean;
var
  cnt_:integer;
  mname_:string;
begin
     cnt_:=sqlc.ExecSQLScalar('select count(*) from keyword where class_keyword_id=:KID',[id_]);
     if cnt_>0 then begin
       mname_:=sqlc.ExecSQLScalar('select min(name) from keyword where class_keyword_id=:KID',[id_]);
       msgerror('Нельзя удалять тэги, которые являются ключевыми. Например, для тэга ['+mname_+']');
       result:=false;
     end
     else begin
       sqlc.ExecSQL('delete from source_keyword where keyword_id=:KID',[id_]);
       sqlc.ExecSQL('delete from note_keyword where keyword_id=:KID',[id_]);
       sqlc.ExecSQL('delete from keyword where id=:KID',[id_]);
       result:=true;
     end;
end;


procedure TDM.RefillKWNExpanded;
var
  fdq:TFdquery;

  procedure fill_KWNE_Stoc(source_id,stoc_id_, substoc_id_:longint);
  var
    fdq:TFdquery;
  begin
    fdq:=TFdquery.Create(nil);
    fdq.Connection:=sqlc;
    sqlc.ExecSQL('insert into note_expanded_keyword (keyword_id, note_id, keyword_name_id, type_, parent_id) '+
                ' select stoc_keyword.keyword_id, note_source.note_id, stoc_keyword.keyword_name_id,0,note_source.source_id  '+
                ' from note_source, stoc_keyword '+
                ' where note_source.source_id=:SS and note_source.stoc_id=:ST and stoc_keyword.source_id=note_source.source_id and stoc_keyword.stoc_id=:PST',
                [source_id,substoc_id_,stoc_id_]);
    fdq.SQL.Text:='select * from source_toc where stoc_id='+inttostr(substoc_id_);
    fdq.Open();
    while not fdq.eof do begin
       fill_KWNE_Stoc(source_id,stoc_id_, fdq['id']);
       fdq.Next;
    end;
    fdq.Close;
    fdq.Free;
  end;

begin
  sqlc.ExecSQL('delete from note_expanded_keyword');
  sqlc.ExecSQL('insert into note_expanded_keyword (keyword_id, note_id, keyword_name_id, type_, parent_id) '+
                ' select source_keyword.keyword_id, note_source.note_id, source_keyword.keyword_name_id,0,note_source.source_id  '+
                ' from note_source, source_keyword '+
                ' where note_source.source_id=source_keyword .source_id');
  fdq:=TFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.SQL.Text:='select distinct source_id, stoc_id from stoc_keyword';
  fdq.Open();
  while not fdq.eof do begin
    fill_KWNE_Stoc(fdq['source_id'],fdq['stoc_id'],fdq['stoc_id']);
    fdq.Next;
  end;
  fdq.close;
  fdq.Free;
end;


function TDM.get_interest_full_root(class_id_:longint):string;
begin
  if null2int(class_id_)=0 then
    result:=''
  else begin
    result:=get_interest_full_root(sqlc.ExecSQLScalar('select class_interest_id from interest where id=:KID',[class_id_]))
      +' / '+sqlc.ExecSQLScalar('select name from interest where id=:KID',[class_id_])
  end;

end;


procedure TDM.kw_mark_status(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
  function get_marked_status(kw_id_,f_id_:longint):integer;
  var
    fdq:TFdquery;
  begin
    result:=0;
    if sqlc.ExecSQLScalar('select count(*) from keyword k where class_keyword_id=:KW',[kw_id_])>0 then begin
      if sqlc.ExecSQLScalar('select count(*) from filter_keyword fk, keyword k where filter_id=:FID and k.id=keyword_id and class_keyword_id=:KW',[f_id_,kw_id_])>0 then begin
          Result:=-1;
      end
      else begin
        fdq:=TFdquery.Create(nil);
        fdq.Connection:=sqlc;
        fdq.sql.Clear;
        {fdq.sql.add('select k.id kwid, fk.id fkid from keyword k');
        fdq.sql.add('left join (select * from filter_keyword where filter_keyword.filter_id='+inttostr(f_id_)+') fk on k.id=fk.keyword_id');
        fdq.sql.add('where class_keyword_id='+inttostr(kw_id_));}
        fdq.SQL.add('select id kwid from keyword where class_keyword_id='+inttostr(kw_id_));
        fdq.Open();
        while not fdq.Eof do begin
            if get_marked_status(fdq['kwid'],f_id_)=-1 then begin
              Result:=-1;
              break;
            end;
          fdq.Next;
        end;
        fdq.Close;
        fdq.Free;
      end;
    end;
  end;
begin
  // kw_id, mark_st
  if sqlc.ExecSQLScalar('select count(*) from filter_keyword where keyword_id=:KW and filter_id=:FID',[AInputs[0].AsInteger,AInputs[1].AsInteger])=1 then
    AOutput.AsInteger := 1
  else begin // не помечен
    AOutput.AsInteger := get_marked_status(AInputs[0].AsInteger,AInputs[1].AsInteger);
  end;
end;


procedure TDM.interest_mark_status(AFunc: TSQLiteFunctionInstance;
  AInputs: TSQLiteInputs; AOutput: TSQLiteOutput; var AUserData: TObject);
  function get_marked_status(kw_id_,f_id_:longint):integer;
  var
    fdq:TFdquery;
  begin
    result:=0;
    if sqlc.ExecSQLScalar('select count(*) from interest k where class_interest_id=:KW',[kw_id_])>0 then begin
      if sqlc.ExecSQLScalar('select count(*) from filter_interest fk, interest k where filter_id=:FID and k.id=interest_id and class_interest_id=:KW',[f_id_,kw_id_])>0 then begin
          Result:=-1;
      end
      else begin
        fdq:=TFdquery.Create(nil);
        fdq.Connection:=sqlc;
        fdq.sql.Clear;
        {fdq.sql.add('select k.id kwid, fk.id fkid from keyword k');
        fdq.sql.add('left join (select * from filter_keyword where filter_keyword.filter_id='+inttostr(f_id_)+') fk on k.id=fk.keyword_id');
        fdq.sql.add('where class_keyword_id='+inttostr(kw_id_));}
        fdq.SQL.add('select id kwid from interest where class_interest_id='+inttostr(kw_id_));
        fdq.Open();
        while not fdq.Eof do begin
            if get_marked_status(fdq['kwid'],f_id_)=-1 then begin
              Result:=-1;
              break;
            end;
          fdq.Next;
        end;
        fdq.Close;
        fdq.Free;
      end;
    end;
  end;
begin
  // kw_id, mark_st
  if sqlc.ExecSQLScalar('select count(*) from filter_interest where interest_id=:KW and filter_id=:FID',[AInputs[0].AsInteger,AInputs[1].AsInteger])=1 then
    AOutput.AsInteger := 1
  else begin // не помечен
    AOutput.AsInteger := get_marked_status(AInputs[0].AsInteger,AInputs[1].AsInteger);
  end;
end;

function TDM.to_filter:boolean;
var
  cfn_:string;
  fdqfilter:TFdquery;

  procedure clear_tmp_filter;
  var
    ddd:ansistring;
  begin
    ddd:=GetStrFromAppResource('clear_tmp_filter');
    DM.sqlc.ExecSQL(ddd);
  end;

  // добавляем выходные ключевые слова по источнику
  procedure add_kw_out_by_source;
  begin
      DM.sqlc.ExecSQL('insert into tmp_filter_keyword_out  (keyword_id) '+
                          ' SELECT distinct nk.keyword_id '+
                          ' from tmp_filter_source tfs, note_source ns, note_keyword nk '+
                          ' where tfs.source_id=ns.source_id and ns.note_id=nk.note_id '+
                          ' and not exists (select * from tmp_filter_keyword_out where keyword_id=nk.keyword_id ) ');
  end;

  // добавляем выходные интересы по источнику
  procedure add_interest_out_by_source;
  begin
      DM.sqlc.ExecSQL('insert into tmp_filter_interest_out  (interest_id) '+
                          ' SELECT distinct ike.interest_id '+
                          ' from tmp_filter_source tfa, note_source ns, note_keyword nk , interest_keyword_expand ike '+
                          ' where tfa.source_id=ns.source_id and ns.note_id=nk.note_id and ike.keyword_id=nk.keyword_id '+
                          ' and not exists (select * from tmp_filter_interest_out where interest_id=ike.interest_id ) ');
  end;

  // добавляем выходные интересы по ключевым словам
  procedure add_interest_out_by_kw;
  begin
      DM.sqlc.ExecSQL('insert into tmp_filter_interest_out  (interest_id) '+
                          ' SELECT distinct ike.interest_id '+
                          ' from tmp_filter_keyword tfk , interest_keyword_expand ike '+
                          ' where tfk.keyword_id=ike.keyword_id '+
                          ' and not exists (select * from tmp_filter_interest_out where interest_id=ike.interest_id ) ');
  end;

  // добавляем выходные ключевые слова по проекту
  procedure add_kw_out_by_project;
  begin
      DM.sqlc.ExecSQL('insert into tmp_filter_keyword_out  (keyword_id) '+
                          ' SELECT distinct nk.keyword_id '+
                          ' from tmp_filter_project tfs, note_source ns, note_keyword nk '+
                          ' where tfs.project_id=ns.source_id and ns.note_id=nk.note_id '+
                          ' and not exists (select * from tmp_filter_keyword_out where keyword_id=nk.keyword_id ) ');
  end;

  // добавляем выходные ключевые слова по автору
  procedure add_kw_out_by_author;
  begin
      DM.sqlc.ExecSQL('insert into tmp_filter_keyword_out  (keyword_id) '+
                          ' SELECT distinct nk.keyword_id from tmp_filter_author tfa, source_author sa, note_source ns, note_keyword nk '+
                          ' where tfa.author_id=sa.author_id and sa.source_id=ns.source_id and ns.note_id=nk.note_id '+
                          ' and not exists (select * from tmp_filter_keyword_out where keyword_id=nk.keyword_id ) ');
  end;

  // добавляем выходные интересы по автору
  procedure add_interest_out_by_author;
  begin
      DM.sqlc.ExecSQL('insert into tmp_filter_interest_out  (interest_id) '+
                          ' SELECT distinct ike.interest_id '+
                          ' from tmp_filter_author tfa, source_author sa, note_source ns, note_keyword nk , interest_keyword_expand ike '+
                          ' where tfa.author_id=sa.author_id and sa.source_id=ns.source_id and ns.note_id=nk.note_id and ike.keyword_id=nk.keyword_id '+
                          ' and not exists (select * from tmp_filter_interest_out where interest_id=ike.interest_id ) ');

  end;

  // формируем ключевые слова по базе интересов
  procedure add_kw_out_by_interest;
  var
    fdq:TFdquery;
  begin
      fdq:=TFdquery.Create(nil);
      fdq.Connection:=DM.sqlc;
      fdq.sql.Text:='select distinct ik.keyword_id from tmp_filter_interest int, interest_keyword ik where int.interest_id=ik.interest_id';
      fdq.Open();
      while not fdq.Eof do begin
        kw_add_all_sublevel(fdq['keyword_id']);
        fdq.Next;
      end;
      fdq.Close;
      fdq.Free;
  end;

  // добавляем ключевые слова к выходным ключевым словам
  procedure add_kw_out_by_kw;
  var
    ch_cnt_:integer;
  begin
    DM.sqlc.ExecSQL('insert into tmp_filter_keyword_out(keyword_id) select keyword_id from tmp_filter_keyword '+
      ' where not exists '+
      '(select * from tmp_filter_keyword_out where tmp_filter_keyword_out.keyword_id=tmp_filter_keyword.keyword_id)');
    // формируем иерархию ключевых слов с папками
    repeat
      DM.sqlc.ExecSQL('insert into tmp_filter_keyword_out(keyword_id,type_) '+
                          ' select distinct keyword.class_keyword_id,1 '+
                          ' from tmp_filter_keyword_out , keyword '+
                          ' where tmp_filter_keyword_out.keyword_id=keyword.id '+
                          ' and keyword.class_keyword_id<>0 '+
                          '    and not exists (select * from tmp_filter_keyword_out where tmp_filter_keyword_out.keyword_id=keyword.class_keyword_id) '
                        );
      ch_cnt_:=DM.sqlc.ExecSQLScalar('select changes()');
    until ch_cnt_=0;
  end;

  // добавляем интересы к выходным интересам
  procedure add_interest_out_by_interest;
  var
    ch_cnt_:integer;
  begin
    DM.sqlc.ExecSQL('insert into tmp_filter_interest_out(interest_id) select interest_id from tmp_filter_interest '+
      ' where not exists '+
      '(select * from tmp_filter_interest_out where tmp_filter_interest_out.interest_id=tmp_filter_interest.interest_id)');
    // формируем иерархию интересов с папками
    repeat
      DM.sqlc.ExecSQL('insert into tmp_filter_interest_out(interest_id,type_) '+
                          ' select distinct interest.class_interest_id,1 '+
                          ' from tmp_filter_interest_out , interest '+
                          ' where tmp_filter_interest_out.interest_id=interest.id '+
                          ' and interest.class_interest_id<>0 '+
                          '    and not exists (select * from tmp_filter_interest_out where tmp_filter_interest_out.interest_id=interest.class_interest_id) '
                        );
      ch_cnt_:=DM.sqlc.ExecSQLScalar('select changes()');
    until ch_cnt_=0;
  end;

  procedure gen_tmp_source_and_project;
  begin
    DM.sqlc.ExecSQL('insert into tmp_filter_source_and_project(sp_id) select source_id from tmp_filter_source');
    DM.sqlc.ExecSQL('insert into tmp_filter_source_and_project(sp_id) select project_id from tmp_filter_project');
  end;


  procedure add_kw_int_out;
  begin
    if DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_author')>0 then begin
      // есть фильтр по авторам
      add_kw_out_by_author; // добавляем выходные ключевые слова по автору
      add_interest_out_by_author;  // добавляем выходные интересы по автору
    end;
    if DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_source')>0 then begin
      // есть фильтр по источникам
      add_kw_out_by_source;  // добавляем выходные ключевые слова по источнику
      add_interest_out_by_source;  // добавляем выходные интересы по источнику
    end;
    if DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_keyword')>0 then begin
      // есть фильтр по ключевым словам
      add_interest_out_by_kw; // добавляем выходные интересы по ключевым словам
    end;
    if DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_interest')>0 then begin
      // есть фильтр по интересам
      add_kw_out_by_interest; // формируем ключевые слова по базе интересов
    end;
    if DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_project')>0 then begin
      // есть фильтр по проектам
      add_kw_out_by_project;  // добавляем выходные ключевые слова по проекту
      //add_interest_out_by_project;  // добавляем выходные ключевые слова по проекту
    end;

    if (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_keyword')>0) or
       (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_keyword_out')>0)then
          add_kw_out_by_kw; // добавляем ключевые слова к выходным ключевым словам

    if (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_interest')>0) or
       (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_interest_out')>0)then
          add_interest_out_by_interest;; // добавляем интересы к выходным интересам

  end;

begin
  //if not fmmain.filtered then begin
    fdqfilter:=TFdquery.Create(nil);
    fdqfilter.Connection:=sqlc;
    fdqfilter.sql.Text:=' select *  from filter';
    fdqfilter.open;
    clear_tmp_filter;
    fill_interest_keyword_expand;
    //fmmain.Applied_Filters_Name:='';
    while not fdqfilter.eof do begin
      if fdqfilter['is_active']=1 then begin
         //cfn_:=fdqfilter['Name']+'('+ dbgAuthors.Columns[2].PickList[fdqFilter['area_type']]+')';
         {if fmmain.Applied_Filters_Name='' then
           fmmain.Applied_Filters_Name:=cfn_
         else
           fmmain.Applied_Filters_Name:=fmmain.Applied_Filters_Name+', '+cfn_;}
         case fdqfilter['area_type'] of
         0:add_filter_author(fdqfilter['id'],fdqfilter['use_type']);
         1:add_filter_source(fdqfilter['id'],fdqfilter['use_type']);
         2:add_filter_keyword(fdqfilter['id'],0,fdqfilter['use_type']);
         3:add_filter_interest(fdqfilter['id'],0,fdqfilter['use_type']);
         4:add_filter_project(fdqfilter['id'],fdqfilter['use_type']);
         end;
      end;
      fdqfilter.next;
    end;

    //fmmain.Applied_Filters_Name:='['+fmmain.Applied_Filters_Name+']';

    add_kw_int_out; // добавить все связанное с выходными ключевыми словами и выходными интересами
    gen_tmp_source_and_project; // формируем единый файл фильтров источники+проект

    if (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_keyword')=0)
        and
        (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_interest')=0)
        and
        (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_source')=0)
        and
        (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_project')=0)
        and
        (DM.sqlc.ExecSQLScalar('select count(*) from tmp_filter_author')=0)
     then begin
       msgerror('Пустые фильтры - нечего применять!');
       result:=false;
       exit;
     end;
  //end;
  Result:=true;

end;

// ДОБАВЛЯЕМ все-все ключевые слова с подфайлами по интересу
procedure TDM.fill_interest_keyword_expand;
  procedure fill_kw_dir(iid_,kwid_:longint);
  var
    fdq:TFdquery;
  begin
    fdq:=TFdquery.Create(nil);
    fdq.Connection:=sqlc;
    fdq.SQL.Text:='select * from keyword where class_keyword_id='+inttostr(kwid_);
    fdq.Open();
    while not fdq.eof do begin
      sqlc.ExecSQL('insert into interest_keyword_expand (interest_id, keyword_id) '+
                    ' select :II, :KK where not exists '+
                      ' (select * from interest_keyword_expand where interest_id=:II1 and keyword_id=:KK1)',
                     [iid_,fdq['id'],iid_,fdq['id']]);
      fill_kw_dir(iid_,fdq['id']);
      fdq.Next;
    end;
    fdq.Close;
    fdq.Free;

  end;

  procedure fill_int(ci_id_:longint);
  var
    fdq, fdqk:TFdquery;
  begin
    fdq:=TFdquery.Create(nil);
    fdq.Connection:=sqlc;
    fdq.SQL.Text:='select * from interest where class_interest_id='+inttostr(ci_id_);
    fdq.Open();
    while not fdq.eof do begin
      fdqk:=TFdquery.Create(nil);
      fdqk.Connection:=sqlc;
      fdqk.SQL.Text:='select * from interest_keyword where interest_id='+inttostr(fdq['id']);
      fdqk.Open();
      // по ключевым словам одного интереса
      while not fdqk.eof do begin
        sqlc.ExecSQL('insert into interest_keyword_expand (interest_id, keyword_id) '+
                    ' select :II, :KK where not exists '+
                      ' (select * from interest_keyword_expand where interest_id=:II1 and keyword_id=:KK1)',
                     [fdq['id'],fdqk['keyword_id'],fdq['id'],fdqk['keyword_id']]);
        fill_kw_dir(fdq['id'],fdqk['keyword_id']);
        fdqk.Next;
      end;
      fdqk.Close;
      fdqk.Free;
      fill_int(fdq['id']);
      fdq.Next;
    end;
    fdq.Close;
    fdq.Free;
  end;
begin
  sqlc.ExecSQL('delete from interest_keyword_expand');
  fill_int(0);
end;

procedure TDM.kw_add_all_sublevel(kw_id_:longint);
var
  fdq:TFdquery;
begin
  sqlc.ExecSQL('insert into tmp_filter_keyword (keyword_id) values(:KW)',[kw_id_]);
  fdq:=tFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.SQL.Clear;
  fdq.SQL.Add('select * from keyword k where class_keyword_id='+inttostr(kw_id_));
  fdq.Open();
  while not fdq.eof do begin
    kw_add_all_sublevel(fdq['id']);
    fdq.Next;
  end;
  fdq.close;
  fdq.Free;
end;

procedure TDM.kw_del_all_sublevel(kw_id_:longint);
var
  fdq:TFdquery;
begin
  sqlc.ExecSQL('delete from tmp_filter_keyword_not where keyword_id=:KW',[kw_id_]);
  fdq:=tFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.SQL.Clear;
  fdq.SQL.Add('select * from keyword k where class_keyword_id='+inttostr(kw_id_));
  fdq.Open();
  while not fdq.eof do begin
    kw_del_all_sublevel(fdq['id']);
    fdq.Next;
  end;
  fdq.close;
  fdq.Free;
end;


// добавляет все ключевые слова с подфайлами
procedure TDM.add_filter_keyword(f_id_,kw_id_:longint;use_type_:integer);
var
  fdq:TFdquery;
  cnt_:integer;
begin
  if (kw_id_=0) and (use_type_=1) then begin
    sqlc.ExecSQL('delete from tmp_filter_keyword_not');
    sqlc.ExecSQL('insert into tmp_filter_keyword_not(keyword_id) select id from keyword');
  end;

  fdq:=tFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.SQL.Clear;
  fdq.SQL.Add('select * from keyword k where class_keyword_id='+inttostr(kw_id_));
  fdq.Open();
  while not fdq.eof do begin
    cnt_:=sqlc.ExecSQLScalar('select count(*) from filter_keyword '+
                                 'where filter_id=:FID and keyword_id=:KW',[f_id_,fdq['id']]);
    if use_type_=0 then begin
      if cnt_=1 then
        kw_add_all_sublevel(fdq['id'])
      else
        add_filter_keyword(f_id_,fdq['id'],use_type_);
    end;
    if use_type_=1 then begin
      if cnt_=1 then
        kw_del_all_sublevel(fdq['id'])
      else
        add_filter_keyword(f_id_,fdq['id'],use_type_);
    end;
    fdq.Next;
  end;
  fdq.close;
  fdq.Free;

  if (kw_id_=0) and (use_type_=1) then begin
    sqlc.ExecSQL('insert into tmp_filter_keyword (keyword_id) select keyword_id from tmp_filter_keyword_not '+
                        ' where not exists (select * from tmp_filter_keyword where keyword_id=tmp_filter_keyword_not.keyword_id)');
  end;

end;

procedure TDM.add_filter_author(f_id_:longint;use_type_:integer);
begin
  if null2int(use_type_)=0 then
    sqlc.ExecSQL('insert into tmp_filter_author (author_id) select author_id from filter_author where filter_id=:FID',[f_id_])
  else
    sqlc.ExecSQL('insert into tmp_filter_author (author_id) select id from author where not exists (select * from filter_author where filter_id=:FID and author_id=author.id)',[f_id_])
end;


procedure TDM.add_filter_source(f_id_:longint;use_type_:integer);
begin
  if null2int(use_type_)=0 then
    sqlc.ExecSQL('insert into tmp_filter_source (source_id) select source_id from filter_source where filter_id=:FID',[f_id_])
  else
    sqlc.ExecSQL('insert into tmp_filter_source (source_id) select id from source where is_mine=0 and not exists( select * from filter_source where filter_id=:FID and source_id=source.id',[f_id_])
end;

procedure TDM.add_filter_project(f_id_:longint;use_type_:integer);
begin
  if null2int(use_type_)=0 then
    sqlc.ExecSQL('insert into tmp_filter_project (project_id) select project_id from filter_project where filter_id=:FID',[f_id_])
  else
    sqlc.ExecSQL('insert into tmp_filter_project (project_id) select id from source where is_mine=1 and not exists (select * from filter_project where filter_id=:FID and project_id=source.id)',[f_id_])
end;

procedure TDM.add_filter_interest(f_id_,i_id_:longint;use_type_:integer);
var
  fdq:TFdquery;
begin
  fdq:=tFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.SQL.Clear;
  fdq.SQL.Add('select * from interest k where class_interest_id='+inttostr(i_id_));
  fdq.Open();
  while not fdq.eof do begin
    if sqlc.ExecSQLScalar('select count(*) from filter_interest '+
                                 'where filter_id=:FID and interest_id=:KW',[f_id_,fdq['id']])=1 then begin
      interest_add_all_sublevel(fdq['id']);
    end
    else
      add_filter_interest(f_id_,fdq['id'],use_type_);
    fdq.Next;
  end;
  fdq.close;
  fdq.Free;
end;

procedure TDM.interest_add_all_sublevel(i_id_:longint);
var
  fdq:TFdquery;
begin
  sqlc.ExecSQL('insert into tmp_filter_interest (interest_id) values(:KW)',[i_id_]);
  fdq:=tFdquery.Create(nil);
  fdq.Connection:=sqlc;
  fdq.SQL.Clear;
  fdq.SQL.Add('select * from interest k where class_interest_id='+inttostr(i_id_));
  fdq.Open();
  while not fdq.eof do begin
    interest_add_all_sublevel(fdq['id']);
    fdq.Next;
  end;
  fdq.close;
  fdq.Free;
end;



procedure TDM.add_new_service_rows;
var
  ch_str_:ansistring;
  JsonArray: TJSONArray;
  ArrayElement: TJSonValue;
  RowValue: TJSonValue;
  RowItem: TJSonValue;
  table_name_,field_name_,field_value_, id_:string;
  fdq_:TFdquery;
  seq_id_:longint;
begin
  ch_str_:=GetStrFromAppResource('add_new_rows');
  lcb.log(ch_str_);
  fdq_:=tFdquery.Create(nil);
  fdq_.Connection:=sqlc;
  JsonArray := TJSonObject.ParseJSONValue(ch_str_) as TJSONArray;
  for ArrayElement in JsonArray do begin
     ArrayElement.TryGetValue('TABLE', table_name_);
     ArrayElement.TryGetValue('COLUMN', field_name_);
     ArrayElement.TryGetValue('VALUE', field_value_);
     ArrayElement.TryGetValue('ID', id_);
     if sqlc.ExecSQLScalar('select count(*) from '+table_name_+' where id=:DD', [str2int(id_)])=0 then begin
       seq_id_:=null2int(sqlc.ExecSQLScalar('select seq from sqlite_sequence where name=:NN',[table_name_]));
       if seq_id_<>str2int(id_)-1 then
         sqlc.ExecSQL('update sqlite_sequence set seq=:SSS where name=:NNN',[str2int(id_)-1,table_name_]);
       sqlc.ExecSQL('insert into '+table_name_+' ('+field_name_+') values(:VVV)',[field_value_]);
     end;

  end;
  fdq_.Free;
  JsonArray.Free;

end;


end.
