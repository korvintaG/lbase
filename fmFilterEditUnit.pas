unit fmFilterEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  dmDataUnit, fmFilterUnit,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.ComCtrls, Vcl.StdCtrls, DBCtrlsEh, Vcl.Mask, Vcl.ExtCtrls;

const
  source_sort_array:array[0..1] of string=('order by id','order by ru_lower(name)');


type
  TfmFilterEdit = class(TForm)
    pnTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeName: TDBEditEh;
    dbcUseType: TDBComboBoxEh;
    dbcActive: TDBCheckBoxEh;
    btSave: TButton;
    dbcArea: TDBComboBoxEh;
    pcMain: TPageControl;
    tsAuthor: TTabSheet;
    dbgAuthor: TDBGridEh;
    tsSource: TTabSheet;
    dbgSource: TDBGridEh;
    tsKW: TTabSheet;
    pnBottom: TPanel;
    dbgKWIer: TDBGridEh;
    pnListTop: TPanel;
    lbRoot: TLabel;
    btUp: TButton;
    tsInt: TTabSheet;
    Panel1: TPanel;
    dbgInt: TDBGridEh;
    Panel2: TPanel;
    lbRootI: TLabel;
    btUpI: TButton;
    tsProject: TTabSheet;
    dbgProject: TDBGridEh;
    fdqKeywordIer: TFDQuery;
    fdqKeywordIerid: TFDAutoIncField;
    fdqKeywordIerclass_keyword_id: TIntegerField;
    fdqKeywordIerdate_time_create: TDateTimeField;
    fdqKeywordIerin_filter: TIntegerField;
    fdqKeywordIeris_dir: TWideMemoField;
    fdqKeywordIername_main: TWideMemoField;
    dsKeywordIer: TDataSource;
    fdqAuthor: TFDQuery;
    fdqAuthorid: TFDAutoIncField;
    fdqAuthorname: TWideMemoField;
    fdqAuthordate_time_create: TDateTimeField;
    fdqAuthorin_filter: TIntegerField;
    dsAuthor: TDataSource;
    fdqSource: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    WideMemoField1: TWideMemoField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    dsSource: TDataSource;
    pmSource: TPopupMenu;
    mnSourceSortDate: TMenuItem;
    mnSourceSortName: TMenuItem;
    fdqInterest: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    WideMemoField2: TWideMemoField;
    DateTimeField2: TDateTimeField;
    IntegerField3: TIntegerField;
    WideMemoField3: TWideMemoField;
    fdqInterestclass_interest_id: TIntegerField;
    dsInterest: TDataSource;
    fdqProject: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    WideMemoField4: TWideMemoField;
    DateTimeField3: TDateTimeField;
    IntegerField2: TIntegerField;
    dsProject: TDataSource;
    pmProject: TPopupMenu;
    mnProjectSortDate: TMenuItem;
    mnProjectSortName: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mnProjectSortDateClick(Sender: TObject);
    procedure mnSourceSortDateClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btUpClick(Sender: TObject);
    procedure btUpIClick(Sender: TObject);
    procedure dbcAreaCloseUp(Sender: TObject; Accept: Boolean);
    procedure dbgAuthorDblClick(Sender: TObject);
    procedure dbgAuthorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgKWIerDblClick(Sender: TObject);
    procedure dbgKWIerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgProjectDblClick(Sender: TObject);
    procedure dbgProjectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgIntDblClick(Sender: TObject);
    procedure dbgIntKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgSourceDblClick(Sender: TObject);
    procedure dbgSourceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    source_sql_save:ansistring;
    project_sql_save:ansistring;
    source_sort_index:integer;
    class_id:longint;
    procedure toggleKW;
    procedure toggleAuthor;
    procedure toggleSource;
    procedure toggleProject;
    procedure toggleInterest;
    procedure kw_unmark_sublevel(kwid_:integer);
    procedure interest_unmark_sublevel(kwid_:integer);
    procedure SetNessTabs;
  public
    { Public declarations }
    procedure SetClassKW(clid_:longint);
    procedure SetClassInterest(clid_:longint);
  end;

