unit fmSourceEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, MemTableDataEh, Data.DB,
  DataDriverEh, MemTableEh, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, DBCtrlsEh, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, Vcl.Mask, DBLookupEh, extend_data,
  display_service, TwoPanelControlForm, aliasform, UrlPanels;

const
  tab_name:array[0..1] of string=('note_source','source_toc');
  id_field:array[0..1] of string=('note_id','id');
  par_fname:array[0..1] of string=('SourceEdit','ProjectEdit');
  max_auth_kw_width:integer=269;
  min_source_type_width=100;
  sort_array:array[0..1] of string=('ifnull(order_,0), name','is_dir desc, ifnull(order_,0), name');

type


  TfmSourceEditPanelTagInfo = class(TPanelTagInfo)
     fdqSTOC,fdqSTOC_a, fdq_note, fdq_note_a:TFdquery;
     mteSTOC,mteSTOC_a:TMemTableEh;
     mem_dir, mem_dir_a:TMemo; // ИНФО директорий мемо
     memLink,memLink_a:TRichEdit; // связи заметки
     gbFastNote,gbFastNote_a:TGroupBox; // панель быстрой заметки
     memFastNote,memFastNote_a:TDBMemo; // memo быстрой заметки
     gbOriginal,gbOriginal_a:TGroupBox; // панель оригинального текста
     memOriginal,memOriginal_a:TDBMemo; // memo оригинального текста
     gbIdea,gbIdea_a:TGroupBox; // панель главной идеи
     dbrIdea, dbrIdea_a:TDBRichEditeh; // richEdit главной идеи
     note_url,note_url_a:TNoteURL;
     pnIdea3, pnIdea3_a:TPanel;
     fdqSTOCKW, fdqSTOCKW_a:TFdquery;
     dbgSTOCKW,dbgSTOCKW_a:TDBGridEh;
  end;


  TfmSourceEdit = class(TfmTwoPanelControl)
    pcSource: TPageControl;
    tsMain: TTabSheet;
    lbState: TLabel;
    lbType: TLabel;
    lbNoteView: TLabel;
    lbNotes: TLabel;
    Label1: TLabel;
    dblSourceType: TDBLookupComboboxEh;
    dbcStatus: TDBComboBoxEh;
    dbcNoteShowMode: TDBComboBoxEh;
    dbeNotes: TDBEditEh;
    dbgAuthor: TDBGridEh;
    dbgurl: TDBGridEh;
    dbgKeyword: TDBGridEh;
    dbgFiles: TDBGridEh;
    dblClass: TDBLookupComboboxEh;
    tsSTOC: TTabSheet;
    gbLeft: TGroupBox;
    dbgLeftSTOC: TDBGridEh;
    pnLeftCont: TPanel;
    memLeftLink: TRichEdit;
    pnLeftNote: TPanel;
    gbLeftFastNote: TGroupBox;
    dbmLeftFastNote: TDBMemo;
    gbLeftIdea: TGroupBox;
    dbrLeftIdea: TDBRichEditEh;
    gbLeftOriginal: TGroupBox;
    dbmLeftOriginal: TDBMemo;
    gbRight: TGroupBox;
    pnRightCont: TPanel;
    memRightLink: TRichEdit;
    pnRightNote: TPanel;
    gbRightFastNote: TGroupBox;
    dbmRightFastNote: TDBMemo;
    gbRightIdea: TGroupBox;
    dbrRightIdea: TDBRichEditEh;
    gbRightOriginal: TGroupBox;
    dbmRightOriginal: TDBMemo;
    dbgRightSTOC: TDBGridEh;
    pnTop: TPanel;
    lbName: TLabel;
    dbeName: TDBEditEh;
    pnBottom: TPanel;
    btOk: TButton;
    btRTF: TButton;
    fdqSource: TFDQuery;
    fdqSourceid: TFDAutoIncField;
    fdqSourcename: TWideMemoField;
    fdqSourcenotes: TWideMemoField;
    fdqSourcesource_type_id: TIntegerField;
    fdqSourcedate_time_create: TDateTimeField;
    fdqSourcenote_show_mode: TIntegerField;
    fdqSourcestatus: TIntegerField;
    fdqSourcecur_stoc_id: TIntegerField;
    fdqSourceis_mine: TIntegerField;
    fdqSourcefullname: TWideMemoField;
    fdqSourcesource_classification_id: TIntegerField;
    fdqSourcetelegram_message_id: TWideMemoField;
    dsSource: TDataSource;
    fdqLeftSTOC: TFDQuery;
    fdqLeftSTOCid: TFDAutoIncField;
    fdqLeftSTOCname: TWideMemoField;
    fdqLeftSTOCstoc_id: TIntegerField;
    fdqLeftSTOCsource_id: TIntegerField;
    fdqLeftSTOCorder_: TIntegerField;
    fdqLeftSTOCis_dir: TIntegerField;
    fdqLeftSTOCntype: TWideMemoField;
    fdqLeftSTOClink_cnt: TIntegerField;
    fdqLeftSTOCattach_cnt: TIntegerField;
    fdqLeftSTOClinka_cnt: TIntegerField;
    dsLeftSTOC: TDataSource;
    fdqLeftnote: TFDQuery;
    fdqLeftnoteid: TFDAutoIncField;
    fdqLeftnotesubpart_id: TIntegerField;
    fdqLeftnotename: TWideMemoField;
    fdqLeftnoteoriginal_text: TWideMemoField;
    fdqLeftnotecontent: TWideMemoField;
    fdqLeftnotecontent_plain: TWideMemoField;
    fdqLeftnotedate_time_create: TDateTimeField;
    fdqLeftnotefast_text: TWideMemoField;
    fdqLeftnotenote_show_mode: TIntegerField;
    fdqLeftnotesplitter_param: TIntegerField;
    fdqLeftnoteh_splitter_param: TIntegerField;
    fdqLeftnotedate_time_update: TDateTimeField;
    fdqLeftnoteform_width: TIntegerField;
    dsLeftnote: TDataSource;
    pmMain: TPopupMenu;
    mnChooseTheSame: TMenuItem;
    mnModeMaximized: TMenuItem;
    mnMode2Panel: TMenuItem;
    mnModeShowContent: TMenuItem;
    N3: TMenuItem;
    mnAdd: TMenuItem;
    mnNoteCreate: TMenuItem;
    mnEdit: TMenuItem;
    mnDel: TMenuItem;
    N7: TMenuItem;
    mnMove: TMenuItem;
    N2: TMenuItem;
    mnUpper: TMenuItem;
    mnDowner: TMenuItem;
    N1: TMenuItem;
    mnFolder2Rtf: TMenuItem;
    mnFolder2RtfWOriginal: TMenuItem;
    mnMoveStoc: TMenuItem;
    pmNote: TPopupMenu;
    mnNoteAdd: TMenuItem;
    mnNoteAttach: TMenuItem;
    N8: TMenuItem;
    mnNoteUp: TMenuItem;
    mnNoteDown: TMenuItem;
    N6: TMenuItem;
    mnNoteDeattach: TMenuItem;
    pmAuthor: TPopupMenu;
    mnAuthorAdd: TMenuItem;
    mnAuthorDel: TMenuItem;
    fdqSourceAuthor: TFDQuery;
    fdqSourceAuthorid: TFDAutoIncField;
    fdqSourceAuthorsource_id: TIntegerField;
    fdqSourceAuthorauthor_id: TIntegerField;
    dsSourceAuthor: TDataSource;
    fdqSourceURL: TFDQuery;
    fdqSourceURLid: TFDAutoIncField;
    fdqSourceURLsource_id: TIntegerField;
    fdqSourceURLurl: TWideMemoField;
    dsSourceURL: TDataSource;
    pmUrl: TPopupMenu;
    mnUrlAdd: TMenuItem;
    mnurldel: TMenuItem;
    mnurledit: TMenuItem;
    N4: TMenuItem;
    mnUrlGo: TMenuItem;
    pmKeyword: TPopupMenu;
    mnKeywordAdd: TMenuItem;
    MenuItem1: TMenuItem;
    mnKeywordDel: TMenuItem;
    fdqSourceKeyword: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    fdqSourceKeywordkeyword_id: TIntegerField;
    dsSourceKeyword: TDataSource;
    fdqSourceAttach: TFDQuery;
    fdqSourceAttachid: TIntegerField;
    fdqSourceAttachfilename: TWideMemoField;
    fdqSourceAttachsource_id: TIntegerField;
    fdqSourceAttachfile_size: TIntegerField;
    dsSourceAttach: TDataSource;
    OpenDialog: TOpenDialog;
    sdAttach: TSaveDialog;
    pmAttach: TPopupMenu;
    mnAttachAdd: TMenuItem;
    mnAttachDel: TMenuItem;
    mnFileOpen: TMenuItem;
    N5: TMenuItem;
    mbAttachSave: TMenuItem;
    fdqRightSTOC: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    WideMemoField1: TWideMemoField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    fdqRightSTOCntype: TWideMemoField;
    fdqRightSTOClink_cnt: TIntegerField;
    fdqRightSTOCattach_cnt: TIntegerField;
    fdqRightSTOClinka_cnt: TIntegerField;
    dsRightSTOC: TDataSource;
    FDqRightNote: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    IntegerField6: TIntegerField;
    WideMemoField2: TWideMemoField;
    WideMemoField3: TWideMemoField;
    WideMemoField4: TWideMemoField;
    WideMemoField5: TWideMemoField;
    DateTimeField1: TDateTimeField;
    WideMemoField6: TWideMemoField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    DateTimeField2: TDateTimeField;
    IntegerField10: TIntegerField;
    dsRightNote: TDataSource;
    mteLeftSTOC: TMemTableEh;
    dsdeLeftSTOC: TDataSetDriverEh;
    dsdeRightSTOC: TDataSetDriverEh;
    mteRightSTOC: TMemTableEh;
    FDqSourceClassification: TFDQuery;
    FDAutoIncField4: TFDAutoIncField;
    WideMemoField7: TWideMemoField;
    IntegerField11: TIntegerField;
    dsSourceClassification: TDataSource;
    fdqSourceAuthorauthor_name: TWideMemoField;
    fdqSourceKeywordname: TWideMemoField;
    fdqSourceType: TFDQuery;
    fdqSourceTypeid: TFDAutoIncField;
    fdqSourceTypename: TWideMemoField;
    fdqSourceTypecr_type: TIntegerField;
    dsSourceType: TDataSource;
    dsProjectClassification: TDataSource;
    fdqProjectClassification: TFDQuery;
    FDAutoIncField5: TFDAutoIncField;
    WideMemoField8: TWideMemoField;
    IntegerField12: TIntegerField;
    mnMode: TMenuItem;
    mnSortByName: TMenuItem;
    mnChangePanel: TMenuItem;
    memLeftDir: TMemo;
    memRightDir: TMemo;
    N9: TMenuItem;
    mnSort: TMenuItem;
    mnSortAll: TMenuItem;
    mnSortFolderUp: TMenuItem;
    fdqSourcedate_time_update: TDateTimeField;
    dbgSTOCKWRight: TDBGridEh;
    dbgSTOCKWLeft: TDBGridEh;
    fdqSTOCKWRight: TFDQuery;
    dsSTOCKWRight: TDataSource;
    fdqSTOCKWLeft: TFDQuery;
    dsSTOCKWLeft: TDataSource;
    pmSTOCKW: TPopupMenu;
    mnSTOCKWAdd: TMenuItem;
    mnSTOCKWDel: TMenuItem;
    fdqSTOCKWRightid: TFDAutoIncField;
    fdqSTOCKWRightsource_id: TIntegerField;
    fdqSTOCKWRightstoc_id: TIntegerField;
    fdqSTOCKWRightkeyword_id: TIntegerField;
    fdqSTOCKWRightkeyword_name_id: TIntegerField;
    fdqSTOCKWRightname: TWideMemoField;
    fdqSTOCKWRightclass_name_after: TWideMemoField;
    fdqSTOCKWLeftid: TFDAutoIncField;
    fdqSTOCKWLeftsource_id: TIntegerField;
    fdqSTOCKWLeftstoc_id: TIntegerField;
    fdqSTOCKWLeftkeyword_id: TIntegerField;
    fdqSTOCKWLeftkeyword_name_id: TIntegerField;
    fdqSTOCKWLeftname: TWideMemoField;
    fdqSTOCKWLeftclass_name_after: TWideMemoField;
    fdqSTOCKWLeftkwcount: TIntegerField;
    fdqSTOCKWRightkwcount: TIntegerField;
    fdqSourceKeywordkeyword_use_count: TIntegerField;
    fdqLeftSTOCurl_cnt: TIntegerField;
    fdqRightSTOCurl_cnt: TIntegerField;
    procedure mnDownerClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgLeftSTOCColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mnAuthorAddClick(Sender: TObject);
    procedure mnAuthorDelClick(Sender: TObject);
    procedure mnUrlAddClick(Sender: TObject);
    procedure mnurldelClick(Sender: TObject);
    procedure mnurleditClick(Sender: TObject);
    procedure mnUrlGoClick(Sender: TObject);
    procedure mnKeywordAddClick(Sender: TObject);
    procedure mnKeywordDelClick(Sender: TObject);
    procedure mnAttachAddClick(Sender: TObject);
    procedure mnFileOpenClick(Sender: TObject);
    procedure mnAttachDelClick(Sender: TObject);
    procedure mbAttachSaveClick(Sender: TObject);
    procedure CMDialogKey(var Msg: TWMKey); message CM_DIALOGKEY;
    procedure btOkClick(Sender: TObject);
    procedure mnNoteCreateClick(Sender: TObject);
    procedure mnDelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btRTFClick(Sender: TObject);
    procedure fdqLeftnoteAfterScroll(DataSet: TDataSet);
    procedure FDqRightNoteAfterScroll(DataSet: TDataSet);
    procedure dbrRightIdeaEnter(Sender: TObject);
    procedure dbrLeftIdeaEnter(Sender: TObject);
    procedure mnAddClick(Sender: TObject);
    procedure mnMoveClick(Sender: TObject);
    procedure mnEditClick(Sender: TObject);
    procedure mnSortByNameClick(Sender: TObject);
    procedure FormResize(Sender: TObject); override;
    procedure DbgDblClick(Sender: TObject); override;
    procedure SetPanelClassAddAction(tag_:integer); override;
    procedure mnUpperClick(Sender: TObject);
    procedure mnFolder2RtfClick(Sender: TObject);
    procedure mnSortAllClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mnSTOCKWAddClick(Sender: TObject);
    procedure dbgSTOCKWLeftColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mnSTOCKWDelClick(Sender: TObject);
    procedure dbgKeywordColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
    //class_left_id, class_right_id:longint;
    nsrt:integer;
    sql_save, sql_stoc_save:ansistring;
    //mode:integer; // =0 - слева каталог, справа инфо, =1-справа каталог, слева инфо, =3 - оба каталога
    //maximized:boolean;
    //LastScroolTag:array[0..1] of longint;
    //function get_par_class_name(tag_:integer):string;
    procedure FillDirInfo(tc_:TStrings; fdqstoc_id_:longint);
    procedure Add_Attach_File(filename_:string);
    procedure saveAttachAsFile(fname:string);
