unit fmAuthorListUnit;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  dmDataUnit,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,display_service,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, aliasform;

type

  TfmAuthorList = class(TForm)
    dbgAuthors: TDBGridEh;
    pmAuthor: TPopupMenu;
    mnAdd: TMenuItem;
    mnDel: TMenuItem;
    mnEdit: TMenuItem;
    N1: TMenuItem;
    mnSortByDate: TMenuItem;
    mnSortByName: TMenuItem;
    fdqAuthor: TFDQuery;
    fdqAuthorname: TWideMemoField;
    fdqAuthornotes: TWideMemoField;
    fdqAuthordate_time_create: TDateTimeField;
    fdqAuthorid: TFDAutoIncField;
    dsAuthor: TDataSource;
    mnSort: TMenuItem;
    mnSortByDateDesc: TMenuItem;
    N3: TMenuItem;
    mnSortByNameDesc: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pmAuthorPopup(Sender: TObject);
    procedure mnSortByDateClick(Sender: TObject);
    procedure mnAddClick(Sender: TObject);
    procedure mnDelClick(Sender: TObject);
    procedure mnEditClick(Sender: TObject);
    procedure dbgAuthorsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    nsrt:integer;
    sql_save:ansistring;
  public
    { Public declarations }
  end;

var
  fmAuthorList: TfmAuthorList;

implementation

{$R *.dfm}

uses fmMainUnit, data_service, extend_dialog, extend_data;
const
  sort_array:array[0..3] of string=('order by id','order by id desc',
                                    'order by ru_lower(name)','order by ru_lower(name) desc');

procedure TfmAuthorList.dbgAuthorsKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
      Key:=#0;
      mnEditClick(sender);
      exit;
  end;
  inherited

end;

procedure TfmAuthorList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.Set_Ini_Int_Par(alias+par_sort,nsrt);
  action:=cafree;
  fmAuthorList:=nil;
  fmmain.mnAuthorList.Enabled:=true;


end;

procedure TfmAuthorList.FormCreate(Sender: TObject);
begin
  fmmain.mnAuthorList.Enabled:=false;
  nsrt:=dm.Get_Ini_Int_Par(alias+par_sort);
  sql_save:=fdqAuthor.SQL.Text;
  fdqAuthor.SQL.Add(sort_array[nsrt]);
  fdqAuthor.Open();
end;

procedure TfmAuthorList.mnDelClick(Sender: TObject);
var
  cnt_:integer;
  aid_:longint;
begin
  if msgquestion(format('Удалить автора [%s]?',[fdqAuthor['name']])) then begin
    aid_:=fdqAuthor['id'];
    cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from source_author where author_id=:ID',[fdqAuthor['id']]);
    if cnt_>0 then begin
        msgerror(format('На автора [%s] в базе назначено %s книг. Чтобы удалить автора, вначале уберите привязку его к книгам!',[fdqAuthor['name'],inttostr(cnt_)]));
        exit
    end;
    fdqAuthor.delete;
  end;

end;

procedure TfmAuthorList.mnEditClick(Sender: TObject);
var
  str_:string;
begin
  if null2int(fdqAuthor['id'])>0 then begin
    str_:=fdqAuthor['name'];
    if inputstr('Редактирование данных','Укажите исправленное ФИО автора:',str_) then begin
      fdqAuthor.edit;
      fdqAuthor['name']:=str_;
      fdqAuthor.post;
    end;
  end;
end;

procedure TfmAuthorList.mnAddClick(Sender: TObject);
var
  str_:string;
begin
  if inputstr('Ввод данных','Укажите ФИО нового автора:',str_) then begin
    fdqAuthor.Insert;
    fdqAuthor['name']:=str_;
    fdqAuthor['date_time_create']:=Now;
    fdqAuthor.post;
  end;

end;

procedure TfmAuthorList.mnSortByDateClick(Sender: TObject);
begin
  nsrt:=(sender as TMenuItem).tag;
  fdqAuthor.Close;
  fdqAuthor.SQL.Text:=self.sql_save;
  fdqAuthor.SQL.Add(sort_array[nsrt]);
  fdqAuthor.open;

end;

procedure TfmAuthorList.pmAuthorPopup(Sender: TObject);
begin
  mnSortByDate.Checked:=false;
  mnSortByName.Checked:=false;
  mnSortByDateDesc.Checked:=false;
  mnSortByNameDesc.Checked:=false;
  case nsrt of
  0:mnSortByDate.Checked:=true;
  1:mnSortByDateDesc.Checked:=true;
  2:mnSortByName.Checked:=true;
  3:mnSortByNameDesc.Checked:=true;
  end;
end;

end.
