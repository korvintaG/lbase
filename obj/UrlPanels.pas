unit UrlPanels;

interface

uses
  Vcl.Forms, System.Classes, Vcl.ExtCtrls, Winapi.Messages, ComCtrls, Vcl.Graphics, dbctrlseh,
  Vcl.StdCtrls,
  richedit;

type
  TNoteURL=record
    url_count:integer;
    url_array:array [1..100] of record
      uid:longint;
      name:string;
      strpos:integer;
    end;
    link_count:integer;
    link_array:array [1..100] of record
      lid:longint;
      name:string;
      strpos:integer;
    end;
    tag_count:integer;
    tag_array:array [1..100] of record
      tid:longint;
      name:string;
      strpos:integer;
    end;
    stoc_count:integer;
    stoc_array:array [1..100] of record
      source_id, stoc_id:longint;
      name:string;
      strpos:integer;
    end;
  end;


  TSendPanel = class(TPanel)
   public
     noteURL:TNoteURL;
   private
     procedure RunLink(var Msg: TMessage); message WM_NOTIFY;
   end;

  TSendGroupBox = class(TGroupBox)
   public
     noteURL:TNoteURL;
   private
     procedure RunLink(var Msg: TMessage); message WM_NOTIFY;
   end;

  TPanel = class(TSendPanel);
  TGroupBox=class(TSendGroupBox);


  procedure FillNoteLink(var tc_:TRichEdit;var nu_:TNoteURL;nid_:longint;source_id_,class_id_:longint );
  function get_note_id_by_url(var nu_:TNoteURL;url_:string):integer;
  function get_tag_id_by_url(var nu_:TNoteURL;url_:string):integer;
  function get_stoc_index_by_url(var nu_:TNoteURL;url_:string):integer;
  procedure RunLinkUni(var Msg: TMessage; nu_:TNoteURL);


implementation

uses vcl.themes, Winapi.Windows, lcb_unit,
     sysutils, extend_diskutil, System.IOUtils, data_service,  Vcl.Styles, firedac.comp.client,
     fmKeyWordCommanderUnit, fmNoteEditUnit, fmSourceEditUnit, shellapi, fmmainunit,
     data.db, dmDataUnit, extend_data, extend_dialog;

procedure FillNoteLink(var tc_:TRichEdit;var nu_:TNoteURL;nid_:longint;source_id_,class_id_:longint );
var
  ns_, cs_:string;
  fdq_:TFdquery;
  cpos_:integer;
  link_label_, stoc_label_:string;
  i:integer;
  addstr_cnt:integer;
  procedure add_str(s:string);
  begin
    inc(addstr_cnt);
    tc_.Lines.add(s);
  end;

