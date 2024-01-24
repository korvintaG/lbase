unit fmKeywordCommanderUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, MemTableDataEh, Data.DB,
  MemTableEh, DataDriverEh, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, DBCtrlsEh, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, display_service, dmdataunit, TwoPanelControlForm,
  Vcl.ExtCtrls, UrlPanels;

const
  sort_array:array[0..2] of string=('order by is_dir desc, ifnull(order_,0),ru_lower(name)',//(case when (select count(*) from keyword k where class_keyword_id=id)=0 then 0 else 1 end) desc,'+
    //'ifnull(order_,0),ru_lower(name_main)',
    'order by ifnull(order_,0),ru_lower(name_main)','order by ru_lower(name)');
  tmp_table_array:array[0..1] of string=('tmp_left_keyword','tmp_right_keyword');
  tmp_table_array_cont:array[0..1] of string=('tmp_left_keyword_cont','tmp_right_keyword_cont');
  note_expand_keyword:array[0..1] of string=('(select note_id from note_keyword where keyword_id=:KID) nk',
    '(select distinct note_id from (select note_id from note_keyword where keyword_id=:KID union all select note_id from note_expanded_keyword where keyword_id=:KID)) nk');
  par_fname='TagCommander';


type
  TProc=procedure(id_:integer) of object;
  TfmKeywordListPanelTagInfo = class(TPanelTagInfo)
     fdq,fdq_a:TFdquery;
     mte,mte_a:TMemTableEh;
     fdq_note,fdq_note_a:TFdquery;
     mte_note,mte_note_a:TMemTableEh;
     memo, memo_a:TMemo;
     memdef, memdef_a:Tmemo;
     dbg_note, dbg_note_a:TDbGridEh;
     dbrnc,dbrnc_a:TDbRichEditEh;
  end;

  TfmKeywordCommander = class(TfmTwoPanelControl)
    gbLeft: TGroupBox;
    dbgKWLeft: TDBGridEh;
    gbRight: TGroupBox;
    dbgKWRight: TDBGridEh;
    pnRightCont: TPanel;
    dbgRightnotes: TDBGridEh;
    dbrRightNoteCont: TDBRichEditEh;
    memRight: TMemo;
    memRightKWDef: TMemo;
    pnLeftCont: TPanel;
    dbgLeftNotes: TDBGridEh;
    dbrLeftNoteCont: TDBRichEditEh;
    memLeft: TMemo;
    memLeftKWDef: TMemo;
    fdqKeywordLeft: TFDQuery;
    fdqKeywordLeftid: TFDAutoIncField;
    fdqKeywordLeftclass_keyword_id: TIntegerField;
    fdqKeywordLeftis_dir: TIntegerField;
    fdqKeywordLeftdate_time_create: TDateTimeField;
    fdqKeywordLeftorder_: TIntegerField;
    fdqKeywordLefttype_: TIntegerField;
    fdqKeywordLeftnote_cnt: TIntegerField;
    fdqKeywordLeftsubfolder_cnt: TIntegerField;
    fdqKeywordLeftname: TWideMemoField;
    fdqKeywordLeftclass_name_after: TWideMemoField;
    fdqKeywordLeftsource_cnt: TIntegerField;
    fdqKeywordLeftdef: TWideMemoField;
    fdqKeywordLeftinterest_count: TIntegerField;
    fdqKeywordLeftclass_name_before: TWideMemoField;
    dsKeywordLeft: TDataSource;
    pmMain: TPopupMenu;
    mnModeShowContent: TMenuItem;
    mnChangePanel: TMenuItem;
    mnModeMaximized: TMenuItem;
    mnMode2Panel: TMenuItem;
    mnChooseTheSame: TMenuItem;
    N2: TMenuItem;
    mnAdd: TMenuItem;
    mnEditEh: TMenuItem;
    mnDel: TMenuItem;
    N1: TMenuItem;
    mnMove: TMenuItem;
    mnJoin: TMenuItem;
    N5: TMenuItem;
    mnUp: TMenuItem;
    mnDown: TMenuItem;
    mnSortAlhaBet: TMenuItem;
    N6: TMenuItem;
    mnUpLevel: TMenuItem;
    mnDownLevel: TMenuItem;
    mnMoveToAny: TMenuItem;
    N3: TMenuItem;
    mnRunProc: TMenuItem;
    mnRunProcClose: TMenuItem;
    N7: TMenuItem;
    mnKWAnalize: TMenuItem;
    mnNoteAdd: TMenuItem;
    mnFind: TMenuItem;
    fdqKeywordRight: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    fdqKeywordRightnote_cnt: TIntegerField;
    fdqKeywordRightsubfolder_cnt: TIntegerField;
    fdqKeywordRightname: TWideMemoField;
    fdqKeywordRightclass_name_after: TWideMemoField;
    fdqKeywordRightsource_cnt: TIntegerField;
    fdqKeywordRightdef: TWideMemoField;
    fdqKeywordRightinterest_count: TIntegerField;
    fdqKeywordRightclass_name_before: TWideMemoField;
    dsKeywordRight: TDataSource;
    dsRightnote: TDataSource;
    fdqRightnote: TFDQuery;
    dsLeftNote: TDataSource;
    FDQTmpKeywordFill: TFDQuery;
    FDAutoIncField3: TFDAutoIncField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    DateTimeField2: TDateTimeField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    WideMemoField1: TWideMemoField;
    IntegerField11: TIntegerField;
    FDQTmpKeywordFillclass_name_after: TWideMemoField;
    dsdeKeywordLeft: TDataSetDriverEh;
    mteKeywordLeft: TMemTableEh;
    dsdeKeywordRight: TDataSetDriverEh;
    mteKeywordRight: TMemTableEh;
    mteLeftNote: TMemTableEh;
    dsdeKeftNote: TDataSetDriverEh;
    mteRightNote: TMemTableEh;
    dsdeRightNote: TDataSetDriverEh;
    mnMode: TMenuItem;
    mnMakeSynonym: TMenuItem;
    mnShowIer: TMenuItem;
    FDQTmpKeywordFillall_cnt: TIntegerField;
    fdqRightnoteid: TFDAutoIncField;
    fdqRightnotetype_: TIntegerField;
    fdqRightnotecont_id: TIntegerField;
    fdqRightnotename: TWideMemoField;
    fdqRightnotecontent: TWideMemoField;
    fdqRightnotesource_type: TIntegerField;
    fdqRightnotesubtype: TIntegerField;
    fdqRightnoteattach_cnt: TIntegerField;
    fdqRightnoteurl_cnt: TIntegerField;
    fdqRightnotelink_cnt: TIntegerField;
    fdqRightnotesubname: TWideMemoField;
    fdqLeftNote: TFDQuery;
    FDAutoIncField2: TFDAutoIncField;
    IntegerField5: TIntegerField;
    IntegerField10: TIntegerField;
    WideMemoField2: TWideMemoField;
    WideMemoField3: TWideMemoField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    WideMemoField4: TWideMemoField;
    procedure FormCreate(Sender: TObject);
    procedure dbgKWLeftColumns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgRightnotesColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mnEditEhClick(Sender: TObject);
    procedure dbgRightSourceColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure mnFindClick(Sender: TObject);
    procedure dbgRightnotesDblClick(Sender: TObject);
    procedure mteLeftNoteAfterScroll(DataSet: TDataSet);
    procedure mnNoteAddClick(Sender: TObject);
    procedure mnMoveClick(Sender: TObject);
    procedure mnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    // переопределенные методы
    procedure FormResize(Sender: TObject); override;
    procedure DbgDblClick(Sender: TObject); override;
    procedure dbrLeftNoteContEnter(Sender: TObject);
    procedure dbrRightNoteContExit(Sender: TObject);
    procedure dbrLeftNoteContMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgRightnotesColumns1GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgLeftSourceDblClick(Sender: TObject);
    procedure mnDelClick(Sender: TObject);
    procedure mnMakeSynonymClick(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure mnShowIerClick(Sender: TObject);
  private
    { Private declarations }
    sql_save:array [0..1] of ansistring;
    sql_prepare_save,sql_note_save:ansistring;
    Color_KWDef:longint;
    nsrt:integer;
    procedure set_display_grid(PTI:TfmKeywordListPanelTagInfo); // проставляем видимый размер гридов, если нужно
    procedure RefreshAll;
    function get_KWL_PTI(tag_:integer;is_fast_:boolean=false):TfmKeywordListPanelTagInfo;

    // определение методов родительских
    procedure SetPanelClassAddAction(tag_:integer); override;
    function GetClassClassId(class_id_:longint):longint; override;
    function GetClassNameFull(class_id_:longint):string; override;
    function GetClassName(class_id_:longint):string; override;


  public
    //mode:integer;
    //maximized:boolean;
    add_proc:TProc;
    mnname:string;
    def_kw_id:longint;
    { Public declarations }
    constructor Create(AOwner: TComponent;mnname_:string;add_proc_:Tproc;def_kw_id_:longint=0);reintroduce;
//    procedure set_panel_class_caption(tag_:integer);
    procedure fill_tmp_sources(tag_:integer);
    procedure DsuAfterScroolHandle(DataSet_:TDataSet); override; // реальные действия при скрулинге основного датасет

  end;

var
  fmKeywordCommander: TfmKeywordCommander;
  corr_type_backGround:array[0..3] of longint=(clWindow,clWindowFrame,clRed,clBtnFace);
  corr_type_FontColor:array[0..3] of longint=(clWindowText,clWindowText,clWindowText,clInactiveCaption);

implementation

{$R *.dfm}

uses extend_data, lcb_unit, extend_dialog, data_service,
  vcl.themes, fmKWEditUnit, shellapi, fmNoteEditUnit,
  fmMainUnit;

constructor TfmKeywordCommander.Create(AOwner: TComponent;mnname_:string;add_proc_:Tproc;def_kw_id_:longint=0);
var
  smode:integer;
begin
  def_kw_id:=def_kw_id_;
  add_proc:=add_proc_;
  mnname:=mnname_;

  inherited CreateWithAlias(AOwner,'fmKeywordList','Ключевые слова');

 {self.ScaleBy(2320,1366);
  self.RestoreFormParams();}

  Color_KWDef:=dm.Get_Ini_Int_Par('Color_KWDef',clBlue);

  sql_save[0]:=fdqKeywordLeft.SQL.Text;
  sql_save[1]:=fdqKeywordRight.SQL.Text;
  sql_note_save:=fdqRightnote.SQL.Text;
  sql_prepare_save:=FDQTmpKeywordFill.SQL.Text;
  nsrt:=dm.Get_Ini_Int_Par(par_fname+par_sort);
  fdqKeywordLeft.SQL.Add(sort_array[nsrt]);
  fdqKeywordRight.SQL.Add(sort_array[nsrt]);
  //fdqRightNote.SQL.Add('order by name,subname');
  //fdqLeftNote.SQL.Add ('order by name,subname');

  self.AssignControls(pmMain, gbLeft, gbRight,
                   dbgKWLeft,dbgKWRight,
                   pnLeftCont,pnRightCont,
                   mteKeywordLeft,mteKeywordRight);
  fmmain.KeywordListNeedRefresh:=true;


end;

procedure TfmKeywordCommander.FormActivate(Sender: TObject);
var
  i:integer;
  id_old_left:longint;
  id_old_right:longint;
begin
  if fmmain.KeywordListNeedRefresh then begin
    //for i:=0 to 2 do corr_type_FontColor[i]:=clWhite;//TStyleManager.ActiveStyle.GetSystemColor(clWindowText);
    if mteKeywordLeft.Active then
      id_old_left:=null2int(mteKeywordLeft['id'])
    else
      id_old_left:=0;
    if mteKeywordRight.Active then
      id_old_right:=null2int(mteKeywordRight['id'])
    else
      id_old_right:=0;
    ResetLastScroolTag;
    SetPanelClass(0);
    SetPanelClass(1);

    if id_old_left>0 then
      mteKeywordLeft.Locate('ID',id_old_left,[]);
    if id_old_right>0 then
      mteKeywordRight.Locate('ID',id_old_right,[]);

    if (viewmode =0) and (mteRightNote.Active) then begin
      id_old_Right:=null2int(mteRightNote['id']);
      if id_old_Right>0 then begin
        //mteKeywordLeft.AfterScroll(mteKeywordLeft);
        mteRightNote.Locate('id',id_old_right,[]);
      end;
    end;
    if (viewmode =1) and (mteLeftNote.Active) then begin
      id_old_left:=null2int(mteLeftNote['id']);
      if id_old_Left>0 then begin
        //mteKeywordRight.AfterScroll(mteKeywordRight);
        mteLeftNote.Locate('id',id_old_left,[]);
      end;
    end;

    fmmain.KeywordListNeedRefresh:=false;
  end;


end;

procedure TfmKeywordCommander.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
  fmKeywordCommander:=nil

end;

procedure TfmKeywordCommander.FormCreate(Sender: TObject);
var
  i,j:integer;
  def_class_,tag:longint;
  PTI:TfmKeywordListPanelTagInfo;
begin

  corr_type_backGround[0]:=clWindow;
  corr_type_FontColor[0]:=clWindowText;
  corr_type_backGround[1]:=dm.Get_Ini_Int_Par('Color_KWBkgInterest',14215400);
  corr_type_FontColor[1]:=dm.Get_Ini_Int_Par('Color_KWFontInterest',clWindowText);
  corr_type_backGround[2]:=dm.Get_Ini_Int_Par('Color_KWBkgAntonym',clRed);
  corr_type_FontColor[2]:=dm.Get_Ini_Int_Par('Color_KWFontAntonym',clYellow);
  corr_type_backGround[3]:=dm.Get_Ini_Int_Par('Color_KWBkgOmonym',clBtnFace);
  corr_type_FontColor[3]:=dm.Get_Ini_Int_Par('Color_KWFontOmonym',clWindowText);


  {if def_kw_id=0 then begin
    SetPanelClass(0,tnav.GetDefClass(0));
    SetPanelClass(1,tnav.GetDefClass(1));
  end
  else begin
    def_class_:=dm.sqlc.ExecSQLScalar('select class_keyword_id from keyword where id=:IID',[def_kw_id]);
    SetPanelClass(0,def_class_);
    SetPanelClass(1,def_class_);
  end;

  set_panel_class_caption(0);
  set_panel_class_caption(1);
  if def_kw_id>0 then
    mteKeywordLeft.Locate('ID',def_kw_id, []);}

  SetViewMode();
  if ViewMode=1 then
    SendMessage(dbgKWRight.Handle, WM_SETFOCUS, 0, 0);

  if def_kw_id<>0 then begin
    if viewmode=3 then
       tag:=0
    else
       tag:=viewmode;
    PTI:=get_KWL_PTI(tag);

    def_class_:=dm.sqlc.ExecSQLScalar('select class_keyword_id from keyword where id=:IID',[def_kw_id]);
    SetPanelClass(tag,def_class_);
    PTI.dsu.Locate('ID',def_kw_id, []);
    SendMessage(PTI.dbg.Handle, WM_SETFOCUS, 0, 0);
  end;




  if mnname='' then begin
    mnRunProc.Visible:=false;
    mnRunProcClose.Visible:=false;
  end
  else begin
    mnRunProc.Caption:=mnname+' и остаться';
    mnRunProcClose.Caption:=mnname+' и закрыть окно';
  end;

  //dbrRightNoteCont.ScaleBy(150,100);

end;


procedure TfmKeywordCommander.FormResize(Sender: TObject);
begin
  if ViewMaximized then
    exit;

  if ViewMode=3 then begin
    gbLeft.Width:=round(self.ClientWidth/2-1);
    gbRight.Left:=round(self.ClientWidth/2-1);
  end
  else if ViewMode=0 then begin
    if ClassLeftId=-1 then begin
      gbLeft.Width:=round(self.ClientWidth/2+1);
      gbRight.Left:=round(self.ClientWidth/2-1);
    end
    else begin
      gbLeft.Width:=round(self.ClientWidth/3+1);
      gbRight.Left:=round(2*self.ClientWidth/3-1);
    end;
  end
  else begin // mode=1
    if ClassRightId=-1 then begin
      gbLeft.Width:=round(self.ClientWidth/2-1);
      gbRight.Left:=round(self.ClientWidth/2+1);
    end
    else begin
      gbLeft.Width:=round(2*self.ClientWidth/3-1);
      gbRight.Left:=round(self.ClientWidth/3+1);
    end;
  end;

end;


procedure TfmKeywordCommander.SetPanelClassAddAction(tag_:integer);
var
  pos_:integer;
//  rclass_:longint;
  PTI:TfmKeywordListPanelTagInfo;
begin
  lcb.Log('SetPanelClassAddAction начало');
  PTI:=get_KWL_PTI(tag_);

  PTI.fdq.SQL.Text:=self.sql_save[tag_];
  if (PTI.class_id=-1) or (PTI.class_id=-4) then
    PTI.fdq.SQL.Add(sort_array[2])
  else
    PTI.fdq.SQL.Add(sort_array[nsrt]);

  fill_tmp_sources(tag_);

  {lcb.Log('  PTI.fdq.Close-open начало');
  PTI.fdq.Close;
  PTI.fdq.Open;
  lcb.Log('  PTI.fdq.Close-open конец');

  PTI.mte.close;
  PTI.mte.Open();
  lcb.Log('  PTI.mte.Open-close конец');}
  if PTI.fdq.active then
    PTI.fdq.Refresh
  else
    PTI.fdq.Open();
  if PTI.mte.Active then
    PTI.mte.Refresh()
  else
    PTI.mte.Open();

  lcb.Log('SetPanelClassAddAction конец');
end;



function TfmKeywordCommander.GetClassNameFull(class_id_:longint):string;
begin
  result:=dm.get_kw_full_root(class_id_);
end;

function TfmKeywordCommander.GetClassName(class_id_:longint):string;
begin
  result:=dm.sqlc.ExecSQLScalar('select name_main from keyword where id=:III',[class_id_]);
end;


procedure TfmKeywordCommander.dbgKWLeftColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
  tag_:integer;
  PTI:TfmKeywordListPanelTagInfo;
  cg_:TDbGridEh;
begin
  cg_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh);
  ds_:=cg_.DataSource.DataSet;
  tag_:=ds_.tag;
  PTI:=self.get_KWL_PTI(tag_,true);
  if (ds_['id']=null) or (ds_['id']=-3) then // ...
    Params.ImageIndex := -1
  else begin
    if (ds_['is_dir']=1) and (PTI.class_id<>-1) and (PTI.class_id<>-4) then begin
      if ds_['id']=-1 then begin // "все ключевые слова"
        Params.ImageIndex := 3;
      end
      else if ds_['id']=-4 then begin // омонимы
        Params.ImageIndex := 35;
      end
      else begin // папки
        if (ds_['source_cnt']=0) and (ds_['note_cnt']=0) then
          Params.ImageIndex := 0
        else
          Params.ImageIndex := 19;
      end;
    end
    else begin
      if (null2str(ds_['def'])<>'')  then begin
        if (gdSelected in Params.State) then begin
          if cg_.focused then
            Params.Font.Color:=clwhite-Color_KWDef
          else
            Params.Font.Color:=Color_KWDef
        end
        else
          Params.Font.Color:=Color_KWDef;
      end;
      Params.ImageIndex := get_keyword_picture(null2int(ds_['note_cnt'])+null2int(ds_['source_cnt']));
    end;
  end;


