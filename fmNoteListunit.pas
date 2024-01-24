unit fmNoteListunit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  Vcl.Styles, VCl.Themes,
  dmDataUnit,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.DBCtrls, DBCtrlsEh, Vcl.Mask, DBLookupEh, Vcl.ExtCtrls,
  Vcl.CheckLst,  richedit, display_service, aliasform, TwoPanelControlForm, UrlPanels;



type
  TfmNoteList = class(TForm)
    dbgNoteList: TDBGridEh;
    pmNoteList: TPopupMenu;
    mnViewMode: TMenuItem;
    mnViewModeSimple: TMenuItem;
    mnViewCont: TMenuItem;
    mnSort: TMenuItem;
    mnSortDate: TMenuItem;
    mnSortDateDesc: TMenuItem;
    N1: TMenuItem;
    mnSortdateUp: TMenuItem;
    mnSortdateUpDesc: TMenuItem;
    N5: TMenuItem;
    mnSortName: TMenuItem;
    mnSortNameDesc: TMenuItem;
    mnSearchPossible: TMenuItem;
    mnSearchOff: TMenuItem;
    mnSearchFast: TMenuItem;
    mnSearchFull: TMenuItem;
    N4: TMenuItem;
    mnNoteAdd: TMenuItem;
    mnNoteDel: TMenuItem;
    mnNoteGoto: TMenuItem;
    fdqNote: TFDQuery;
    fdqNoteid: TFDAutoIncField;
    fdqNotesubpart_id: TIntegerField;
    fdqNotename: TWideMemoField;
    fdqNoteoriginal_text: TWideMemoField;
    fdqNotecontent: TWideMemoField;
    fdqNotelkcount: TIntegerField;
    fdqNotedate_time_create: TDateTimeField;
    fdqNotefast_text: TWideMemoField;
    fdqNotenote_show_mode: TIntegerField;
    fdqNotecontent_plain: TWideMemoField;
    fdqNotedate_time_update: TDateTimeField;
    fdqNotentype: TWideMemoField;
    fdqNoteattachcount: TIntegerField;
    fdqNotesrccount: TIntegerField;
    fdqNoteurlcount: TIntegerField;
    dsNote: TDataSource;
    pnRight: TGroupBox;
    reLinks: TRichEdit;
    gbFastNote: TGroupBox;
    dbmFastNote: TDBMemo;
    gbOriginal: TGroupBox;
    dbmOriginal: TDBMemo;
    gbRightIdea: TGroupBox;
    dbrIdea: TDBRichEditEh;
    pnSearch: TPanel;
    lbSource: TLabel;
    clbFindItem: TCheckListBox;
    leFindStr: TLabeledEdit;
    dblSource: TDBLookupComboboxEh;
    cbUseCase: TCheckBox;
    btFind: TButton;
    btFindCancel: TButton;
    fdqNotesplitter_param: TIntegerField;
    fdqNoteform_width: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgNoteListColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgNoteListColumns1GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgNoteListColumns2GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgNoteListColumns3GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mnSortDateClick(Sender: TObject);
    procedure pmNoteListPopup(Sender: TObject);
    procedure fdqNoteAfterScroll(DataSet: TDataSet);
    procedure mnSearchOffClick(Sender: TObject);
    procedure btFindClick(Sender: TObject);
    procedure btFindCancelClick(Sender: TObject);
    procedure leFindStrKeyPress(Sender: TObject; var Key: Char);
    procedure mnViewModeSimpleClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgNoteListDblClick(Sender: TObject);
    procedure dbrIdeaEnter(Sender: TObject);
    procedure dbgNoteListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnNoteAddClick(Sender: TObject);
    procedure mnContentEditClick(Sender: TObject);
    procedure pmContentPopup(Sender: TObject);
    procedure dbrIdeaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbrIdeaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    sql_save:ansistring;
    mode:integer;
    search_mode:integer;
    nsrt:integer;
    full_find_cond:string;
    original_width:integer;
    procedure RecreateSQLAndReopen;
    procedure SetSearchMode(sm_:integer);
    procedure SetViewMode(mode_:integer);
    procedure SetOriMainProp;
  public
    { Public declarations }
    note_url:TNoteURL;
  end;

var
  fmNoteList: TfmNoteList;

implementation

{$R *.dfm}

uses fmMainUnit, extend_data, lcb_unit, data_service, extend_dialog, fmNoteEditUnit;