begin
  try
    addstr_cnt:=0;
    tc_.clear; ns_:='';
    nu_.link_count:=0;nu_.tag_count:=0;nu_.stoc_count:=0;
    //tc_.Lines.BeginUpdate;
    stoc_label_:='STOC: ';
    fdq_:=TFdquery.Create(nil);
    fdq_.Connection:=dm.sqlc;

    // тип идеи
    fdq_.SQL.Text:='select si.name from note_structure_item nsi, structure_item si where note_id='+int2str(nid_)+' and nsi.structure_item_id=si.id';
    fdq_.Open(); cs_:='';
    while not fdq_.eof do begin
      if cs_='' then
         cs_:='Тип идеи: '+fdq_['name']
      else
         cs_:=cs_+', '+fdq_['name'];
      fdq_.Next;
    end;
    if cs_<>'' then
      add_str(cs_);
    cs_:='';

    // источники/проекты
    cpos_:=length(tc_.Text)-addstr_cnt;
    fdq_.SQL.Text:='select * from note_source where note_id='+int2str(nid_)+' and ifnull(stoc_id,0)<>'+int2str(class_id_);
    fdq_.Open();
    while not fdq_.eof do begin
      if source_id_=fdq_['source_id'] then
        cs_:=''
      else
        cs_:=dm.get_source_fullname_by_id(fdq_['source_id'],1)+' ';
      cs_:='{'+cs_+dm.get_root_toc(null2int(fdq_['stoc_id']))+'}';
      inc(nu_.stoc_count);
      nu_.stoc_array[nu_.stoc_count].source_id:=fdq_['source_id'];
      nu_.stoc_array[nu_.stoc_count].stoc_id:=null2int(fdq_['stoc_id']);
      nu_.stoc_array[nu_.stoc_count].name:=cs_;
      if ns_<>'' then
        ns_:=ns_+', ';
      nu_.stoc_array[nu_.stoc_count].strpos:=length(stoc_label_)+length(ns_);
      ns_:=ns_+cs_;
      fdq_.Next;
    end;
    if ns_<>'' then begin
      add_str(stoc_label_+trim(ns_));
      for i := 1 to nu_.stoc_count do begin
        RichEditSetUrl(tc_,cpos_+nu_.stoc_array[i].strpos,length(nu_.stoc_array[i].name));
      end;
    end;

    // ключевые слова
    cpos_:=length(tc_.Text)-addstr_cnt;
    fdq_.Close;
    if DM.Get_Ini_Int_Par('KW_Note_Source',0)=0 then
      fdq_.SQL.Text:='select kn.name, kn.keyword_id from note_keyword nk, keyword_name kn where nk.note_id='+inttostr(nid_)+' and kn.id=nk.keyword_name_id order by kn.name'
    else with fdq_.SQL do begin
      clear;
      add('select distinct * from (');
      add('select kn.name, kn.keyword_id');
      add('from note_keyword nk, keyword_name kn');
      add('where nk.note_id='+inttostr(nid_)+' and kn.id=nk.keyword_name_id');
      add('union all');
      add('select kn.name, kn.keyword_id');
      add('from note_expanded_keyword nk, keyword_name kn');
      add('where nk.note_id='+inttostr(nid_)+' and kn.id=nk.keyword_name_id )');
      add(' order by name');
    end;
    ns_:='';
    fdq_.Open();
    while not fdq_.Eof do begin
      cs_:='#'+fdq_['name'];
      inc(nu_.tag_count);
      nu_.tag_array[nu_.tag_count].tid:=fdq_['keyword_id'];
      nu_.tag_array[nu_.tag_count].name:=cs_;
      if ns_<>'' then
        ns_:=ns_+', ';
      nu_.tag_array[nu_.tag_count].strpos:=length(ns_);
      ns_:=ns_+cs_;
      fdq_.Next;
    end;
    //ns_:=null2str(fmmain.sqlc.ExecSQLScalar(' select replace (group_concat(name),'','','', #'') from (select name from note_keyword nk, keyword_name kn where nk.note_id=:NID and kn.id=nk.keyword_name_id order by name)',[nid_]));
    if ns_<>'' then begin
      add_str(ns_);
      for i := 1 to nu_.tag_count do begin
        RichEditSetUrl(tc_,cpos_+nu_.tag_array[i].strpos,length(nu_.tag_array[i].name));
      end;
    end;

    // ссылки на заметки
    cpos_:=length(tc_.Text)-addstr_cnt;
    fdq_.Close;
    fdq_.SQL.clear;
    fdq_.SQL.add('select distinct note.name, note.id from note_link nl, note ');
    fdq_.SQL.add('where note.id in (nl.note1_id, nl.note2_id) and '+inttostr(nid_)+' in (nl.note1_id, nl.note2_id) and '+inttostr(nid_)+'<>note.id');
    fdq_.Open();
    ns_:=''; link_label_:='Links: ';
    while not fdq_.Eof do begin
      cs_:='['+fdq_['name']+']';
      inc(nu_.link_count);
      nu_.link_array[nu_.link_count].lid:=fdq_['id'];
      nu_.link_array[nu_.link_count].name:=cs_;
      if ns_<>'' then
        ns_:=ns_+', ';
      nu_.link_array[nu_.link_count].strpos:=length(link_label_)+length(ns_);
      ns_:=ns_+cs_;
      fdq_.Next;
    end;
    if ns_<>'' then begin
      add_str(link_label_+ns_);
      for i := 1 to nu_.link_count do begin
        RichEditSetUrl(tc_,cpos_+nu_.link_array[i].strpos,length(nu_.link_array[i].name));
      end;
    end;

    // urls
    cpos_:=length(tc_.Text)-addstr_cnt;
    fdq_.Close;
    fdq_.SQL.clear;
    fdq_.SQL.add('select id, url from note_url where note_id = '+inttostr(nid_));
    fdq_.Open();
    ns_:='';
    while not fdq_.Eof do begin
      cs_:=fdq_['url'];
      inc(nu_.url_count);
      nu_.url_array[nu_.url_count].uid:=fdq_['id'];
      nu_.url_array[nu_.url_count].name:=cs_;
      if ns_<>'' then
        ns_:=ns_+', ';
      nu_.url_array[nu_.url_count].strpos:=length(ns_);
      ns_:=ns_+cs_;
      fdq_.Next;
    end;
    if ns_<>'' then begin
      add_str(ns_);
      for i := 1 to nu_.url_count do begin
        RichEditSetUrl(tc_,cpos_+nu_.url_array[i].strpos,length(nu_.url_array[i].name));
      end;
    end;

    fdq_.Free;
  except
    // да и хер с ним!
  end;
