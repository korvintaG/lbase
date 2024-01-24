unit fmSourceListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, MemTableDataEh, Data.DB,
  DataDriverEh, MemTableEh, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.StdCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  display_service,
  Vcl.ExtCtrls, TwoPanelControlForm, UrlPanels;

const
  par_fname:array[0..1] of string=('SourceList','ProjectList');

  sort_array:array[0..7] of string=(
    // по дате - времени
    'order by is_dir desc, class_id_sort_val(id), id', 'order by is_dir desc, class_id_sort_val(id), id desc',
    // по названию
    'order by is_dir desc, class_id_sort_val(id), ru_lower(fullname)', 'order by is_dir desc, class_id_sort_val(id), ru_lower(fullname) desc',
    // по автору
    'order by is_dir desc, class_id_sort_val(id), (SELECT GROUP_CONCAT(a.name) FROM source_author sa, author a WHERE source_id=source.id and author_id=a.id), ru_lower(fullname)',
    'order by is_dir desc, class_id_sort_val(id), (SELECT GROUP_CONCAT(a.name) FROM source_author sa, author a WHERE source_id=source.id and author_id=a.id) desc, ru_lower(fullname) desc',
    // по состоянию
    'order by is_dir desc, class_id_sort_val(id), status, ru_lower(fullname)','order by is_dir desc, class_id_sort_val(id), status desc, ru_lower(fullname) ');
  param_sc_prefix:array[0..1] of string =('SourceList','ProjectList');
  tmp_table_array:array[0..1,0..1] of string=(('tmp_left_sources','tmp_right_sources'),
                                              ('tmp_left_projects','tmp_right_projects'));


type

  TSourceListPanelTagInfo=class(TPanelTagInfo)
    fdq, fdq_a:TFdQuery;
    mem_dir, mem_dir_a:TMemo;
  end;

  TfmSourceList = class(TfmTwoPanelControl)
    pnTop: TPanel;
    gbLeft: TGroupBox;
    dbgLeftSourceList: TDBGridEh;
    pnLeftCont: TPanel;
    memLeftDir: TMemo;
    gbRight: TGroupBox;
    pnRightCont: TPanel;
    memRightDir: TMemo;
    dbgRightSourceList: TDBGridEh;
    pmMain: TPopupMenu;
    mnModeShowContent: TMenuItem;
    mnModeMaximized: TMenuItem;
    mnMode2Panel: TMenuItem;
    mnSort: TMenuItem;
    mnSortByDate: TMenuItem;
    mnSortByDateDesc: TMenuItem;
    N9: TMenuItem;
    mnSortByName: TMenuItem;
    mnSortByNameDesc: TMenuItem;
    N10: TMenuItem;
    mnSortAuthor: TMenuItem;
    mnSortAuthorDesc: TMenuItem;
    N12: TMenuItem;
    mnSortState: TMenuItem;
    mnSortStateDesc: TMenuItem;
    mnChooseTheSame: TMenuItem;
    N4: TMenuItem;
    mnAddFolder: TMenuItem;
    mnAdd: TMenuItem;
    mnDel: TMenuItem;
    mnEdit: TMenuItem;
    N2: TMenuItem;
    mnChangeStatus: TMenuItem;
    mnStatus0: TMenuItem;
    mnStatus1: TMenuItem;
    mnStatus3: TMenuItem;
    mnMove: TMenuItem;
    N1: TMenuItem;
    fdqLeftSource: TFDQuery;
    fdqLeftSourcefullname: TWideMemoField;
    fdqLeftSourceid: TIntegerField;
    fdqLeftSourceis_dir: TIntegerField;
    fdqLeftSourceis_mine: TIntegerField;
    fdqLeftSourcestatus: TIntegerField;
    fdqLeftSourcesource_type_id: TIntegerField;
    fdqLeftSourcesource_classification_id: TIntegerField;
    fdqLeftSourcename: TWideMemoField;
    dsLeftSource: TDataSource;
    FDQTmpSourceFill: TFDQuery;
    WideMemoField1: TWideMemoField;
    LargeintField1: TLargeintField;
    LargeintField2: TLargeintField;
    LargeintField3: TLargeintField;
    LargeintField4: TLargeintField;
    LargeintField5: TLargeintField;
    LargeintField6: TLargeintField;
    mteLeftSource: TMemTableEh;
    dsdeLeftSource: TDataSetDriverEh;
    mteRightSource: TMemTableEh;
    dsdeRightSource: TDataSetDriverEh;
    dsRightSource: TDataSource;
    fdqRightSource: TFDQuery;
    WideMemoField2: TWideMemoField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    WideMemoField3: TWideMemoField;
    mnMode: TMenuItem;
    mnChangePanel: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgLeftSourceListColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnStatus0Click(Sender: TObject);
    procedure mnAddFolderClick(Sender: TObject);
    procedure mnMoveClick(Sender: TObject);
    procedure mnSortByDateClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mnAddClick(Sender: TObject);

    // переопределяемые
    procedure DbgDblClick(Sender: TObject); override;
    //procedure DsuAfterScroll(DataSet: TDataSet); override;
    procedure FormResize(Sender: TObject); override;
    procedure mnDelClick(Sender: TObject);
    procedure mnEditClick(Sender: TObject);
  private
    { Private declarations }
    sql_save, sql_prepare_save:ansistring;
    nsrt:integer;
    is_mine:integer; // источник или проект?
    is_creating:boolean;

    procedure fill_tmp_sources(tag_:integer);
    function get_SLPTI(tag_:integer):TSourceListPanelTagInfo;

    // определение методов родительских
    procedure SetPanelClassAddAction(tag_:integer); override;
    function GetClassClassId(class_id_:longint):longint; override;
    function GetClassNameFull(class_id_:longint):string; override;
    function GetClassName(class_id_:longint):string; override;

  public
    { Public declarations }
    constructor CreateWithData(is_mine_:integer; AOwner: TComponent);
    procedure DsuAfterScroolHandle(DataSet_:TDataSet); override; // реальные действия при скрулинге основного датасет

  end;

