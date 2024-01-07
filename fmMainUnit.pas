unit fmMainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  extend_data,
  Vcl.Styles, VCl.Themes,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.AppEvnts,
  System.Actions, Vcl.ActnList, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, MemTableDataEh,
  DataDriverEh, MemTableEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, AliasForm;

const
  WM_GOTO_NOTE = WM_USER + 2001;
  WM_GOTO_SOURCE_PROJ = WM_USER + 2002;
  WM_CREATE_LINK_NOTE = WM_USER + 2005;
  WM_GOTO_TASK = WM_USER + 2007;


type
  Tfmmain = class(TForm)
    MainMenu: TMainMenu;
    mnInput: TMenuItem;
    mnNotes: TMenuItem;
    mnTagCommander: TMenuItem;
    mnSources: TMenuItem;
    mnAuthorList: TMenuItem;
    mnMyProj: TMenuItem;
    mnService: TMenuItem;
    mnParams: TMenuItem;
    mnTray: TMenuItem;
    mnStat: TMenuItem;
    mnStatNote: TMenuItem;
    mnStatKW: TMenuItem;
    N3: TMenuItem;
    mnLoadFastNoteTelegram: TMenuItem;
    N2: TMenuItem;
    mbAbout: TMenuItem;
    pnTitle: TPanel;
    lbDBFileName: TLabel;
    TreeImage: TImageList;
    aeMain: TApplicationEvents;
    mnKWJoin: TMenuItem;
    N1: TMenuItem;
    mnHistory: TMenuItem;
    N4: TMenuItem;
    MainActionList: TActionList;
    History: TAction;
    mnTask: TMenuItem;
    mnControl: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure lbDBFileNameDblClick(Sender: TObject);
    procedure mnParamsClick(Sender: TObject);
    procedure mnNotesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnAuthorListClick(Sender: TObject);
    procedure mnSourcesClick(Sender: TObject);
    procedure mnTagCommanderClick(Sender: TObject);
    procedure mnLoadFastNoteTelegramClick(Sender: TObject);
    procedure mnMyProjClick(Sender: TObject);
    procedure aeMainActivate(Sender: TObject);
    procedure mnKWJoinClick(Sender: TObject);
    procedure mnTrayClick(Sender: TObject);
    procedure mnStatNoteClick(Sender: TObject);
    procedure mnStatKWClick(Sender: TObject);
    procedure mbAboutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnHistoryOne(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure HistoryExecute(Sender: TObject);
    procedure mnTaskClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    //KBHook: HHook; {this intercepts keyboard input}
    cx, cy : integer; {track battle ship's position}
    //klav : Integer;
    //procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Public declarations }
    NoteListNeedRefresh:boolean;
    KeywordListNeedRefresh:boolean;
    TelegramNeedRefresh:boolean;
    SourceListNeedRefresh:array [0..1] of boolean; // источник или проект нуждается в обновлении
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure ReBuildHistory;
  end;

  //function KeyboardHookProc(Code: Integer; WordParam: Word; LongParam: LongInt): LongInt; stdcall;


var
  fmmain: Tfmmain;

implementation

{$R *.dfm}

uses
  extend_dialog, extend_diskutil, extend_ini, extend_graph,
  display_service, URLPanels, scale_icons,
  fmSetupUnit, data_service,dmdataUnit,
  fmNoteListunit, fmAuthorListUnit, fmSourceListUnit, fmKeywordCommanderUnit,
  fmTelegramUnit, fmKeywordJoinUnit, fmNoteEditUnit, fmNoteStatUnit,
  lcb_unit,RichEditRTF,
  fmKeywordStatUnit, fmAboutUnit, fmSourceEditUnit, fmTaskListUnit,
  fmTaskEditUnit, fmFilterUnit;

const
    HOTKEY_F8 = WM_USER + 1;

procedure Tfmmain.aeMainActivate(Sender: TObject);
begin
  if fmTelegram<>nil then begin
    fmTelegram.FormActivate(sender);
  end;
end;

procedure Tfmmain.FormCreate(Sender: TObject);
var
  style_, fname:string;
  Style    : TStyleManager.TStyleServicesHandle;
begin
  NoteListNeedRefresh:=true;
  TelegramNeedRefresh:=true;
  Application.OnMessage:=AppMessage;
  //klav := GlobalAddAtom('Hotkey4');
  //RegisterHotKey(Handle, klav, 0, VK_LWIN);
  //RegisterHotKey(Handle, HOTKEY_F8, MOD_CONTROL, Ord('S'));
(*KBHook:=SetWindowsHookEx(WH_KEYBOARD,   {callback >} @KeyboardHookProc,
                           HInstance,
                           GetCurrentThreadId()) ;*)
  style_:=DM.Get_Ini_Str_Par('ColorStyle','');
  if style_<>'' then begin
      TStyleManager.TrySetStyle(style_);
  end;

{  fname:='C:\Projects\Progressor\lbase\scheme\Windows11_Modern_Light.vsf';

   if TStyleManager.IsValidStyle( fname) then
    begin
      Style := TStyleManager.LoadFromFile( fname);
      if Assigned( Style) then
      begin
        TStyleManager.SetStyle( Style);
      end;
    end;}


  lbDBFileName.Caption:='Файл БД: '+ExtractFileName(dm.sqlc.Params.Database);

end;

{procedure Tfmmain.WMHotKey(var Msg: TWMHotKey);
begin
 if Msg.HotKey = klav then
    Button1Click(nil);
end;}

procedure Tfmmain.FormDestroy(Sender: TObject);
begin
  //UnHookWindowsHookEx(KBHook) ;
  if dm.sqlc.Connected then
    dm.sqlc.Close;
end;

procedure Tfmmain.FormShow(Sender: TObject);
begin
  ReBuildHistory
end;

procedure Tfmmain.HistoryExecute(Sender: TObject);
begin
 if IsAppThemed then begin
   keybd_event(VK_F10,0,0,0);
   keybd_event(VK_F10,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_DOWN,0,0,0);
   keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_DOWN,0,0,0);
   keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_UP,0,0,0);
   keybd_event(VK_UP,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_RIGHT,0,0,0);
   keybd_event(VK_RIGHT,0,KEYEVENTF_KEYUP,0);
 end
 else begin
   keybd_event(VK_F10,0,0,0);
   keybd_event(VK_F10,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_DOWN,0,0,0);
   keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_UP,0,0,0);
   keybd_event(VK_UP,0,KEYEVENTF_KEYUP,0);
   keybd_event(VK_RIGHT,0,0,0);
   keybd_event(VK_RIGHT,0,KEYEVENTF_KEYUP,0);
 end;