end;

function get_keyword_picture(note_cnt_,source_cnt_:integer):integer;
begin
      if (note_cnt_=0) and (source_cnt_=0) then
          Result:=17
      else if (note_cnt_+source_cnt_) =1 then
        Result:=14
      else if (note_cnt_+source_cnt_)=2 then
        Result:=13
      else
        Result:=20

end;

procedure TSendPanel.RunLink(var Msg: TMessage);
var
 p: TENLink;
 Len: Integer;
 strURL: string;
 stoc_index:integer;
begin
 if (PNMHDR(Msg.lParam).code = EN_LINK) then begin
   RunLinkUni(Msg, self.noteURL)
 end else
   inherited;
end;

procedure RunLinkUni(var Msg: TMessage; nu_:TNoteURL);
var
 p: TENLink;
 Len: Integer;
 strURL: string;
 stoc_index:integer;
 is_mine:integer;
 source_id:longint;
begin
   p:= TENLink(Pointer(TWMNotify(Msg).NMHdr)^);
   if (p.Msg = WM_LBUTTONDOWN) then begin
     SendMessage(TWMNotifyFormat(Msg).From, EM_EXSETSEL, 0, Longint(@(p.chrg)));

     Len:= p.chrg.cpMax - p.chrg.cpMin;
     if Len = 0 then Exit;

     SetLength(strURL, Len + 1);
     Len:= SendMessage(TWMNotifyFormat(Msg).From, EM_GETSELTEXT, 0, Longint(PChar(strURL)));
     SetLength(strURL, Len);

     if strURL[1]='[' then // заметка
       NoteEdit(get_note_id_by_url(nu_,strURL))
     else if strURL[1]='#' then begin // ключевое слово
        if fmKeyWordCommander<>nil then begin
           fmKeyWordCommander.Close;
        end;
        fmKeyWordCommander := TfmKeyWordCommander.Create(fmmain,'',nil,get_tag_id_by_url(nu_,strURL));
        fmKeyWordCommander.show;
        fmKeyWordCommander.BringToFront;
     end
     else if strURL[1]='{' then begin // источник
        stoc_index:=null2int(get_stoc_index_by_url(nu_,strURL));
        source_id:=nu_.stoc_array[stoc_index].source_id;
        PostMessage(fmmain.handle, WM_GOTO_SOURCE_PROJ, source_id, stoc_index);
     end
     else if lowercase(strURL[1])='h' then begin // url
       ShellExecute(Application.Handle,PChar('open'),PChar(strURL), PChar(0), nil, SW_NORMAL);
     end;
   end

end;

procedure TSendGroupBox.RunLink(var Msg: TMessage);
begin
 if (PNMHDR(Msg.lParam).code = EN_LINK) then begin
   RunLinkUni(Msg, self.noteURL)
 end else
  inherited;
end;



function get_note_id_by_url(var nu_:TNoteURL;url_:string):integer;
var
  i:integer;
begin
  result:=0;
  for I := 1 to nu_.link_count do begin
    if url_= nu_.link_array[i].name then
      result:=nu_.link_array[i].lid;
  end;
end;

function get_stoc_index_by_url(var nu_:TNoteURL;url_:string):integer;
var
  i:integer;
begin
  result:=0;
  for I := 1 to nu_.stoc_count do begin
    if url_= nu_.stoc_array[i].name then
      result:=i;
  end;
end;

function get_tag_id_by_url(var nu_:TNoteURL;url_:string):integer;
var
  i:integer;
begin
  result:=0;
  for I := 1 to nu_.tag_count do begin
    if url_= nu_.tag_array[i].name then
      result:=nu_.tag_array[i].tid;
  end;
end;


begin
end.
