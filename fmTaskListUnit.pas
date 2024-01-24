unit fmTaskListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, aliasform, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls;

type
  TfmTaskList = class(TForm)
    dbgTask: TDBGridEh;
    fdqTask: TFDQuery;
    dsTask: TDataSource;
    fdqTaskid: TFDAutoIncField;
    fdqTaskname: TWideMemoField;
    fdqTaskcontent: TWideMemoField;
    fdqTasktype_: TIntegerField;
    fdqTaskdeadline: TDateTimeField;
    fdqTaskdate_time_create: TDateTimeField;
    fdqTaskstatus: TIntegerField;
    fdqTaskdate_time_close: TDateTimeField;
    pmTask: TPopupMenu;
    mnInsert: TMenuItem;
    fdqTasktask_id: TIntegerField;
    fdqTaskpname: TWideMemoField;
    mnDel: TMenuItem;
    pnTop: TPanel;
    lbFiltrStatus: TLabel;
    dbcFiltrStatus: TDBComboBoxEh;
    mnSort: TMenuItem;
    N2: TMenuItem;
    mnByID: TMenuItem;
    mnByIDDesc: TMenuItem;
    mnByProj: TMenuItem;
    mnByProjDesc: TMenuItem;
    fdqTaskptname: TWideMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnInsertClick(Sender: TObject);
    procedure dbgTaskDblClick(Sender: TObject);
    procedure dbgTaskKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnDelClick(Sender: TObject);
    procedure dbcFiltrStatusChange(Sender: TObject);
    procedure mnByIDClick(Sender: TObject);
    procedure pmTaskPopup(Sender: TObject);
  private
    { Private declarations }
    sql_save:string;
    nsrt, filter_index:integer;
    procedure RecreateSQLAndReopen;
  public
    { Public declarations }
  end;

var
  fmTaskList: TfmTaskList;

implementation

{$R *.dfm}

uses
  extend_data, extend_dialog,lcb_unit,
  fmTaskEditUnit, fmMainUnit, dmDataUnit, display_service;

const
    sort_array:array[0..3] of string=('order by id', 'order by id desc',
                                      'order by (select GROUP_CONCAT(distinct source_fullname_by_id(tp.source_id,1)) from task_source tp where task_id=task.id and is_mine=1)',
                                      'order by (select GROUP_CONCAT(distinct source_fullname_by_id(tp.source_id,1)) from task_source tp where task_id=task.id and is_mine=1) desc');


procedure TfmTaskList.RecreateSQLAndReopen;
begin
  fdqTask.Close;
  case filter_index of
  0:fdqTask.SQL.Text:=sql_save;
  3:fdqTask.SQL.Text:=sql_save+' where status in (0,1)';
  else
    fdqTask.SQL.Text:=sql_save+' where status='+dbcFiltrStatus.KeyItems[filter_index]
  end;
  fdqTask.SQL.Add(sort_array[nsrt]);
  LCB.LOG(fdqTask.SQL.text);
  fdqTask.Open;

end;


procedure TfmTaskList.dbcFiltrStatusChange(Sender: TObject);
begin
  filter_index:=dbcFiltrStatus.ItemIndex;
  RecreateSQLAndReopen;
  dm.Set_Ini_Int_Par(alias+par_filter,dbcFiltrStatus.ItemIndex);

end;

procedure TfmTaskList.dbgTaskDblClick(Sender: TObject);
begin
  if fdqTask.RecordCount>0 then begin
    fmTaskEdit:=TfmTaskEdit.CreateWithData(fdqTask['id'],0,dbEdit,fmmain);
    fmTaskEdit.Show;
  end;
end;

procedure TfmTaskList.dbgTaskKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then begin
    dbgTaskDblClick(sender);
    exit;
  end;

end;

procedure TfmTaskList.FormActivate(Sender: TObject);
begin
  if fdqTask.Active then
    fdqTask.Refresh
end;

procedure TfmTaskList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmTaskList:=nil
end;

procedure TfmTaskList.FormCreate(Sender: TObject);
begin
  sql_save:=fdqTask.sql.Text;
  dbcFiltrStatus.ItemIndex:=dm.Get_Ini_Int_Par(alias+par_filter,0);
  nsrt:=dm.Get_Ini_Int_Par(alias+par_sort,0);


end;

procedure TfmTaskList.mnByIDClick(Sender: TObject);
begin
  nsrt:=(sender as TMenuItem).tag;
  DM.Set_Ini_Int_Par(alias+par_sort,nsrt);
  RecreateSQLAndReopen;

end;

procedure TfmTaskList.mnDelClick(Sender: TObject);
begin
  if msgquestion(format('Удалить задачу [%s] по проекту [%s]?',[fdqTask['name'],null2str(fdqTask['pname'])])) then begin
    dm.sqlc.ExecSQL('delete from task_source where task_id=:TID and is_mine=1',[fdqTask['id']]);
    dm.sqlc.ExecSQL('delete from task where id=:TID',[fdqTask['id']]);
    fdqTask.Refresh;
  end;


end;

procedure TfmTaskList.mnInsertClick(Sender: TObject);
begin
  fmTaskEdit:=TfmTaskEdit.CreateWithData(0,0,dbInsert,fmmain);
  fmTaskEdit.Show;
end;

procedure TfmTaskList.pmTaskPopup(Sender: TObject);
begin
    mnByID.Checked:=false;
    mnByIDDesc.Checked:=false;
    mnByProj.Checked:=false;
    mnByProjDesc.Checked:=false;
    case nsrt of
    0:mnByID.Checked:=true;
    1:mnByIDDesc.Checked:=true;
    2:mnByProj.Checked:=true;
    3:mnByProjDesc.Checked:=true;
    end;

end;

end.
