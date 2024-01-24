unit fmTelegramUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, display_Service, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibJPegImage, EhLibGIFImage,
  EhLibPNGImage, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, MemTableDataEh, Data.DB, Vcl.Menus,
  DataDriverEh, MemTableEh, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.JSON,  TGC.Handler.UpdateAuthorizationState, TGC.Client,
  Vcl.StdCtrls, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, dmdataunit, aliasform;

type
  TfmTelegram = class(TForm)
    memLog: TMemo;
    dbgFastNote: TDBGridEh;
    pnBottom: TPanel;
    btStart: TButton;
    btShow: TButton;
    TC: TTelegramClient;
    fdqFastNote: TFDQuery;
    fdqFastNoteid: TIntegerField;
    fdqFastNotetelegram_message_id: TIntegerField;
    fdqFastNotetext: TWideMemoField;
    fdqFastNotestatus: TIntegerField;
    fdqFastNotefile_unique_id: TWideMemoField;
    fdqFastNotefile_remote_id: TWideMemoField;
    fdqFastNotefile_session_id: TIntegerField;
    fdqFastNotefile: TBlobField;
    fdqFastNotelocal_file_name: TWideMemoField;
    fdqFastNotedate_time_create: TDateTimeField;
    fdqFastNotetmid: TWideMemoField;
    fdqFastNoteweb_page_url: TWideMemoField;
    fdqFastNoteweb_page_type: TWideMemoField;
    fdqFastNoteweb_page_title: TWideMemoField;
    fdqFastNotefile_ext: TWideMemoField;
    fdqFastNotemessage_type: TWideMemoField;
    mteFastNote: TMemTableEh;
    dsdeFastNote: TDataSetDriverEh;
    dsFastNote: TDataSource;
    pmFastNote: TPopupMenu;
    mnCreateNote: TMenuItem;
    mnNewNoteAttach: TMenuItem;
    N1: TMenuItem;
    mnNewSource: TMenuItem;
    mnMarkAsRead: TMenuItem;
    N2: TMenuItem;
    mnShowWhat: TMenuItem;
    N3: TMenuItem;
    mnMarkCurrent: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TCError(Sender: TObject; const Code: Integer;
      const Message: string);
    procedure TCNeedAuthCode(Sender: TObject);
    procedure TCNeedAuthConfirm(Sender: TObject; const Link: string);
    procedure TCNeedAuthPassword(Sender: TObject);
    procedure TCReceive(Sender: TObject; const Data: string);
    procedure TCRegistration(Sender: TObject; const Terms: TTermsOfService);
    procedure btStartClick(Sender: TObject);
    procedure btShowClick(Sender: TObject);
    procedure mnCreateNoteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgFastNoteDblClick(Sender: TObject);
    procedure mnMarkAsReadClick(Sender: TObject);
    procedure mnMarkCurrentClick(Sender: TObject);
    procedure mnNewSourceClick(Sender: TObject);
  private
    { Private declarations }
    step:integer;
    cur_user:int64;
    message_id:int64;
    msg_read:integer;
    file_modify_name:string;
    id_note:longint;
    file_modify_datetime:TDateTime;
    note_status:integer;
    procedure ProcessMessagePhoto(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
    procedure ProcessMessageDocument(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
    procedure ProcessMessageAudio(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
    procedure ProcessMessageText(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
    procedure ProcessMessageVideo(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
    procedure GetWebPage(msg_:TJSONObject;
      var web_page_url,web_page_type,web_page_title:string);
  public
    { Public declarations }
    procedure GetMeReact(Answer: TJSONObject);
    procedure GetChatHistoryFull(Answer: TJSONObject);
    procedure GetRemoteFileReact(Answer: TJSONObject);
    procedure DownloadFileReact(Answer: TJSONObject);
    procedure FullLog(str:string);
    procedure set_new_source_par(var txt_file_cont, pt_,url,wbt: string);
  end;

var
  fmTelegram: TfmTelegram;

implementation

{$R *.dfm}

uses
  extend_data, extend_dialog, lcb_unit,  extend_diskutil,  shellapi,
  TGC.Builder.GetMe, TGC.Builder.GetChatHistory, TGC.Builder.GetRemoteFile,TGC.Builder.DownLoadFile,
  fmNoteEditUnit, fmMainUnit, fmSourceEditUnit;

const
  step_begin=0;
  step_getme_sended=1;
  step_after_getme=3;
  step_chat_history_sended=4;
  step_all_messages_done=10;
  step_get_remote_file_sended=12;
  //step_all_path_done=30;
  step_download_sended=31;
  step_end=100;


procedure TfmTelegram.FormActivate(Sender: TObject);
var
  oldid:longint;
  fdqup:TFdquery;
  fmdt:TDateTime;
begin
  lcb.log('TfmTelegram activated');
  if file_modify_name<>'' then begin
    lcb.log('file_modify_name='+file_modify_name);
    fmdt:=GetFileModificationTimeAsDT(file_modify_name);
    lcb.log('file_new_dt='+datetimetostr(fmdt));
    if file_modify_datetime<>fmdt then begin
      lcb.log('file_modify_datetime<>fmdt');
      if DM.Get_Ini_Int_Par('FileStorePlace')=0 then begin
         lcb.log('FileStorePlace=0');
         fdqup := TFDQuery.Create(nil);
         fdqup.Connection:=dm.sqlc;
         try
           fdqup.SQL.Text := 'update telegram_fast_note set file=:FF where id=:IID;';
           fdqup.Params[1].DataType := ftInteger;
           fdqup.params[1].AsInteger := id_note;
           fdqup.Params[0].DataType := ftBlob;
           fdqup.Params[0].AsStream := Tfilestream.Create(file_modify_name,fmopenread);
           fdqup.ExecSQL();
         except
           fulllog('Error Download File');
         end;
         fdqup.Free;
      end
      else begin
       lcb.log('FileStorePlace=1');
       CopyFile(PWideChar(file_modify_name),
                PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\TelegramFile\'+inttostr(id_note)),
                false);
      end;
      fmmain.TelegramNeedRefresh:=true;
    end;
    file_modify_name:=''
  end;

  if fmmain.TelegramNeedRefresh and dbgFastNote.Visible and (fdqFastNote.RecordCount>0) then begin
     oldid:=mteFastNote['id'];
     fdqFastNote.Refresh;
     mteFastNote.Refresh;
     mteFastNote.Locate('ID',oldid,[]);
     fmmain.TelegramNeedRefresh:=false;
  end;


end;

procedure TfmTelegram.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  fmTelegram:=nil;

end;

procedure TfmTelegram.FormCreate(Sender: TObject);
begin
  tc.PhoneNumber:=dm.Get_Ini_Str_Par('TelegramPhone');
  file_modify_name:='';

end;

procedure TfmTelegram.TCError(Sender: TObject; const Code: Integer;
  const Message: string);
begin
  fulllog('Error: ' + Message + #13#10' Code: ' + Code.ToString);

end;

procedure TfmTelegram.TCNeedAuthCode(Sender: TObject);
var
  ac:string;
begin
  if inputstr('Авторизация', 'Введите код авторизации, высланный Вам Telegram:',ac) then
        TC.SetAuthCode(ac);


end;

procedure TfmTelegram.TCNeedAuthConfirm(Sender: TObject; const Link: string);
begin
  ShowMessage('Confirm ' + Link);

end;

procedure TfmTelegram.TCNeedAuthPassword(Sender: TObject);
var
  ac:string;
begin
  if inputstr('Авторизация', 'Введите Ваш пароль от аккаунта Telegram:', ac) then
        TC.SetAuthPassword(ac);


end;

procedure TfmTelegram.TCReceive(Sender: TObject; const Data: string);
begin
  if not (
      (pos('{"@type":"updateOption"',data)=1)
      or (pos('{"@type":"updateUser"',data)=1)
      or (pos('{"@type":"updateDefaultReactionType"',data)=1)
      or (pos('{"@type":"updateAnimationSearchParameters"',data)=1)
      or (pos('{"@type":"updateAttachmentMenuBots"',data)=1)
      or (pos('{"@type":"updateSelectedBackground"',data)=1)
      or (pos('{"@type":"updateDiceEmojis"',data)=1)
      or (pos('{"@type":"updateActiveEmojiReactions"',data)=1)
      or (pos('{"@type":"updateChatThemes"',data)=1)
      or (pos('{"@type":"updateScopeNotificationSettings"',data)=1)
      or (pos('{"@type":"updateNewMessage"',data)=1)
      or (pos('{"@type":"updateNewChat"',data)=1)
      or (pos('{"@type":"updateChatLastMessage"',data)=1)
      or (pos('{"@type":"updateChatNotificationSettings"',data)=1)
      or (pos('{"@type":"updateChatAvailableReactions"',data)=1)
      or (pos('{"@type":"updateSupergroup"',data)=1)
      or (pos('{"@type":"updateSupergroupFullInfo"',data)=1)
      or (pos('{"@type":"updateChatFilters"',data)=1)
      or (pos('{"@type":"updateUnreadChatCount"',data)=1)
      or (pos('{"@type":"updateHavePendingNotifications"',data)=1)
      or (pos('{"@type":"updateConnectionState"',data)=1)
      or (pos('{"@type":"updateChatReadInbox"',data)=1)
      or (pos('{"@type":"updateSuggestedActions"',data)=1)
      or (pos('{"@type":"updateChatReadInbox"',data)=1)
      or (pos('{"@type":"updateMessageInteractionInfo"',data)=1)
      or (pos('{"@type":"updateUserStatus"',data)=1)
      or (pos('{"@type":"updateChatAction",',data)=1)
      or (pos('{"@type":"updateChatUnreadMentionCount"',data)=1)
      or (pos('{"@type":"updateChatPermissions"',data)=1)
      or (pos('{"@type":"updateUserFullInfo"',data)=1)
      or (pos('{"@type":"updateBasicGroupFullInfo"',data)=1)
      or (pos('{"@type":"updateMessageMentionRead"',data)=1)
      or (pos('{"@type":"updateAuthorizationState"',data)=1)
      or (pos('{"database_directory":"tdlib"',data)=1)
      //or (pos('{"@type":"updateAuthorizationState"',data)=1)
      //or (pos('{"@type":"updateFileDownloads"',data)=1)
      or (pos('{"@type":"updateMessageContent"',data)=1)
      or (pos('{"@type":"updateMessageEdited"',data)=1)
      or (pos('{"@type":"updateBasicGroup"',data)=1)
      or (pos('{"@type":"updateChatReadOutbox"',data)=1)
      or (pos('{"@type":"updateDeleteMessages"',data)=1)
      ) then begin
       FullLog(Data);
       if (pos('{"@type":"updateFile"',data)=1) then
           DownloadFileReact(TJSonObject.ParseJSONValue(data) as TJSonObject);
       if (pos('{"@type":"error","code":401,"message":"Unauthorized"',data)=1) then begin
         FullLog('Поймали ошибку авторизации');
         step:=step_begin;
         inherited;
         //TCNeedAuthCode(sender);
         //sleep(10000); // само должно

       end;
   end;

end;

procedure TfmTelegram.TCRegistration(Sender: TObject;
  const Terms: TTermsOfService);
var
  fn,ln:string;
begin
  if inputstr('User Registration', 'First Name',fn) then
    if inputstr('User Registration', 'Last Name',ln) then
       TC.SetRegisterUser(fn, ln);
end;

procedure TfmTelegram.ProcessMessagePhoto(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
var
  jso_message_content,jso_photo:TJsonObject;
  jsa_photo_sizes:TJsonArray;
  loc_cnt:integer;
begin
  GetWebPage(msg_,web_page_url,web_page_type,web_page_title);
  jso_message_content:=msg_.GetValue('content')  as TJsonObject;
  str:=null2str(jso_message_content.GetValue<string>('caption.text'));
  jso_photo:=jso_message_content.GetValue('photo')  as TJsonObject;
  jsa_photo_sizes:=jso_photo.GetValue('sizes') as TJsonArray;
  loc_cnt:=jsa_photo_sizes.Count;
  file_remote_id:=jsa_photo_sizes.Items[loc_cnt-1].GetValue<string>('photo.remote.id');
  file_unique_id:=jsa_photo_sizes.Items[loc_cnt-1].GetValue<string>('photo.remote.unique_id');
end;

procedure TfmTelegram.ProcessMessageDocument(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
var
  jso_message_content,{jso_video,jso_video_video, }jso_doc, jso_doc_doc:TJsonObject;
  jsa_photo_sizes:TJsonArray;
  loc_cnt:integer;
begin
  lcb.Log('ProcessMessageDocument - начало '+msg_.ToString);
  GetWebPage(msg_,web_page_url,web_page_type,web_page_title);
  jso_message_content:=msg_.GetValue('content')  as TJsonObject;
  {if jso_message_content.GetValue<string>('@type')='messageVideo' then begin
    lcb.Log('  messageVideo');
    jso_video:=jso_message_content.GetValue('video')  as TJsonObject;
    str:=null2str(jso_message_content.GetValue<string>('caption.text'));
    jso_video_video:=jso_video.GetValue('video')  as TJsonObject;;
    //loc_cnt:=jsa_photo_sizes.Count;
    file_remote_id:=jso_video_video.GetValue<string>('remote.id');
    file_unique_id:=jso_video_video.GetValue<string>('remote.unique_id');
  end;}
  if jso_message_content.GetValue<string>('@type')='messageDocument' then begin
    lcb.Log('  messageDocument');
    jso_doc:=jso_message_content.GetValue('document')  as TJsonObject;
    lcb.Log('  jso_doc прочитали'+jso_doc.ToString);
    str:=null2str(jso_message_content.GetValue<string>('caption.text'));
    lcb.Log('  str прочитали');
    jso_doc_doc:=jso_doc.GetValue('document')  as TJsonObject;;
    //loc_cnt:=jsa_photo_sizes.Count;
    file_remote_id:=jso_doc_doc.GetValue<string>('remote.id');
    file_unique_id:=jso_doc_doc.GetValue<string>('remote.unique_id');
    lcb.Log('  file_remote_id='+file_remote_id+' file_unique_id='+file_unique_id);
  end;
end;


procedure TfmTelegram.ProcessMessageAudio(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
var
  jso_message_content,jso_voice_note,jso_voice:TJsonObject;
begin
  GetWebPage(msg_,web_page_url,web_page_type,web_page_title);
  jso_message_content:=msg_.GetValue('content')  as TJsonObject;
  str:='';
  jso_voice_note:=jso_message_content.GetValue('voice_note')  as TJsonObject;
  jso_voice:=jso_voice_note.GetValue('voice')  as TJsonObject;
  file_remote_id:=jso_voice.GetValue<string>('remote.id');
  file_unique_id:=jso_voice.GetValue<string>('remote.unique_id');
end;


procedure TfmTelegram.ProcessMessageVideo(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
var
  jso_message_content,jso_video,jso_video_video,jso_caption,jso_entiti,jso_entiti_type:TJsonObject;
  jsa_entities:TJsonArray;
  loc_cnt:integer;
begin
  web_page_type:='';
  GetWebPage(msg_,web_page_url,web_page_type,web_page_title);
  jso_message_content:=msg_.GetValue('content')  as TJsonObject;
  str:=null2str(jso_message_content.GetValue<string>('caption.text'));
  jso_caption:=jso_message_content.GetValue('caption')  as TJsonObject;
  jsa_entities:=jso_caption.GetValue('entities') as TJsonArray;
  if jsa_entities<>nil then begin
    loc_cnt:=jsa_entities.Count;
    if loc_cnt>0 then begin
      jso_entiti:=jsa_entities.Items[0] as TJsonObject;
      jso_entiti_type:=jso_entiti.GetValue('type') as TJsonObject;
      if jso_entiti_type<>nil then begin
        if jso_entiti_type.GetValue<string>('@type')='textEntityTypeTextUrl' then begin
          web_page_url:=null2str(jso_entiti_type.GetValue<string>('url'));
          if pos('https://t.me',web_page_url)>0 then
             web_page_type:='Telegram Post';
        end;
      end;
    end;
  end;
  jso_video:=jso_message_content.GetValue('video')  as TJsonObject;
  str:=null2str(jso_message_content.GetValue<string>('caption.text'));
  jso_video_video:=jso_video.GetValue('video')  as TJsonObject;;
  if jso_video_video<>nil then begin
    web_page_type:='video';
    file_remote_id:=jso_video_video.GetValue<string>('remote.id');
    file_unique_id:=jso_video_video.GetValue<string>('remote.unique_id');
  end;

end;


procedure TfmTelegram.ProcessMessageText(msg_:TJSONObject;
      var str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title:string);
var
  jso_message_content:TJsonObject;
begin
  jso_message_content:=msg_.GetValue('content')  as TJsonObject;
  str:=jso_message_content.GetValue<string>('text.text');
  GetWebPage(msg_,web_page_url,web_page_type,web_page_title);

end;


procedure TfmTelegram.GetWebPage(msg_:TJSONObject;
      var web_page_url,web_page_type,web_page_title:string);
var
  jso_message_content,jso_web_page:TJsonObject;
begin
  jso_message_content:=msg_.GetValue('content')  as TJsonObject;
  jso_web_page:=jso_message_content.GetValue('web_page')  as TJsonObject;
  if jso_web_page=nil then begin
    web_page_url:='';
    web_page_type:='';
    web_page_title:='';
  end
  else begin
    web_page_url:=null2str(jso_web_page.GetValue<string>('url'));
    web_page_type:=null2str(jso_web_page.GetValue<string>('@type'))+null2str(jso_web_page.GetValue<string>('type'));
    web_page_title:=null2str(jso_web_page.GetValue<string>('title'));
  end;

end;


procedure TfmTelegram.mnCreateNoteClick(Sender: TObject);
var
  source_id_, stoc_id_:longint;
begin
    dm.get_def_source_stoc(source_id_, stoc_id_);
    if fmNoteEdit<>nil then begin
      fmNoteEdit.Close;
      Application.ProcessMessages
    end;
    fmNoteEdit := TfmNoteEdit.CreateWithData(source_id_,stoc_id_,0,-1,dbInsert,fmmain,mteFastNote['tmid'],mteFastNote['text'],
      false,null2str(mteFastNote['web_page_url']));
    fmNoteEdit.show;
end;

procedure TfmTelegram.mnMarkAsReadClick(Sender: TObject);
begin
  dm.sqlc.ExecSQL('update telegram_fast_note set status=1 where status=0 and telegram_message_id<=:TMOID',[mteFastNote['tmid']]);
  fdqFastNote.Refresh;
  mteFastNote.Refresh;
end;

procedure TfmTelegram.mnMarkCurrentClick(Sender: TObject);
var
 tmid, ntmid:string;
begin
  tmid:=mteFastNote['tmid'];
  mteFastNote.next;
  if tmid<>mteFastNote['tmid'] then
    ntmid:=mteFastNote['tmid']
  else begin
    mteFastNote.Prior;
    ntmid:=mteFastNote['tmid']
  end;

  dm.sqlc.ExecSQL('update telegram_fast_note set status=1 where status=0 and telegram_message_id=:TMOID',[tmid]);
  fdqFastNote.Refresh;
  mteFastNote.Refresh;
  mteFastNote.Locate('tmid',ntmid,[]);

end;

procedure TfmTelegram.set_new_source_par(var txt_file_cont, pt_,url,wbt: string);
begin
    txt_file_cont:='';
    if null2str(mteFastNote['web_page_title'])<>'' then
      pt_:=mteFastNote['web_page_title']
    else begin
      if null2str(mteFastNote['web_page_type'])='Telegram Post' then
        pt_:='Telegram Post'
      else
        pt_:=''
    end;
    //if null2str(mteFastNote['web_page_type'])='Telegram Post' then
    txt_file_cont:=mteFastNote['text'];
    url:=''; wbt:=null2str(mteFastNote['message_type']);
    if null2str(mteFastNote['web_page_url'])<>'' then begin
      url:=mteFastNote['web_page_url'];
      wbt:=null2str(mteFastNote['web_page_type']);
    end
    else if pos('http',null2str(mteFastNote['text']))>0 then begin
      url:=mteFastNote['text'];
      wbt:='webPage';
    end;
end;


procedure TfmTelegram.mnNewSourceClick(Sender: TObject);
var
  pt_, txt_file_cont,url, wbt:string;
begin
    if fmSourceEdit<>nil then begin
      fmSourceEdit.Close;
      Application.ProcessMessages
    end;
    set_new_source_par(txt_file_cont, pt_,url,wbt);
    fmSourceEdit:=TfmSourceEdit.CreateWithData(-1,GetDefSourceClass,0,DBInsert,self,mteFastNote['tmid'],
       wbt,pt_,url,txt_file_cont);
    fmSourceEdit.show;

end;

procedure TfmTelegram.GetMeReact(Answer: TJSONObject);
begin
  FullLog('GetMeReact callback');
  if Answer.GetValue<string>('@type')<>'error' then begin
    cur_user :=Answer.GetValue<int64>('id');
    dm.Set_Ini_Int_Par('TelegramCurUserID',cur_user);
    FullLog('parsed user id='+inttostr(cur_user));
    fulllog('step:=step_after_getme');
    step:=step_after_getme;
  end;
end;


procedure TfmTelegram.FullLog(str:string);
begin
  System.TMonitor.Enter(dm.sqlc);
  try
    memLog.Lines.Add(str);
    lcb.log(str);
  finally
    System.TMonitor.Exit(dm.sqlc);
  end;
end;


procedure TfmTelegram.GetChatHistoryFull(Answer: TJSONObject);
var
  i,cnt,loc_cnt:integer;
  mess_type,str:string;
  jsa_packet_messages,jsa_photo_sizes, jsa_entities: TJSONArray;
  JSM:TJSONObject;
  file_unique_id,file_remote_id:string;
  cur_message_id, date_sec:int64;
  date_:TDateTime;
  jso_message,jso_message_content,jso_photo, jso_web_page, jso_caption, jso_entiti, jso_entiti_type:TJsonObject;
  cur_message_id_str, web_page_url,web_page_type,web_page_title:string;
begin
  FullLog('GetChatHistryFull callback'#13#10 + Answer.ToString {Format});
  if Answer.GetValue<string>('@type')='error' then begin
    if Answer.GetValue<integer>('code')=401 then begin
      step:=step_begin;
      fulllog('Неавторизоавно, на начало!');
      exit;
    end
    else begin
      step:=step_end;
      fulllog('@type=error, exit...');
      exit;
    end;
  end;

  jsa_packet_messages := Answer.GetValue('messages') as TJsonArray;
  cnt:=Answer.GetValue<integer>('total_count');
  if cnt=0 then
    step:=step_all_messages_done
  else begin // точно есть сообщения
    message_id:=jsa_packet_messages.Items[cnt-1].GetValue<int64>('id');
    for i:=0 to cnt-1 do begin
       jso_message:=jsa_packet_messages.Items[i] as TJsonObject;
       fulllog('Обрабатываем сообщение '+jso_message.ToString);
       cur_message_id:=jso_message.GetValue<int64>('id');
       date_sec:=jso_message.GetValue<int64>('date');
       date_:=LinuxDateTimeToDelphi(date_sec);
       jso_message_content:=jso_message.GetValue('content')  as TJsonObject;

       mess_type:=jso_message_content.GetValue<string>('@type');
       fulllog('cur_message_id='+inttostr(cur_message_id)+' mess_type='+mess_type );
       inc(msg_read);
       if msg_read>100 then begin
         fulllog('step:=step_all_messages_done');
         step:=step_all_messages_done;
         exit;
       end;
       System.TMonitor.Enter(dm.sqlc);
       try
         str:=''; file_remote_id:=''; file_unique_id:='';
         if mess_type = 'webPage' then begin
           //web_page_type:='Web Page';
         end;
         if mess_type = 'messagePhoto' then
             ProcessMessagePhoto(jso_message,str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title);
         if mess_type = 'messageVideo' then
            ProcessMessageVideo (jso_message,str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title);
         if mess_type = 'messageDocument' then // какое-то непонятное сообщение
            ProcessMessageDocument (jso_message,str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title);
         if mess_type = 'messageText'  then
            ProcessMessageText(jso_message,str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title);
         if mess_type = 'messageVoiceNote'  then
            ProcessMessageAudio(jso_message,str,file_unique_id,file_remote_id, web_page_url,web_page_type,web_page_title);

         fulllog('перед полной проверкой');
         cur_message_id_str:=inttostr(cur_message_id);
         {fulllog('cur_message_id_str='+cur_message_id_str);
         cnt:=dm.sqlc.ExecSQLScalar('select count(*)  from note where note.telegram_message_id=:TMID',[cur_message_id_str]);
         fulllog('cnt='+inttostr(cnt));
         cnt:=dm.sqlc.ExecSQLScalar('select count(*)  from note where note.telegram_message_id=:TMID',[cur_message_id_str]);}
         if (dm.sqlc.ExecSQLScalar('select count(*) from telegram_fast_note where telegram_message_id=:TMID',[cur_message_id])>0)
            or (dm.sqlc.ExecSQLScalar('select count(*)  from note where note.telegram_message_id=:TMID',[cur_message_id_str])>0)
            or (dm.sqlc.ExecSQLScalar('select count(*)  from source where source.telegram_message_id=:TMID',[cur_message_id_str])>0)
            then begin
            fulllog('step:=step_all_messages_done');
            step:=step_all_messages_done
         end
         else
           if cur_message_id<>0 then
             dm.sqlc.ExecSQL('insert into telegram_fast_note (telegram_message_id,text, file_unique_id, file_remote_id, date_time_create,web_page_url,web_page_type,web_page_title,message_type)'+
                                 ' values(:VV,:TT,:FU,:FR,:DTC,:WPU,:WPTY,:WPTI,:MTP)',
                                 [cur_message_id,str,file_unique_id,file_remote_id, date_,web_page_url,web_page_type,web_page_title,mess_type]);
       finally
          System.TMonitor.Exit(dm.sqlc);
       end;
       if step=step_all_messages_done then
         exit;

    end;
    fulllog('step:=step_after_getme');
    step:=step_after_getme;
  end;
end;


procedure TfmTelegram.GetRemoteFileReact(Answer: TJSONObject);
var
  local_file_id, loc_cnt: integer;
  file_unique_id, file_remote_id:string;
  path:string;
begin
  fulllog('GetRemoteFileReact callback ' + Answer.ToString {Format});
  file_unique_id:=Answer.GetValue<string>('remote.unique_id');
  local_file_id:=Answer.GetValue<integer>('id');
  path:=Answer.GetValue<string>('local.path');
  if path<>'' then begin // уже загружался ранее
    System.TMonitor.Enter(dm.sqlc);
    try
      dm.sqlc.ExecSQL('update telegram_fast_note set local_file_name=:LFN, file_ext=:FEE, file_session_id=:SFID where file_unique_id=:FUID',
        [path,ExtractFileExt(path),local_file_id,file_unique_id]);
      loc_cnt:=dm.sqlc.ExecSQLScalar('select count(*) from telegram_fast_note where file_unique_id<>"" and ifnull(local_file_name,''n'')=''n''');
      if loc_cnt=0 then begin
        fulllog('step=step_get_remote_file_sended');
        step:=step_get_remote_file_sended;
      end;
    finally
      System.TMonitor.Exit(dm.sqlc);
    end;
  end
  else begin
    System.TMonitor.Enter(dm.sqlc);
    try
      dm.sqlc.ExecSQL('update telegram_fast_note set file_session_id=:SFID where file_unique_id=:FUID',[local_file_id,file_unique_id]);
      if dm.sqlc.ExecSQLScalar('select count(*) from telegram_fast_note where file_session_id is null and file_unique_id<>"" and status=0')=0 then begin
        fulllog('step=step_get_remote_file_sended');
        step:=step_get_remote_file_sended;
      end;
    finally
      System.TMonitor.Exit(dm.sqlc);
    end;
  end;

end;


procedure TfmTelegram.btShowClick(Sender: TObject);
begin
  note_status:=0;
  fdqFastNotefile.BlobType := ftGraphic;
  fdqFastNote.params.ParamValues['ST']:=note_status;
  fdqFastNote.Open();
  mteFastNote.Open;
  dbgFastNote.Visible:=true;
  pnBottom.Visible:=false;

end;

procedure TfmTelegram.btStartClick(Sender: TObject);
var
  fdq:TFdquery;
  fdqup:TFdQuery;
  oldfname,newfname:string;
begin
  memLog.Lines.clear;
  dm.sqlc.ExecSQL('delete from telegram_fast_note where status=0 and file_unique_id <>"" and local_file_name is null'); // зависшие сессии рубим
  dm.sqlc.ExecSQL('update telegram_fast_note set file_session_id=null, file_remote_id=null where file_session_id is not null or file_remote_id is not null');
  if not TC.Initializate then begin
    msgerror('Not inited');
  end
  else begin
    fulllog('TC.Initializate done');
    setcursorsql(sender);
    btShow.Enabled:=false;
    cur_user:=dm.Get_Ini_Int_Par('TelegramCurUserID');
    FullLog('Restore user='+inttostr(cur_user));
    memLog.Visible:=true;
    msg_read:=0; message_id:=0;
    if cur_user=0 then begin
      fulllog('step:=step_begin');
      step:=step_begin
    end
    else begin
      fulllog('step:=step_after_getme');
      step:=step_after_getme;
    end;
    repeat
      application.processmessages;
      sleep(1000);
      fulllog('step='+inttostr(step));
      case step of
      step_begin: begin
          FullLog('GetMe');
          TC.Methods.Execute(TGetMe.Create, '',GetMeReact);
          fulllog('step:=step_getme_sended');
          step:=step_getme_sended;
        end;
      step_after_getme: begin
           TC.Methods.Execute(TGetChatHistory.Create.ChatId(cur_user).limit(99).offset(0).from_message_id(message_id), '',
            GetChatHistoryFull);
           fulllog('step:=step_chat_history_sended');
           step:=step_chat_history_sended;
        end;
      step_all_messages_done: begin
          FullLog('Load session file id...');
          fdq:=TFdquery.Create(nil);
          fdq.connection:=dm.sqlc;
          fdq.sql.clear;
          fdq.sql.add('select * from telegram_fast_note where local_file_name is null and file_remote_id <>"" and file_session_id is null and file is null');
          System.TMonitor.Enter(dm.sqlc);
          try
            fdq.open;
            if fdq.RecordCount=0 then begin
              fulllog('step:=step_end');
              step:=step_end;
            end
            else
              while not fdq.eof do begin
                FullLog('  remote_file_id='+fdq['file_remote_id']);
                TC.Methods.Execute(TGetRemoteFile.Create.FileId(fdq['file_remote_id']), '', GetRemoteFileReact);
                fdq.next;
              end;
          finally
            fdq.Close;
            fdq.Free;
            System.TMonitor.Exit(dm.sqlc);
          end;
          if step<step_get_remote_file_sended then begin
             fulllog('step:=step_get_remote_file_sended');
             step:=step_get_remote_file_sended
          end;
        end;
      step_get_remote_file_sended: begin
          FullLog('Load file...');
          fdq:=TFdquery.Create(nil);
          fdq.connection:=dm.sqlc;
          fdq.sql.clear;
          fdq.sql.add('select * from telegram_fast_note where file_session_id is not null and ifnull(local_file_name,''n'') =''n''');
          System.TMonitor.Enter(dm.sqlc);
          try
            fdq.open;
            while not fdq.eof do begin
              FullLog('  unique_file_id='+fdq['file_unique_id']);
              TC.Methods.Execute(TDownLoadFile.Create.FileId(fdq['file_session_id']).prior(1), '', DownloadFileReact);
              fdq.next;
            end;
          finally
            fdq.Close;
            fdq.Free;
            System.TMonitor.Exit(dm.sqlc);
          end;
          fulllog('step:=step_download_sended;');
          step:=step_download_sended;

        end;
      step_download_sended: begin
        if dm.sqlc.execsqlscalar('select count(*) from telegram_fast_note where status=0 and ifnull(file_unique_id,"") <>"" and ifnull(local_file_name,"") =""')=0 then begin
          fulllog('step:=step_end');
          step:=step_end
        end;
      end;
      step_end: begin
        FullLog('File load to sqlite...');
        fdq:=TFdquery.Create(nil);
        fdq.connection:=dm.sqlc;
        fdq.sql.clear;
        fdq.sql.add('select id, file_unique_id,local_file_name, file_ext from telegram_fast_note where local_file_name <>"" and file is null');
        System.TMonitor.Enter(dm.sqlc);
        try
          fdq.open;
          while not fdq.eof do begin
             FullLog('  file load to sqlite ='+fdq['local_file_name']);
             if DM.Get_Ini_Int_Par('FileStorePlace')=0 then begin
               fdqup := TFDQuery.Create(nil);
               fdqup.Connection:=dm.sqlc;
               try
                 fdqup.SQL.Text := 'update telegram_fast_note set file=:FF where id=:IID;';
                 fdqup.Params[1].DataType := ftInteger;
                 fdqup.params[1].AsInteger := fdq['id'];
                 fdqup.Params[0].DataType := ftBlob;
                 fdqup.Params[0].AsStream := Tfilestream.Create(fdq['local_file_name'],fmopenread);
                 fdqup.ExecSQL();
                 newfname:=tmppath+inttostr(fdq['id'])+null2str(fdq['file_ext']);
                 oldfname:=fdq['local_file_name'];
                 copyfile(PWideChar(oldfname),PWideChar(newfname),true);
               except
                 fulllog('Error Download File');
               end;
               fdqup.Free;
             end
             else begin
                newfname:=fdq['local_file_name'];
                CopyFile(PWideChar(newfname),
                PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\TelegramFile\'+inttostr(fdq['id'])),
                false);
             end;

             fdq.next;
          end;
        finally
          fdq.Close;
          fdq.Free;
          System.TMonitor.Exit(dm.sqlc);
        end;

        FullLog('Exit...');
        TC.Close;
        //TC.Destroy;
        TThread.RemoveQueuedEvents(nil);
        FullLog('Done');
        break;
        end;
      end;
    until false;
    setcursordef(sender);
    btShow.Enabled:=true;
    (sender as TButton).Visible:=false;
    btShowClick(sender);
  end;


end;

procedure TfmTelegram.dbgFastNoteDblClick(Sender: TObject);
var
  fname:string;
  ms:TMemoryStream;
begin
  if dbgFastNote.selectedindex=5 then
    lcb.log('Жамкнули dc');
    if null2str(mteFastNote['local_file_name'])<>'' then begin
     fname:=tmppath+inttostr(mteFastNote['id'])+null2str(mteFastNote['file_ext']);
     if DM.Get_Ini_Int_Par('FileStorePlace')=0 then begin
       ms:=TMemoryStream.Create;
       TBlobField(mteFastNote.FieldByName('file')).SaveToStream(ms);
       ms.Seek(0, soFromBeginning);
       ms.SaveToFile(fname);
       ms.Free;
     end
     else
       CopyFile(PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\TelegramFile\'+inttostr(mteFastNote['id'])),
                PWideChar(fname),false);
     file_modify_name:=fname;
     id_note:=mteFastNote['id'];
     file_modify_datetime:=GetFileModificationTimeAsDT(fname);
     lcb.log('Дата время исходного файла '+DateTimeTostr(file_modify_datetime));
     ShellExecute(0, nil, PChar(fname), nil,nil, SW_SHOWNORMAL);
    end;

end;

procedure TfmTelegram.DownloadFileReact(Answer: TJSONObject);
var
  jso_file,jso_local,jso_remote:TJsonObject;
  path_:string;
  remote_id,unique_id:string;
begin
  FullLog('DownloadFileReact callback ' + Answer.ToString {Format});
  if answer.GetValue<string>('@type') ='updateFile' then begin
      FullLog('updateFile');
      jso_file:=answer.GetValue('file') as TJsonObject;
      if jso_file<>nil then begin
        jso_local:=jso_file.GetValue('local') as TJsonObject;
        jso_remote:=jso_file.GetValue('remote') as TJsonObject;
        if jso_local<>nil then begin
           path_:=jso_local.GetValue<string>('path');
           remote_id:=jso_remote.GetValue<string>('id');
           unique_id:=jso_remote.GetValue<string>('unique_id');
           if path_<>'' then begin
              System.TMonitor.Enter(dm.sqlc);
              try
                dm.sqlc.ExecSQL('update telegram_fast_note set local_file_name=:LFN, file_ext=:FEE where file_unique_id=:FUID',[path_,ExtractFileExt(path_),unique_id]);
                if dm.sqlc.ExecSQLScalar('select count(*) from telegram_fast_note where status=0 and file_session_id is not null and ifnull(local_file_name,''n'')=''n''')=0 then begin
                  fulllog('step:=step_end');
                  step:=step_end;
                end;
              finally
                System.TMonitor.Exit(dm.sqlc);
              end;
           end;
        end;
      end;
  end;
end;


end.