//    procedure btUpClick(Sender: TObject);
//    procedure set_new_class(tag_:integer; class_value_:longint);
    procedure RefreshAll;
    procedure CheckListOrder(class_:longint);
    function GetListOrder(class_:longint):string;
    function GetListOrderCond(class_:longint):string;
    function get_SEL_PTI(tag_:integer):TfmSourceEditPanelTagInfo;
    procedure SetLastUpdate;
    function get_tag_by_STOCKW_focused:integer;
  public
    { Public declarations }
    Source_id:longint;
    is_mine:integer;
    new_url:string;
    NoteLeftURL,NoteRightURL:TNoteURL;
    DBMode:TDbMode;
    text_content:string;
    constructor CreateWithData(Source_id_, source_classification_id_:longint; is_mine_:integer; DBMode_:TDBMode;AOwner: TComponent;
                             telegram_message_id_:string='';type_:string='';title_:string='';url_:string='';text_content_:string='');
    function GetClassNameFull(class_id_:longint):string; override;
    function GetClassName(class_id_:longint):string; override;
    function GetClassClassId(class_id_:longint):longint; override; // получить ID папки по ID подпапки
    procedure DsuAfterScroolHandle(DataSet_:TDataSet); override; // реальные действия при скрулинге основного датасет

  end;

var
  fmSourceEdit: TfmSourceEdit;
  fmProjectEdit: TfmSourceEdit;

implementation

{$R *.dfm}

uses
  dmdataunit, fmSourceAuthorUnit, RichEditRTF,
  extend_dialog, extend_diskutil, lcb_unit, richedit,
  shellapi, data_service, fmNoteEditUnit, fmMainUnit;


constructor TfmSourceEdit.CreateWithData(Source_id_, source_classification_id_:longint; is_mine_:integer; DBMode_:TDBMode;AOwner: TComponent;
            telegram_message_id_:string='';type_:string='';title_:string='';url_:string='';text_content_:string='');
var
  mask: Word;