var
  fmSourceList, fmProjectList: TfmSourceList;

implementation

{$R *.dfm}

uses dmDataUnit, fmMainUnit, extend_data, fmSourceEditUnit, lcb_unit, extend_dialog;

constructor TfmSourceList.CreateWithData(is_mine_:integer; AOwner: TComponent);
begin
  is_mine:=is_mine_;

  inherited CreateWithAlias(AOwner,param_sc_prefix[is_mine],'Папки/'+display_service.source_proj[is_mine,3]);
  self.AssignControls(pmMain, gbLeft, gbRight,
                   dbgLeftSourceList,dbgRightSourceList,
                   pnLeftCont,pnRightCont,
                   mteLeftSource,mteRightSource);
  mnadd.Caption:='Добавить '+display_service.source_proj[is_mine,4];
  fmmain.SourceListNeedRefresh[is_mine]:=true;
end;

procedure TfmSourceList.FormActivate(Sender: TObject);
var
  id_old_left:longint;
  id_old_right:longint;
begin
  if fmmain.SourceListNeedRefresh[is_mine] then begin
    if mteLeftSource.Active then
      id_old_left:=null2int(mteLeftSource['id'])
    else
      id_old_left:=0;
    if mteRightSource.Active then
      id_old_right:=null2int(mteRightSource['id'])
    else
      id_old_right:=0;
    SetPanelClass(0);
    SetPanelClass(1);

    if id_old_left>0 then
      mteLeftSource.Locate('ID',id_old_left,[]);
    if id_old_right>0 then
      mteLeftSource.Locate('ID',id_old_right,[]);
    fmmain.SourceListNeedRefresh[is_mine]:=false;
  end;


end;

procedure TfmSourceList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  if is_mine=0 then begin
    fmSourceList:=nil;
    fmmain.mnSources.Enabled:=true;
  end
  else begin
    fmProjectList:=nil;
    fmmain.mnMyProj.Enabled:=true;
  end;
end;

procedure TfmSourceList.FormCreate(Sender: TObject);
var
  filtered:boolean;