const
  sort_array:array[0..7] of string=(
    'order by id ','order by id desc',
    'order by date_time_update ','order by date_time_update desc',
    'order by ru_lower(name)','order by ru_lower(name) desc',
    'order by (select ifnull(ns.order_,0) from note_source ns where ns.source_id=%s and nn.id=ns.note_id),id desc',
    'order by '+
        '(select ifnull(ts.order_,0) from tmp_stoc ts, note_source ns where ns.source_id=%s and nn.id=ns.note_id and ts.id=ns.stoc_id),'+
        '(select ifnull(order_,0) from note_source ns where ns.source_id=%s and nn.id=ns.note_id),'+
        '(select ifnull(page_from,0) from note_source ns where ns.source_id=%s and nn.id=ns.note_id),'+
        'id desc');



procedure TfmNoteList.btFindCancelClick(Sender: TObject);
begin
  self.full_find_cond:='';
  self.RecreateSQLAndReopen;
  btFindCancel.Visible:=false;
  self.dbgNoteList.OptionsEh:=self.dbgNoteList.OptionsEh-[dghShowRecNo]; //dghShowRecNo;

end;

procedure TfmNoteList.btFindClick(Sender: TObject);
var
  cnt_, i_:integer;
begin
  if (length(null2str(leFindStr.Text))<3)
    and not ((length(null2str(leFindStr.Text))>=1) and clbFinditem.Checked[6]) then begin
    msgerror('Строка для поиска должна состоять минимум из 3-х символов!');
    exit;
  end;
  cnt_:=0;
  for i_ := 0 to clbFindItem.Count - 1 do
    if clbFindItem.Checked[i_] then Inc(cnt_);
  if cnt_=0 then begin
    msgerror('Не задано ни одной области поиска!');
    exit;
  end;

  //fdqNote.close;
  //fdqNote.SQL.Text:=sql_save+' and (';
  full_find_cond:=' and (';
  cnt_:=0;
  if clbFinditem.Checked[0] then begin // наименование
     if cbUseCase.Checked then
       full_find_cond:=full_find_cond+' n.name like ''%'+lefindstr.Text+'%'' '
     else
       full_find_cond:=full_find_cond+' ru_lower(nn.name) like ru_lower(''%'+lefindstr.Text+'%'') ';
     inc(cnt_);
  end;
  if clbFinditem.Checked[2] then begin // текст быстрой заметок
    if cnt_>0 then
      full_find_cond:=full_find_cond+' or ';
    if cbUseCase.Checked then
      full_find_cond:=full_find_cond+' fast_text like ''%'+lefindstr.Text+'%'' '
    else
      full_find_cond:=full_find_cond+' ru_lower(fast_text) like ru_lower(''%'+lefindstr.Text+'%'') ';
    inc(cnt_);
  end;
  if clbFinditem.Checked[1] then begin // текст заметок
    if cnt_>0 then
      full_find_cond:=full_find_cond+' or ';
    if cbUseCase.Checked then
      full_find_cond:=full_find_cond+' content_plain like ''%'+lefindstr.Text+'%'' '
    else
      full_find_cond:=full_find_cond+' ru_lower(content_plain) like ru_lower(''%'+lefindstr.Text+'%'') ';
    inc(cnt_);
  end;
  if clbFinditem.Checked[4] then begin // ключевым словам
    if cnt_>0 then
      full_find_cond:=full_find_cond+' or ';
    if cbUseCase.Checked then
      full_find_cond:=full_find_cond+' exists (select * from keyword k, note_keyword nk where nk.keyword_id=k.id and nk.note_id=nn.id and (k.name_w_synonym like ''%'+lefindstr.Text+'%'' or k.note like ''%'+lefindstr.Text+'%'' )) '
    else
      full_find_cond:=full_find_cond+' exists (select * from keyword k, note_keyword nk where nk.keyword_id=k.id and nk.note_id=nn.id and (ru_lower(k.name_w_synonym) like ru_lower(''%'+lefindstr.Text+'%'') or ru_lower(k.note) like ru_lower(''%'+lefindstr.Text+'%'') )) ';
    inc(cnt_);
  end;
  if clbFinditem.Checked[5] then begin // ссылкам на оглавление
    if cnt_>0 then
      full_find_cond:=full_find_cond+' or ';
    if cbUseCase.Checked then
      full_find_cond:=full_find_cond+' exists (select * from source_toc st, note_source ns where ns.note_id=nn.id and ns.stoc_id=st.id and st.name like ''%'+lefindstr.Text+'%'' ) '
    else
      full_find_cond:=full_find_cond+' exists (select * from source_toc st, note_source ns where ns.note_id=nn.id and ns.stoc_id=st.id and ru_lower(st.name) like ru_lower(''%'+lefindstr.Text+'%'')) ';
    inc(cnt_);
  end;
  if clbFinditem.Checked[6] then begin // ID заметки
    if cnt_>0 then
      full_find_cond:=full_find_cond+' or ';
    full_find_cond:=full_find_cond+' nn.id ='+int2str(str2int(lefindstr.Text));
    inc(cnt_);
  end;
  if clbFinditem.Checked[3] then begin // исходный текст
    if cnt_>0 then
      full_find_cond:=full_find_cond+' or ';
    if cbUseCase.Checked then
      full_find_cond:=full_find_cond+' original_text like ''%'+lefindstr.Text+'%'' '
    else
      full_find_cond:=full_find_cond+' ru_lower(original_text) like ru_lower(''%'+lefindstr.Text+'%'') ';
    inc(cnt_);
  end;
  full_find_cond:=full_find_cond+' ) ';
  if null2int(dblSource.KeyValue)>0 then
    full_find_cond:=full_find_cond+' and exists (select * from note_source ns where note_id=nn.id and source_id='+inttostr(dblSource.KeyValue)+') ';
  //filtered:=fmmain.SQL_Note_Add_Filter(fdqSearch);
  //fdqNote.SQL.Add(sort_array[nsrt]);
  //lcbs.log(fdqNote.SQL.text);
  //fdqNote.open;
  self.RecreateSQLAndReopen;
  btFindCancel.Visible:=true;
  self.dbgNoteList.OptionsEh:=self.dbgNoteList.OptionsEh+[dghShowRecNo]; //dghShowRecNo;