end;

procedure Tfmmain.lbDBFileNameDblClick(Sender: TObject);
begin
  if msgquestion(format('Сбросить автооткрытие файла [%s] при следующем запуске программы?',[dm.sqlc.Params.Database])) then begin
    extend_ini.SetBoolValue('DB','AutoOpen',false);
    msgok('Параметр автооткрытия текущей базы убран! В следующий запуск программы Вы сможете сменить файл БД или создать новый.');
  end

end;

procedure Tfmmain.mbAboutClick(Sender: TObject);
begin
  fmAbout:=TfmAbout.Create(self);
  fmAbout.Showmodal;
  fmAbout.free;
end;

procedure Tfmmain.mnAuthorListClick(Sender: TObject);
begin
  if fmAuthorList=nil then
    fmAuthorList := TfmAuthorList.CreateWithAlias(self,'fmAuthorList');
  fmAuthorList.show;

end;

procedure Tfmmain.mnKWJoinClick(Sender: TObject);
begin
  if fmKeywordJoin<>nil then begin
     fmKeywordJoin.Close;
     Application.ProcessMessages;
  end;
  fmKeywordJoin := TfmKeywordJoin.CreateWithAlias(self,'fmKeywordJoin');
  fmKeywordJoin.Show;
end;

procedure Tfmmain.mnLoadFastNoteTelegramClick(Sender: TObject);
var
  phone_:string;