begin
  is_creating:=true;
  if is_mine=0 then
    fmmain.mnSources.Enabled:=false
  else
    fmmain.mnMyProj.Enabled:=false;

  sql_save:=fdqLeftSource.SQL.Text;
  sql_prepare_save:=FDQTmpSourceFill.SQL.Text;
  nsrt:=dm.Get_Ini_Int_Par(par_fname[is_mine]+par_sort);
  fdqLeftSource.SQL.Add(sort_array[nsrt]);
  fdqRightSource.SQL.Text:=fdqLeftSource.SQL.Text;
  fdqLeftSource.SQL.Text:=format(fdqLeftSource.SQL.Text,[tmp_table_array[is_mine,0]]);
  fdqRightSource.SQL.Text:=format(fdqRightSource.SQL.Text,[tmp_table_array[is_mine,1]]);

  pnTop.Visible:=false;

  is_creating:=false;
  caption:='Список '+display_service.source_proj[is_mine,1];
  SetViewMode();
  if ViewMode=1 then
    SendMessage(dbgRightSourceList.Handle, WM_SETFOCUS, 0, 0);

end;

procedure TfmSourceList.FormResize(Sender: TObject);
begin
  if ViewMaximized then
    Exit;

  if ViewMode=3 then begin
    gbLeft.Width:=round(self.ClientWidth/2)-4;
  end
  else if ViewMode=0 then begin
    gbLeft.Width:=round(self.ClientWidth*(2/3))
  end
  else begin
    gbLeft.Width:=round(self.ClientWidth*(1/3))
  end;

end;

procedure TfmSourceList.mnAddClick(Sender: TObject);
var
  PTI:TSourceListPanelTagInfo;
begin
  PTI:=get_SLPTI(GetFocusTag);
  if is_mine=0 then begin
    if fmSourceEdit<>nil then begin
      fmSourceEdit.Close;
      Application.ProcessMessages
    end;
    fmSourceEdit:=TfmSourceEdit.CreateWithData(-1,PTI.class_id,is_mine,DBInsert,fmmain);
    fmSourceEdit.show;
  end
  else begin
    if fmProjectEdit<>nil then begin
      fmProjectEdit.Close;
      Application.ProcessMessages
    end;
    fmProjectEdit:=TfmSourceEdit.CreateWithData(-1,PTI.class_id,is_mine,DBInsert,fmmain);
    fmProjectEdit.show;
  end;
end;

procedure TfmSourceList.mnAddFolderClick(Sender: TObject);
var
  str:string;
  tag:integer;
  id, id_next:longint;
  PTI:TSourceListPanelTagInfo;
begin
  tag:=GetFocusTag;
  PTI:=get_SLPTI(tag);
  if inputstr('Добавление новой папки в каталоге ['+ PTI.class_full_name + ']' ,'Название новой папки :',str) then begin
    dm.sqlc.ExecSQL('insert into source_classification (source_classification_id, name, is_mine, date_time_create) '+
                        ' values(:SCID,:NN,:ISM,:DT)',[PTI.class_id,str,is_mine,now]);
    id:=dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
    SetPanelClass(tag);
    PTI.dsu.Locate('id',id,[]);
    if ViewMode=3 then
      SetPanelClass(GetAnotherTag(tag));
  end;
end;

procedure TfmSourceList.mnDelClick(Sender: TObject);
var
  cnt_:integer;
  tag_, taga_:integer;
  PTI:TSourceListPanelTagInfo;
  id_, id_next_:longint;
begin
  tag:=GetFocusTag;
  PTI:=get_SLPTI(tag);
  if PTI.dsu['is_dir']=0 then begin // конечный источник
    if msgquestion(Format('Удалить источник [%s]?',[PTI.dsu['name']])) then begin
       cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from note_source where source_id='+inttostr(PTI.dsu['id']));
       if cnt_>0 then begin
         msgerror(Format('Нельзя удалять источник! К нему прикреплено %s заметок! Вначале удалите все заметки по этому источнику!',[inttostr(cnt_)]));
         exit
       end
       else
         id_:=PTI.dsu['id'];
         id_next_:=DM.get_ds_id_next(PTI.dsu);
         DM.sqlc.ExecSQL('delete from source_toc where source_id='+inttostr(id_));
         DM.sqlc.ExecSQL('delete from source_structure_item where source_id=:SID',[id_]);
         DM.sqlc.ExecSQL('delete from source_author where source_id='+inttostr(id_));
         DM.sqlc.ExecSQL('delete from source_url where source_id='+inttostr(id_));
         DM.sqlc.ExecSQL('delete from source_attach where source_id='+inttostr(id_));
         DM.sqlc.ExecSQL('delete from source_keyword where source_id='+inttostr(id_));
         DM.sqlc.ExecSQL('update telegram_fast_note set status=0 where status<>0 and telegram_message_id=(select telegram_message_id from source where id=:SID)',[id_]);
         DM.sqlc.ExecSQL('delete from source where id='+inttostr(id_));
         SetPanelClass(0);
         SetPanelClass(1);
         if id_next_>0 then
           PTI.dsu.Locate('id;is_dir',VarArrayOf([id_next_,0]),[]);
    end
  end

  else begin // папка
    id_:=PTI.dsu['id'];
    id_next_:=DM.get_ds_id_next(PTI.dsu);
    if msgquestion('Удалить папку ['+PTI.dsu['fullname']+']?') then begin
       if DM.sqlc.ExecSQLScalar('select count(*) from source where source_classification_id=:CC',[id_])>0 then begin
          msgerror('Нельзя удалять папку, за которой есть закрепленные '+source_proj[is_mine,2]+'!');
          exit;
       end;
       if DM.sqlc.ExecSQLScalar('select count(*) from source_classification where source_classification_id=:CC',[id_])>0 then begin
          msgerror('Нельзя удалять папку, за которой есть закрепленные папки!');
          exit;
       end;
       DM.sqlc.ExecSQL('delete from source_classification where id=:IID',[id_]);
       SetPanelClass(0);
       SetPanelClass(1);
       if id_next_>0 then
         PTI.dsu.Locate('id;is_dir',VarArrayOf([id_next_,1]),[]);
    end;
  end;


