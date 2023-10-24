unit data_service;

interface

uses
  display_service, system.classes;

  function getKeyword(var id_, name_id_:longint;AOwner: TComponent; Caption_,MsgSelect_,btSelect_,SQLText_:string;AllowInsert_:boolean=false;MsgInsert_:string='';btInsert_:string=''):boolean;
  procedure NoteEdit(note_id_:longint);
  function GetSTOC(var source_id_,stoc_id_:longint; is_mine_:integer):boolean;
  function MoveFilesToDir:boolean; // перенести все файлы с базы во внешний каталог
  procedure CreateIfNeedDirStore; // создать если нужнот каталоги для хранения файлов


implementation

uses Vcl.Controls, vcl.forms, fmmainunit, lcb_unit, system.sysutils, dmDataUnit, firedac.comp.client,
  fmGetSTOCUnit,
  data.db, extend_data, extend_dialog, fmKeywordGetunit, fmNoteEditUnit;

procedure CreateIfNeedDirStore; // создать если нужнот каталоги для хранения файлов
const
  sf_dir: array [1..3] of string=('SourceFile','NoteFile','TelegramFile');
var
  esr, tmp:  string;
  i: integer;
begin
 if DM.Get_Ini_Int_Par('FileStorePlace')=1 then begin
   esr:=DM.Get_Ini_Str_Par('FileStoreDir');
   for i:=1 to 3 do begin
     tmp:=esr+'\'+sf_dir[i]+'\';
     if not DirectoryExists(tmp) then
        ForceDirectories(tmp);
   end;
 end;
end;


function MoveFilesToDir:boolean; // перенести все файлы с базы во внешний каталог
var
  sf: TFdquery;
  ms:TMemoryStream;
  esr, sf_dir:string;
begin

  esr:=DM.Get_Ini_Str_Par('FileStoreDir');
  if esr='' then begin
    msgerror('Не указан внешний каталог!');
    MoveFilesToDir:=false;
    exit;
  end;

  sf:=TFdquery.Create(nil);
  sf.Connection:=dm.sqlc;

  CreateIfNeedDirStore;

  // аттачи источников
  sf_dir:=esr+'\SourceFile\';
  sf.SQL.Text:='select * from source_attach';
  sf.Open();
  while not sf.Eof do begin
     ms:=TMemoryStream.Create;
     TBlobField(sf.FieldByName('content')).SaveToStream(ms);
     ms.Seek(0, soFromBeginning);
     ms.SaveToFile(sf_dir+sf.FieldByName('id').AsString);
     ms.Free;
     sf.Next;
  end;
  sf.Close;

  // аттачи заметок
  sf_dir:=esr+'\NoteFile\';
  sf.SQL.Text:='select * from note_attach';
  sf.Open();
  while not sf.Eof do begin
     ms:=TMemoryStream.Create;
     TBlobField(sf.FieldByName('content')).SaveToStream(ms);
     ms.Seek(0, soFromBeginning);
     ms.SaveToFile(sf_dir+sf.FieldByName('id').AsString);
     ms.Free;
     sf.Next;
  end;
  sf.Close;

  // Телеграм
  sf_dir:=esr+'\TelegramFile\';
  sf.SQL.Text:='select * from telegram_fast_note where file is not null';
  sf.Open();
  while not sf.Eof do begin
     ms:=TMemoryStream.Create;
     TBlobField(sf.FieldByName('file')).SaveToStream(ms);
     ms.Seek(0, soFromBeginning);
     ms.SaveToFile(sf_dir+sf.FieldByName('id').AsString);
     ms.Free;
     sf.Next;
  end;
  sf.Close;

  dm.sqlc.ExecSQL('update source_attach set content=null');
  dm.sqlc.ExecSQL('update note_attach set content=null');
  dm.sqlc.ExecSQL('update telegram_fast_note set file=null');

  MoveFilesToDir:=true;
end;


function getKeyword(var id_, name_id_:longint;AOwner: TComponent; Caption_,MsgSelect_,btSelect_,SQLText_:string;AllowInsert_:boolean=false;MsgInsert_:string='';btInsert_:string=''):boolean;
var
  fdq_:tFDQuery;
  ds_:tDataSource;
  mres_:integer;
  res_:string;
begin
  fmKeywordGet:=TfmKeywordGet.CreateData(AOwner,Caption_,MsgSelect_,btSelect_,SQLText_,AllowInsert_,MsgInsert_,btInsert_);
  mres_:=fmKeywordGet.ShowModal;
  if mres_=mrOk then begin
    id_:=fmKeywordGet.kw_id;
    name_id_:=fmKeywordGet.kw_name_id;
    Result:=true;
  end
  else begin
    Result:=false;
  end;
  fmKeywordGet.Free;
  fmKeywordGet:=nil;

end;


procedure NoteEdit(note_id_:longint);
begin
  if fmNoteEdit<>nil then begin
     fmNoteEdit.Close;
     Application.ProcessMessages
  end;
  fmNoteEdit := TfmNoteEdit.CreateWithData(0,0, 0, note_id_,dbEdit,fmmain);
  fmNoteEdit.show;
end;


function GetSTOC(var source_id_,stoc_id_:longint; is_mine_:integer):boolean;
var
  mr:integer;
begin
  fmGetSTOC:=TfmGetSTOC.CreateWithData(source_id_,stoc_id_,fmmain, is_mine_);
  mr:=fmGetSTOC.ShowModal;
  if mr=mrok then begin
    result:=true;
    source_id_:=fmGetSTOC.source_id;
    stoc_id_:=fmGetSTOC.stoc_id;
  end
  else
    result:=false;
  fmGetSTOC.Free;

end;


begin
end.