begin
  phone_:=dm.Get_Ini_Str_Par('TelegramPhone');
  if phone_='' then begin
    if inputstr('Ввод данных','Укажите свой номер телефона в формате, на который зарегестрирован Ваш Telegram',phone_) then begin
      if phone_<>'' then
        dm.Set_Ini_Str_Par('TelegramPhone',phone_)
      else begin
        msgerror('Номер телефона не может быть пустым!');
        exit;
      end;
    end;
  end;
  if fmTelegram<>nil then begin
    fmTelegram.Close;
  end;
  fmTelegram:=TFmTelegram.CreateWithAlias(self,'fmTelegram');
  fmTelegram.show;


end;

procedure Tfmmain.mnMyProjClick(Sender: TObject);
begin
  if fmProjectList<>nil then begin
    fmProjectList.Close;
    Application.ProcessMessages
  end;
  fmProjectList := TfmSourceList.CreateWithData(1,self);
  fmProjectList.show;

end;

procedure Tfmmain.mnNotesClick(Sender: TObject);
begin
  if fmNoteList<>nil then begin
    fmNoteList.Close;
    Application.ProcessMessages
  end;
  fmNoteList := TfmNoteList.createWithAlias(self,'fmNoteList');//CreateWithData(0,null2int(dblSource.KeyValue),[],false,0,0,self);
  fmNoteList.show;

end;

procedure Tfmmain.mnParamsClick(Sender: TObject);
begin
  if fmSetup=nil then
    fmSetup := TfmSetup.CreateWithAlias(self,'fmSetup');
  fmSetup.show;

end;

procedure Tfmmain.mnSourcesClick(Sender: TObject);
begin
  if fmSourceList<>nil then begin
    fmSourceList.Close;
    Application.ProcessMessages
  end;
  fmSourceList := TfmSourceList.CreateWithData(0,self);
  fmSourceList.show;

end;

procedure Tfmmain.mnStatKWClick(Sender: TObject);
begin
  if fmKeywordStat<>nil then begin
     fmKeywordStat.Close;
     Application.ProcessMessages
  end;
  fmKeywordStat := TfmKeywordStat.CreateWithAlias(self,'fmKeywordStat');
  fmKeywordStat.show;

end;

procedure Tfmmain.mnStatNoteClick(Sender: TObject);
begin
  if fmNoteStat<>nil then begin
     fmNoteStat.Close;
     Application.ProcessMessages
  end;
  fmNoteStat := TfmNoteStat.CreateWithAlias(self,'fmNoteStat');
  fmNoteStat.show;

end;

procedure Tfmmain.mnTagCommanderClick(Sender: TObject);
begin
  if fmKeyWordCommander<>nil then begin
     fmKeyWordCommander.Close;
     Application.ProcessMessages
  end;
  fmKeyWordCommander := TfmKeyWordCommander.Create(self,'',nil);
  fmKeyWordCommander.show;

end;

procedure Tfmmain.mnTaskClick(Sender: TObject);
begin
  if fmTaskList=nil then begin
    fmTaskList := TfmTaskList.CreateWithAlias(self,'fmTaskList');
  end;
  fmTaskList.show;

end;

procedure Tfmmain.mnTrayClick(Sender: TObject);
begin
  dm.sqlc.Close;
  dm.sqlc.Open;
  dm.sqlc.ExecSQL('VACUUM;');
  dm.sqlc.Close;
  close;

end;

procedure Tfmmain.N4Click(Sender: TObject);
var
  fdq:TFdquery;
  prav:string;
  cnt:integer;