var
  fmFilterEdit: TfmFilterEdit;

implementation

{$R *.dfm}

uses extend_data, extend_dialog;



procedure TfmFilterEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmFilterEdit:=nil;
end;

procedure TfmFilterEdit.kw_unmark_sublevel(kwid_:integer);
var
  fdq:TFdquery;
begin
  if DM.sqlc.ExecSQLScalar('select count(*) from keyword where class_keyword_id=:KID',[kwid_])>0 then begin
      DM.sqlc.ExecSQL('delete from filter_keyword where filter_id=:FID '+
                          ' and keyword_id in (select id from keyword where class_keyword_id=:KID)',
                          [fmfilter.fdqFilter['id'],kwid_]);
      fdq:=TFdquery.Create(nil);
      fdq.Connection:=DM.sqlc;
      fdq.SQL.Text:='select id from keyword where class_keyword_id='+inttostr(kwid_);
      fdq.Open();
      while not fdq.eof do begin
        kw_unmark_sublevel(fdq['id']);
        fdq.Next;
      end;
      fdq.Close;
      fdq.Free;
  end;

end;

procedure TfmFilterEdit.interest_unmark_sublevel(kwid_:integer);
var
  fdq:TFdquery;
begin
  if dm.sqlc.ExecSQLScalar('select count(*) from interest where class_interest_id=:KID',[kwid_])>0 then begin
      dm.sqlc.ExecSQL('delete from filter_interest where filter_id=:FID '+
                          ' and interest_id in (select id from interest where class_interest_id=:KID)',
                          [fmfilter.fdqFilter['id'],kwid_]);
      fdq:=TFdquery.Create(nil);
      fdq.Connection:=dm.sqlc;
      fdq.SQL.Text:='select id from interest where class_interest_id='+inttostr(kwid_);
      fdq.Open();
      while not fdq.eof do begin
        interest_unmark_sublevel(fdq['id']);
        fdq.Next;
      end;
      fdq.Close;
      fdq.Free;
  end;
end;

procedure TfmFilterEdit.mnProjectSortDateClick(Sender: TObject);
begin
  source_sort_index:=(sender as TMenuItem).tag;
  fdqProject.Close;
  fdqProject.SQL.Text:=self.project_sql_save;
  fdqProject.SQL.Add(source_sort_array[source_sort_index]);
  fdqProject.open;

end;

procedure TfmFilterEdit.mnSourceSortDateClick(Sender: TObject);
begin
  source_sort_index:=(sender as TMenuItem).tag;
  fdqSource.Close;
  fdqSource.SQL.Text:=self.source_sql_save;
  fdqSource.SQL.Add(source_sort_array[source_sort_index]);
  fdqSource.open;
end;


procedure TfmFilterEdit.toggleKW;
begin
   case fdqKeywordIer['in_filter'] of
    1: begin // была пометка, сбрасываем
      DM.sqlc.ExecSQL('delete from filter_keyword where filter_id=:FID and  keyword_id=:KID',
         [fmfilter.fdqFilter['id'],fdqKeywordIer['id']]);
      kw_unmark_sublevel(fdqKeywordIer['id']);
      fdqKeywordIer.Refresh;
    end;
    0,-1: begin // как 0 обрабатываем
      DM.sqlc.ExecSQL('insert into filter_keyword (filter_id, keyword_id) values(:FID, :KID)',
         [fmfilter.fdqFilter['id'],fdqKeywordIer['id']]);
      kw_unmark_sublevel(fdqKeywordIer['id']);
      fdqKeywordIer.Refresh;
    end;
   end;
end;

