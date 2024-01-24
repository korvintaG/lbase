unit fmKWEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Menus, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, display_service, aliasform;

type
  TfmKWEdit = class(TForm)
    dbgSynonym: TDBGridEh;
    gbNote: TGroupBox;
    mmNote: TMemo;
    pnBottom: TPanel;
    btOk: TButton;
    dbgAntonym: TDBGridEh;
    fdqKeywordName: TFDQuery;
    fdqKeywordNameid: TFDAutoIncField;
    fdqKeywordNamekeyword_id: TIntegerField;
    fdqKeywordNamename: TWideMemoField;
    fdqKeywordNameorder_: TIntegerField;
    dsKeywordName: TDataSource;
    pmSynonym: TPopupMenu;
    mnDel: TMenuItem;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    N1: TMenuItem;
    mnUp: TMenuItem;
    mnDown: TMenuItem;
    fdqAntonym: TFDQuery;
    fdqAntonymid: TFDAutoIncField;
    fdqAntonymkwid: TFDAutoIncField;
    fdqAntonymname: TWideMemoField;
    dsAntonym: TDataSource;
    pmAntonym: TPopupMenu;
    mnADel: TMenuItem;
    mnAAdd: TMenuItem;
    procedure dbgAntonymColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormCreate(Sender: TObject);
    procedure mnAddClick(Sender: TObject);
    procedure mnEditClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btOkClick(Sender: TObject);
    procedure mnAAddClick(Sender: TObject);
    procedure mnADelClick(Sender: TObject);
  private
    { Private declarations }
    kw_id:longint;
    was_changed:boolean;
    RootKWName:string;
    fdq_refresh:TFdquery;
  public
    { Public declarations }
    constructor CreateWData(kwid_: longint;RootKWName_:string; fdq_refresh_:TFdquery; AOwner: TComponent);
  end;

var
  fmKWEdit: TfmKWEdit;

implementation

{$R *.dfm}

uses extend_data, extend_dialog, data_service,
     dmDataUnit, fmMainUnit;

procedure TfmKWEdit.btOkClick(Sender: TObject);
begin
  fmmain.KeywordListNeedRefresh:=true;
end;

constructor TfmKWEdit.CreateWData(kwid_: longint;RootKWName_:string; fdq_refresh_:TFdquery; AOwner: TComponent);
begin
  createWithAlias(AOwner,'fmKWEdit');
  was_changed:=false;
  kw_id:=kwid_;
  RootKWName:=RootKWName_;
  fdq_refresh:=fdq_refresh_;
  self.Caption:='Редактирование ключевого слова ['+RootKWName_+'] ID='+inttostr(kwid_);
  mmNote.Text:=null2str(dm.sqlc.ExecSQLScalar('select note from keyword where id=:IID',[kw_id]));
  fdqKeywordName.Params.ParamValues['KID']:=kw_id;
  fdqAntonym.Params.ParamValues['KID']:=kw_id;
  fdqKeywordName.Open();
  fdqAntonym.Open();
end;


procedure TfmKWEdit.dbgAntonymColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
 Params.Background:=dm.Get_Ini_Int_Par('Color_KWAntonym',$00C7C7FF)

end;

procedure TfmKWEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if self.was_changed then begin
    dm.recalc_keyword(kw_id);
  end;

end;

procedure TfmKWEdit.FormCreate(Sender: TObject);
begin
  dbgAntonym.Color:=dm.Get_Ini_Int_Par('Color_KWBkgAntonym',$00C7C7FF)

end;

procedure TfmKWEdit.mnAAddClick(Sender: TObject);
var
  str_:string;
  id_,name_id_: longint;

begin
 if getKeyword(id_,name_id_,self,'Добавление антонима к ['+RootKWName+']',
       'Укажите ключевое слово-антоним:','Добавить антоним',
       ' select * from (Select %s as name, kwn.id kw_name_id, k.id kw_id from keyword_name kwn, keyword k '+
       ' where k.id=kwn.keyword_id and k.id<>'+inttostr(self.kw_id)+' ) order by ru_lower(name)',
       false)
  then begin
    dm.sqlc.ExecSQL('insert into keyword_link2(link_type,keyword1_id,keyword2_id) values(2,:K1,:K2)',[self.kw_id,id_]);
    fdqAntonym.Refresh
  end;

end;

procedure TfmKWEdit.mnAddClick(Sender: TObject);
var
  str_:string;
begin
  if inputstr('Добавление нового синонима' ,'Наименования',str_) then begin
    fdqKeywordName.Append;
    fdqKeywordName['name']:=str_;
    fdqKeywordName['keyword_id']:=kw_id;
    fdqKeywordName.post;
    fdqKeywordName.Refresh;
    was_changed:=true;
  end;
end;

procedure TfmKWEdit.mnADelClick(Sender: TObject);
var
  cnt_:integer;
  aid_:longint;
  order_:longint;
begin
  if fdqAntonym.RecordCount<=1 then
    msgerror('Нечего удалять! Должно быть хотя бы одно значение в списке!')
  else begin
    if msgquestion('Удалить антоним ['+fdqAntonym['name']+']') then begin
      dm.sqlc.ExecSQL('delete from keyword_link2 where id=:II',[fdqAntonym['id']]);
      fdqAntonym.Refresh
    end;
  end;

end;

procedure TfmKWEdit.mnEditClick(Sender: TObject);
var
  str_:string;
begin
  str_:=fdqKeywordName['name'];
  if inputstr('Правка синонима','Новое значение для синонима',str_) then begin
    fdqKeywordName.edit;
    fdqKeywordName['name']:=str_;
    fdqKeywordName.post;
    was_changed:=true;
  end;
end;

end.