end;

procedure TfmSourceList.mnEditClick(Sender: TObject);
var
  PTI:TSourceListPanelTagInfo;
  str_:string;
  id:longint;
begin
  PTI:=get_SLPTI(GetFocusTag);
  if PTI.dsu['is_dir']=1 then begin
    str_:=PTI.dsu['fullname'];
    if inputstr('Редактирование данных','Исправленное название папки:',str_) then begin
      id:=PTI.dsu['id'];
      dm.sqlc.ExecSQL('update source_classification set name=:NN where id=:IID',[str_,id]);
      SetPanelClass(0);
      SetPanelClass(1);
      PTI.dsu.Locate('id;is_dir',VarArrayOf([id,1]),[]);
    end;
  end
  else
    DbgDblClick(sender)
end;

procedure TfmSourceList.mnMoveClick(Sender: TObject);
var
  id, id_next:longint;
  PTI:TSourceListPanelTagInfo;
begin
  if ViewMode<>3  then
    Exit;
  PTI:=get_SLPTI(GetFocusTag);
  if PTI.dsu['id']=-3 then  //  ...
  else if PTI.dsu['is_dir']=0 then begin // перемещение файла
      if PTI.class_id_a>=0 then begin // напротив реальный каталог
        if msgquestion('Переместить '+source_proj[is_mine,4]+' ['+PTI.dsu['fullname']+'] из папки ['+PTI.class_full_name+'] в папку ['+PTI.class_full_name_a+']?') then begin
           id:=PTI.dsu['id'];
           id_next:=DM.get_ds_id_next(PTI.dsu);
           DM.sqlc.ExecSQL('update source set source_classification_id=:NS where id=:NN',[PTI.class_id_a,id]);
           SetPanelClass(0);
           SetPanelClass(1);
           PTI.dsu_a.Locate('id',id,[]);
           if id_next>0 then
             PTI.dsu.Locate('id',id_next,[]);
        end;
      end;
  end
  else if (PTI.dsu['is_dir']=1) then begin // перемещение каталог
    if (PTI.class_id_a>=0) and (PTI.dsu['id']>0) then begin
        if msgquestion('Переместить папку ['+PTI.dsu['fullname']+'] из каталога ['+PTI.class_full_name+'] в каталог ['+PTI.class_full_name_a+']?') then begin
           id:=PTI.dsu['id'];
           id_next:=DM.get_ds_id_next(PTI.dsu);
           DM.sqlc.ExecSQL('update source_classification set source_classification_id=:NS where id=:NN',[PTI.class_id_a,id]);
           SetPanelClass(0);
           SetPanelClass(1);
           PTI.dsu_a.Locate('id;is_dir',VarArrayOf([id,1]),[]);
           if id_next>0 then
             PTI.dsu.Locate('id;is_dir',VarArrayOf([id_next,1]),[]);
        end;
    end;
  end;
end;

procedure TfmSourceList.mnSortByDateClick(Sender: TObject);
var
  tag:integer;
  PTI:TSourceListPanelTagInfo;
