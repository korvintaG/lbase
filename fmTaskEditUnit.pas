unit fmTaskEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  aliasform, extend_data, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBCtrlsEh, Vcl.StdCtrls, Vcl.Mask,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls,
  DBLookupEh;

type
  TfmTaskEdit = class(TForm)
    fdqTask: TFDQuery;
    dsTask: TDataSource;
    dbeName: TDBEditEh;
    dbmContent: TDBMemoEh;
    fdqTaskid: TFDAutoIncField;
    fdqTaskname: TWideMemoField;
    fdqTaskcontent: TWideMemoField;
    fdqTasktype_: TIntegerField;
    fdqTaskdeadline: TDateTimeField;
    fdqTaskdate_time_create: TDateTimeField;
    fdqTaskstatus: TIntegerField;
    fdqTaskdate_time_close: TDateTimeField;
    fdqTasktask_id: TIntegerField;
    lbName: TLabel;
    lbContent: TLabel;
    dbgNoteSource: TDBGridEh;
    fdqTaskProject: TFDQuery;
    fdqTaskProjectsourcename: TWideMemoField;
    dsTaskProject: TDataSource;
    fdqTaskProjectid: TFDAutoIncField;
    fdqTaskProjecttask_id: TIntegerField;
    pmTaskProject: TPopupMenu;
    mnNoteSourceAdd: TMenuItem;
    mnNoteSourceDel: TMenuItem;
    mnGotoSource: TMenuItem;
    fdqTaskProjectsource_id: TIntegerField;
    fdqTaskProjectstoc_id: TIntegerField;
    fdqTaskProjectstocname: TWideMemoField;
    dbdDeadLine: TDBDateTimeEditEh;
    lbDeadLine: TLabel;
    dbcStatus: TDBComboBoxEh;
    lbStatus: TLabel;
    dbdClose: TDBDateTimeEditEh;
    pcMainTaskEdit: TPageControl;
    tsGeneral: TTabSheet;
    btOk: TButton;
    pnBottom: TPanel;
    pnTop: TPanel;
    tsChilds: TTabSheet;
    dbltask_id: TDBLookupComboboxEh;
    lbParent: TLabel;
    fdqTaskList: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideMemoField1: TWideMemoField;
    WideMemoField2: TWideMemoField;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField2: TIntegerField;
    DateTimeField3: TDateTimeField;
    IntegerField3: TIntegerField;
    dsTaskList: TDataSource;
    fdqTaskListname_pname: TWideMemoField;
    DBGridEh1: TDBGridEh;
    fdqTaskChild: TFDQuery;
    fdqTaskChildid: TFDAutoIncField;
    fdqTaskChildname: TWideMemoField;
    fdqTaskChildcontent: TWideMemoField;
    fdqTaskChildtype_: TIntegerField;
    fdqTaskChilddeadline: TDateTimeField;
    fdqTaskChilddate_time_create: TDateTimeField;
    fdqTaskChildstatus: TIntegerField;
    fdqTaskChilddate_time_close: TDateTimeField;
    fdqTaskChildtask_id: TIntegerField;
    fdqTaskChildpname: TWideMemoField;
    dsTaskChild: TDataSource;
    pmChildTask: TPopupMenu;
    mnChildAdd: TMenuItem;
    mnChildDetach: TMenuItem;
    tsKeyword: TTabSheet;
    dbgKeyword: TDBGridEh;
    fdqKeyword: TFDQuery;
    dsKeyword: TDataSource;
    fdqKeywordid: TFDAutoIncField;
    fdqKeywordkeyword_name_id: TIntegerField;
    fdqKeywordkeyword_id: TIntegerField;
    fdqKeywordname: TWideMemoField;
    fdqKeywordclass_name_after: TWideMemoField;
    pmKeyword: TPopupMenu;
    mnKWAdd: TMenuItem;
    tsSource: TTabSheet;
    DBGridEh2: TDBGridEh;
    fdqTaskSource: TFDQuery;
    WideMemoField3: TWideMemoField;
    FDAutoIncField2: TFDAutoIncField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    WideMemoField4: TWideMemoField;
    dsTaskSource: TDataSource;
    pmTaskSource: TPopupMenu;
    mnSourceAdd: TMenuItem;
    mnSourceDel: TMenuItem;
    mnSourceGoto: TMenuItem;
    fdqKeywordkeyword_use_count: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure mnNoteSourceAddClick(Sender: TObject);
    procedure mnNoteSourceDelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbcStatusChange(Sender: TObject);
    procedure mnChildAddClick(Sender: TObject);
    procedure mnKWAddClick(Sender: TObject);
    procedure mnSourceAddClick(Sender: TObject);
    procedure mnSourceDelClick(Sender: TObject);
    procedure dbgKeywordColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
    task_id,class_task_id:longint;
    sql_save:string;
    DBMode:TDBMode;
    is_creating:boolean;
    procedure SetCaption;
    procedure RefreshdataSet;
  public
    { Public declarations }
    constructor CreateWithData(task_id_, class_task_id_:longint;DBMode_:TDBMode;AOwner: TComponent);

  end;