procedure TfmFilterEdit.toggleInterest;
begin
   case fdqInterest['in_filter'] of
    1: begin // была пометка, сбрасываем
      DM.sqlc.ExecSQL('delete from filter_interest where filter_id=:FID and  interest_id=:KID',
         [fmfilter.fdqFilter['id'],fdqInterest['id']]);
      interest_unmark_sublevel(fdqInterest['id']);
      fdqInterest.Refresh;
    end;
    0,-1: begin // как 0 обрабатываем
      DM.sqlc.ExecSQL('insert into filter_interest (filter_id, interest_id) values(:FID, :KID)',
         [fmfilter.fdqFilter['id'],fdqInterest['id']]);
      interest_unmark_sublevel(fdqInterest['id']);
      fdqInterest.Refresh;
    end;
   end;
end;


procedure TfmFilterEdit.toggleAuthor;
begin
   case fdqAuthor['in_filter'] of
    1: begin // была пометка, сбрасываем
      DM.sqlc.ExecSQL('delete from filter_author where filter_id=:FID and  Author_id=:AID',
         [fmfilter.fdqFilter['id'],fdqAuthor['id']]);
      fdqAuthor.Refresh;
    end;
    0,-1: begin // как 0 обрабатываем
      DM.sqlc.ExecSQL('insert into filter_author (filter_id, author_id) values(:FID, :AID)',
         [fmfilter.fdqFilter['id'],fdqAuthor['id']]);
      fdqAuthor.Refresh;
    end;
   end;
end;


procedure TfmFilterEdit.toggleSource;
begin
   case fdqSource['in_filter'] of
    1: begin // была пометка, сбрасываем
      DM.sqlc.ExecSQL('delete from filter_source where filter_id=:FID and  Source_id=:SID',
         [fmfilter.fdqFilter['id'],fdqSource['id']]);
      fdqSource.Refresh;
    end;
    0,-1: begin // как 0 обрабатываем
      DM.sqlc.ExecSQL('insert into filter_source (filter_id, source_id) values(:FID, :SID)',
         [fmfilter.fdqFilter['id'],fdqSource['id']]);
      fdqSource.Refresh;
    end;
   end;
end;


procedure TfmFilterEdit.toggleProject;
begin
   case fdqProject['in_filter'] of
    1: begin // была пометка, сбрасываем
      DM.sqlc.ExecSQL('delete from filter_project where filter_id=:FID and  project_id=:SID',
         [fmfilter.fdqFilter['id'],fdqProject['id']]);
      fdqProject.Refresh;
    end;
    0,-1: begin // как 0 обрабатываем
      DM.sqlc.ExecSQL('insert into filter_project (filter_id, project_id) values(:FID, :SID)',
         [fmfilter.fdqFilter['id'],fdqProject['id']]);
      fdqProject.Refresh;
    end;
   end;
end;

procedure TfmFilterEdit.btSaveClick(Sender: TObject);
begin
  if fmfilter.fdqFilter.State in [dsEdit] then
    fmfilter.fdqFilter.Post;
  close

end;

procedure TfmFilterEdit.btUpClick(Sender: TObject);
begin
     SetClassKW(null2int(DM.sqlc.ExecSQLScalar('select class_keyword_id from keyword where id=:KID',[class_id])));
end;


procedure TfmFilterEdit.btUpIClick(Sender: TObject);
begin
     SetClassInterest(null2int(DM.sqlc.ExecSQLScalar('select class_interest_id from interest where id=:KID',[class_id])));
end;

procedure TfmFilterEdit.SetNessTabs;
var
  i:integer;
begin
  for I := 0 to 4 do begin
    if i=dbcArea.ItemIndex then
      pcMain.Pages[i].TabVisible:=true
    else
      pcMain.Pages[i].TabVisible:=false

  end;
end;


procedure TfmFilterEdit.dbcAreaCloseUp(Sender: TObject; Accept: Boolean);
begin
  SetNessTabs
end;


procedure TfmFilterEdit.dbgAuthorDblClick(Sender: TObject);
begin
    toggleAuthor
end;

procedure TfmFilterEdit.dbgAuthorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_SPACE then begin
     toggleAuthor;
     exit;
  end;
  inherited

end;