end;

procedure TfmNoteList.dbgNoteListColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if null2int(ds_['id'])<>0 then begin
    Params.ImageIndex :=get_note_picture(null2str(ds_['ntype']),null2int(ds_['srccount']));
  end;

end;

procedure TfmNoteList.dbgNoteListColumns1GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  Params.ImageIndex :=-1;
  if null2int(ds_['id'])<>0 then begin
    if null2int(ds_['attachcount'])>0 then
      Params.ImageIndex :=41;
  end;


end;

procedure TfmNoteList.dbgNoteListColumns2GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  Params.ImageIndex :=-1;
  if null2int(ds_['id'])<>0 then begin
    if null2int(ds_['urlcount'])>0 then
      Params.ImageIndex :=43;
  end;
end;

procedure TfmNoteList.dbgNoteListColumns3GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  Params.ImageIndex :=-1;
  if null2int(ds_['id'])<>0 then begin
    if null2int(ds_['lkcount'])>0 then
      Params.ImageIndex :=42;
  end;

end;


procedure TfmNoteList.dbgNoteListDblClick(Sender: TObject);
begin
  if (fmNoteEdit=nil) or not assigned(fmNoteEdit) then
    fmNoteEdit := TfmNoteEdit.CreateWithData(0,0, 0, fdqnote['id'],dbEdit,fmmain);
  fmNoteEdit.show;

end;

procedure TfmNoteList.dbgNoteListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then begin
    dbgNoteListDblClick(sender);
    exit;
  end;

end;

procedure TfmNoteList.dbrIdeaEnter(Sender: TObject);
begin
  RecoverDBRDefFontColor(dbrIdea);

end;

procedure TfmNoteList.dbrIdeaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin // чиним глюк попытки изменения содержимого по правой кнопке мыши
    lcb.log('dbrIdeaMouseDown');
    //sleep(500);
    //RecoverDBRDefFontColor(dbridea)
  end;

end;

procedure TfmNoteList.dbrIdeaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin // чиним глюк попытки изменения содержимого по правой кнопке мыши
    lcb.log('dbrIdeaMouseUp');
    keybd_event(VK_ESCAPE,0,0,0);
    keybd_event(VK_ESCAPE,0,KEYEVENTF_KEYUP,0);
    Application.ProcessMessages;
    //RecoverDBRDefFontColor(dbridea)
  end;

end;

procedure TfmNoteList.SetOriMainProp;
var
  dow_,dfw_, owc_:integer;