var
  fmTaskEdit: TfmTaskEdit;

implementation

{$R *.dfm}

uses dmDataUnit,
     extend_dialog, data_service, display_service,
     fmmainunit;


procedure TfmTaskEdit.SetCaption;
begin
  if task_id>0 then begin
    Caption:='Редактирование задачи c ID='+inttostr(task_id);
    if fdqTask.Active then
      if fdqTask['date_time_create']<>null then
        Caption:=Caption+' от '+DateTimeToStr(fdqTask['date_time_create'])
  end
  else begin
    caption:='Создание новой задачи';
  end;

end;

procedure TfmTaskEdit.RefreshdataSet;
begin
  if fdqTaskProject.Active then
    fdqTaskProject.Close;
  fdqTaskProject.Params.ParamValues['NID']:=task_id;
  fdqTaskProject.Open();

  if fdqTaskSource.Active then
    fdqTaskSource.Close;
  fdqTaskSource.Params.ParamValues['NID']:=task_id;
  fdqTaskSource.Open();


  if fdqTaskChild.Active then
    fdqTaskProject.Close;
  fdqTaskChild.Params.ParamValues['TID']:=task_id;
  fdqTaskChild.Open();

  if fdqKeyword.Active then
    fdqKeyword.Close;
  fdqKeyword.Params.ParamValues['TID']:=task_id;
  fdqKeyword.Open();


end;



procedure TfmTaskEdit.btOkClick(Sender: TObject);
var
  old_state:TDataSetState;
begin
  old_state:=fdqtask.State;
  if fdqtask.State in [dsInsert, dsEdit] then
    fdqtask.Post;
  task_id:=fdqtask['id'];
  if old_state=data.DB.TDataSetState.dsInsert then begin
    dbgNoteSource.Visible:=true;
    btOK.Caption:='Сохранить и закрыть';
    SetCaption;
    RefreshdataSet
  end
  else
    close;
end;

constructor TfmTaskEdit.CreateWithData(task_id_,class_task_id_:longint;DBMode_:TDBMode;AOwner: TComponent);
begin
  task_id:=task_id_;
  class_task_id:=class_task_id_;
  DBMode:=DBMode_;
  inherited CreateWithAlias(AOwner,'fmTaskEdit'+inttostr(task_id));


end;

procedure TfmTaskEdit.dbcStatusChange(Sender: TObject);
begin
  if not is_creating then begin
    if (dbcStatus.KeyItems[dbcStatus.ItemIndex]='3') or (dbcStatus.KeyItems[dbcStatus.ItemIndex]='2') then
      fdqTask['date_time_close']:=now
    else
      fdqTask['date_time_close']:=null
  end;
end;

procedure TfmTaskEdit.dbgKeywordColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds_.RecordCount>0 then
    Params.ImageIndex :=get_keyword_picture(ds_['keyword_use_count']);