procedure TfmFilterEdit.dbgKWIerDblClick(Sender: TObject);
begin

  if dbgKWIer.SelectedIndex=0 then begin
    toggleKW
  end
  else begin
    if fdqKeywordIer['in_filter']=1 then begin
      msgerror('Не имеет смысла заходить внутрь уже помеченной ветки ключевых слов. Если нужно, вначале снимите по ней пометку!');
      exit;
    end;
    SetClassKW(fdqKeywordIer['id'])
  end;

end;

procedure TfmFilterEdit.dbgKWIerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_SPACE then begin
     toggleKW;
     exit;
  end;
  if key=VK_BACK then begin
     SetClassKW(null2int(DM.sqlc.ExecSQLScalar('select class_keyword_id from keyword where id=:KID',[class_id])));
     exit;
  end;

  inherited
end;

procedure TfmFilterEdit.dbgProjectDblClick(Sender: TObject);
begin
  toggleProject
end;

procedure TfmFilterEdit.dbgProjectKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_SPACE then begin
     toggleProject;
     exit;
  end;
  inherited

end;


procedure TfmFilterEdit.dbgIntDblClick(Sender: TObject);
begin

  if dbgInt.SelectedIndex=0 then begin
    toggleInterest
  end
  else begin
    if fdqInterest['in_filter']=1 then begin
      msgerror('Не имеет смысла заходить внутрь уже помеченной ветки интересов. Если нужно, вначале снимите по ней пометку!');
      exit;
    end;
    SetClassInterest(fdqInterest['id'])
  end;

end;

procedure TfmFilterEdit.dbgIntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_SPACE then begin
     toggleInterest;
     exit;
  end;
  if key=VK_BACK then begin
     SetClassInterest(null2int(DM.sqlc.ExecSQLScalar('select class_Interest_id from interest where id=:KID',[class_id])));
     exit;
  end;
  if key=VK_RETURN then begin
    dbgIntDblClick(sender);
    exit;
  end;

end;

procedure TfmFilterEdit.dbgSourceDblClick(Sender: TObject);
begin
    toggleSource

end;

procedure TfmFilterEdit.dbgSourceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_SPACE then begin
     toggleSource;
     exit;
  end;
  inherited

end;



procedure TfmFilterEdit.FormCreate(Sender: TObject);
begin
  SetClassKW(0);
  SetClassInterest(0);
  fdqAuthor.Params.ParamValues['FID']:=fmfilter.fdqFilter['id'];
  fdqAuthor.open;
  source_sql_save:=fdqSource.SQL.Text;
  project_sql_save:=fdqProject.SQL.Text;
  source_sort_index:=0;
  fdqSource.SQL.Add(source_sort_array[source_sort_index]);
  fdqSource.Params.ParamValues['FID']:=fmfilter.fdqFilter['id'];
  fdqSource.open;
  fdqProject.SQL.Add(source_sort_array[source_sort_index]);
  fdqProject.Params.ParamValues['FID']:=fmfilter.fdqFilter['id'];
  fdqProject.open;
  SetNessTabs
end;

procedure TfmFilterEdit.SetClassKW(clid_:longint);
begin
  class_id:=clid_;
  fdqKeywordIer.Close;
  fdqKeywordIer.Params.ParamValues['CKW']:=clid_;
  fdqKeywordIer.Params.ParamValues['FID']:=fmfilter.fdqFilter['id'];
  fdqKeywordIer.open;
  lbroot.Caption:=DM.get_kw_full_root(class_id);
  self.btUp.Visible:=lbroot.Caption<>'';
end;

procedure TfmFilterEdit.SetClassInterest(clid_:longint);
begin
  class_id:=clid_;
  fdqInterest.Close;
  fdqInterest.Params.ParamValues['CKW']:=clid_;
  fdqInterest.Params.ParamValues['FID']:=fmfilter.fdqFilter['id'];
  fdqInterest.open;
  lbrooti.Caption:=DM.get_interest_full_root(class_id);
  self.btUpI.Visible:=lbrootI.Caption<>'';
end;



end.