begin
  Source_id:=Source_id_;
  text_content:=text_content_;
  new_url:=url_;
  is_mine:=is_mine_;
  dm.recreate_source_classification(is_mine);
  inherited CreateWithAlias(AOwner,'fm'+par_fname[is_mine]+inttostr(source_id),'Элементы оглавления/идеи');

  self.AssignControls(pmMain, gbLeft, gbRight,
                   dbgLeftSTOC,dbgRightSTOC,
                   pnLeftCont,pnRightCont,
                   mteLeftSTOC,mteRightSTOC);

  pnRightCont.Align:=alclient;
  pnLeftCont.Align:=alclient;

  sql_save:=fdqsource.SQL.Text;
  sql_stoc_save:=fdqLeftSTOC.SQL.Text;
  fdqRightSTOC.SQL.Text:=sql_stoc_save;
  if is_mine=1 then begin
    dbgAuthor.Visible:=false;
    dblClass.ListSource:=dsProjectClassification;
  end
  else
    dblClass.ListSource:=dsSourceClassification;

  DBMode:=DBMode_;

  if DBMode=dbedit then begin
    //fmmain.sqlc.ExecSQL('delete from source_toc_navigation where date_time_create is null or ' +
    //                    '(strftime(''%s'',''now'',''localtime'') - strftime(''%s'',date_time_create,''localtime''))>3600 ');
    fdqSource.SQL.Text:=sql_save+' where id='+inttostr(source_id);
    fdqSource.open;
    SetPanelClass(0);
    SetPanelClass(1);
    //set_panel_class_caption(0);
    pcSource.ActivePageIndex := 1;
    caption:='Редактирование '+display_service.source_proj[is_mine,2]+' ID='+inttostr(Source_id)+' "'+fdqSource['fullname']+'"'
  end
  else begin
    btRTF.Visible:=false;
    caption:='Добавление '+display_service.source_proj[is_mine,2];
    fdqSource.open;
    fdqSource.insert;
    fdqSource['date_time_create']:=now;
    fdqSource['note_show_mode']:=0;
    fdqSource['is_mine']:=is_mine;
    fdqSource['status']:=1;
    fdqSource['source_classification_id']:=source_classification_id_;
    fdqSource['telegram_message_id']:=telegram_message_id_;
    if title_<>'' then
       fdqSource['name']:=title_
    else if text_content_<>'' then
       fdqSource['name']:=copy(text_content_,1,256);
    if (fdqSource['name']='') and (fdqSource['telegram_message_id']<>'') then
        fdqSource['name']:=replacestr(dm.sqlc.ExecSQLScalar('select text from telegram_fast_note where telegram_message_id=:TM',[fdqSource['telegram_message_id']]),chr(13),' ');

    if type_<>'' then begin
      if pos('video',lowercase(type_))>0 then
        fdqSource['source_type_id']:=2
      else if pos('Telegram',type_)>0 then
        fdqSource['source_type_id']:=6
      else if pos('webPage',type_)>0 then
        fdqSource['source_type_id']:=4;
    end;
    //pnRouter.Visible:=false;

  end;

  dbgKeyword.Visible:=dm.Get_Ini_Int_Par('use_tag_for_source',1)=1;
  dblSourceType.Visible:=is_mine=0;
  lbType.Visible:=is_mine=0;

  //FormResize(self);



  mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(memRightLink.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
  SendMessage(memLeftLink.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);


end;

function TfmSourceEdit.get_tag_by_STOCKW_focused:integer;
begin
  if dbgSTOCKWLeft.focused then
    result:=0
  else
    result:=1
end;



procedure TfmSourceEdit.FormActivate(Sender: TObject);
var
  cid:integer;
  lid_,rid_:longint;
begin
  ResetLastScroolTag; // чтоб точно перерисовалось все
  lid_:=0;rid_:=0;
  lid_:=fdqSource['id'];
  if (fdqSource.state<>dsInsert) and (fdqSource.state<>dsEdit) then
    fdqSource.Refresh;
  if fdqLeftSTOC.Active then
    fdqLeftSTOC.Refresh;
  if fdqRightSTOC.Active then
    fdqRightSTOC.Refresh;
  if mteLeftSTOC.Active then begin
    lid_:=null2int(mteLeftSTOC['id']);
    mteLeftSTOC.Refresh;
    if lid_>0 then
       mteLeftSTOC.Locate('ID',lid_,[]);
  end;
  if mteRightSTOC.Active then begin
    rid_:=null2int(mteRightSTOC['id']);
    mteRightSTOC.Refresh;
    if rid_>0 then
       mteRightSTOC.Locate('ID',rid_,[]);
  end;

end;

procedure TfmSourceEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var
    s:string;
    cs_:longint;
begin
  action:=cafree;
  if is_mine=1 then
    fmProjectEdit:=nil
  else
   fmSourceEdit:=nil;
end;

procedure TfmSourceEdit.FormCreate(Sender: TObject);
begin
  fdqSourceType.open;
  nsrt:=dm.Get_Ini_Int_Par(par_fname[is_mine]+par_sort);

  if is_mine=0 then
    FDqSourceClassification.open
  else
    FDqProjectClassification.open;
  dbgLeftSTOC.Align:=alClient;
  if null2int(fdqSource['id'])<=0 then begin
    dbgAuthor.Visible:=false;
    dbgKeyword.Visible:=false;
    dbgurl.Visible:=false;
    dbgFiles.Visible:=false;
    tsstoc.TabVisible:=false;
    btok.Caption:='Сохранить и продолжить';
    btok.Width:=200;
  end
  else begin
    SetPanelClassAddAction(0);
    fdqSource.Edit;
  end;
  SetViewMode();

end;


procedure TfmSourceEdit.FormResize(Sender: TObject);
var
  nw_:integer;
  scale:integer;
begin
  scale:=dm.Get_Ini_Int_Par('ScaleBy',100);
  dbgAuthor.Height:=round((tsMain.Height-dbgAuthor.top)/2-5);
  nw_:=round(tsMain.Width/2);
  if nw_>max_auth_kw_width*(scale/100) then
    nw_:=round(max_auth_kw_width*(scale/100));
  dbgAuthor.Width:=nw_;
  dbgKeyword.Width:=nw_;

  dbgKeyword.Top:=dbgAuthor.top+dbgAuthor.Height+5;
  dbgKeyword.Height:=round((tsMain.Height-dbgKeyword.top)-5);
  dbgurl.Height:=dbgAuthor.Height;
  dbgFiles.Top:=dbgKeyword.Top;
  dbgFiles.Height:=dbgKeyword.Height;
  dbgurl.Left:=dbgAuthor.Left+dbgAuthor.Width+5;
  dbgurl.Width:=tsMain.Width-dbgurl.Left-5;
  dbgFiles.Left:=dbgurl.Left;
  dbgFiles.Width:=dbgurl.Width;

  btOk.Left:=round(pnBottom.Width/3-btOk.Width/2);
  btRTF.Left:=round(2*pnBottom.Width/3-btRTF.Width/2);
  if btRTF.Left<btOk.Left+btOk.Width then begin
    btOk.Left:=5;
    btRTF.Left:=btOk.Left+btOk.Width+5;
  end;

  dbename.Width:=self.ClientWidth-dbename.Left-10;
  dblClass.Width:=self.ClientWidth-dblClass.Left-10;

  nw_:=round(tsmain.Width/3-dblSourceType.Left-10);
  if nw_<min_source_type_width then
    nw_:=min_source_type_width;
  dblSourceType.Width:=nw_;
  dbcStatus.Width:=nw_;
  lbNoteView.Left:=dblSourceType.Left+dblSourceType.Width+10;
  lbNotes.Left:=lbNoteView.Left;
  dbcNoteShowMode.Left:=lbNoteView.Left+lbNoteView.Width+5;
  nw_:=tsmain.Width-dbcNoteShowMode.Left-5;
  if nw_<min_source_type_width then
     nw_:=min_source_type_width;
  dbcNoteShowMode.width:=nw_;
  dbeNotes.Left:=lbNotes.Left+lbNotes.Width+5;
  nw_:=tsmain.Width-dbeNotes.Left-5;
  if nw_<min_source_type_width then
     nw_:=min_source_type_width;
  dbeNotes.width:=nw_;

  if ViewMaximized then
    exit;


  case ViewMode of
  3: begin
        gbleft.Width:=round(tsstoc.ClientWidth/2-6)
     end;
  0: begin
        if mteLeftSTOC.Active then begin
          gbleft.Width:=round(tsstoc.ClientWidth*(2/5)-6);
          if (null2int(mteLeftSTOC['is_dir'])=0) and (null2int(mteLeftSTOC['id'])<>0) then begin // заметка
            if null2int(fdqRightNote['form_width'])>0 then
              gbRightOriginal.Width:=round(pnRightNote.ClientWidth*(fdqRightNote['splitter_param']/fdqRightNote['form_width']))-3;
          end;
          //Set_TDBMemo_V_ScroolBar(dbmRightFastNote);
          //Set_TDBMemo_V_ScroolBar(dbmRightOriginal);
        end;
     end;
  1: begin
        if mteRightSTOC.Active then begin
          gbleft.Width:=round(tsstoc.ClientWidth*(3/5)-6);
          if (null2int(mteRightSTOC['is_dir'])=0) and (null2int(mteRightSTOC['id'])<>0) then begin // заметка
            if null2int(fdqLeftNote['form_width'])>0 then
              gbLeftOriginal.Width:=round(pnLeftNote.ClientWidth*(fdqLeftNote['splitter_param']/fdqLeftNote['form_width']))-3;
          end;
          //Set_TDBMemo_V_ScroolBar(dbmLeftFastNote);
          //Set_TDBMemo_V_ScroolBar(dbmLeftOriginal);
        end;
     end;
  end;

end;

{function TfmSourceEdit.get_par_class_name(tag_:integer):string;
var
  res:string;
begin
  Res:=par_fname[is_mine]+'_'+par_class+'_'+inttostr(source_id);
  if tag_>=0 then
    Res:=res+'_'+inttostr(tag_);
  Result:=res;
end;}


procedure TfmSourceEdit.mbAttachSaveClick(Sender: TObject);
var
  filename:string;
begin
  if fdqSourceAttach.RecordCount>0 then begin
    sdAttach.FileName:=fdqSourceAttach['filename'];
    if sdAttach.Execute then begin
        filename:=sdAttach.FileName;
        if fileexists(filename) then begin
          if msgquestion(format('Файл [%s] уже существует. Перезаписать?',[filename])) then begin
            DeleteFile(filename);
          end
          else
            abort
        end;
        saveAttachAsFile(filename);
        msgok(format('Файл [%s] успешно сохранен в каталоге [%s]!',
          [ExtractFileName(filename),ExtractFilePath(filename)]));
    end;
  end;


end;

function TfmSourceEdit.get_SEL_PTI(tag_:integer):TfmSourceEditPanelTagInfo;
var
  PTI:TfmSourceEditPanelTagInfo;
begin
  PTI:=TfmSourceEditPanelTagInfo.Create;
  inherited GetTagPTI(tag_,PTI as TPanelTagInfo);

  with PTI do begin
    if tag_=0 then begin
       fdqSTOC:=fdqLeftSTOC;
       fdqSTOC_a:=fdqRightSTOC;
       fdq_note:=fdqLeftnote;
       fdq_note_a:=fdqRightnote;
       mteSTOC:=mteLeftSTOC;
       mteSTOC_a:=mteRightSTOC;
       mem_dir:=memLeftDir;
       mem_dir_a:=memRightDir;
       memLink:=memLeftLink;
       memLink_a:=memRightLink;
       gbFastNote:=gbLeftFastNote;
       gbFastNote_a:=gbRightFastNote;
       memFastNote:=dbmLeftFastNote;
       memFastNote_a:=dbmRightFastNote;
       gbOriginal:=gbLeftOriginal;
       gbOriginal_a:=gbRightOriginal;
       memOriginal:=dbmLeftOriginal;
       memOriginal_a:=dbmRightOriginal;
       gbIdea:=gbLeftIdea;
       gbIdea_a:=gbRightIdea;
       dbrIdea:=dbrLeftIdea;
       dbrIdea_a:=dbrRightIdea;
       note_url:=NoteLeftURL;
       note_url_a:=NoteRightURL;
       pnIdea3:=pnLeftNote;
       pnIdea3_a:=pnRightNote;
       fdqSTOCKW:=fdqSTOCKWLeft;
       fdqSTOCKW_a:=fdqSTOCKWRight;
       dbgSTOCKW:=dbgSTOCKWLeft;
       dbgSTOCKW_a:=dbgSTOCKWRight;

    end
    else begin
       fdqSTOC_a:=fdqLeftSTOC;
       fdqSTOC:=fdqRightSTOC;
       fdq_note_a:=fdqLeftnote;
       fdq_note:=fdqRightnote;
       mteSTOC_a:=mteLeftSTOC;
       mteSTOC:=mteRightSTOC;
       mem_dir_a:=memLeftDir;
       mem_dir:=memRightDir;
       memLink_a:=memLeftLink;
       memLink:=memRightLink;
       gbFastNote_a:=gbLeftFastNote;
       gbFastNote:=gbRightFastNote;
       memFastNote_a:=dbmLeftFastNote;
       memFastNote:=dbmRightFastNote;
       gbOriginal_a:=gbLeftOriginal;
       gbOriginal:=gbRightOriginal;
       memOriginal_a:=dbmLeftOriginal;
       memOriginal:=dbmRightOriginal;
       gbIdea_a:=gbLeftIdea;
       gbIdea:=gbRightIdea;
       dbrIdea_a:=dbrLeftIdea;
       dbrIdea:=dbrRightIdea;
       note_url_a:=NoteLeftURL;
       note_url:=NoteRightURL;
       pnIdea3_a:=pnLeftNote;
       pnIdea3:=pnRightNote;
       fdqSTOCKW_a:=fdqSTOCKWLeft;
       fdqSTOCKW:=fdqSTOCKWRight;
       dbgSTOCKW_a:=dbgSTOCKWLeft;
       dbgSTOCKW:=dbgSTOCKWRight;
    end;
  end;
  Result:=PTI;
end;



procedure TfmSourceEdit.mnAddClick(Sender: TObject);
var
  InpSTR:string;
  id_, max, new_order:longint;
  tag_,taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  if inputstr('Ввод данных','Введите новый элемент оглавления',InpStr) then begin
    if trim(InpStr)='' then begin
      msgerror('Каталог не может быть пустым!');
      exit
    end;
    max:=dm.get_max_stoc_order(fdqSource['id'],PTI.class_id);
    dm.sqlc.ExecSQL('insert into source_toc (name, source_id,stoc_id) values(:NN,:SID, :ST)',
      [InpStr,fdqSource['id'],PTI.class_id]);
    id_:=dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
    if max>0 then
      new_order:=max+1
    else
      new_order:=id_;
    dm.sqlc.ExecSQL('update source_toc set order_=:OO where id=:IID',[new_order,id_]);
    SetLastUpdate;
    PTI.fdqSTOC.Refresh;
    PTI.fdqSTOC_a.Refresh;
    PTI.mteSTOC.Refresh;
    PTI.mteSTOC_a.Refresh;
    PTI.mteSTOC.Locate('id',id_,[]);
  end;
end;

procedure TfmSourceEdit.mnAttachAddClick(Sender: TObject);
begin
  if Opendialog.Execute then begin
     Add_Attach_File(Opendialog.FileName);
  end;

end;

procedure TfmSourceEdit.mnAttachDelClick(Sender: TObject);
begin
  if msgquestion(format('Удалить файл [%s]?',[fdqSourceAttach['filename']])) then begin
    if DM.Get_Ini_Int_Par('FileStorePlace')=1 then begin
      DeleteFile(DM.Get_Ini_Str_Par('FileStoreDir')+'\SourceFile\'+inttostr(fdqSourceAttach['id']))
    end;
    fdqSourceAttach.Delete;
  end;

end;

procedure TfmSourceEdit.mnAuthorAddClick(Sender: TObject);
begin
  fmSourceAuthor:=TfmSourceAuthor.CreateData(fdqSource['id'],dbgAuthor,self);
  fmSourceAuthor.Caption:=Format('Добавление автора к источнику [%s]',[fdqSource['name']]);
  fmSourceAuthor.ShowModal;

end;

procedure TfmSourceEdit.mnAuthorDelClick(Sender: TObject);
begin
  if msgquestion(format('Исключить автора [%s] из текущего источника?',[fdqSourceAuthor['author_name']])) then
    dm.sqlc.ExecSQL('delete from source_author where id=:SAID',[fdqSourceAuthor['id']]);
  fdqSourceAuthor.Refresh();

end;

{procedure TfmSourceEdit.mnChangePanelClick(Sender: TObject);
var
  c1,c2,id1,id2:longint;
  tag_, taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
  id_:longint;
begin
  if maximized then
    exit;
  set_left_right_auto_tag(tag_, taga_, pnptr);
  c1:=PTI.class_id;
  c2:=PTI.class_id_a;
  id1:=PTI.mteSTOC['id'];
  id2:=pnptr.mteSTOCa_['id'];
  if mode<>3 then begin
    if mode=0 then
       SetViewMode(1,false)
    else
       SetViewMode(0,false);
  end;
  set_new_class(tag_,c2);
  set_new_class(taga_,c1);
  LastScroolTag[0]:=-1000;
  LastScroolTag[1]:=-1000;

  if mode<>3 then begin
    mteLeftSTOCAfterScroll(pnptr.mteSTOCa_);
    FormResize(sender);
    PTI.mteSTOC_a.Locate('id',id1,[]);
  end
  else begin
    PTI.mteSTOC_a.Locate('id',id1,[]);
    PTI.mteSTOC.Locate('id',id2,[]);
  end;
  PTI.dbg_a.SetFocus;

end;}


procedure TfmSourceEdit.SetLastUpdate;
begin
      if not (fdqSource.State in [dsEdit,dsInsert]) then
        fdqSource.edit;
      fdqSource['date_time_update']:=now;
      fdqSource.post;
      fmmain.ReBuildHistory;
end;

procedure TfmSourceEdit.mnDelClick(Sender: TObject);
var
  cnt_:integer;
  mname_:string;
  tag_,taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  if PTI.mteSTOC['is_dir']=1 then begin // удаление каталога
    if msgquestion(format('Удалить элемент содержания [%s]?',[PTI.mteSTOC['name']])) then begin
      cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from source_toc where stoc_id=:STID',[PTI.mteSTOC['id']]);
      if cnt_>0  then begin
        msgerror('Нельзя удалять те элементы оглавления, у которых есть подоглавления!');
        exit
      end;
      cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from note_source where stoc_id=:STID',[PTI.mteSTOC['id']]);
      if cnt_>0  then begin
        msgerror('Нельзя удалять каталог, в котором есть заметки!');
        exit
      end;
      dm.sqlc.ExecSQL('delete from source_toc where id=:SID',[PTI.mteSTOC['id']]);
      SetLastUpdate;
      RefreshAll
    end
  end
  else begin // статья
    if msgquestion(format('Открепить заметку [%s] от текущего источника? Сама заметка останется в системе.',[PTI.mteSTOC['name']])) then begin
      dm.sqlc.ExecSQL('delete from note_source where note_id=:NN and source_id=:SS',[PTI.mteSTOC['id'],Source_id]);
      SetLastUpdate;
      RefreshAll
    end;

  end;

end;

procedure TfmSourceEdit.mnFileOpenClick(Sender: TObject);
var
  fn:string;
begin
  fn:=tmppath+fdqSourceAttach['filename'];
  saveAttachAsFile(fn);
  ShellExecute(0, nil, PChar(fn), nil,nil, SW_SHOWNORMAL);

end;

procedure TfmSourceEdit.mnFolder2RtfClick(Sender: TObject);
var
  fname:string;
  tag_,taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
  id_:longint;
  tf:textfile;
  fonts,colors:TStringList;
  cur_stoc:longint;
  cur_stoc_name:string;
  rtf:TRCRTF;

  function get_fdq(stid_:longint):TFdquery;
  var
    fdq_:TFdquery;
  begin
    fdq_:=TFdquery.Create(nil);
    fdq_.Connection:=DM.sqlc;
    fdq_.SQL.clear;
    fdq_.SQL.add('select note.id as id, name , order_, 0 as is_dir, note.content as content, original_text');
    fdq_.SQL.add('from  note_source , note');
    fdq_.SQL.add('where  note.id=note_source.note_id and note_source.source_id='+inttostr(source_id)+' and (ifnull(note_source.stoc_id,0)='+inttostr(stid_)+')');
    fdq_.SQL.add('union all');
    fdq_.SQL.add('select id, name ,order_, 1 is_dir , '' '' as content, " " as original_text');
    fdq_.SQL.add('from  source_toc st');
    fdq_.SQL.add('where source_id='+inttostr(source_id)+' and stoc_id='+inttostr(stid_));
    fdq_.SQL.add('order by order_');
    Result:=fdq_
  end;

  procedure write_stoc_to_txt(stid_:longint);
  var
    fdq_:TFdquery;
    table_view:boolean;
  begin
    fdq_:=get_fdq(stid_);
    fdq_.Open();
    while not fdq_.Eof do begin
      if fdq_['is_dir']=0 then begin
        rtf.AddREContent(fdq_['name'],fdq_['content']);
      end
      else
        write_stoc_to_txt(fdq_['id']);
      fdq_.Next;
    end;
    fdq_.Close;
    fdq_.free;
  end;

begin
  PTI:=get_SEL_PTI(GetFocusTag);
  cur_stoc:=null2int(PTI.mteSTOC['id']);
  cur_stoc_name:=null2str(PTI.mteSTOC['name']);
  if cur_stoc=-3 then begin
    cur_stoc:=PTI.class_id;
    cur_stoc_name:=PTI.class_name;
  end;

  if cur_stoc>0 then begin
    rtf:=TRCRTF.Create;
    rtf.Init;
    if null2int(PTI.mteSTOC['is_dir'])>0 then begin // папка
      fname:=tmppath+'STOC_'+inttostr(source_id)+'_'+inttostr(cur_stoc)+'.rtf';
      if rtf.SetOutFile(fname) then begin
        write_stoc_to_txt(cur_stoc);
        rtf.WriteBufferAndClose;
        ShellExecute(0, nil, PChar(fname), nil, nil, SW_SHOWNORMAL);
      end
      else
       msgerror(format('Файл [%s] уже занят какой-то программой!',[fname]));
    end;
  end;
end;



procedure TfmSourceEdit.mnKeywordAddClick(Sender: TObject);
var
  id_,name_id_: longint;
begin
     if getKeyword(id_,name_id_,self,'Назначение ключевого слова на '+display_service.source_proj[is_mine,4]+' ['+fdqSource['name']+']',
       'Выберете ключевое слово:','Закрепить тэг за '+display_service.source_proj[is_mine,7],
       ' select * from (Select %s as name, kwn.id kw_name_id, k.id kw_id from keyword_name kwn, keyword k '+
       ' where k.id=kwn.keyword_id and k.id not in '+
       ' (select keyword_id from source_keyword where source_id='+inttostr(fdqSource['id'])+')) order by ru_lower(name)',
       true,
       'Введите новое ключевое слово:','Закрепить новый тзг за '+display_service.source_proj[is_mine,7]
       )
     then begin
      dm.sqlc.ExecSQL('insert into source_keyword (source_id, keyword_id, keyword_name_id) values(:SID,:KID,:KWN)',
        [fdqSource['id'],id_,name_id_]);
      fdqSourceKeyword.Refresh;
      SetLastUpdate
     end;

end;

procedure TfmSourceEdit.mnKeywordDelClick(Sender: TObject);
begin
  if msgquestion(format('Исключить ключевое слово [%s] для текущего источника?',[fdqSourceKeyword['name']])) then begin
    dm.sqlc.ExecSQL('delete from source_keyword where id=:IID',[fdqSourceKeyword['id']]);
    SetLastUpdate;
    fdqSourceKeyword.refresh;
  end;
end;


procedure TfmSourceEdit.mnMoveClick(Sender: TObject);
var
  tag_, taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  if ViewMode<>3  then
    exit;

  PTI:=get_SEL_PTI(GetFocusTag);

  if PTI.mteSTOC['id']=-3 then  //  ...
  else if PTI.mteSTOC['is_dir']=0 then begin // перемещение файла
      if PTI.class_id_a>=0 then begin // напротив реальный каталог
        if msgquestion('Переместить заметку ['+PTI.mteSTOC['name']+'] из папки ['+PTI.class_full_name+'] в папку ['+PTI.class_full_name_a+']?') then
           dm.sqlc.ExecSQL('update note_source set stoc_id=:NS where ifnull(stoc_id,0)=:OS and note_id=:NN',
             [PTI.class_id_a,PTI.class_id,PTI.mteSTOC['id']]);
           SetLastUpdate;
           RefreshAll;
      end;
  end
  else if PTI.mteSTOC['is_dir']=1 then begin // перемещение каталога
      if PTI.class_id_a>=0 then begin // напротив реальный каталог
        if msgquestion('Переместить каталог ['+PTI.mteSTOC['name']+'] из папки ['+PTI.class_full_name+'] в папку ['+PTI.class_full_name_a+']?') then
           dm.sqlc.ExecSQL('update source_toc set stoc_id=:NS where ifnull(stoc_id,0)=:OS and id=:NN',[PTI.class_id_a,PTI.class_id,PTI.mteSTOC['id']]);
           SetLastUpdate;
           RefreshAll;
      end;

  end;


end;

procedure TfmSourceEdit.mnNoteCreateClick(Sender: TObject);
var
  tag_,taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  if fdqSource.State=dsEdit then begin
     fdqSource.post;
  end;
  if null2int(PTI.class_id)<0 then exit;
  if msgquestion(format('Создать заметку по п.содержания [%s]?',[PTI.class_name])) then begin
    if fmNoteEdit<>nil then begin
      fmNoteEdit.Close;
      Application.ProcessMessages
    end;
    fmNoteEdit := TfmNoteEdit.CreateWithData(fdqSource['id'],PTI.class_id,0,-1,dbInsert,self);
    fmNoteEdit.fdqNote['name']:=PTI.class_name;
    fmNoteEdit.show;
  end;

end;

procedure TfmSourceEdit.mnSortAllClick(Sender: TObject);
var
  tag:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  tag:=GetFocusTag;
  PTI:=self.get_SEL_PTI(tag);
  nsrt:=(sender as TMenuItem).tag;
  SetPanelClass(tag);
  dm.Set_Ini_Int_Par(par_fname[is_mine]+par_sort,nsrt);

end;

procedure TfmSourceEdit.mnSortByNameClick(Sender: TObject);
var
  InpSTR:string;
  id_:longint;
  tag_,taga_,i:integer;
  PTI:TfmSourceEditPanelTagInfo;
  fdq:TFdquery;
  stid_:longint;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  stid_:=PTI.class_id;
  if stid_<0 then
    stid_:=0;
  if msgquestion(format('Пересортировать содержимое подкаталога [%s] по алфавиту?',[PTI.class_full_name])) then begin
    fdq:=TFdquery.Create(nil);
    fdq.Connection:=dm.sqlc;
    with fdq.sql do begin
      Clear;
      add('select distinct id, name, stoc_id, source_id, is_dir as "is_dir::INT"');
      add('from (');
      add('      select note_source.id, name , stoc_id, source_id, order_, 0 as is_dir');
      add('      from  note_source , note');
      add('      where  note.id=note_source.note_id and note_source.source_id='+inttostr(self.Source_id)+' and (ifnull(note_source.stoc_id,0)='+inttostr(stid_)+')');
      add('union all');
      add('      select id, name , stoc_id, source_id, order_, 1 is_dir ');
      add('      from  source_toc st where source_id='+inttostr(self.Source_id)+') st');
      add('where (ifnull(stoc_id,0)='+inttostr(stid_)+' )');
      add('order by name');
    end;
    lcb.Log(fdq.SQL.text);
    i:=1;
    fdq.Open();
    while not fdq.eof do begin
      if fdq['is_dir']=1 then
        dm.sqlc.ExecSQL('update source_toc set order_=:III where id=:IID',[i,fdq['id']])
      else
        dm.sqlc.ExecSQL('update note_source set order_=:III where id=:IID',[i,fdq['id']]);
      fdq.Next;
      inc(i);
    end;
  end;
  fdq.Close;
  fdq.Free;
  self.RefreshAll
end;

procedure TfmSourceEdit.mnSTOCKWAddClick(Sender: TObject);
var
  id_,name_id_: longint;
  tag:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  tag:=get_tag_by_STOCKW_focused;//pmSTOCKW.PopupComponent.Tag;
  PTI:=self.get_SEL_PTI(tag);
     if getKeyword(id_,name_id_,self,'Назначение ключевого слова на оглавление '+PTI.mteSTOC_a['name'],
       'Выберете ключевое слово:','Закрепить тэг за '+PTI.mteSTOC_a['name'],
       ' select * from (Select %s as name, kwn.id kw_name_id, k.id kw_id from keyword_name kwn, keyword k '+
       ' where k.id=kwn.keyword_id and k.id not in '+
       ' (select keyword_id from stoc_keyword where stoc_id='+inttostr(PTI.mteSTOC_a['id'])+')) order by ru_lower(name)',
       true,
       'Введите новое ключевое слово:','Закрепить новый тзг за '+PTI.mteSTOC_a['name']
       )
     then begin
      dm.sqlc.ExecSQL('insert into stoc_keyword (source_id, stoc_id, keyword_id, keyword_name_id) values(:SID,:ST,:KID,:KWN)',
        [fdqSource['id'],PTI.mteSTOC_a['id'],id_,name_id_]);
      PTI.fdqSTOCKW.Refresh;
      SetLastUpdate
     end;

end;

procedure TfmSourceEdit.mnSTOCKWDelClick(Sender: TObject);
var
  id_,name_id_: longint;
  tag:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  tag:=get_tag_by_STOCKW_focused;//pmSTOCKW.PopupComponent.Tag;
  PTI:=self.get_SEL_PTI(tag);
  if msgquestion(format('Удалить ключевое слово [%s] для элемента оглавления [%s]',[PTI.fdqSTOCKW['name'],PTI.dsu_a['name']])) then begin
      dm.sqlc.ExecSQL('delete from stoc_keyword where source_id=:SID and stoc_id=:ST and keyword_id=:KID',
        [fdqSource['id'],PTI.mteSTOC_a['id'],PTI.fdqSTOCKW['keyword_id']]);
      PTI.fdqSTOCKW.Refresh;
      SetLastUpdate
  end;


end;

procedure TfmSourceEdit.mnUrlAddClick(Sender: TObject);
var
  InpStr: String;
begin
  //Title, Message: String; var InpStr: String; const Select: Boolean = True;HideInput:boolean=False): Boolean;
  if inputstr('Ввод данных','Укажите новый URL:',InpStr) then begin
    if DM.check_url(InpStr) then begin
      fdqSourceurl.Insert;
      fdqSourceurl['url']:=InpStr;
      fdqSourceurl['source_id']:=self.Source_id;
      fdqSourceurl.post;
    end;
  end;

end;

procedure TfmSourceEdit.mnurldelClick(Sender: TObject);
begin
  if fdqSourceUrl.RecordCount>0 then
    if msgquestion(format('Удалить URL [%s]?',[fdqSourceUrl['url']])) then
       fdqSourceUrl.Delete

end;

procedure TfmSourceEdit.mnurleditClick(Sender: TObject);
var is_:string;
begin
  if fdqSourceUrl.RecordCount>0 then begin
    is_:=fdqSourceurl['url'];
    if inputstr('Изменение данных','Укажите URL:',is_) then begin
      if dm.check_url(is_,self.Source_id) then begin
        fdqSourceUrl.edit;
        fdqSourceUrl['url']:=is_;
        fdqSourceUrl.post;
      end;
    end;
  end;

end;

procedure TfmSourceEdit.mnUrlGoClick(Sender: TObject);
var
  u_:string;
begin
  if fdqSourceUrl.RecordCount>0 then begin
    u_:=fdqSourceurl['url'];
    ShellExecute(Application.Handle,PChar('open'),PChar(u_), PChar(0), nil, SW_NORMAL);
  end;

end;

procedure TfmSourceEdit.pmMainPopup(Sender: TObject);
begin
  self.mnSortAll.Checked:=nsrt=0;
  self.mnSortFolderUp.Checked:=nsrt=1;
end;

procedure TfmSourceEdit.DsuAfterScroolHandle(DataSet_: TDataSet);
var
  dtc_,dtu_:string;
  cnt_:integer;
  PTI:TfmSourceEditPanelTagInfo;
  tag_:integer;
  STOC_Id_:longint;
begin
  tag_:=DataSet_.tag;
  PTI:=get_SEL_PTI(tag_);

        if PTI.mteSTOC['is_dir']=0 then begin // заметка
          PTI.fdq_Note_a.Close;
          PTI.fdq_Note_a.Params.ParamValues['NID']:=PTI.mteSTOC['id'];
          PTI.fdq_Note_a.open;
          PTI.pnIdea3_a.Visible:=true;
          PTI.mem_dir_a.Visible:=false;
          PTI.dbgSTOCKW_a.Visible:=false;
          dtc_:=''; dtu_:='';
          if PTI.fdq_Note_a['date_time_create'] <> null then
            DateTimeToString(dtc_,'dd.mm.yy hh:nn',PTI.fdq_Note_a['date_time_create']);
          if PTI.fdq_Note_a['date_time_update'] <> null then
            DateTimeToString(dtu_,'dd.mm.yy hh:nn',PTI.fdq_Note_a['date_time_update']);
          PTI.gbPanel_a.Caption:='Заметка ID='+inttostr(PTI.mteSTOC['id'])+' от '+dtc_;
          if dtc_<>dtu_ then
           PTI.gbPanel_a.Caption:=PTI.gbPanel_a.Caption+'/'+dtu_;
          PTI.pnIdea3_a.Align:=alClient;
          PTI.gbIdea_a.Align:=alClient;
          PTI.gbFastNote_a.Visible:=null2str(PTI.fdq_Note_a['fast_text'])<>'';
          PTI.gbOriginal_a.Align:=alLeft;
          PTI.gbOriginal_a.Visible:=null2str(PTI.fdq_Note_a['original_text'])<>'';
          FillNoteLink(PTI.memLink_a,PTI.note_url_a,PTI.fdq_Note_a['id'],source_id,PTI.class_id);
          PTI.pnCont_a.noteURL:=PTI.note_url_a;
          FormResize(nil);
          Set_TRichEdit_Height(PTI.memLink_a);
          //PTI.gbNote_a.noteURL:=PTI.note_url_a;
        end
        else begin // каталог
          if PTI.pnIdea3_a.Visible then
            PTI.pnIdea3_a.Visible:=false;
          if PTI.memLink_a.Visible
            then PTI.memLink_a.Visible:=false;
          if not PTI.mem_dir_a.Visible
            then PTI.mem_dir_a.Visible:=true;
          if PTI.mteSTOC['id']>0 then begin
            if PTI.mem_dir_a.Align<>alTop
              then PTI.mem_dir_a.Align:=alTop;
            PTI.mem_dir_a.Height:=round(PTI.mem_dir_a.Parent.Height/2);
            if not PTI.dbgSTOCKW_a.Visible
              then PTI.dbgSTOCKW_a.Visible:=true;
            if PTI.dbgSTOCKW_a.Align<>alClient
              then PTI.dbgSTOCKW_a.Align:=alClient;
            if PTI.fdqSTOCKW_a.Active then
              PTI.fdqSTOCKW_a.Close;
            PTI.fdqSTOCKW_a.Params.ParamValues['SID']:=PTI.mteSTOC['id'];
            PTI.fdqSTOCKW_a.Open;
          end
          else begin
            if PTI.dbgSTOCKW_a.Visible then
              PTI.dbgSTOCKW_a.Visible:=false;
            if PTI.mem_dir_a.Align<>alClient
              then PTI.mem_dir_a.Align:=alClient;
          end;

          if not PTI.pnCont_a.Visible
            then PTI.pnCont_a.Visible:=true;
          if PTI.mteSTOC['id']>0 then begin // реальный каталог
            PTI.gbPanel_a.Caption:='Инфо по ['+PTI.mteSTOC['name']+'] ID='+inttostr(PTI.mteSTOC['id']);
            FillDirInfo(PTI.mem_dir_a.Lines,PTI.mteSTOC['id'])
          end
          else begin
            if (PTI.mteSTOC['id']=-1) or ((PTI.mteSTOC['id']=-3) and (PTI.class_id=-1)) then begin  // все заметки
              PTI.gbPanel_a.Caption:='Инфо по всему '+display_service.source_proj[is_mine,6];
              PTI.mem_dir_a.Lines.Clear;
              cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from note_source where source_id=:SID',[self.Source_id]);
              PTI.mem_dir_a.Lines.add('');
              PTI.mem_dir_a.Lines.add('Всего заметок: '+inttostr(cnt_));
            end
            else begin // шаг вверх
              //PTI.gbdir_info_a.Visible:=false;
              PTI.gbPanel_a.Caption:='Инфо по ['+dm.sqlc.ExecSQLScalar('select name from source_toc where id=:II',
                [PTI.class_id])+'] ID='+inttostr(PTI.class_id);
              FillDirInfo(PTI.mem_dir_a.Lines,PTI.class_id)
            end;
          end;
        end;
end;


procedure TfmSourceEdit.SetPanelClassAddAction(tag_:integer);
var
  dst_:longint;
  ss_:string;
  pix_:longint;
  PTI:TfmSourceEditPanelTagInfo;
begin
  PTI:=get_SEL_PTI(tag_);
  if null2int(source_id)<>0 then begin
    if PTI.fdqSTOC.Active then
      PTI.fdqSTOC.Close;
    if PTI.mteSTOC.Active then
      PTI.mteSTOC.Close;
    PTI.fdqSTOC.Params.ParamValues['SID']:=source_id;
    PTI.fdqSTOC.Params.ParamValues['ST']:=PTI.class_id;
    ss_:='';

    PTI.fdqSTOC.sql.Text:=format(self.sql_stoc_save,[ss_,sort_array[nsrt]]);
    PTI.fdqSTOC.Open();
    PTI.mteSTOC.Open();
    {dst_:=GetStocDef(source_id,PTI.class_id,tag_);
    if dst_>0 then begin
      if not PTI.mteSTOC.Locate('ID',dst_,[])
        then PTI.mteSTOC.First;
    end;}
    //mteLeftSTOCAfterScroll(PTI.mteSTOC)
  end;

    fdqSourceAuthor.Params.ParamValues['SID']:=fdqSource['id'];
    fdqSourceAuthor.Open();

    //fdqSourceTheme.SQL.Text:='select * from source_theme where source_id='+inttostr(fdqSource['id']);
    fdqSourceKeyword.Params.ParamValues['SID']:=fdqSource['id'];
    fdqSourceKeyword.Open();

    fdqSourceURL.Params.ParamValues['SID']:=fdqSource['id'];
    fdqSourceURL.open;
    fdqSourceAttach.Params.ParamValues['SID']:=fdqSource['id'];
    fdqSourceAttach.open;

end;


{procedure TfmSourceEdit.set_left_right(tag_:integer; var pnptr:TPanelPtr);
begin
  if Tag_=0 then begin
    pnptr.fdqSTOC_:=fdqLeftSTOC;
    pnptr.fdqSTOCa_:=fdqRightSTOC;
    pnptr.mteSTOC_:=mteLeftSTOC;
    pnptr.mteSTOCa_:=mteRightSTOC;
    pnptr.fdq_note_:=fdqLeftNote;
    PTI.fdq_Note_a:=fdqRightNote;
    pnptr.pnMain_:=pnLeft;
    pnptr.pnMaina_:=pnRight;
    pnptr.class_:=self.class_left_id;
    PTI.class_id_a:=self.class_right_id;
    pnptr.panel_h_path_:=pnLeft.caption;
    pnptr.panel_h_patha_:=pnRight.caption;
    pnptr.dbgSTOC_:=self.dbgLeftSTOC;
    PTI.dbg_a:=self.dbgRightSTOC;
    pnptr.gbDir_info_:=gbLeftDirInfo;
    pnptr.gbDir_infoa_:=gbRightDirInfo;
    pnptr.mem_dir_:=memLeftDir;
    PTI.mem_dir_a:=memRightDir;
    pnptr.gbNote_:=gbLeftNote;
    pnptr.gbNotea_:=gbRightNote;
    pnptr.memLink_:=memLeftlink;
    PTI.memLink_a:=memRightlink;
    pnptr.gbFastNote_:=gbLeftFastNote;
    pnptr.gbFastNotea_:=gbRightFastNote; // панель быстрой заметки
    pnptr.memFastNote_:=dbmLeftFastNote;
    pnptr.memFastNotea_:=dbmRightFastNote;
    pnptr.memOriginal_:=dbmLeftOriginal;
    pnptr.memOriginala_:=dbmRightOriginal;
    pnptr.gbOriginal_:=gbLeftOriginal;
    pnptr.gbOriginala_:=gbRightOriginal; // панель оригинального текста
    pnptr.gbIdea_:=gbLeftIdea;
    pnptr.gbIdeaa_:=gbRightIdea; // панель главной идеи
    pnptr.dbridea_:=dbrLeftIdea;
    pnptr.dbrideaa_:=dbrRightIdea;
    pnptr.note_url_:=self.NoteLeftURL;
    PTI.note_url_a:=self.NoteRightURL;


  end
  else begin
    pnptr.fdqSTOCa_:=fdqLeftSTOC;
    pnptr.fdqSTOC_:=fdqRightSTOC;
    pnptr.mteSTOCa_:=mteLeftSTOC;
    pnptr.mteSTOC_:=mteRightSTOC;
    PTI.fdq_Note_a:=fdqLeftNote;
    pnptr.fdq_note_:=fdqRightNote;
    pnptr.pnMaina_:=pnLeft;
    pnptr.pnMain_:=pnRight;
    PTI.class_id_a:=self.class_left_id;
    pnptr.class_:=self.class_right_id;
    pnptr.panel_h_patha_:=pnLeft.caption;
    pnptr.panel_h_path_:=pnRight.caption;
    PTI.dbg_a:=self.dbgLeftSTOC;
    pnptr.dbgSTOC_:=self.dbgRightSTOC;
    pnptr.gbDir_infoa_:=gbLeftDirInfo;
    pnptr.gbDir_info_:=gbRightDirInfo;
    PTI.mem_dir_a:=memLeftDir;
    pnptr.mem_dir_:=memRightDir;
    pnptr.gbNotea_:=gbLeftNote;
    pnptr.gbNote_:=gbRightNote;
    PTI.memLink_a:=memLeftLink;
    pnptr.memLink_:=memRightLink;
    pnptr.gbFastNotea_:=gbLeftFastNote;
    pnptr.gbFastNote_:=gbRightFastNote; // панель быстрой заметки
    pnptr.memFastNotea_:=dbmLeftFastNote;
    pnptr.memFastNote_:=dbmRightFastNote;
    pnptr.memOriginala_:=dbmLeftOriginal;
    pnptr.memOriginal_:=dbmRightOriginal;
    pnptr.gbOriginala_:=gbLeftOriginal;
    pnptr.gbOriginal_:=gbRightOriginal; // панель оригинального текста
    pnptr.gbIdeaa_:=gbLeftIdea;
    pnptr.gbIdea_:=gbRightIdea; // панель главной идеи
    pnptr.dbrideaa_:=dbrLeftIdea;
    pnptr.dbridea_:=dbrRightIdea;
    PTI.note_url_a:=self.NoteLeftURL;
    pnptr.note_url_:=self.NoteRightURL;
  end;

  PTI.class_full_name:=dm.get_root_toc(PTI.class_id);
  PTI.class_full_name_a:=dm.get_root_toc(PTI.class_id_a);
  pnptr.class_name_:=dm.get_name_toc(PTI.class_id);
  pnptr.class_namea_:=dm.get_name_toc(PTI.class_id_a);
end;}


{procedure TfmSourceEdit.set_panel_class_caption(tag_:integer);
var
  PTI:TfmSourceEditPanelTagInfo;
  pix_:integer;
begin
  set_left_right(tag_, pnptr);
  pnptr.pnmain_.Caption:=dm.get_root_toc(PTI.class_id);
  Canvas.Font.Size := pnptr.pnMain_.Font.Size;
  Canvas.Font.Name := pnptr.pnMain_.Font.name;
  pix_:=Canvas.TextWidth(pnptr.pnMain_.Caption);
  //msgok(inttostr(pix_));
  if pix_>pnLeft.ClientWidth-10 then begin
    pix_:=round((pnptr.pnMain_.ClientWidth-10)/pix_*length(pnptr.pnMain_.Caption))-5;
    pnptr.pnMain_.Caption:='...'+copy(pnptr.pnMain_.Caption,length(pnptr.pnMain_.Caption)-pix_);
  end;
  if pnptr.pnMain_.Caption='' then
    pnptr.pnMain_.Caption:='Элемент оглавления или заметка';
end;}


procedure TfmSourceEdit.dbgKeywordColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds_.RecordCount>0 then
    Params.ImageIndex :=get_keyword_picture(ds_['keyword_use_count']);

end;

procedure TfmSourceEdit.dbgLeftSTOCColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds_['id']=null then
    Params.ImageIndex := -1
  else begin

    if ds_['is_dir']=1 then begin
      if ds_['id']=-1 then begin // все заметки
        Params.ImageIndex := 3;
      end
      else if ds_['id']=-3 then // ...
        Params.ImageIndex := -1
      else begin
        Params.ImageIndex := 0;

      end;
    end
    else begin
      Params.ImageIndex :=get_new_note_picture(ds_['attach_cnt'],ds_['url_cnt'],ds_['link_cnt']);
      {if (pos('0',ds_['ntype'])>0) and (pos('1',ds_['ntype'])>0) then
        Params.ImageIndex := 25
      else begin
        if ds_['link_cnt']>0 then begin
          if ds_['linka_cnt']>0 then
            Params.ImageIndex := 38
          else
            Params.ImageIndex := 31
        end
        else if ds_['attach_cnt']>0 then
          Params.ImageIndex := 32
        else
          Params.ImageIndex := 12;
      end;}
    end;
  end;


end;

procedure TfmSourceEdit.dbgSTOCKWLeftColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds_.RecordCount>0 then
    Params.ImageIndex :=get_keyword_picture(ds_['kwcount']);

end;

procedure TfmSourceEdit.DbgDblClick(Sender: TObject);
var
  PTI:TfmSourceEditPanelTagInfo;
  tag_:integer;
  old_id_:longint;
begin

  tag_:=(sender as TDBGridEh).tag;
  PTI:=get_SEL_PTI(tag_);

  if fdqSource.State in [dsEdit,dsInsert] then begin
     fdqSource.post;
  end;


  if (null2int(PTI.mteSTOC['id'],-100)=-100) or (PTI.mteSTOC['id']=-3) then begin
    ClassUp(sender);
    exit;
  end;

  old_id_:=null2int(PTI.mteSTOC['id']);
  if null2int(PTI.mteSTOC['is_dir'])>0 then begin    // папка
    if null2int(PTI.mteSTOC['id'],-100)<>-100 then begin
      //.SetStocDef(source_id,PTI.class_id,PTI.mteSTOC['id'], tag_);
      if PTI.mteSTOC['id']=-1 then
        setviewmode(tag_,false); // принудительное переключение с двупанельного
      SetPanelClass(tag_,PTI.mteSTOC['id']);
      self.SetPanelClassAddAction(tag_);
      //dm.Set_Ini_Int_Par(get_par_class_name(tag_),old_id_);
    end
    else begin
          ClassUp(sender)
    end;
  end
  else begin // заметка
    if null2int(PTI.mteSTOC['id'])>0 then
      NoteEdit(PTI.mteSTOC['id'])
  end;
  PTI.dbg.SearchPanel.Enabled:=(old_id_=-1) and (PTI.mteSTOC.RecordCount>10);


end;

{procedure TfmSourceEdit.dbgLeftSTOCKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin
    DbgDblClick(sender);
    exit;
    end;
  VK_BACK:begin
    btUpClick(sender);
    exit;
    end;
  VK_TAB: begin
    //msgok('tab');
    abort;
    //exit;
  end;
  end;
  inherited


end;

}
procedure TfmSourceEdit.dbrLeftIdeaEnter(Sender: TObject);
begin
  RecoverDBRDefFontColor(dbrLeftIdea)

end;

procedure TfmSourceEdit.dbrRightIdeaEnter(Sender: TObject);
begin
  RecoverDBRDefFontColor(dbrRightIdea)

end;

procedure TfmSourceEdit.fdqLeftnoteAfterScroll(DataSet: TDataSet);
begin
  RecoverDBRDefFontColor(dbrLeftIdea)
end;

procedure TfmSourceEdit.FDqRightNoteAfterScroll(DataSet: TDataSet);
begin
  RecoverDBRDefFontColor(dbrRightIdea)
end;

procedure TfmSourceEdit.FillDirInfo(tc_:TStrings; fdqstoc_id_:longint);
var
  cnt_:integer;
begin
  tc_.clear;
  tc_.Add('');
  tc_.Add('Элемент оглавления: '+dm.get_root_toc(fdqstoc_id_));
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from source_toc where stoc_id=:SID',[fdqstoc_id_]);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число подкаталогов 1-го уровня вложенности: '+inttostr(cnt_));
  //end;
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from note_source where stoc_id=:SID',[fdqstoc_id_]);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число заметок 1-го уровня вложенности: '+inttostr(cnt_));
  //end;
{  cnt_:=calc_stoc_subdirs(fdqstoc_id_);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число подкаталогов всего: '+inttostr(cnt_));
  //end;
  cnt_:=calc_stoc_subnote(fdqstoc_id_);
  //if cnt_>0 then begin
    tc_.add('');
    tc_.Add('Число заметок всего: '+inttostr(cnt_));
  //end;
  }