end;

procedure TfmTaskEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmTaskEdit:=nil
end;


procedure TfmTaskEdit.FormCreate(Sender: TObject);
begin
  is_creating:=true;
  fdqTaskList.Open();
  sql_save:=fdqTask.SQL.Text;
  if dbmode=dbInsert then begin
    fdqTask.open;
    fdqTask.insert;
    task_id:=0;
    fdqTask['type_']:=0;
    fdqTask['status']:=0;
    fdqTask['task_id']:=class_task_id;
    fdqTask['date_time_create']:=now;
    btOK.Caption:='Сохранить и продолжить';
    dbgNoteSource.Visible:=false;
  end
  else begin
    fdqTask.SQL.Add('where id='+inttostr(task_id));
    fdqTask.open;
    RefreshDataSet;

  end;
  SetCaption;
  FormResize(sender);
  is_creating:=false;


end;

procedure TfmTaskEdit.FormResize(Sender: TObject);
begin
  dbeName.Width:=self.clientwidth-dbeName.Left-10;
  dbmContent.Width:=self.clientwidth-dbmContent.Left-10;
  dbgNoteSource.Width:=self.clientwidth-dbgNoteSource.Left-10;
end;

procedure TfmTaskEdit.mnChildAddClick(Sender: TObject);
begin
  if msgquestion('Создать новую дочернюю задачу?') then begin
    PostMessage(handle, WM_GOTO_TASK, 0, task_id);
    close;
  end;

end;

procedure TfmTaskEdit.mnKWAddClick(Sender: TObject);
var
  id_,name_id_: longint;
begin
     if getKeyword(id_,name_id_,self,'Назначение ключевого слова на задачу ['+fdqTask['name']+']',
       'Выберете ключевое слово:','Закрепить тэг за задачей',
       ' select * from (Select %s as name, kwn.id kw_name_id, k.id kw_id from keyword_name kwn, keyword k '+
       ' where k.id=kwn.keyword_id and k.id not in '+
       ' (select keyword_id from task_keyword where task_id='+inttostr(task_id)+')) order by ru_lower(name)',
       true,
       'Введите новое ключевое слово:','Закрепить новый тзг за задачей'
       )
     then begin
      dm.sqlc.ExecSQL('insert into task_keyword (task_id, keyword_id, keyword_name_id) values(:SID,:KID,:KWN)',
        [task_id,id_,name_id_]);
      fdqKeyword.Refresh;
     end;

end;

procedure TfmTaskEdit.mnNoteSourceAddClick(Sender: TObject);
var
  source_id,stoc_id:longint;
begin
  source_id:=0;stoc_id:=0;
  if GetSTOC(source_id,stoc_id,1) then begin
    dm.sqlc.ExecSQL('insert into task_source(task_id, source_id, stoc_id, is_mine) values(:TT,:SS,:ST,1)',[task_id,source_id,stoc_id]);
    fdqTaskProject.Refresh
  end;
end;

procedure TfmTaskEdit.mnNoteSourceDelClick(Sender: TObject);
begin
  if msgquestion(format('Удалить задачу из проекта [%s]?',[fdqTaskProject['sourcename']])) then
    fdqTaskProject.Delete

end;

procedure TfmTaskEdit.mnSourceAddClick(Sender: TObject);
var
  source_id,stoc_id:longint;
begin
  source_id:=0;stoc_id:=0;
  if GetSTOC(source_id,stoc_id,0) then begin
    dm.sqlc.ExecSQL('insert into task_source(task_id, source_id, stoc_id, is_mine) values(:TT,:SS,:ST,0)',[task_id,source_id,stoc_id]);
    fdqTaskSource.Refresh
  end;

end;

procedure TfmTaskEdit.mnSourceDelClick(Sender: TObject);
begin
  if msgquestion(format('Удалить источник [%s] для текущей задачи?',[fdqTaskSource['sourcename']])) then
    fdqTaskSource.Delete

end;

end.