begin
  fdq:=tFdquery.Create(nil);
  fdq.Connection:=dm.sqlc;
  fdq.SQL.Text:='select * from note order by id' ;
  fdq.Open(); cnt:=0;
  while not fdq.eof do begin
    prav:=RemoveColor(fdq['content'],TStyleManager.ActiveStyle.GetSystemColor(clWindowText));
    if fdq['content']<>prav then begin
      lcb.Log('');
      lcb.Log('ID='+inttostr(fdq['id']));
      lcb.Log(fdq['content']);
      lcb.Log('PRAV');
      lcb.Log(prav);
      dm.sqlc.ExecSQL('update note set content =:NC where id=:IID',[prav,fdq['id']]);
      inc(cnt);
    end;
    fdq.next;
  end;
  lcb.Log('cnt='+inttostr(cnt));
  fdq.Close;
  fdq.Free;



end;

procedure Tfmmain.N6Click(Sender: TObject);
begin
  if fmFilter<>nil then begin
    fmFilter.Close;
    Application.ProcessMessages
  end;
  fmFilter := TfmFilter.create(self);
  fmFilter.show;

end;

procedure TfmMain.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  source_id, stoc_id:longint;
begin
  if Msg.message=WM_GOTO_NOTE then begin
    if fmNoteEdit<>nil then begin
       fmNoteEdit.Close;
       application.ProcessMessages;
    end;
    fmNoteEdit := TfmNoteEdit.CreateWithData(0,0,0,Msg.wParam,dbEdit,self);
    fmNoteEdit.show;
  end;
  if Msg.message=WM_GOTO_SOURCE_PROJ then begin
    if dm.sqlc.ExecSQLScalar('select is_mine from source where id=:SID',[Msg.wParam])=0 then begin
      // источник
      if fmSourceEdit<>nil then begin
        fmSourceEdit.Close;
        Application.ProcessMessages;
      end;
      fmSourceEdit:=TfmSourceEdit.CreateWithData(Msg.wParam,Msg.lParam ,0,DBEdit,fmmain);
      fmSourceEdit.show;
    end
    else begin
      // проект
      if fmProjectEdit<>nil then begin
        fmProjectEdit.Close;
        Application.ProcessMessages;
      end;
      fmProjectEdit:=TfmSourceEdit.CreateWithData(Msg.wParam,Msg.lParam,1,DBEdit,fmmain);
      fmProjectEdit.show;
    end;
  end;
  if Msg.message=WM_CREATE_LINK_NOTE then begin // создать связанную заметку
    if fmNoteEdit<>nil then begin
        fmNoteEdit.Close;
        Application.ProcessMessages;
    end;
    dm.get_def_source_stoc(source_id, stoc_id);
    fmNoteEdit := TfmNoteEdit.CreateWithData(source_id, stoc_id, 0, -1,dbInsert,fmmain);
    fmNoteEdit.corr_note_id:=Msg.wParam;
    fmNoteEdit.show;
  end;
  if Msg.message=WM_GOTO_TASK then begin // создать задачу
    if fmTaskEdit<>nil then begin
        fmTaskEdit.Close;
        Application.ProcessMessages;
    end;
    if Msg.wParam=0 then  // создание
      fmTaskEdit := TfmTaskEdit.CreateWithData(0, Msg.lParam,dbInsert,fmmain)
    else
      fmTaskEdit := TfmTaskEdit.CreateWithData(Msg.wParam, Msg.lParam,dbEdit,fmmain);
    fmTaskEdit.show;
  end;
end;




procedure TfmMain.ReBuildHistory;
var
  newitem: Tmenuitem;
  fdq:tFdquery;
  i:integer;