end;




procedure TfmSourceEdit.Add_Attach_File(filename_:string);
var
  q:TFdQuery;
  id:longint;
begin
  if filename_<>'' then begin
     q := TFDQuery.Create(nil);
     q.Connection:=dm.sqlc;
     q.SQL.Text := 'INSERT INTO source_attach (filename, content,source_id, file_size) ' + ' VALUES (:fname,:blobdata,:SID, :FS);';
     q.Params[3].DataType := ftInteger;
     q.params[3].AsInteger := BFileSize(FileName_);
     q.Params[0].DataType := ftString;
     q.params[0].AsString := ExtractFileName(FileName_);
     q.Params[1].DataType := ftBlob;
     if DM.Get_Ini_Int_Par('FileStorePlace')=0 then
       q.Params[1].AsStream := Tfilestream.Create(FileName_,fmopenread);
     q.Params[2].DataType := ftInteger;
     q.params[2].AsInteger := fdqSource['id'];
     q.ExecSQL();
     if DM.Get_Ini_Int_Par('FileStorePlace')=1 then begin
       id:=DM.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
       CopyFile(PWideChar(FileName_),
                PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\SourceFile\'+inttostr(id)),
                false)
     end;
     q.Free;
     try
       fdqSourceAttach.Refresh;
       fdqSourceAttach.Locate('filename',ExtractFileName(FileName_));
     except
     end;
  end;