begin
  tag:=GetFocusTag;
  PTI:=get_SLPTI(tag);
  nsrt:=(sender as TMenuItem).tag;
  PTI.dsu.Close;
  PTI.fdq.SQL.Text:=format(self.sql_save,[tmp_table_array[is_mine,tag]]);
  PTI.fdq.SQL.Add(sort_array[nsrt]);
  SetPanelClass(tag);
  dm.Set_Ini_Int_Par(par_fname[is_mine]+par_sort,nsrt);
end;

procedure TfmSourceList.mnStatus0Click(Sender: TObject);
var
  status_:integer;
  tag_:integer;
  id_:longint;
  PTI:TSourceListPanelTagInfo;
begin
  status_:=(sender as TMenuItem).Tag;
  tag_:=GetFocusTag;
  PTI:=get_SLPTI(tag_);
  if PTI.dsu['is_dir']=1 then begin
    msgerror('Нельзя менять состояние у папки! Только у '+display_service.source_proj[is_mine,2]+'!');
  end
  else begin
    if PTI.dsu['status']<>status_ then begin
      id_:=PTI.dsu['id'];
      dm.sqlc.ExecSQL('update source set status=:SS where id=:SID',[status_,id_]);
      self.SetPanelClass(tag_);
      PTI.dsu.Locate('id;is_dir',VarArrayOf([id_,0]),[]);
      PTI.dsu.Next;
    end;
  end;

end;

procedure TfmSourceList.DsuAfterScroolHandle(DataSet_: TDataSet);
var
  cnt:integer;
  tag:integer;
  PTI:TSourceListPanelTagInfo;
begin
  tag:=DataSet_.tag;
  PTI:=get_SLPTI(tag);

        if dataSet_['is_dir']>0 then begin  // каталог
              if (PTI.dsu['id']=-1) or ((PTI.dsu['id']=-3) and (PTI.class_id=-1))  then begin  // все заметки
                PTI.gbPanel_a.Caption:='Инфо по всем '+display_service.source_proj[is_mine,5];
                PTI.mem_dir_a.Lines.Clear;
                cnt:=dm.sqlc.ExecSQLScalar('select count(*) from source where is_mine=:ISM',[self.is_mine]);
                PTI.mem_dir_a.Lines.add('');
                PTI.mem_dir_a.Lines.add('Всего '+display_service.source_proj[is_mine,1]+': '+inttostr(cnt));
              end
              else if PTI.dsu['id']=-3 then begin // шаг вверх
                PTI.gbPanel_a.Caption:='Инфо по ['+dm.sqlc.ExecSQLScalar('select name from source_classification where id=:II',[PTI.class_id])+']';
                dm.FillDirInfo(PTI.mem_dir_a.Lines,PTI.class_id, is_mine);
              end
              else begin // реальный каталог
                PTI.mem_dir_a.Lines.Clear;
                PTI.gbPanel_a.Caption:='Инфо по папке ['+DataSet_['fullname']+']';
                dm.FillDirInfo(PTI.mem_dir_a.Lines,dataset_['id'],is_mine);
              end;
        end
        else begin
          PTI.mem_dir_a.Lines.Clear;
          PTI.gbPanel_a.Caption:='Инфо по '+display_service.source_proj[is_mine,6];
          PTI.mem_dir_a.lines.add('Название: '+DataSet_['name']);
          PTI.mem_dir_a.lines.add('');
          if is_mine=0 then
            PTI.mem_dir_a.lines.add('Авторы: '+dm.get_source_authors(dataSet_['id']));
          PTI.mem_dir_a.lines.add('Тип: '+dm.get_source_type(dataSet_['id']));
          PTI.mem_dir_a.lines.add('Состояние: '+dm.get_work_status(dataSet_['status']));
          PTI.mem_dir_a.lines.add(dm.get_source_keywords(dataSet_['id']));
          PTI.mem_dir_a.lines.add('');
          PTI.mem_dir_a.lines.add('ИТОГО:');
          PTI.mem_dir_a.lines.add('  заметок: '+int2str(dm.sqlc.ExecSQLScalar('select count(*) from note_source where source_id=:SID',[dataSet_['id']])));
          PTI.mem_dir_a.lines.add('  элементов оглавления: '+int2str(dm.sqlc.ExecSQLScalar('select count(*) from source_toc where source_id=:SID',[dataSet_['id']])));
          PTI.mem_dir_a.lines.add('  WEB-ссылок: '+int2str(dm.sqlc.ExecSQLScalar('select count(*) from source_url where source_id=:SID',[dataSet_['id']])));
          PTI.mem_dir_a.lines.add('  присоединенных файлов: '+int2str(dm.sqlc.ExecSQLScalar('select count(*) from source_attach where source_id=:SID',[dataSet_['id']])));
        end;
