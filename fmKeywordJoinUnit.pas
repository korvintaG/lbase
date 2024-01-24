unit fmKeywordJoinUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, display_service, aliasform;

type
  TfmKeywordJoin = class(TForm)
    dblOld: TDBLookupComboboxEh;
    dblNew: TDBLookupComboboxEh;
    lbOld: TLabel;
    lbNew: TLabel;
    fdqKeywordName: TFDQuery;
    fdqKeywordNameid: TFDAutoIncField;
    fdqKeywordNamename: TWideMemoField;
    dsKeywordName: TDataSource;
    lbSource: TLabel;
    fdqSource: TFDQuery;
    fdqSourceid: TFDAutoIncField;
    fdqSourceis_mine: TIntegerField;
    fdqSourcefullname: TWideMemoField;
    dsSource: TDataSource;
    dblSource: TDBLookupComboboxEh;
    cbDelOld: TCheckBox;
    btJoin: TButton;
    fdqKeywordNamekw_id: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btJoinClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dblSourceChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmKeywordJoin: TfmKeywordJoin;

implementation

{$R *.dfm}

uses
  extend_data, extend_dialog, dmdataunit;

procedure TfmKeywordJoin.btJoinClick(Sender: TObject);
var
  qst_:string;
  old_kw, new_kw:longint;
  src_filter_:string;
  update_cnt_, del_cnt_:integer;
begin
  if null2int(dblold.KeyValue)<=0 then begin
    msgerror('Не выбрано старое ключевое слово!');
    exit;
  end;
  if null2int(dblnew.KeyValue)<=0 then begin
    msgerror('Не выбрано новое ключевое слово!');
    exit;
  end;
  if null2int(dblnew.KeyValue)=(dblold.KeyValue) then begin
    msgerror('Новое ключевое слово и старое должны быть разными!');
    exit;
  end;

  qst_:=format('Заменить ключевое слово [%s] на [%s]?',[dblold.Text,dblNew.Text]);
  if null2int(dblsource.KeyValue)>0 then
    qst_:=copy(qst_,1,length(qst_)-1)+format(' в заметках по источнику [%s]',[dblSource.Text])
  else
    if cbDelOld.Checked then
      qst_:=qst_+' (При этом старое ключевое слово будет удалено)';
  if msgquestion(qst_) then begin
    old_kw:=dm.get_kw_by_kwn(dblold.KeyValue);
    new_kw:=dm.get_kw_by_kwn(dblnew.KeyValue);
    src_filter_:=''; update_cnt_:=0; del_cnt_:=0;
    if null2int(dblsource.KeyValue)>0 then  // указан источник
      src_filter_:=' and note_id in (select note_id from note_source where source_id='+inttostr(dblsource.KeyValue)+')';
    if old_kw=new_kw then begin // смена синонимов
       dm.sqlc.execsql('update note_keyword set keyword_name_id=:KN where keyword_name_id=:KO '+src_filter_,[dblnew.KeyValue,dblold.KeyValue]);
       update_cnt_:=update_cnt_+dm.sqlc.ExecSQLScalar('select changes()');
    end
    else begin // смена не синонимов, а реально разных ключевых слов
         // удаляем те старые тэги, в заметках которых уже есть новые
         dm.sqlc.execsql('delete from note_keyword where keyword_name_id=:OKWN '+
           ' and exists (select * from note_keyword nko where keyword_name_id=:NKWN and nko.note_id=note_keyword.note_id) '+src_filter_,
           [dblold.KeyValue,dblnew.KeyValue]);
         del_cnt_:=del_cnt_+dm.sqlc.ExecSQLScalar('select changes()');
         // удаляем те старые тэги, в заметках которых уже есть новые (но не точно, а синонимы)
         dm.sqlc.execsql('delete from note_keyword where keyword_name_id=:OKWN '+
           ' and exists (select * from note_keyword nko where keyword_id=:NKW and nko.note_id=note_keyword.note_id) '+src_filter_,
           [dblold.KeyValue,new_kw]);
         del_cnt_:=del_cnt_+dm.sqlc.ExecSQLScalar('select changes()');
         // собственно говоря смена
         dm.sqlc.execsql('update note_keyword set keyword_id=:KK, keyword_name_id=:KN where keyword_name_id=:OKN '+src_filter_,
           [new_kw,dblnew.KeyValue,dblold.KeyValue]);
         update_cnt_:=update_cnt_+dm.sqlc.ExecSQLScalar('select changes()');
    end;
    msgok(format('Успешно удалено [%s] ключевых слов, и изменено [%s] слов!',[inttostr(del_cnt_),inttostr(update_cnt_)]));
    fdqKeywordName.Refresh;
    dblold.KeyValue:=-1;
  end;


end;

procedure TfmKeywordJoin.dblSourceChange(Sender: TObject);
begin
  if null2int(dblsource.KeyValue)>0 then begin
    cbDelOld.Checked:=false;
    cbDelOld.Enabled:=false;
  end
  else
    cbDelOld.Enabled:=true;

end;

procedure TfmKeywordJoin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmKeywordJoin:=nil;
end;

procedure TfmKeywordJoin.FormCreate(Sender: TObject);
begin
  fdqKeywordName.open;
  fdqSource.Open();
end;

procedure TfmKeywordJoin.FormResize(Sender: TObject);
begin
  dblOld.Width:=self.ClientWidth-dblOld.Left-7;
  dblNew.Width:=self.ClientWidth-dblNew.Left-7;
  dblSource.Width:=self.ClientWidth-dblSource.Left-7;
  btjoin.Left:=round(self.ClientWidth/2-btjoin.Width/2);
end;

end.