end;

procedure TfmKeywordCommander.dbgLeftSourceDblClick(Sender: TObject);
var
  tag_:integer;
  PTI:TfmKeywordListPanelTagInfo;
  old_id_:longint;
begin
  {tag_:=(sender as TDBGridEh).tag;
  PTI:=get_KWL_PTI(tag_);
  if null2int(PTI.fdq_source['id'])>0 then begin
     PostMessage(fmmain.handle, WM_GOTO_SOURCE_PROJ, PTI.fdq_source['id'], 0);
  end;}
end;

procedure TfmKeywordCommander.DbgDblClick(Sender: TObject);
var
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
  old_id_, old_class_:longint;
begin
  if sender.ToString='TMenuItem' then begin
    tag_:=self.GetFocusTag;
  end
  else begin
    tag_:=(sender as TDBGridEh).tag;
  end;
  //PTI:=get_KWL_PTI(tag_);
  PTI:=get_KWL_PTI(tag_);
  old_class_:=PTI.class_id;
  old_id_:=null2int(PTI.mte['id']);
  if old_id_=-1 then begin // все тэги по порядку
    if ViewMode=3 then begin
      setviewmode(tag_,false);

    end;
    //mode:=tag_;
  end;
  if (PTI.class_id=-1) and (old_id_<>-3) and (old_id_<>0) then
    exit;

  if (old_id_=0) or (old_id_=-3) then // пусто - идем вверх
    ClassUp(Sender)
  else begin
    //dm.Set_Ini_Int_Par('TagCmdr'+PTI.tag_name+inttostr(PTI.class_id),old_id_);
    SetPanelClass(tag_,old_id_);
    //PTI.mte.AfterScroll(PTI.mte);
    //ClassEnter(tag_,old_class_,old_id_);
  end;
  //set_panel_class_caption(tag_);
  PTI.dbg.Columns[1].Visible:=(old_id_=-1) or (old_id_=-4);
  PTI.dbg.SearchPanel.Enabled:=old_id_=-1;