begin
      dow_:=null2int(fdqNote['splitter_param']);
      dfw_:=null2int(fdqNote['form_width']);
      if (dow_>0) and (dfw_>0) and (dfw_>dow_) then begin
        owc_:=round(pnRight.Width*(dow_/dfw_));
        if (owc_<original_width) or (pnRight.Width-owc_<original_width) then begin
             owc_:=round(pnRight.Width /2)
        end
        else if pnRight.Width-owc_<original_width then
           owc_:=pnRight.Width-original_width;

        gbOriginal.Width:=owc_;
      end
      else
         gbOriginal.Width:=original_width;

end;

procedure TfmNoteList.fdqNoteAfterScroll(DataSet: TDataSet);
var
  dtc_,dtu_, cap_:string;
begin

  if not dbgNoteList.SearchPanel.Active and pnRight.Visible and not fdqNote.ControlsDisabled then begin
    gbFastNote.Visible:=(fdqNote['note_show_mode']=1) or (fdqNote['note_show_mode']=3);
    gbOriginal.Visible:=(fdqNote['note_show_mode']=2) or (fdqNote['note_show_mode']=3);
    dtc_:=''; dtu_:='';
    if DataSet['date_time_create'] <> null then
      DateTimeToString(dtc_,'dd.mm.yy hh:nn',DataSet['date_time_create']);
    if DataSet['date_time_update'] <> null then
      DateTimeToString(dtu_,'dd.mm.yy hh:nn',DataSet['date_time_update']);
    cap_:='Заметка ID='+inttostr(dataset['id'])+' от '+dtc_;
    if dtu_<>'' then
      cap_:=cap_+' / '+dtu_;
    pnRight.Caption:=cap_;

    reLinks.Lines.Clear;
    FillNoteLink(reLinks,note_url,DataSet['id'],-1,-1); // делаем раз, чтобы было что считать
    pnRight.noteURL:=note_url;

    Set_TRichEdit_Height(reLinks);
    if gbOriginal.Visible then begin
      SetOriMainProp
    end;

    //Set_TRichEdit_V_ScroolBar(memRightLink); // после смены скрулбара почему то нужно менять все
    //memRightLink.Lines.Clear;
    //FillNoteLink(memRightLink,note_url,DataSet['id'],-1,-1);
    //gbLink.noteURL:=note_url;
    //mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
    //SendMessage(memRightLink.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
    //dbrIdea.ReadOnly := False;
    RecoverDBRDefFontColor(dbrIdea);
    RecoverDBRDefFontColor(reLinks);
    //dbrIdea.Modified := False;

  end;
end;

procedure TfmNoteList.FormActivate(Sender: TObject);
var
  old_id_:longint;
begin
  if fmmain.NoteListNeedRefresh then begin
    if not (fdqNote.Filtered) then begin
      old_id_:=null2int(fdqNote['id']);
      RecreateSQLAndReopen;
      if (fdqNote.RecordCount>0) then begin
        fdqNote.DisableControls;
        fdqNote.Locate('id',old_id_,[]);
        fdqNote.EnableControls;
        fdqNoteAfterScroll(fdqNote);
      end;
      fmmain.NoteListNeedRefresh:=false;
    end
    else
      fdqNote.Refresh
  end;

end;

procedure TfmNoteList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=caFree;
  fmNoteList:=nil;
  fmmain.mnnotes.Enabled:=true;

end;

procedure TfmNoteList.FormCreate(Sender: TObject);
var
  i:integer;
  mask: Word;
begin
  fmmain.NoteListNeedRefresh:=true;
  for i:=0 to clbFindItem.Items.Count-1 do begin
    clbFindItem.Checked[i]:=true;
  end;
  original_width:=dbmOriginal.Width;
  nsrt:=DM.Get_Ini_Int_Par(alias+par_sort);
  sql_save:=fdqNote.SQL.Text;
  SetSearchMode(DM.Get_Ini_Int_Par(alias+par_search));
  SetViewMode(DM.Get_Ini_Int_Par(alias+par_mode));

  mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(reLinks.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);


end;

procedure TfmNoteList.FormResize(Sender: TObject);
begin
  if mode=1 then
    dbgNoteList.Width:=round(self.ClientWidth/2);

  if self.pnRight.Visible and self.gbOriginal.Visible then
    SetOriMainProp


end;

procedure TfmNoteList.leFindStrKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then begin
      Key:=#0;
      btFindClick(sender);
      exit;
  end;
  inherited

end;