end;


procedure TfmSourceEdit.saveAttachAsFile(fname:string);
var
  q:TFdQuery;
  ms:TMemoryStream;
begin
     q := TFDQuery.Create(nil);
     q.Connection:=dm.sqlc;
     q.SQL.Text := 'select * from source_attach where id='+inttostr(fdqSourceAttach['id']);
     q.open;
     if DM.Get_Ini_Int_Par('FileStorePlace')=0 then begin
       ms:=TMemoryStream.Create;
       TBlobField(q.FieldByName('content')).SaveToStream(ms);
       ms.Seek(0, soFromBeginning);
       ms.SaveToFile(fname);
       ms.Free;
     end
     else begin
       CopyFile(PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\SourceFile\'+inttostr(fdqSourceAttach['id'])),
                PWideChar(fname),false);
     end;
     q.Free;
end;


procedure TfmSourceEdit.btOkClick(Sender: TObject);
var
  prev_state:TDataSetState;
  iam_,id:longint;
  fname:string;
  q:TFdQuery;
  ms:TMemoryStream;
begin
  prev_state:=fdqSource.State;
  fmmain.SourceListNeedRefresh[is_mine]:=true;
  if fdqSource.State in [dsinsert, dsedit] then begin
    fdqSource['date_time_update']:=now;
    fdqSource.Post;
  end;
  fmmain.ReBuildHistory;
  if prev_state=dsinsert then begin
    self.SaveFormParams; // для 0-го сохраняем
    self.Source_id:=fdqSource['id'];
    self.SetAlias('fm'+par_fname[is_mine]+inttostr(source_id));
    //TNav.SetNewAlias('fm'+par_fname[is_mine]+'_'+inttostr(source_id));
    if new_url<>'' then
      dm.sqlc.ExecSQL('insert into source_url (source_id,url) values(:SID,:URL)',[self.Source_id,new_url]);
    if null2str(fdqSource['telegram_message_id'])<>'' then begin
      dm.sqlc.ExecSQL('update telegram_fast_note set status=1 where status=0 and telegram_message_id=:TMID',[fdqSource['telegram_message_id']]);
      if dm.sqlc.ExecSQLScalar('select changes()')>0 then
        fmmain.TelegramNeedRefresh:=true;
    end;
    if text_content<>'' then begin
      fname:=tmppath+'source_text_content_'+inttostr(self.Source_id)+'.txt';
      str_to_text_file(text_content,fname);
      Add_Attach_File(fname)
    end;
    if null2str(fdqSource['telegram_message_id'])<>'' then
       if dm.sqlc.ExecSQLScalar('select count(*) from telegram_fast_note where local_file_name is not null '+
              ' and telegram_message_id=:TT',[fdqSource['telegram_message_id']])>0 then begin
         if DM.Get_Ini_Int_Par('FileStorePlace')=0 then begin
           dm.sqlc.ExecSQL('INSERT INTO source_attach (filename, content,source_id, file_size) '+
            ' select message_type||file_ext, file, :SS, length(file) from telegram_fast_note where telegram_message_id=:TT',
            [source_id,fdqSource['telegram_message_id']]);
         end
         else begin
           dm.sqlc.ExecSQL('INSERT INTO source_attach (filename, source_id, file_size) '+
            ' select message_type||file_ext, :SS, length(file) from telegram_fast_note where telegram_message_id=:TT',
            [source_id,fdqSource['telegram_message_id']]);
           id:=dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
           {dm.sqlc.ExecSQL('INSERT INTO source_attach (filename, source_id, file_size) '+
            ' select message_type||file_ext, :SS, length(file) from telegram_fast_note where telegram_message_id=:TT',
            [source_id,fdqSource['telegram_message_id']]);
           id:=DM.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
           q := TFDQuery.Create(nil);
           q.Connection:=dm.sqlc;
           q.SQL.Text := 'select * from telegram_fast_note where telegram_message_id='+fdqSource['telegram_message_id'];
           q.open;
           ms:=TMemoryStream.Create;
           TBlobField(q.FieldByName('file')).SaveToStream(ms);
           ms.Seek(0, soFromBeginning);
           ms.SaveToFile(DM.Get_Ini_Str_Par('FileStoreDir')+'\SourceFile\'+inttostr(id)); тут copy
           ms.Free;}
           CopyFile(PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\TelegramFile\'+
                                inttostr(dm.sqlc.ExecSQLScalar('select id from telegram_fast_note where telegram_message_id=:III',
                                  [fdqSource['telegram_message_id']]))),
                    PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\SourceFile\'+inttostr(id)),
                    false);

         end
       end;
  end;

  if prev_state=dsInsert then begin
    if is_mine=0 then
      dbgAuthor.Visible:=true;
    dbgKeyword.Visible:=true;
    dbgurl.Visible:=true;
    dbgFiles.Visible:=true;
    btok.Caption:='OK';
    btok.Width:=75;
    dm.sqlc.ExecSQL('insert into source_toc (source_id, name) values(:SS,:NN)',[self.Source_id,'Содержание']);
    SetPanelClassAddAction(0);
    SetPanelClassAddAction(1);
    tsstoc.TabVisible:=true;
  end
  else
    close