end;


procedure TfmSourceList.pmMainPopup(Sender: TObject);
var
  PTI:TSourceListPanelTagInfo;
begin
  PTI:=get_SLPTI(GetFocusTag);

  SetMenuItemActive(mnMove,not ViewMaximized and (ViewMode=3));
  SetMenuItemActive(mnChooseTheSame,PTI.class_id>=0);

  if is_mine=1 then begin
    mnSortAuthor.Visible:=false;
    mnSortAuthorDesc.Visible:=false;
  end;
  if null2int(PTI.dsu['is_dir'])=1 then begin
    SetMenuItemActive(mnChangeStatus,false);
    SetMenuItemActive(mnStatus0,false);
    SetMenuItemActive(mnStatus1,false);
    SetMenuItemActive(mnStatus3,false);
  end
  else begin
    SetMenuItemActive(mnChangeStatus);
    SetMenuItemActive(mnStatus0);
    SetMenuItemActive(mnStatus1);
    SetMenuItemActive(mnStatus3);
    self.mnStatus0.Checked:=false;
    self.mnStatus1.Checked:=false;
    self.mnStatus3.Checked:=false;
    case null2int(PTI.dsu['status']) of
    0: self.mnStatus0.Checked:=true;
    1: self.mnStatus1.Checked:=true;
    3: self.mnStatus3.Checked:=true;
    end;
  end;

  mnSortByDate.Checked:=false;
  mnSortByDateDesc.Checked:=false;
  mnSortByName.Checked:=false;
  mnSortByNameDesc.Checked:=false;
  mnSortAuthor.Checked:=false;
  mnSortAuthorDesc.Checked:=false;
  mnSortState.Checked:=false;
  mnSortStateDesc.Checked:=false;

  case nsrt of
  0:mnSortByDate.Checked:=true;
  1:mnSortByDateDesc.Checked:=true;
  2:mnSortByName.Checked:=true;
  3:mnSortByNameDesc.Checked:=true;
  4:mnSortAuthor.Checked:=true;
  5:mnSortAuthorDesc.Checked:=true;
  6:mnSortState.Checked:=true;
  7:mnSortStateDesc.Checked:=true;
  end;
end;

function TfmSourceList.get_SLPTI(tag_:integer):TSourceListPanelTagInfo;
var
  PTI:TSourceListPanelTagInfo;
begin
  PTI:=TSourceListPanelTagInfo.Create;
  inherited GetTagPTI(tag_,PTI as TPanelTagInfo);
  if tag_=0 then begin
    PTI.fdq:=self.fdqLeftSource;
    (PTI as TSourceListPanelTagInfo).fdq_a:=self.fdqRightSource;
    (PTI as TSourceListPanelTagInfo).mem_dir:=self.memLeftDir;
    (PTI as TSourceListPanelTagInfo).mem_dir_a:=self.memRightDir;
  end
  else begin
    (PTI as TSourceListPanelTagInfo).fdq_a:=self.fdqLeftSource;
    (PTI as TSourceListPanelTagInfo).fdq:=self.fdqRightSource;
    (PTI as TSourceListPanelTagInfo).mem_dir_a:=self.memLeftDir;
    (PTI as TSourceListPanelTagInfo).mem_dir:=self.memRightDir;

  end;
  Result:=PTI;
end;

procedure TfmSourceList.SetPanelClassAddAction(tag_:integer);
var
  id:longint;
  rclass:longint;
  PTI:TSourceListPanelTagInfo;
begin
  PTI:=get_SLPTI(tag_);

  fill_tmp_sources(tag_);
  if PTI.fdq.active then
    PTI.fdq.refresh
  else begin
    //PTI.fdq.SQL.Text:=format(self.sql_save,[tmp_table_array[tag_]]);
    PTI.fdq.open;
  end;
  if PTI.dsu.active then
    PTI.dsu.Refresh
  else
    PTI.dsu.open;