procedure TfmNoteList.mnContentEditClick(Sender: TObject);
begin
  dbgNoteListDblClick(sender)
end;

procedure TfmNoteList.mnNoteAddClick(Sender: TObject);
begin
    if fmNoteEdit<>nil then begin
      fmNoteEdit.Close;
      Application.ProcessMessages
    end;
    fmNoteEdit := TfmNoteEdit.CreateWithData(0,0,0,-1,dbInsert,fmmain);
    fmNoteEdit.show;

end;

procedure TfmNoteList.mnSearchOffClick(Sender: TObject);
begin
  self.SetSearchMode((sender as TMenuItem).tag);
  RecreateSQLAndReopen
end;

procedure TfmNoteList.mnSortDateClick(Sender: TObject);
begin
  nsrt:=(sender as TMenuItem).tag;
  DM.Set_Ini_Int_Par(alias+par_sort,nsrt);
  RecreateSQLAndReopen;
end;

procedure TfmNoteList.mnViewModeSimpleClick(Sender: TObject);
begin
  SetViewMode((sender as TMenuItem).tag);
  fdqNoteAfterScroll(fdqNote)
end;

procedure TfmNoteList.pmContentPopup(Sender: TObject);
begin
  dbridea.DataSource.DataSet.Cancel

end;

procedure TfmNoteList.pmNoteListPopup(Sender: TObject);
begin
  mnSortDate.Checked:=false;
  mnSortDateDesc.Checked:=false;
  mnSortdateUp.Checked:=false;
  mnSortdateUpDesc.Checked:=false;
  mnSortName.Checked:=false;
  mnSortNameDesc.Checked:=false;
  case nsrt of
  0: mnSortDate.Checked:=true;
  1: mnSortDateDesc.Checked:=true;
  2: mnSortdateUp.Checked:=true;
  3: mnSortdateUpDesc.Checked:=true;
  4: mnSortName.Checked:=true;
  5: mnSortNameDesc.Checked:=true;
  end;

  mnSearchOff.Checked:=false;
  mnSearchFast.Checked:=false;
  mnSearchFull.Checked:=false;
  case self.search_mode of
  0:mnSearchOff.Checked:=true;
  1:mnSearchFast.Checked:=true;
  2:mnSearchFull.Checked:=true;
  end;

  mnViewModeSimple.Checked:=false;
  mnViewCont.Checked:=false;
  case mode of
  0: mnViewModeSimple.Checked:=true;
  1: mnViewCont.Checked:=true;
  end;



end;

procedure TfmNoteList.RecreateSQLAndReopen;
begin
  fdqNote.Close;
  fdqNote.SQL.Text:=self.sql_save;
  fdqNote.SQL.add(full_find_cond);
  fdqNote.SQL.Add(sort_array[nsrt]);
  fdqNote.open;
end;

procedure TfmNoteList.SetSearchMode(sm_:integer);
begin
  search_mode:=sm_;
  DM.Set_Ini_Int_Par(alias+par_search,search_mode);
  full_find_cond:='';
  leFindStr.Text:='';
  btFindcancel.Visible:=false;
  self.dbgNoteList.OptionsEh:=self.dbgNoteList.OptionsEh-[dghShowRecNo]; //dghShowRecNo;

  case search_mode of
  0: begin
       self.dbgNoteList.SearchPanel.SearchingText:='';
       self.dbgNoteList.SearchPanel.CancelSearchFilter;
       self.dbgNoteList.SearchPanel.Enabled:=false;
       self.pnSearch.Visible:=false;
     end;
  1: begin
       self.dbgNoteList.SearchPanel.Enabled:=true;
       self.pnSearch.Visible:=false;
     end;
  2: begin
       self.dbgNoteList.SearchPanel.Enabled:=false;
       self.dbgNoteList.SearchPanel.SearchingText:='';
       self.dbgNoteList.SearchPanel.CancelSearchFilter;
       self.pnSearch.Visible:=true;
     end;
  end;
end;


procedure TfmNoteList.SetViewMode(mode_:integer);
begin
  mode:=mode_;
  dm.Set_Ini_Int_Par(alias+par_mode,mode);
  case mode of
  0: begin // только названия
       pnRight.Visible:=false;
       dbgNoteList.Align:=alClient;
     end;
  1: begin // Содержимое заметки
       dbgNoteList.Align:=alLeft;
       dbgNoteList.Width:=round(self.Width/2);
       pnRight.Visible:=true;
     end;
  end;
end;

end.