end;

procedure TfmSourceEdit.btRTFClick(Sender: TObject);
var
  rtf:TRCRTF;
  fname:string;
  fdq:tFdquery;
begin
  dm.recreate_source_stoc(fdqSource['id'],nil);
  rtf:=TRCRTF.Create;
  rtf.Init;
  fname:=tmppath+'\'+display_service.source_proj[is_mine,8]+'_'+inttostr(fdqSource['id'])+'.rtf';
  if rtf.SetOutFile(fname) then begin
    fdq:=tFdquery.Create(nil);
    fdq.Connection:=dm.sqlc;
    fdq.SQL.clear;
    fdq.SQL.add('select n.name name, n.content content, ts.order_, st.order_, st.name, ns.order_,ns.page_from from note n, note_source ns, source_toc st, tmp_stoc ts');
    fdq.SQL.add('where ns.note_id=n.id and st.id=ns.stoc_id and ns.source_id='+inttostr(fdqSource['id'])+' and st.id=ts.id');
    fdq.SQL.add('union all');
    fdq.SQL.add('select n.name name, n.content content,-1 ,0,'''',0,0 from note n, note_source ns');
    fdq.SQL.add('where ns.note_id=n.id and ifnull(ns.stoc_id,0)<=0 and ns.source_id='+inttostr(fdqSource['id']));
    fdq.SQL.add('order by ts.order_, st.order_, st.name, ns.order_,ns.page_from');
    lcb.log(fdq.SQL.Text);
    // вначале формируем шрифты и цвета
    fdq.open;
    while not fdq.Eof do begin
      rtf.AddREContent(fdq['name'],fdq['content']);
      fdq.Next;
    end;
    rtf.WriteBufferAndClose;
    fdq.Close;
    fdq.Free;
    ShellExecute(0, nil, PChar(fname), nil, nil, SW_SHOWNORMAL);
  end
  else
    msgerror(format('Файл [%s] уже занят какой-то программой!',[fname]));
  rtf.Destroy;
end;


procedure TfmSourceEdit.CMDialogKey(var Msg: TWMKEY);
var
  tag_:integer;
  PTI:TfmSourceEditPanelTagInfo;
begin
  if (ViewMode=3) and (Msg.Charcode = VK_TAB)
    and ((ActiveControl =dbgLeftSTOC) or(ActiveControl =dbgRightSTOC)) then begin
      if ActiveControl =dbgLeftSTOC then
        tag_:=0
      else
        tag_:=1;
      PTI:=get_SEL_PTI(tag_);
      //ShowMessage('Нажата клавиша TAB?');
      PTI.dbg_a.SetFocus;
      exit;
  end;
  inherited;
end;


procedure TfmSourceEdit.RefreshAll;
var
  cid_, id_next_:longint;
  i, is_dir_:integer;
  loopa_:array[0..1] of TMemTableEh;
  pr_:TDataSetDriverEh;
begin
  self.IgnoreDSUScroolEvent:=true;
  loopa_[0]:=mteLeftSTOC; loopa_[1]:=mteRightSTOC;
  for I := 0 to 1 do begin
    if loopa_[i].Active then begin
      cid_:=0;
      if null2int(loopa_[i]['id'])<>0 then begin
        cid_:=loopa_[i]['id'];
        is_dir_:=loopa_[i]['is_dir'];
        id_next_:=dm.get_ds_id_next(loopa_[i]);
      end;
      pr_:=loopa_[i].DataDriver as TDataSetDriverEh;
      pr_.ProviderDataSet.Refresh;
      loopa_[i].Refresh;
      if cid_<>0 then begin
        if not loopa_[i].Locate('id;is_dir',VarArrayOf([cid_,is_dir_]),[]) then
          if id_next_>0 then
            loopa_[i].Locate('id;is_dir',VarArrayOf([id_next_,is_dir_]),[]);
      end;
    end;
  end;
  self.IgnoreDSUScroolEvent:=false;

  //self.SetFocus
end;


function TfmSourceEdit.GetListOrderCond(class_:longint):string;
begin
  GetListOrderCond:='source_id='+inttostr(source_id)+' and ifnull(stoc_id,0)='+inttostr(class_)+' ';
end;


function TfmSourceEdit.GetListOrder(class_:longint):string;
var
  sqlt,cond_add_:string;
begin
  cond_add_:=GetListOrderCond(class_);
  GetListOrder:='select 1 as is_dir, id,order_ from source_toc where +'+cond_add_+
        ' union all '+
        'select 0 as is_dir, note_id id, order_ from note_source where '+cond_add_;
end;


procedure TfmSourceEdit.CheckListOrder(class_:longint);
var
  i, cnt_, cnt_dist_:integer;
  sqlt,sqlc:ansistring;
  fdq_:TFdquery;

begin
  sqlt:=GetListOrder(class_);
  dm.sqlc.ExecSQL('update note_source set order_=0 where source_id=:SID and ifnull(stoc_id,0)=:SS and order_ is null',[source_id,class_]);
  cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from ('+sqlt+')');
  cnt_dist_:=dm.sqlc.ExecSQLScalar('select count(distinct ifnull(order_,0)) from('+sqlt+')');
  if cnt_<>cnt_dist_ then begin // непорядок в сортировке, работаем
     fdq_:=TFdquery.Create(nil);
     fdq_.Connection:=dm.sqlc;
     fdq_.SQL.Text:='select * from('+sqlt+') order by is_dir desc, ifnull(order_,0), id';
     fdq_.Open(); i:=1;
     while not fdq_.eof do begin
       sqlc:='update '+tab_name[null2int(fdq_['is_dir'])]+' set order_='+inttostr(i)+
          ' where '+ self.GetListOrderCond(class_)+' and '+id_field[null2int(fdq_['is_dir'])]+'='+inttostr(fdq_['id']);
       lcb.log(sqlc);
       dm.sqlc.ExecSQL(sqlc);
       fdq_.Next;
       inc(i);
     end;
     fdq_.Close;
     fdq_.Free;
  end;

end;


procedure TfmSourceEdit.mnUpperClick(Sender: TObject);
var
  tag_,up_is_dir_:integer;
  PTI:TfmSourceEditPanelTagInfo;
  sqlt, sqlc, sql_dir:ansistring;
  cur_order_,up_order_:longint;
  cond_add_:string;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  if PTI.mteSTOC.RecordCount<2 then
    exit;
  CheckListOrder(PTI.class_id);
  cond_add_:=GetListOrderCond(PTI.class_id);
  sqlt:=GetListOrder(PTI.class_id);

  sql_dir:='';
  if nsrt=1 then
     sql_dir:=' and is_dir='+inttostr(PTI.mteSTOC['is_dir'])+' ';

  sqlc:='select order_ from ('+sqlt+') where id='+inttostr(PTI.mteSTOC['id'])+' and is_dir='+inttostr(PTI.mteSTOC['is_dir']);
  cur_order_:=dm.sqlc.ExecSQLScalar(sqlc);
  sqlc:='select max(order_) from ('+sqlt+') where  order_<'+inttostr(cur_order_)+sql_dir;
  up_order_:=null2int(dm.sqlc.ExecSQLScalar(sqlc),-1);
  sqlc:='select is_dir from ('+sqlt+') where  order_='+inttostr(up_order_);
  up_is_dir_:=null2int(dm.sqlc.ExecSQLScalar(sqlc));
  if up_order_>=0 then begin
    // правим найденный макс
    sqlc:='update '+tab_name[up_is_dir_]+' set order_='+inttostr(cur_order_)+
          ' where '+ cond_add_+' and order_='+inttostr(up_order_);
    dm.sqlc.ExecSQL(sqlc);
    sqlc:='update '+tab_name[null2int(PTI.mteSTOC['is_dir'])]+' set order_='+inttostr(up_order_)+
          ' where '+ cond_add_+' and '+id_field[null2int(PTI.mteSTOC['is_dir'])]+'='+inttostr(PTI.mteSTOC['id']);
    dm.sqlc.ExecSQL(sqlc);
  end;
  SetLastUpdate;
  RefreshAll;
end;



procedure TfmSourceEdit.mnDownerClick(Sender: TObject);
var
  tag_,taga_,cur_order_,down_order_,down_is_dir_:integer;
  PTI:TfmSourceEditPanelTagInfo;
  sqlc, cond_add_,sqlt, sql_dir:string;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  if PTI.mteSTOC.RecordCount<2 then
    exit;
  CheckListOrder(PTI.class_id);
  cond_add_:=GetListOrderCond(PTI.class_id);
  sqlt:=GetListOrder(PTI.class_id);
  sql_dir:='';
  if nsrt=1 then
     sql_dir:=' and is_dir='+inttostr(PTI.mteSTOC['is_dir'])+' ';

  sqlc:='select order_ from ('+sqlt+') where id='+inttostr(PTI.mteSTOC['id'])+' and is_dir='+inttostr(PTI.mteSTOC['is_dir']);
  cur_order_:=dm.sqlc.ExecSQLScalar(sqlc);
  sqlc:='select min(order_) from ('+sqlt+') where  order_>'+inttostr(cur_order_)+sql_dir;
  down_order_:=null2int(dm.sqlc.ExecSQLScalar(sqlc),-1);
  sqlc:='select is_dir from ('+sqlt+') where  order_='+inttostr(down_order_);
  down_is_dir_:=null2int(dm.sqlc.ExecSQLScalar(sqlc));
  if down_order_>=0 then begin
    // правим найденный мин
    sqlc:='update '+tab_name[down_is_dir_]+' set order_='+inttostr(cur_order_)+
          ' where '+ cond_add_+' and order_='+inttostr(down_order_);
    dm.sqlc.ExecSQL(sqlc);
    sqlc:='update '+tab_name[null2int(PTI.mteSTOC['is_dir'])]+' set order_='+inttostr(down_order_)+
          ' where '+ cond_add_+' and '+id_field[null2int(PTI.mteSTOC['is_dir'])]+'='+inttostr(PTI.mteSTOC['id']);
    dm.sqlc.ExecSQL(sqlc);
  end;
  SetLastUpdate;
  RefreshAll;


end;



procedure TfmSourceEdit.mnEditClick(Sender: TObject);
var
  s:string;
  tag_,taga_:integer;
  PTI:TfmSourceEditPanelTagInfo;
  id_:longint;
begin
  PTI:=get_SEL_PTI(GetFocusTag);
  if PTI.mteSTOC['id']<=0 then
    exit;

  if PTI.mteSTOC['is_dir']=1 then begin // каталог
     s:=PTI.mteSTOC['name'];
     if InputQuery('Редактирование элемента оглавления','Новое название:',s) then begin
        id_:=PTI.mteSTOC['id'];
        dm.sqlc.ExecSQL('update source_toc set name=:NN where id=:IID',[s,id_]);
        PTI.fdqSTOC.Refresh;
        PTI.mteSTOC.Refresh;
        PTI.fdqSTOC_a.Refresh;
        PTI.mteSTOC_a.Refresh;
        PTI.mteSTOC.Locate('id;is_dir',VarArrayOf([id_,1]),[]);
     end;
  end
  else begin
    DbgDblClick(PTI.dbg)
  end;
end;

{procedure TfmSourceEdit.SetViewMode(new_mode:integer;new_maximized:boolean);
var
  PTI:TfmSourceEditPanelTagInfo;
begin
  mode:=new_mode;
  maximized:=new_maximized;
  set_left_right(mode,pnptr);
  if mode=3 then begin // двупанельность
    gbRightNote.Visible:=false;
    gbLeftNote.Visible:=false;
    dbgRightSTOC.Visible:=true;
    dbgLeftSTOC.Visible:=true;
    dbgRightSTOC.align:=alClient;
    dbgLeftSTOC.align:=alClient;
    pnptr.pnMain_.Visible:=true;
    PTI.gbPanel_a.Visible:=true;
    pnLeft.Align:=alLeft;
    gbLeftDirInfo.Visible:=false;
    gbRightDirInfo.Visible:=false;
    pnRight.Align:=alClient;
    set_panel_class_caption(0);
    set_panel_class_caption(1);

  end
  else begin // однопанельный
      if maximized then begin
        PTI.gbPanel_a.Visible:=false;
        pnptr.pnMain_.Visible:=true;
        pnptr.pnMain_.Align:=alClient;
        PTI.dbg.Visible:=true;
        PTI.dbg.Align:=alClient;
      end
      else begin // двупанельный с просмотром
        PTI.dbg.Visible:=true;
        PTI.dbg.Align:=alClient;
        PTI.dbg_a.Visible:=false;
        pnptr.pnMain_.Visible:=true;
        PTI.gbPanel_a.Visible:=true;
        PTI.gbOriginal_a.Align:=alLeft;
        PTI.gbFastNote_a.Visible:=true;
        PTI.gbFastNote_a.Align:=alTop;
        pnptr.memFastNotea_.Align:=alClient;
        pnptr.memFastNotea_.Visible:=true;

        pnLeft.Align:=alLeft;
        pnRight.Align:=alClient;
      end;
  end;
end;
}


function TfmSourceEdit.GetClassNameFull(class_id_:longint):string;
begin
  Result:=dm.get_root_toc(class_id_)
end;

function TfmSourceEdit.GetClassName(class_id_:longint):string;
begin
  Result:=dm.get_name_toc(class_id_)
end;


function TfmSourceEdit.GetClassClassId(class_id_:longint):longint;
begin
  Result:=null2int(dm.sqlc.ExecSQLScalar('select stoc_id from source_toc where id=:IID',[class_id_]));
end;


end.