end;


procedure TfmSourceList.dbgLeftSourceListColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds:tDataSet;
begin
  ds:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds.RecordCount=0 then
    Exit;

  if ds['is_dir']=1 then begin // каталог
     if ds['id']=-3 then
       Params.ImageIndex := -1
     else if ds['id']=-1 then begin
        Params.ImageIndex := 3;
     end
     else begin
       Params.ImageIndex := 0;
     end;
  end
  else begin
    Params.ImageIndex:=get_source_picture(is_mine,null2int(ds['source_type_id']));

    case ds['status'] of
    0: if not(gdSelected in Params.State) then
          Params.Font.Color:=dm.Get_Ini_Int_Par('Color_SLNotRead',clRed) // $00008b;  // не начата
       else
          Params.Font.Color:=clWhite-dm.Get_Ini_Int_Par('Color_SLNotRead',clRed);
    1: if not(gdSelected in Params.State) then
         Params.Font.Color:=dm.Get_Ini_Int_Par('Color_SLInProcess',clBlue)//$123524;  // в процессе
       else
         Params.Font.Color:=clWhite-dm.Get_Ini_Int_Par('Color_SLInProcess',clBlue)//$123524;  // в процессе
    end;

  end;



end;

procedure TfmSourceList.DbgDblClick(Sender: TObject);
var
  dsv:integer;
  old_class, new_id:longint;
  tag:integer;
  PTI:TSourceListPanelTagInfo;
begin
  if sender.ToString='TMenuItem' then
    tag:=GetFocusTag
  else
    tag:=(sender as TDBGridEh).tag;
  PTI:=get_SLPTI(tag);

  new_id:=null2int(PTI.dsu['id']);
  if PTI.dsu['is_dir']=0 then begin // ИСТОЧНИК
    if is_mine=0 then begin
      if fmSourceEdit<>nil then begin
        fmSourceEdit.Close;
        Application.ProcessMessages;
      end;
      fmSourceEdit:=TfmSourceEdit.CreateWithData(PTI.dsu['id'],0,is_mine,DBEdit,fmmain);
      fmSourceEdit.show;
    end
    else begin
      if fmProjectEdit<>nil then begin
        fmProjectEdit.Close;
        Application.ProcessMessages;
      end;
      fmProjectEdit:=TfmSourceEdit.CreateWithData(PTI.dsu['id'],0,is_mine,DBEdit,fmmain);
      fmProjectEdit.show;
    end;
  end
  else begin // папка
    old_class:=PTI.class_id;
    if PTI.dsu['id']=-3 then begin // ...
      ClassUp(sender);
      Exit;
    end
    else begin
      if (PTI.dsu['id']=-1) and (ViewMode=3) then // все заметки
        SetViewMode(tag,false);
      SetPanelClass(tag,PTI.dsu['id']);
      DsuAfterScroll(PTI.dsu);

    end;
    //ClassEnter(tag,old_class,new_id);

  end;
  PTI.dbg.SearchPanel.Enabled:=new_id=-1;
end;


procedure TfmSourceList.fill_tmp_sources(tag_:integer);
var
  PTI:TSourceListPanelTagInfo;
begin
   PTI:=get_SLPTI(tag_);
   dm.sqlc.ExecSQL('delete from '+tmp_table_array[is_mine,tag_]);
   FDQTmpSourceFill.sql.Text:=format(self.sql_prepare_save,[tmp_table_array[is_mine,tag_],display_service.source_proj[is_mine,3]]);
   lcb.log(FDQTmpSourceFill.sql.Text);
   FDQTmpSourceFill.Params.ParamValues['ISM']:=is_mine;
   FDQTmpSourceFill.Params.ParamValues['STID']:=PTI.class_id;
   FDQTmpSourceFill.Execute;
end;

function TfmSourceList.GetClassClassId(class_id_:longint):longint;
begin
  result:=null2int(dm.sqlc.ExecSQLScalar('select source_classification_id from source_classification where id=:KID',[class_id_]));
end;

function TfmSourceList.GetClassNameFull(class_id_:longint):string;
begin
  Result:=dm.get_source_full_root(class_id_);
end;


function TfmSourceList.GetClassName(class_id_:longint):string;
begin
  Result:=dm.sqlc.ExecSQLScalar('select name from source_classification where id=:II',[class_id_]);
end;



end.
