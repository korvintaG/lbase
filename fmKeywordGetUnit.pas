unit fmKeywordGetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Data.DB, DBCtrlsEh,
  Firedac.comp.client,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, DBLookupEh, Vcl.Menus, Vcl.Buttons,
  display_service, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, aliasform;

type
  TfmKeywordGet = class(TForm)
    gbChoose: TGroupBox;
    dblKeyword: TDBLookupComboboxEh;
    btAddKeyword: TButton;
    gbAddNew: TGroupBox;
    lbAddNew: TLabel;
    lbTheme: TLabel;
    dbeNewKeyWord: TDBEditEh;
    btAddNewKeyword: TButton;
    pnTop: TPanel;
    Label1: TLabel;
    dbcIerMode: TDBComboBoxEh;
    dsKeyWordToAdd: TDataSource;
    sbSetup: TSpeedButton;
    pmSetup: TPopupMenu;
    mnRootFormWay: TMenuItem;
    mnAddNew: TMenuItem;
    fdqKeywordRoot: TFDQuery;
    fdqKeywordRootid: TFDAutoIncField;
    fdqKeywordRootname: TWideMemoField;
    dblRootTag: TDBLookupComboboxEh;
    dsKeywordRoot: TDataSource;
    procedure sbSetupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmSetupPopup(Sender: TObject);
    procedure mnRootFormWayClick(Sender: TObject);
    procedure mnAddNewClick(Sender: TObject);
    procedure dbcIerModeChange(Sender: TObject);
    procedure btAddKeywordClick(Sender: TObject);
    procedure btAddNewKeywordClick(Sender: TObject);
  private
    { Private declarations }
    fdq:TFdquery;
    SQLText, SQLTextRoot:string;
    is_creating:boolean;
    procedure changeClassMetod(nm_:integer);
  public
    kw_id, kw_name_id:longint;
    AllowInsert:boolean;
    constructor CreateData(AOwner: TComponent; Caption_,MsgSelect_,btSelect_,SQLText_:string;
      AllowInsert_:boolean=false;MsgInsert_:string='';btInsert_:string='');
    { Public declarations }
  end;

var
  fmKeywordGet: TfmKeywordGet;

implementation

{$R *.dfm}

uses dmDataUnit, LCB_Unit, fmMainUnit, extend_data, extend_dialog;

procedure TfmKeywordGet.FormCreate(Sender: TObject);
begin
  is_creating:=true;
  fdq:=TFdquery.Create(nil);
  fdq.Connection:=dm.sqlc;
  dsKeywordToAdd.DataSet:=fdq;
  dbcIerMode.ItemIndex:=dm.Get_Ini_Int_Par(self.alias+'_RootMode');
  pnTop.Visible:=dm.Get_Ini_Int_Par(self.alias+'_pnTopVisible')=1;
  if AllowInsert then
    gbAddNew.Visible:=dm.Get_Ini_Int_Par(self.alias+'_gbAddNewVisible')=1;
  changeClassMetod(dbcIerMode.ItemIndex);

  is_creating:=false;

end;

procedure TfmKeywordGet.mnAddNewClick(Sender: TObject);
begin
  gbAddNew.Visible:=not gbAddNew.Visible;
  dm.Set_Ini_Int_Par(self.alias+'_gbAddNewVisible',bool2int(gbAddNew.Visible))
end;

procedure TfmKeywordGet.mnRootFormWayClick(Sender: TObject);
begin
  pnTop.Visible:=not pnTop.Visible;
  dm.Set_Ini_Int_Par(self.alias+'_pnTopVisible',bool2int(pnTop.Visible))

end;

procedure TfmKeywordGet.pmSetupPopup(Sender: TObject);
begin
  mnRootFormWay.Checked:=pnTop.Visible;
  mnAddNew.Checked:=gbAddNew.Visible;
end;

procedure TfmKeywordGet.sbSetupClick(Sender: TObject);
var
  pnt : TPoint;
begin
 if GetCursorPos(pnt) then
    pmsetup.Popup(pnt.X, pnt.Y);
end;

constructor TfmKeywordGet.CreateData(AOwner: TComponent; Caption_,MsgSelect_,btSelect_,SQLText_:string;AllowInsert_:boolean=false;MsgInsert_:string='';btInsert_:string='');
begin
  createWithAlias(AOwner,'fmKeywordGet');
  SQLText:=SQLText_;
  SQLTextRoot:=fdqKeywordRoot.SQL.Text;
  Caption:=Caption_;
  gbChoose.Caption:=MsgSelect_;
  btAddKeyword.Caption:=btSelect_;

  AllowInsert:=AllowInsert_;
  if not AllowInsert_ then
    gbAddNew.Visible:=false
  else begin
    gbAddNew.Caption:=MsgInsert_;
    btAddNewKeyword.Caption:=btInsert_;
  end;
end;


procedure TfmKeywordGet.dbcIerModeChange(Sender: TObject);
begin
  if not is_creating  then begin
    changeClassMetod(dbcIerMode.ItemIndex);
    dm.Set_Ini_Int_Par(self.alias+'_RootMode',dbcIerMode.ItemIndex);
  end;

end;

procedure TfmKeywordGet.btAddKeywordClick(Sender: TObject);
begin
  if null2int(dblKeyword.KeyValue)<=0 then begin
    modalresult:=mrNone;
    exit
  end;
  kw_name_id:=dblKeyword.KeyValue;
  fdq.Locate('kw_name_id',kw_name_id,[]);
  kw_id:=fdq['kw_id'];

end;

procedure TfmKeywordGet.btAddNewKeywordClick(Sender: TObject);
var
  oldds_:TDataSource;
  kwid_, ckw_:longint;

begin
  if null2str(dbeNewKeyWord.Text)='' then begin
    msgerror('Новое ключевое слово не может быть пустым!');
    modalresult:=mrNone;
    exit
  end;

  ckw_:=0;
  if null2int(dblRootTag.KeyValue)>0 then
    ckw_:=DM.get_kw_by_kwn(dblRootTag.KeyValue);
  dm.add_new_kw_name(dbeNewKeyWord.Text,ckw_,self.kw_id, self.kw_name_id);

end;

procedure TfmKeywordGet.changeClassMetod(nm_:integer);
var
  goal_field_:string;
begin
  if fdq.Active then
    fdq.close;
  if fdqKeywordRoot.Active then
    fdqKeywordRoot.close;

  if nm_=0 then
    goal_field_:=' name ||class_name_after'
  else
    goal_field_:=' class_name_before||name ';
  fdq.SQL.Text:=format(SQLText,[goal_field_]);
  fdqKeywordRoot.SQL.Text:=format(SQLTextRoot,[goal_field_,goal_field_]);

  lcb.log(fdq.SQL.Text);
  fdq.Open();
  fdqKeywordRoot.Open();

end;


end.