begin
  lcb.Log('rebuildmenu - начало');
  for I := mnHistory.Count-1 downto 0 do begin
     //mnHistory.Delete(i);
     mnHistory.Items[i].Destroy;
  end;

  fdq:=TFdquery.Create(nil);
  fdq.Connection:=dm.sqlc;
  with fdq.sql do begin
    clear;
    add('select');
    add('  source.id, source_fullname_by_id(source.id,1)  as "fullname::TEXT", dtc');
    add('from source,');
    add('(select id, max(date_time_update) dtc from');
    add('  (select id, date_time_update from source where date_time_create is not null');
    add('  union all');
    add('  select note_source.source_id, ifnull(note.date_time_update,note.date_time_create) from note, note_source where note.id=note_id)');
    add('  group by id');
    add(') maxd');
    add('where source.id=maxd.id');
    add('order by dtc desc');
  end;
  fdq.Open(); i:=0;
  while not fdq.eof do begin
    if i>10 then break;
    newitem := tmenuitem.create(Mainmenu);
    newitem.caption := fdq['fullname'];//+' '+fdq['date_time'];
    newitem.Tag := fdq['id'];
    newitem.onclick:=mnHistoryOne;
    mnHistory.insert(i, newitem);
    inc(i);
    fdq.Next;
  end;
  fdq.Close;
  fdq.Free;
  self.scale_menu;


  lcb.Log('rebuildmenu - конец');

end;

procedure TfmMain.mnHistoryOne(Sender: TObject);
var
  tag_:longint;
  is_mine:integer;
begin
  tag_:=(sender as TMenuItem).Tag;
  is_mine:=dm.sqlc.ExecSQLScalar('select is_mine from source where id=:II',[tag_]);
  if is_mine=0 then begin
    if fmSourceEdit<>nil then begin
      fmSourceEdit.Close;
    end;
    fmSourceEdit:=TfmSourceEdit.CreateWithData(tag_,0,0,DBEdit,fmmain);
    fmSourceEdit.show;
  end
  else begin
    if fmProjectEdit<>nil then begin
      fmProjectEdit.Close;
    end;
    fmProjectEdit:=TfmSourceEdit.CreateWithData(tag_ ,0,1,DBEdit,fmmain);
    fmProjectEdit.show;
  end;

end;


(*function KeyboardHookProc(Code: Integer; WordParam: Word; LongParam: LongInt) : LongInt;
var
  i:integer;
begin
  case WordParam of
   vk_F8: {erase battle ship's path}
    begin

 keybd_event(VK_F10,0,0,0);
 keybd_event(VK_F10,0,KEYEVENTF_KEYUP,0);
 {keybd_event(VK_DOWN,0,0,0);
 keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
 keybd_event(VK_UP,0,0,0);
 keybd_event(VK_UP,0,KEYEVENTF_KEYUP,0);
 keybd_event(VK_RIGHT,0,0,0);
 keybd_event(VK_RIGHT,0,KEYEVENTF_KEYUP,0);}
 Result:=0;
 exit;

      //fmmain.Button1Click(fmmain);
       keybd_event(VK_F10,0,0,0);
       keybd_event(VK_F10,0,KEYEVENTF_KEYUP,0);
         keybd_event(VK_DOWN,0,0,0);
       {
         keybd_event(VK_DOWN,0,0,0);
         keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);}
       {for i:=1 to 7 do begin
         keybd_event(VK_DOWN,0,0,0);
         keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
       end;}
       //keybd_event(VK_UP,0,0,0);
       //keybd_event(VK_UP,0,KEYEVENTF_KEYUP,0);
       //keybd_event(VK_DOWN,0,0,0);
       //keybd_event(VK_DOWN,0,KEYEVENTF_KEYUP,0);
       {keybd_event(VK_RIGHT,0,0,0);
       keybd_event(VK_RIGHT,0,KEYEVENTF_KEYUP,0);
       keybd_event(VK_UP,0,0,0);
       keybd_event(VK_UP,0,KEYEVENTF_KEYUP,0);}

      Result:=0;
    end;
   else
      Result:=0;
  end; {case}

 {To prevent Windows from passing the keystrokes  to the target window, the Result value must  be a nonzero value.}
end; *)


end.