end;


procedure TfmKeywordCommander.dbgRightnotesColumns0GetCellParams(
  Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if null2int(ds_['id'])=0 then
    exit;
  Params.ImageIndex:=get_source_picture(bool2int(null2int(ds_['source_type'])=1000),null2int(ds_['source_type']));

  {Params.ImageIndex := get_note_picture(null2str(ds_['ntype']),null2int(ds_['srccount']));
  if ds_['corr_type']<>0 then begin
    Params.Background := corr_type_backGround[null2int(ds_['corr_type'])];
    if not (gdSelected in Params.State) then
      Params.Font.Color:=corr_type_FontColor[null2int(ds_['corr_type'])]
    else
      Params.Font.Color:=clWhite-corr_type_FontColor[null2int(ds_['corr_type'])];
  end;}
end;

procedure TfmKeywordCommander.dbgRightnotesColumns1GetCellParams(
  Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if (null2int(ds_['cont_id'])=0) then
    exit;

  if (null2int(ds_['type_'])=1) then // заметки
    Params.ImageIndex:=get_new_note_picture(ds_['attach_cnt'],ds_['url_cnt'],ds_['link_cnt']);


  {if ds_['corr_type']<>0 then begin
    Params.Background := corr_type_backGround[null2int(ds_['corr_type'])];
    if not (gdSelected in Params.State) then
      Params.Font.Color:=corr_type_FontColor[null2int(ds_['corr_type'])]
    else
      Params.Font.Color:=clWhite-corr_type_FontColor[null2int(ds_['corr_type'])];
  end;}

end;

procedure TfmKeywordCommander.dbgRightnotesDblClick(Sender: TObject);
var
  old_id_:longint;
  ds_:TDataSet;
begin
  ds_:=(sender as TDBGridEh).DataSource.DataSet;
  if null2int(ds_['cont_id'])>0 then begin
    case ds_['type_'] of
    1:begin // заметка
      if fmNoteEdit<>nil then begin
         fmNoteEdit.Close;
         Application.ProcessMessages;
      end;
      fmNoteEdit := TfmNoteEdit.CreateWithData(0,0,0,ds_['cont_id'],dbEdit,self);
      fmNoteEdit.show;
    end;
    3: if null2int(ds_['cont_id'])>0 then begin
     PostMessage(fmmain.handle, WM_GOTO_SOURCE_PROJ, ds_['cont_id'], 0);
    end;

    end;
  end;
end;

procedure TfmKeywordCommander.dbgRightSourceColumns0GetCellParams(
  Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
  tag_:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  tag_:=ds_.tag;
  PTI:=get_KWL_PTI(tag_);
  if null2int(ds_['id'])=0 then
    exit;
  Params.ImageIndex:=get_source_picture(ds_['is_mine'],null2int(ds_['source_type_id']));

end;

procedure TfmKeywordCommander.fill_tmp_sources(tag_:integer);
var
  PTI:TfmKeywordListPanelTagInfo;
begin
   lcb.Log('fill_tmp_sources - начало');
   PTI:=get_KWL_PTI(tag_);
   dm.sqlc.ExecSQL('delete from '+tmp_table_array[tag_]);
   FDQTmpKeywordFill.sql.Text:=format(self.sql_prepare_save,[tmp_table_array[tag_]]);
   FDQTmpKeywordFill.Params.ParamValues['CKW']:=PTI.class_id;
   FDQTmpKeywordFill.Params.ParamValues['KWUT']:=dm.Get_Ini_Int_Par('KW_Uni_Trend',0);
   FDQTmpKeywordFill.Execute;
   lcb.Log('fill_tmp_sources - конец');
end;

procedure TfmKeywordCommander.mnAddClick(Sender: TObject);
var
  inpstr:string;
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
  t_:integer;
  kw_id, kw_name_id:longint;
begin
  PTI:=get_KWL_PTI(GetFocusTag);
  if inputstr('Ввод данных','Введите новое ключевое слово для добавления:',InpStr) then begin
    dm.add_new_kw_name(InpStr,PTI.class_id,kw_id, kw_name_id);
    RefreshAll;
    PTI.mte.Locate('id',kw_id,[]);
  end;

end;


procedure TfmKeywordCommander.mnDelClick(Sender: TObject);
var
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
  PTI:=get_KWL_PTI(GetFocusTag);
  if msgquestion(format('Удалить ключевое слово [%s]?',[PTI.dsu['name']])) then begin
      if DM.keyword_delete(PTI.dsu['id']) then
         RefreshAll;
  end;

end;

procedure TfmKeywordCommander.mnEditEhClick(Sender: TObject);
var
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
  PTI:=get_KWL_PTI(GetFocusTag);
  fmKWEdit:=TfmKWEdit.CreateWData(PTI.mte['id'],PTI.mte['name'],nil,self);
  if fmKWEdit.ShowModal=mrok then begin
    dm.sqlc.ExecSQL('update keyword set note=:NN where id=:IID',[fmKWEdit.mmNote.Text,PTI.mte['id']]);
    //RefreshAll;
    FormActivate(sender)
  end;
  fmKWEdit.Free;
  fmKWEdit:=nil;

end;

procedure TfmKeywordCommander.mnFindClick(Sender: TObject);
var
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
  u_:string;
begin
  PTI:=get_KWL_PTI(GetFocusTag);
  if null2int(PTI.mte['id'])>0 then begin
    u_:='https://yandex.ru/search/?text='+PTI.mte['name']+'+это';
    ShellExecute(Application.Handle,PChar('open'),PChar(u_), PChar(0), nil, SW_NORMAL);
  end;
end;


procedure TfmKeywordCommander.mnMakeSynonymClick(Sender: TObject);
var
  id_,name_id_, old_id_, old_name_id_: longint;
  nn:string;
  PTI:TfmKeywordListPanelTagInfo;
begin
  PTI:=get_KWL_PTI(GetFocusTag);
     if getKeyword(id_,name_id_,self,format('Преобразование [%s] в синоним другого',[PTI.mte['name']]),
       'Выберете базовое ключевое слово:','Преобразовать в синоним',
       ' select * from (Select %s as name, kwn.id kw_name_id, k.id kw_id from keyword_name kwn, keyword k '+
       ' where k.id=kwn.keyword_id and k.id <>'+inttostr(PTI.mte['id'] )+') order by ru_lower(name)',
       false,
       '',''
       )
     then begin
       old_id_:=PTI.mte['id'];
       old_name_id_:=dm.sqlc.ExecSQLScalar('select id from keyword_name where keyword_id-:OO',[old_id_]);
       dm.sqlc.ExecSQL('update keyword_name set keyword_id=:NN where keyword_id=:OO',[id_,old_id_]);
       dm.sqlc.ExecSQL('update note_keyword set keyword_id=:NN where keyword_id=:OO',[id_,old_id_]);
       dm.sqlc.ExecSQL('update source_keyword set keyword_id=:NN where keyword_id=:OO',[id_,old_id_]);
       dm.sqlc.ExecSQL('update stoc_keyword set keyword_id=:NN where keyword_id=:OO',[id_,old_id_]);
       dm.sqlc.ExecSQL('update task_keyword set keyword_id=:NN where keyword_id=:OO',[id_,old_id_]);
       dm.sqlc.ExecSQL('delete from keyword where keyword_id=:OO',[old_id_]);
       dm.recalc_keyword(id_);
       RefreshAll
     end;
end;

procedure TfmKeywordCommander.mnMoveClick(Sender: TObject);
var
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
  if ViewMode<>3 then
    exit;
  PTI:=get_KWL_PTI(GetFocusTag);
  if msgquestion(format('Перенести ключевое слово [%s] в папку [%s]',[PTI.mte['name'],PTI.class_full_name_a])) then begin
    dm.sqlc.ExecSQL('update keyword set class_keyword_id=:NC where id=:IID',[PTI.class_id_a,PTI.mte['id']]);
    dm.recalc_class_name(PTI.class_id_a);
    RefreshAll;
    //dbg_.SetFocus
  end;

end;

procedure TfmKeywordCommander.mnNoteAddClick(Sender: TObject);
var
  kw_id_:longint;
  tag_, taga_:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
      PTI:=get_KWL_PTI(GetFocusTag);
      kw_id_:=PTI.mte['id'];
      if fmNoteEdit<>nil then begin
        fmNoteEdit.Close;
        Application.ProcessMessages
      end;
      fmNoteEdit := TfmNoteEdit.CreateWithData(0,0,kw_id_,-1,dbInsert,fmmain);
      fmNoteEdit.show;
end;


procedure TfmKeywordCommander.mnShowIerClick(Sender: TObject);
var
  ckw,id:longint;
  tag:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
  tag:=GetFocusTag;
  PTI:=get_KWL_PTI(tag);
  ckw:=PTI.mte['class_keyword_id'];
  id:=PTI.mte['id'];
  PTI.dbg.SearchPanel.SearchingText:='';
  PTI.dbg.SearchPanel.CancelSearchFilter;
  PTI.dbg.SearchPanel.Enabled:=false;
  self.SetPanelClass(tag,ckw);
  self.SetViewMode(3,false);
  PTI.mte.Locate('ID',id,[]);
  PTI.dbg.Columns[1].Visible:=false;
end;

procedure TfmKeywordCommander.DsuAfterScroolHandle(DataSet_: TDataSet);
var
  PTI:TfmKeywordListPanelTagInfo;
  tag_:integer;
  folder_id_:longint;
  folder_name_, kwcont:string;
  cnt_:integer;

begin
  tag_:=DataSet_.tag;
  PTI:=get_KWL_PTI(tag_);
  kwcont:=tmp_table_array_cont[GetAnotherTag(tag_)];
  dm.sqlc.ExecSQL('delete from '+kwcont);
  dm.sqlc.ExecSQL('insert into  '+kwcont+' (type_, cont_id, name, subname, content, source_type, subtype, attach_cnt, url_cnt, link_cnt) '+
                  ' select 1,note.id, '+
                  '   (select  GROUP_CONCAT(source_fullname_by_id(ns.source_id,1)) from note_source ns where ns.note_id=note.id), '+
                  '   note.name, note.content_plain, note_source_type(note.id), 1, '+
                  '   (select count(*) from note_attach where note_id=note.id) attach_cnt, '+
                  '   (select count(*) from note_url where note_id=note.id) url_cnt, '+
                  '   (select count(*) from note_link where note.id in (note1_id, note2_id)) link_cnt '+
                  ' from note_keyword nk, note '+
                  ' where nk.keyword_id=:KK and nk.note_id=note.id ',[PTI.mte['id']]);

  lcb.Log('Начало exp');
  dm.sqlc.ExecSQL('insert into  '+kwcont+' (type_, cont_id, name, subname, content, source_type, subtype, attach_cnt, url_cnt, link_cnt) '+
                  ' select distinct 1,note.id, '+
                  '   (select  GROUP_CONCAT(source_fullname_by_id(ns.source_id,1)) from note_source ns where ns.note_id=note.id), '+
                  //' ''для теста'', '+
                  '   note.name, note.content_plain, note_source_type(note.id), 1, '+
                  //'   note.name, note.content_plain, note.id, 1, '+
                  '   (select count(*) from note_attach where note_id=note.id) attach_cnt, '+
                  '   (select count(*) from note_url where note_id=note.id) url_cnt, '+
                  '   (select count(*) from note_link where note.id in (note1_id, note2_id)) link_cnt '+
                  ' from note_expanded_keyword nk, note '+
                  ' where nk.keyword_id=:KK and nk.note_id=note.id '+
                  '   and not exists (select * from '+kwcont+' where cont_id=note.id and type_=1)',[PTI.mte['id']]);
  lcb.Log('Конец exp');


  lcb.Log('Начало src');
  dm.sqlc.ExecSQL('insert into  '+kwcont+' (type_, cont_id, name, source_type, subtype ) '+
                  ' select 3, source_id, source_fullname_by_id(source_id,1), source_type_id, is_mine '+
                  ' from source_keyword, source '+
                  ' where keyword_id=:KK and source_id=source.id',[PTI.mte['id']]);
  lcb.Log('Конец src');


        lcb.log('mteKeywordLeftAfterScroll mode='+inttostr(ViewMode)+' PTI.mte[id]='+inttostr(PTI.mte['id']));

        if null2int(PTI.mte['id'])<=0 then
           PTI.pnCont_a.Caption:=''
        else
           PTI.pnCont_a.Caption:=null2str(PTI.mte['class_name_before'])+PTI.mte['name'];

        lcb.log('mteKeywordLeftAfterScroll до перезакрытия');
        PTI.mte_note_a.close;
        PTI.fdq_note_a.Close;
        //PTI.fdq_note_a.SQL.Text:=replacestr(sql_note_save,'%s',note_expand_keyword[DM.Get_Ini_Int_Par('KW_Note_Source',0)]);
        {with PTI.fdq_note_a.Params do begin
          ParamValues['KID']:=null2int(dataset_['id']);
          ParamValues['SBI']:=dm.Get_Ini_Int_Par('KW_Note_Show_Interest');
          ParamValues['SBA']:=dm.Get_Ini_Int_Par('KW_Note_Show_Antonym');
          ParamValues['SBO']:=dm.Get_Ini_Int_Par('KW_Note_Show_Omonym');
        end;}
        lcb.log(PTI.fdq_note_a.SQL.Text+' '+inttostr(null2int(dataset_['id'])));
        PTI.fdq_note_a.Open();
        PTI.mte_note_a.Open;
        lcb.log('mteKeywordLeftAfterScroll после перезакрытия');

        {PTI.fdq_source_a.Close;
        with PTI.fdq_source_a.Params do begin
          ParamValues['KID']:=null2int(dataset_['id']);
        end;
        PTI.fdq_source_a.open;
        lcb.log('mteKeywordLeftAfterScroll после перезакрытия источников');}

        if (null2int(PTI.mte['id'])=-1) or ((null2int(PTI.mte['id'])=-3) and (PTI.class_id=-1)) then begin // Все ключевые слова п/п
           lcb.log('mteKeywordLeftAfterScroll все слова п/п начало');
           PTI.dbg_note_a.Visible:=false;
           PTI.memo_a.Visible:=true;
           PTI.memo_a.align:=alClient;
           PTI.dbrnc_a.Visible:=false;
           PTI.memo_a.Lines.Clear;
           PTI.memo_a.Lines.Add('');
           PTI.memo_a.Lines.Add('Общее количество ключевых слов='+inttostr(dm.sqlc.ExecSQLScalar('select count(*) from keyword')));
           lcb.log('mteKeywordLeftAfterScroll все слова п/п конец');
        end
        else begin
           lcb.log('mteKeywordLeftAfterScroll папки или слова начало');
           if null2int(PTI.mte['id'])<>0 then
             PTI.gbPanel_a.Caption:='ID='+inttostr(PTI.mte['id']);
           PTI.memo_a.Visible:=false;
           //application.ProcessMessages;
           PTI.dbg_note_a.Visible:=PTI.fdq_note_a.RecordCount>0;
           PTI.dbrnc_a.Visible:=PTI.fdq_note_a.RecordCount>0;
           lcb.log('mteKeywordLeftAfterScroll до начала анализа видимости источников');
           cnt_:=dm.sqlc.ExecSQLScalar('select count(*) from keyword_name where keyword_id=:KID',[PTI.mte['id']]);
           if (null2str(PTI.mte['def'])<>'') or (cnt_>1) then begin
             PTI.memdef_a.Align:=alTop;
             PTI.memdef_a.Lines.Clear;
             if null2str(PTI.mte['def'])<>'' then
               PTI.memdef_a.Lines.add('«'+PTI.mte['name']+'» – '+ PTI.mte['def']);
             if cnt_>1 then
               PTI.memdef_a.Lines.add('Синонимы: '+
                 dm.sqlc.ExecSQLScalar('SELECT GROUP_CONCAT(name) FROM keyword_name where keyword_id=:KID and name<>:NN',
                                            [PTI.mte['id'],PTI.mte['name']]));
             PTI.memdef_a.Height:=70;
             PTI.memdef_a.Visible:=true;
             PTI.memdef_a.Top:=0;
           end
           else
             PTI.memdef_a.Visible:=false;

           if PTI.dbg_note_a.Visible
              //PTI.dbgNoteInterest_a.Visible
           then begin
             lcb.log('mteKeywordLeftAfterScroll гриды видимы');
             set_display_grid(PTI);
             RecoverDBRDefFontColor(PTI.dbrnc_a);
           end
           else begin // нет ни источников, ни заметок
             lcb.log('mteKeywordLeftAfterScroll источники невидимы и заметки тоже');
             PTI:=get_KWL_PTI(tag_);
             PTI.memo_a.Visible:=true;
             PTI.memo_a.Align:=alClient;
             PTI.memo_a.Lines.Clear;
             if PTI.mte['id']=-3 then begin // ...
               folder_name_:=PTI.class_full_name;
               folder_id_:=PTI.class_id;
             end
             else begin // обычная папка
               folder_id_:=PTI.mte['id'];
               folder_name_:=PTI.mte['name'];
             end;

             PTI.memo_a.Lines.add('Папка ключевых слов ['+folder_name_+']');
             PTI.memo_a.Lines.add('');
             PTI.memo_a.Lines.add('Кол-во вложенных ключевых слов первого уровня: '+
               inttostr(dm.sqlc.ExecSQLScalar('select count(*) from keyword k where k.class_keyword_id=:KID',[folder_id_])));
             PTI.memo_a.Lines.add('  включая папок: '+
               inttostr(dm.sqlc.ExecSQLScalar('select count(*) from keyword k where k.class_keyword_id=:KID and exists (select * from keyword where class_keyword_id=k.id)',[folder_id_])));
             PTI.memo_a.Lines.add('  включая обычных ключевых слов: '+
               inttostr(dm.sqlc.ExecSQLScalar('select count(*) from keyword k where k.class_keyword_id=:KID and not exists (select * from keyword where class_keyword_id=k.id)',[folder_id_])));

             PTI.memo_a.Lines.add('');
             PTI.memo_a.Lines.add('Кол-во вложенных ключевых слов на всех подуровнях: '+
               inttostr(dm.calc_keyword_in_sublevel(folder_id_)));
             PTI.memo_a.Lines.add('  включая папок: '+
               inttostr(dm.calc_keyword_in_sublevel(folder_id_,3)));
             PTI.memo_a.Lines.add('  включая обычных ключевых слов: '+
               inttostr(dm.calc_keyword_in_sublevel(folder_id_,1)));

           end;
           lcb.log('mteKeywordLeftAfterScroll папки или слова конец');



        end;

end;

procedure TfmKeywordCommander.mteLeftNoteAfterScroll(DataSet: TDataSet);
var
  tag_:integer;
  PTI:TfmKeywordListPanelTagInfo;
begin
  tag_:=DataSet.tag;
  PTI:=get_KWL_PTI(tag_);
  RecoverDBRDefFontColor(PTI.dbrnc);
  //PTI.dbrnc.Color:=corr_type_backGround[null2int(DataSet['corr_type'])];
end;



procedure TfmKeywordCommander.pmMainPopup(Sender: TObject);
var
  PTI:TfmKeywordListPanelTagInfo;
begin
  PTI:=get_KWL_PTI(GetFocusTag);
  mnShowIer.Visible:=PTI.class_id=-1;
end;

procedure TfmKeywordCommander.dbrLeftNoteContEnter(Sender: TObject);
begin
  RecoverDBRDefFontColor(Sender as TDBRichEditEh);
end;

procedure TfmKeywordCommander.dbrLeftNoteContMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then begin // чиним глюк попытки изменения содержимого по правой кнопке мыши
    lcb.log('dbrIdeaMouseUp');
    keybd_event(VK_ESCAPE,0,0,0);
    keybd_event(VK_ESCAPE,0,KEYEVENTF_KEYUP,0);
    Application.ProcessMessages;
  end;

end;

procedure TfmKeywordCommander.dbrRightNoteContExit(Sender: TObject);
begin
  RecoverDBRDefFontColor(Sender as TDBRichEditEh);

end;

procedure TfmKeywordCommander.set_display_grid(PTI:TfmKeywordListPanelTagInfo); // проставляем видимый размер гридов, если нужно
var
  fno_:integer;
begin
  fno_:=0;
  if null2str(PTI.mte['def'])<>'' then
    fno_:=fno_+1;
  if PTI.mte['source_cnt']>0 then
    fno_:=fno_+10;
  if PTI.mte['note_cnt']>0 then
    fno_:=fno_+100;

  case fno_ of
  001: begin // только определение
         PTI.dbg_note_a.Visible:=false;
         PTI.dbrnc_a.Visible:=false;
         PTI.memdef_a.Visible:=true;
         PTI.memdef_a.Align:=alClient;
       end;
  010: begin // только источники
         PTI.dbg_note_a.Visible:=false;
         PTI.dbrnc_a.Visible:=false;
         PTI.memdef_a.Visible:=false;
       end;
  011: begin // источники и определение
         PTI.memdef_a.Top:=0;
         PTI.memdef_a.Align:=alTop;
         PTI.memdef_a.Visible:=true;
         PTI.dbg_note_a.Visible:=false;
         PTI.dbrnc_a.Visible:=false;
       end;
  100: begin // только заметки
         PTI.memdef_a.Visible:=false;
         PTI.dbg_note_a.Align:=alTop;
         PTI.dbg_note_a.Visible:=true;
         PTI.dbg_note_a.Height:=round(self.Height*(2/3));
         PTI.dbrnc_a.Visible:=true;
         PTI.dbrnc_a.align:=alClient;
       end;
  101: begin // заметки и определения
         PTI.memdef_a.Visible:=true;
         PTI.memdef_a.align:=alTop;
         PTI.memdef_a.Top:=0;
         PTI.dbg_note_a.Align:=alTop;
         PTI.dbg_note_a.Visible:=true;
         PTI.dbg_note_a.Height:=round((self.Height-PTI.memdef_a.Height) *(2/3));
         PTI.dbrnc_a.Visible:=true;
         PTI.dbrnc_a.align:=alClient;
       end;
  110: begin // заметки и источники
         PTI.memdef_a.Visible:=false;
         PTI.dbg_note_a.Align:=alTop;
         PTI.dbg_note_a.Visible:=true;
         PTI.dbg_note_a.Height:=round(self.Height/2);
         PTI.dbrnc_a.Visible:=true;
         PTI.dbrnc_a.align:=alClient;
       end;
  111: begin // все
         PTI.memdef_a.Visible:=true;
         PTI.memdef_a.Top:=0;
         PTI.memdef_a.Align:=alTop;
         PTI.dbg_note_a.Align:=alTop;
         PTI.dbg_note_a.Visible:=true;
         PTI.dbrnc_a.Visible:=true;
         PTI.dbrnc_a.align:=alClient;
       end;

  end;

end;

procedure TfmKeywordCommander.RefreshAll;
var
  cid_, id_next_:longint;
  i:integer;
  loopa_:array[0..1] of TMemTableEh;
  pr_:TDataSetDriverEh;
begin
  lcb.Log('RefreshAll начало');
  loopa_[0]:=mteKeywordLeft; loopa_[1]:=mteKeywordRight;
  for I := 0 to 1 do begin
    if loopa_[i].Active then begin
      fill_tmp_sources(i);
      cid_:=0;
      if null2int(loopa_[i]['id'])<>0 then begin
        cid_:=loopa_[i]['id'];
        id_next_:=dm.get_ds_id_next(loopa_[i]);
      end;
      pr_:=loopa_[i].DataDriver as TDataSetDriverEh;
      pr_.ProviderDataSet.Refresh;
      loopa_[i].Refresh;
      if cid_<>0 then begin
        if not loopa_[i].Locate('id',cid_,[]) then
          if id_next_>0 then
            loopa_[i].Locate('id',id_next_,[]);
      end;
    end;
  end;
  lcb.Log('RefreshAll конец');

end;

function TfmKeywordCommander.get_KWL_PTI(tag_:integer;is_fast_:boolean=false):TfmKeywordListPanelTagInfo;
var
  PTI:TfmKeywordListPanelTagInfo;
begin
  PTI:=TfmKeywordListPanelTagInfo.Create;
  inherited GetTagPTI(tag_,PTI as TPanelTagInfo,is_fast_);

  if tag_=0 then begin
    PTI.fdq:=fdqKeywordLeft;
    PTI.fdq_a:=fdqKeywordRight;
    PTI.mte:=mteKeywordLeft;
    PTI.mte_a:=mteKeywordRight;
    PTI.fdq_note:=fdqLeftNote;
    PTI.fdq_note_a:=fdqRightNote;
    PTI.dbg_note:=self.dbgLeftNotes;
    PTI.dbg_note_a:=self.dbgRightNotes;

    PTI.mte_note:=mteLeftNote;
    PTI.mte_note_a:=mteRightNote;
    PTI.memo:=self.memLeft;
    PTI.memo_a:=self.memRight;
    PTI.memdef:=memLeftKWDef;
    PTI.memdef_a:=memRightKWDef;
    PTI.dbrnc:=dbrLeftNoteCont;
    PTI.dbrnc_a:=dbrRightNoteCont;

  end
  else begin
    PTI.fdq_a:=fdqKeywordLeft;
    PTI.fdq:=fdqKeywordRight;
    PTI.mte_a:=mteKeywordLeft;
    PTI.mte:=mteKeywordRight;
    PTI.fdq_note_a:=fdqLeftNote;
    PTI.fdq_note:=fdqRightNote;
    PTI.dbg_note_a:=self.dbgLeftNotes;
    PTI.dbg_note:=self.dbgRightNotes;
    PTI.mte_note_a:=mteLeftNote;
    PTI.mte_note:=mteRightNote;
    PTI.memo_a:=self.memLeft;
    PTI.memo:=self.memRight;
    PTI.memdef_a:=memLeftKWDef;
    PTI.memdef:=memRightKWDef;
    PTI.dbrnc_a:=dbrLeftNoteCont;
    PTI.dbrnc:=dbrRightNoteCont;
  end;
  Result:=PTI;
end;


function TfmKeywordCommander.GetClassClassId(class_id_:longint):longint;
begin
 Result:=dm.sqlc.ExecSQLScalar('select class_keyword_id from keyword where id=:IID',[class_id_])
end;



end.
