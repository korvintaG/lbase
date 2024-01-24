unit fmNoteEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  extend_data, dmDataUnit,
  Vcl.Styles,Vcl.Themes,

  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, MemTableDataEh, Data.DB,
  DataDriverEh, MemTableEh, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DBCtrlsEh, Vcl.Buttons, Vcl.StdCtrls, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls,
  ColorTabs,
  display_service, aliasform;

type
  //TTabsheet=class(TColorTabSheet);
  TCustomDBRichEditEh = class(TDBRichEditEh);


  TfmNoteEdit = class(TForm)
    pcMainNoteEdit: TPageControl;
    tsGen: TTabSheet;
    Splitter1: TSplitter;
    pnTop: TPanel;
    gbFast: TGroupBox;
    dbmFastNote: TDBMemoEh;
    pnMain: TPanel;
    splVert: TSplitter;
    gbsource: TGroupBox;
    dbmOriginal: TDBMemoEh;
    gbNote: TGroupBox;
    dbrNoteContent: TDBRichEditEh;
    tsSource: TTabSheet;
    dbgNoteSource: TDBGridEh;
    tsTag: TTabSheet;
    dbgKeyWord: TDBGridEh;
    dbgStrucItem: TDBGridEh;
    tsDublicate: TTabSheet;
    dbgNoteDubl: TDBGridEh;
    tsNoteLink: TTabSheet;
    dbgLinks: TDBGridEh;
    tsAdd: TTabSheet;
    dbgurl: TDBGridEh;
    dbgFiles: TDBGridEh;
    pnTool: TPanel;
    btOk: TButton;
    btSaveAndContinue: TButton;
    pnTopGlo: TPanel;
    lbName: TLabel;
    sbNoteDel: TSpeedButton;
    sbNoteCopy: TSpeedButton;
    dbeName: TDBEditEh;
    fdqNoteKeyword: TFDQuery;
    fdqNoteKeywordid: TFDAutoIncField;
    fdqNoteKeywordnote_id: TIntegerField;
    fdqNoteKeywordkeyword_id: TIntegerField;
    fdqNoteKeywordkeyword_name_id: TIntegerField;
    fdqNoteKeywordkwcount: TIntegerField;
    DSNoteKeyword: TDataSource;
    fdqNoteLink: TFDQuery;
    fdqNoteLinkid: TFDAutoIncField;
    fdqNoteLinknote1_id: TIntegerField;
    fdqNoteLinknote2_id: TIntegerField;
    fdqNoteLinklink_type: TIntegerField;
    fdqNoteLinklink_type_name: TWideMemoField;
    fdqNoteLinknote2_name: TWideMemoField;
    fdqNoteLinkntype: TWideMemoField;
    fdqNoteLinksrccount: TIntegerField;
    fdqNoteLinksources: TWideMemoField;
    dsNoteLink: TDataSource;
    pmNoteLink: TPopupMenu;
    mnNoteLinkAdd: TMenuItem;
    mnNoteLinkDel: TMenuItem;
    mnGotoNote: TMenuItem;
    N1: TMenuItem;
    mnCreateNoteNewByLink: TMenuItem;
    fdqNote: TFDQuery;
    fdqNoteid: TFDAutoIncField;
    fdqNotesubpart_id: TIntegerField;
    fdqNotename: TWideMemoField;
    fdqNoteoriginal_text: TWideMemoField;
    fdqNotecontent: TWideMemoField;
    fdqNotecontent_plain: TWideMemoField;
    fdqNotedate_time_create: TDateTimeField;
    fdqNotefast_text: TWideMemoField;
    fdqNotenote_show_mode: TIntegerField;
    fdqNotesplitter_param: TIntegerField;
    fdqNoteh_splitter_param: TIntegerField;
    fdqNotedate_time_update: TDateTimeField;
    fdqNoteform_width: TIntegerField;
    fdqNotetelegram_message_id: TWideMemoField;
    dsNote: TDataSource;
    pmKeyWord: TPopupMenu;
    pmKWAdd: TMenuItem;
    mnAddIer: TMenuItem;
    mnKWDel: TMenuItem;
    N6: TMenuItem;
    mnGotoTag: TMenuItem;
    fdqNoteURL: TFDQuery;
    fdqNoteURLid: TFDAutoIncField;
    fdqNoteURLurl: TWideMemoField;
    fdqNoteURLnote_id: TIntegerField;
    fdqNoteURLcomment: TWideMemoField;
    dsNoteURL: TDataSource;
    pmUrl: TPopupMenu;
    mnUrlAdd: TMenuItem;
    mnurldel: TMenuItem;
    mnurledit: TMenuItem;
    N4: TMenuItem;
    mnUrlGo: TMenuItem;
    dsNoteAttach: TDataSource;
    fdqNoteAttach: TFDQuery;
    fdqNoteAttachid: TIntegerField;
    fdqNoteAttachfilename: TWideMemoField;
    fdqNoteAttachfile_size: TIntegerField;
    fdqNoteAttachnote_id: TIntegerField;
    pmAttach: TPopupMenu;
    mnAttachAdd: TMenuItem;
    mnAttachDel: TMenuItem;
    mnFileOpen: TMenuItem;
    N5: TMenuItem;
    mnAttachSave: TMenuItem;
    OpenDialog: TOpenDialog;
    sdAttach: TSaveDialog;
    fdqNoteStrucIt: TFDQuery;
    fdqNoteStrucItid: TFDAutoIncField;
    fdqNoteStrucItnote_id: TIntegerField;
    fdqNoteStrucItstructure_item_id: TIntegerField;
    dsNoteStrucIt: TDataSource;
    pmStrucItem: TPopupMenu;
    mnStrItAdd: TMenuItem;
    mnStrItDel: TMenuItem;
    fdqNoteSource: TFDQuery;
    fdqNoteSourceid: TFDAutoIncField;
    fdqNoteSourcenote_id: TIntegerField;
    fdqNoteSourcesource_id: TIntegerField;
    fdqNoteSourcestoc_id: TIntegerField;
    fdqNoteSourcePage_from: TFloatField;
    fdqNoteSourcePage_to: TFloatField;
    fdqNoteSourceorder_: TIntegerField;
    fdqNoteSourcesourcename: TWideMemoField;
    fdqNoteSourcestocname: TWideMemoField;
    fdqNoteSourcesource_type_id: TIntegerField;
    fdqNoteSourceis_mine: TIntegerField;
    dsNoteSource: TDataSource;
    pmNoteSource: TPopupMenu;
    mnNoteSourceAdd: TMenuItem;
    mnNoteSourceDel: TMenuItem;
    mnNoteSourceEdit: TMenuItem;
    N2: TMenuItem;
    mnGotoSource: TMenuItem;
    pmNote: TPopupMenu;
    mnPasteBuf: TMenuItem;
    mnCopyBuf: TMenuItem;
    N3: TMenuItem;
    mnToRtf: TMenuItem;
    fdqNoteDubl: TFDQuery;
    fdqNoteDublid: TFDAutoIncField;
    fdqNoteDublname: TWideMemoField;
    fdqNoteDublsources: TWideMemoField;
    fdqNoteDublntype: TWideMemoField;
    fdqNoteDublsame_kw: TWideMemoField;
    fdqNoteDublsrccount: TIntegerField;
    dsNoteDubl: TDataSource;
    mteNoteDubl: TMemTableEh;
    dsdeNoteDubl: TDataSetDriverEh;
    mteNoteLink: TMemTableEh;
    dsdeNoteLink: TDataSetDriverEh;
    mteNoteSource: TMemTableEh;
    dsdeNoteSource: TDataSetDriverEh;
    fdqNoteKeywordkword: TWideMemoField;
    fdqNoteKeywordkclass: TWideMemoField;
    fdqNoteStrucItsi_name: TWideMemoField;
    fdqNoteKeywordkwscount: TIntegerField;
    mnEdit: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgKeyWordColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgNoteSourceColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgNoteDublColumns0GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormCreate(Sender: TObject);
    procedure pmKWAddClick(Sender: TObject);
    procedure dbrNoteContentEnter(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure dsNoteDataChange(Sender: TObject; Field: TField);
    procedure dbrNoteContentChange(Sender: TObject);
    procedure dbmOriginalChange(Sender: TObject);
    procedure dbeNameChange(Sender: TObject);
    procedure dbmFastNoteChange(Sender: TObject);
    procedure sbNoteDelClick(Sender: TObject);
    procedure mnNoteSourceAddClick(Sender: TObject);
    procedure mnStrItAddClick(Sender: TObject);
    procedure mnStrItDelClick(Sender: TObject);
    procedure gbsourceDblClick(Sender: TObject);
    procedure mnGotoSourceClick(Sender: TObject);
    procedure tsGenShow(Sender: TObject);
    procedure mnKWDelClick(Sender: TObject);
    procedure dbgNoteDublDblClick(Sender: TObject);
    procedure mnGotoNoteClick(Sender: TObject);
    procedure mnPasteBufClick(Sender: TObject);
    procedure mnCopyBufClick(Sender: TObject);
    procedure mnEditClick(Sender: TObject);
    procedure mnToRtfClick(Sender: TObject);
    procedure dbgLinksColumns0GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure mnNoteSourceDelClick(Sender: TObject);
    procedure mnNoteLinkAddClick(Sender: TObject);
    procedure mnNoteLinkDelClick(Sender: TObject);
    procedure mnGotoTagClick(Sender: TObject);
    procedure sbNoteCopyClick(Sender: TObject);
    procedure mnUrlAddClick(Sender: TObject);
    procedure mnurldelClick(Sender: TObject);
    procedure mnurleditClick(Sender: TObject);
    procedure mnUrlGoClick(Sender: TObject);
    procedure mnNoteSourceEditClick(Sender: TObject);
    procedure mnAttachAddClick(Sender: TObject);
    procedure mnAttachDelClick(Sender: TObject);
    procedure mnFileOpenClick(Sender: TObject);
    procedure mnAttachSaveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbrNoteContentExit(Sender: TObject);
    procedure mnCreateNoteNewByLinkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    //procedure pcMainDrawTab(Control: TCustomTabControl; TabIndex: Integer; const Rect: TRect; Active: Boolean);
  private
    { Private declarations }
    formOwner:TComponent;
    copy_attach:boolean;
    procedure saveAttachAsFile(fname:string);
  public
    { Public declarations }
    Source_id, note_id, kw_id, stoc_id, corr_note_id:longint;
    DBMode:TDBMode;
    real_update:boolean;
    new_url:string;
    constructor CreateWithData(Source_id_, stoc_id_, kw_id_, note_id_:longint; DBMode_:TDBMode;AOwner: TComponent;
                telegram_message_id:string='';fast_note:string='';copy_attach_:boolean=false;url_:string='');
    procedure SetNoteShowMode(note_show_mode:integer);
    procedure RefrNoteDouble;
  end;

var
  fmNoteEdit: TfmNoteEdit;

implementation

{$R *.dfm}

uses fmMainUnit, data_service, extend_dialog, extend_diskutil,
   fmNoteSourceUnit, fmNoteTypeUnit, lcb_unit,
  shellapi,RichEditRTF,
  fmNoteViewModeUnit, ClipBrd, fmSourceEditUnit, fmNoteLinkAddUnit,
  fmKeywordCommanderUnit, extend_graph;

procedure TfmNoteEdit.btOkClick(Sender: TObject);
var
  fname:string;
  cont_w_c:string;
  id,max:longint;
begin
  if DBMode=dbEdit then
    fdqNote.Edit;

  fdqNote['splitter_param']:=gbsource.Width;
  fdqNote['h_splitter_param']:=pnTop.Height;
  fdqNote['content_plain']:=dbrNoteContent.Text;
  fdqNote['form_width']:=self.ClientWidth;
  fdqnote['date_time_update']:=Now;
  fdqNote.post;
  fmmain.NoteListNeedRefresh:=true;
  fmmain.KeywordListNeedRefresh:=true;
  fmmain.ReBuildHistory;
  real_update:=false;
  note_id:=fdqNote['id'];
  if IsAppThemed then begin
    cont_w_c:=RemoveColor(fdqNote['content'],TStyleManager.ActiveStyle.GetSystemColor(clWindowText));
    if cont_w_c<>fdqNote['content'] then begin
      dm.sqlc.ExecSQL('update note set content=:CC where id=:IID',[cont_w_c,fdqNote['id']]);
      if DBMode<>dbEdit then begin
        fdqNote.close;
        fdqnote.SQL.Text:='select * from note where id='+inttostr(note_id);
        fdqnote.open;
      end
      else
        fdqnote.refresh;
      if Sender=btSaveAndContinue then
        RecoverDBRDefFontColorPrUp(dbrNoteContent,real_update);
    end;
  end;

  if DBMode<>dbEdit then begin
    if null2str(fdqNote['telegram_message_id'])<>'' then begin
      fmmain.TelegramNeedRefresh:=true;
      dm.sqlc.ExecSQL('update telegram_fast_note set status=1 where status=0 and telegram_message_id=:TMID',[fdqNote['telegram_message_id']]);
      if copy_attach then begin
         fname:=dm.sqlc.execSQLScalar('select local_file_name from telegram_fast_note where telegram_message_id=:TMID',[fdqNote['telegram_message_id']]);
         if fname<>'' then begin
           fname:=ExtractFileName(fname);
           dm.sqlc.ExecSQL('insert into note_attach(filename,content,note_id,file_size) select :FF,file,:NN,length(file) from telegram_fast_note where telegram_message_id=:TMID',
             [fname,fdqNote['id'],fdqNote['telegram_message_id']]);
         end;

      end;
    end;

    fdqNoteSource.Params.ParamValues['NID']:=note_id;
    fdqNoteSource.Open();
    mteNoteSource.Open;
    //if (source_id=0) and (fmmain.dblSource.KeyValue>0) then
    //   source_id:=fmmain.dblSource.KeyValue;
    if source_id>0 then begin
      max:=dm.get_max_stoc_order(source_id,stoc_id);
      if stoc_id>0 then
        dm.sqlc.ExecSQL('insert into note_source (note_id, source_id, stoc_id) values (:NN, :SS, :ST)',[note_id,source_id, stoc_id])
      else
        dm.sqlc.ExecSQL('insert into note_source (note_id, source_id) values (:NN, :SS)',[note_id,source_id]);
      id:=dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
      if max<>0 then
         max:=max+1
      else
         max:=id;
      dm.sqlc.ExecSQL('update note_source set order_=:OO where id=:II',[max,id]);
      mteNoteSource.close;
      mteNoteSource.open;

      dm.sqlc.ExecSQL('insert into note_structure_item (structure_item_id,note_id) select structure_item_id, :NID from source_structure_item where source_id=:SID',[note_id,source_id]);

    end;
    if kw_id>0 then begin
      dm.sqlc.ExecSQL('insert into note_keyword (note_id, keyword_id, keyword_name_id) values(:NN, :KK, :NKW)',
        [note_id,kw_id,dm.get_main_kw_name_id(kw_id)]);
      fdqNoteKeyword.close;
      fdqNoteKeyword.open;
    end;

    btOk.Visible:=true;
  end;

  if (corr_note_id<>0) and (DBMode=dbInsert) then begin
    dm.sqlc.ExecSQL('insert into note_link (link_type,note1_id, note2_id) values(1,'+inttostr(corr_note_id)+','+inttostr(fdqNote['id'])+')');
    dm.sqlc.ExecSQL('insert into note_link (link_type,note1_id, note2_id) values(2,'+inttostr(fdqNote['id'])+','+inttostr(corr_note_id)+')');
  end;
  if DBMode=dbEdit then begin
    if sender<>btSaveAndContinue then begin
      application.ProcessMessages;
      real_update:=false;
      close
    end;
  end
  else begin
    DBMode:=dbEdit;
    //pnbtp.Top:=dbgLinks.Top+dbgLinks.Height+10;
    //pnTop.Height:=pnbtp.Top+pnbtp.Height+10;
    //btok.Caption:=ml.GetLangValue('fmNoteEdit','btOk.Caption');
    self.Caption:='Редактирование заметки ID='+inttostr(fdqNote['id']);
    dbgKeyWord.Visible:=true;
    dbgLinks.Visible:=true;
    tsAdd.TabVisible := true;
    tsSource.TabVisible := true;
    tsTag.TabVisible := true;
    tsNoteLink.TabVisible := true;
    sbNoteDel.Visible:=true;
    sbNoteCopy.Visible:=true;
    //sbStocChange.Visible:=true;
    fdqNoteKeyword.Params.ParamValues['NID']:=note_id;
    fdqNoteKeyword.Open();
    fdqNoteLink.Params.ParamValues['NID']:=note_id;
    fdqNoteLink.Open();
    mteNoteLink.Open;
    fdqNoteURL.Params.ParamValues['NID']:=note_id;
    fdqNoteURL.Open();
    if new_url<>'' then begin
      fdqNoteurl.Insert;
      fdqNoteurl['url']:=new_url;
      fdqNoteurl['note_id']:=self.note_id;
      fdqNoteurl.post;
    end;
    fdqNoteAttach.Params.ParamValues['NID']:=note_id;
    fdqNoteAttach.Open();
    fdqNoteStrucIt.Params.ParamValues['NID']:=note_id;
    fdqNoteStrucIt.Open();
    pcMainNoteEdit.ActivePageIndex := 1;
    real_update:=false;
    if sender<>btSaveAndContinue then begin
      application.ProcessMessages;
      real_update:=false;
      close
    end;
  end;
end;

constructor TfmNoteEdit.CreateWithData(Source_id_, stoc_id_,kw_id_, note_id_:longint; DBMode_:TDBMode;AOwner: TComponent;
                telegram_message_id:string='';fast_note:string='';copy_attach_:boolean=false;url_:string='');
var
  shm_:integer;
  fnote:string;
begin
  copy_attach:=copy_attach_;
  new_url:=url_;
  formOwner:=AOwner;
  CreateWithAlias(AOwner,'fmNoteEdit');
  Source_id:=Source_id_;
  note_id:=note_id_;
  kw_id:=kw_id_;
  stoc_id:=stoc_id_;
  corr_note_id:=0;
  DBMode:=DBMode_;

  if (Source_id=0) and (note_id<>0) then begin
    if DM.sqlc.ExecSQLScalar('select count(*) from note_source where note_id=:NN',[note_id])=1 then
      source_id:=DM.sqlc.ExecSQLScalar('select source_id from note_source where note_id=:NN',[note_id]);
  end;

  //recreate_source_stoc(Source_id);

  if DBMode=dbedit then begin
    fdqnote.SQL.Text:='select * from note where id='+inttostr(note_id);
    fdqnote.open;
    RecoverDBRDefFontColorPrUp(dbrNoteContent,real_update);
    real_update:=false;

    //fdqnote.Cancel;

    //fdqnote.edit;
    if null2int(fdqnote['splitter_param'])>0 then
      gbsource.Width:=fdqnote['splitter_param'];

    if null2int(fdqnote['h_splitter_param'])>0 then
      pnTop.Height:=fdqnote['h_splitter_param'];


    fdqNoteKeyword.Params.ParamValues['NID']:=note_id;
    fdqNoteKeyword.Open();
    fdqNoteStrucIt.Params.ParamValues['NID']:=note_id;
    fdqNoteStrucIt.Open();
    fdqNoteLink.Params.ParamValues['NID']:=note_id;
    fdqNoteLink.Open();
    {if fdqNoteLink.RecordCount>0 then begin
      tsNoteLink.BrushColor:=clGreen;
      tsNoteLink.FontColor:=clWhite;
    end;}
    mteNoteLink.Open;


    fdqNoteURL.Params.ParamValues['NID']:=note_id;
    fdqNoteURL.Open();
    fdqNoteSource.Params.ParamValues['NID']:=note_id;
    fdqNoteSource.Open();
    mteNoteSource.Open;
    //msgok(inttostr(mteNoteSource.RecordCount));
    fdqNoteAttach.Params.ParamValues['NID']:=note_id;
    fdqNoteAttach.Open();
    SetNoteShowMode(fdqnote['note_show_mode']);
    RefrNoteDouble
  end
  else begin
    dbgKeyWord.Visible:=false;
    dbgLinks.Visible:=false;
    tsAdd.TabVisible := false;
    tsTag.TabVisible := false;
    tsDublicate.TabVisible := false;
    tsNoteLink.TabVisible := false;
    sbNoteDel.Visible:=false;
    sbNoteCopy.Visible:=false;

    tsSource.TabVisible:=false;
    fdqnote.open;
    fdqnote.insert;
    fdqnote['date_time_create']:=Now;
    fdqnote['date_time_update']:=Now;
    fdqnote['telegram_message_id']:=telegram_message_id;
    if (fast_note<>'') or (url_<>'') then
      fnote:=fast_note+' '+url_
    else
      fnote:='';
    if fnote<>'' then begin
      fdqnote['name']:=fnote;
      fdqnote['fast_text']:=fnote;
      fdqnote['content']:=fnote;
    end;
    if null2int(Source_id)>0 then begin
      fdqnote['note_show_mode']:=DM.sqlc.ExecSQLScalar('select note_show_mode from source where id=:SID',[Source_id]);
      SetNoteShowMode(fdqnote['note_show_mode'])
    end
    else begin // заметка добавляется без источника
      SetNoteShowMode(dm.Get_Ini_Int_Par('def_show_mode'));
      fdqnote['note_show_mode']:=dm.Get_Ini_Int_Par('def_show_mode');
    end;
    btok.Visible:=null2int(kw_id_)>0;
    //btok.Caption:=ml.GetLangValue('fmNoteEdit','btOkIntellectSaveAndCorr');
  end;
  //if fmmain.get_source_cr_type(source_id)=1 then begin
    //pndiapazon.Visible:=false;
  //end;

  if note_id>0 then
    caption:='Редактирование заметки ID='+inttostr(note_id)
  else
    caption:='Создание новой заметки';

  //lcbs.log('TfmNoteEdit.CreateWithData - конец');
  //application.ProcessMessages;
end;


procedure TfmNoteEdit.dbeNameChange(Sender: TObject);
begin
  real_update:=true;

end;

procedure TfmNoteEdit.dbgKeyWordColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds_.RecordCount>0 then
    Params.ImageIndex :=get_keyword_picture(ds_['kwcount']+ds_['kwscount']);


end;

procedure TfmNoteEdit.dbgLinksColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  corr_id_:longint;
begin
  if null2int(mteNoteLink['note1_id'])>0 then begin
    Params.ImageIndex :=display_service.get_note_picture(null2str(mteNoteLink['ntype']),null2int(mteNoteLink['srccount']));
  end;

end;

procedure TfmNoteEdit.dbgNoteDublColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  if null2int(mteNoteDubl['id'])<>0 then begin
    Params.ImageIndex :=display_service.get_note_picture(null2str(mteNoteDubl['ntype']),null2int(mteNoteDubl['srccount']));
  end;

end;

procedure TfmNoteEdit.dbgNoteDublDblClick(Sender: TObject);
var
  nn:integer;
begin
  nn:=mtenotedubl['id'];
  lcb.log(inttostr(nn));
  PostMessage(handle, WM_GOTO_NOTE, nn, 0);
end;

procedure TfmNoteEdit.dbgNoteSourceColumns0GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
var
  ds_:tDataSet;
begin
  ds_:=((sender as TDbgridColumnEh).Collection.Owner as TDbGridEh).DataSource.DataSet;
  if ds_.RecordCount>0 then
    Params.ImageIndex:=get_source_picture(null2int(ds_['is_mine']),null2int(ds_['source_type_id']))
  else
    Params.ImageIndex:=-1
end;

procedure TfmNoteEdit.dbmFastNoteChange(Sender: TObject);
begin
  real_update:=true;

end;

procedure TfmNoteEdit.dbmOriginalChange(Sender: TObject);
begin
  real_update:=true;

end;

procedure TfmNoteEdit.dbrNoteContentChange(Sender: TObject);
begin
  real_update:=true;

end;

procedure TfmNoteEdit.dbrNoteContentEnter(Sender: TObject);
begin
    //dbrNoteContent.ReadOnly := False;
    //dbrNoteContent.DefAttributes.Color := TStyleManager.ActiveStyle.GetSystemColor(clWindowText);
    //dbrNoteContent.Modified := False;
   RecoverDBRDefFontColorPrUp(dbrNoteContent,real_update);

end;

procedure TfmNoteEdit.dbrNoteContentExit(Sender: TObject);
begin
   RecoverDBRDefFontColorPrUp(dbrNoteContent,real_update);

end;

procedure TfmNoteEdit.dsNoteDataChange(Sender: TObject; Field: TField);
begin
  real_update:=true;

end;

procedure TfmNoteEdit.FormActivate(Sender: TObject);
begin
  if fdqNoteKeyword.Active then
    fdqNoteKeyword.Refresh;
  if fdqNoteStrucIt.Active then
    fdqNoteStrucIt.Refresh;
  if fdqNoteKeyword.Active then
    RefrNoteDouble;
end;

procedure TfmNoteEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if real_update or  (DBMode=dbInsert)  then begin
     if msgquestion('Сохранить заметку?') then
       btokClick(btSaveAndContinue);

  end;
  action:=cafree;
  fmNoteEdit:=nil;
end;

procedure TfmNoteEdit.FormCreate(Sender: TObject);
begin
  //tsDublicate.FontColor:=clYellow;
  //tsDublicate.BrushColor:=clRed;
  if self.DBMode=dbInsert then
     SendMessage(dbeName.Handle, WM_SETFOCUS, 0, 0);


  real_update:=false;
end;

procedure TfmNoteEdit.FormResize(Sender: TObject);
begin
  btok.Left:=round(width/3-btok.Width/2-10);
  btSaveAndContinue.Left:=round(2*width/3-btSaveAndContinue.Width/2-10);
  if btok.Left+btok.width>btSaveAndContinue.Left then begin
    btok.Left:=1;
    btSaveAndContinue.Left:=btok.Left+btok.width+3
  end;

end;

procedure TfmNoteEdit.gbsourceDblClick(Sender: TObject);
var
  res_:integer;
begin
  fmNoteViewMode:=tfmNoteViewMode.CreateWithData(fdqNote['note_show_mode'],source_id,fdqNote['id'],fmmain);
  res_:=fmNoteViewMode.ShowModal;
  if (res_=mrOk) or (res_=mrYes) then begin
    if not ((fdqnote.State=dsedit) or ( fdqnote.State=dsinsert)) then
      fdqNote.Edit;
    fdqNote['note_show_mode']:=fmNoteViewMode.get_set_mode;
    fmNoteViewMode.Free;
    SetNoteShowMode(fdqNote['note_show_mode']);
    if res_=mrYes then begin
      dm.sqlc.ExecSQL('update source set note_show_mode=:NSM where id=:SID',
                          [fdqNote['note_show_mode'],Source_id])
    end;
  end;

end;

procedure TfmNoteEdit.mnAttachAddClick(Sender: TObject);
var
  q:TFdQuery;
  id:longint;
begin
  if Opendialog.Execute then begin
     q := TFDQuery.Create(nil);
     q.Connection:=dm.sqlc;
     q.SQL.Text := 'INSERT INTO note_attach (filename, content,note_id, file_size) ' + ' VALUES (:fname,:blobdata,:NID, :FS);';
     q.Params[3].DataType := ftInteger;
     q.params[3].AsInteger := BFileSize(Opendialog.FileName);
     q.Params[0].DataType := ftString;
     q.params[0].AsString := ExtractFileName(Opendialog.FileName);
     q.Params[1].DataType := ftBlob;
     if DM.Get_Ini_Int_Par('FileStorePlace')=0 then
       q.Params[1].AsStream := Tfilestream.Create(Opendialog.FileName,fmopenread);
     q.Params[2].DataType := ftInteger;
     q.params[2].AsInteger := fdqNote['id'];
     q.ExecSQL();
     if DM.Get_Ini_Int_Par('FileStorePlace')=1 then begin
       id:=DM.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
       CopyFile(PWideChar(Opendialog.FileName),
                PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\NoteFile\'+inttostr(id)),
                false)
     end;


     q.Free;
     fdqNoteAttach.Refresh;
     fdqNoteAttach.Locate('filename',ExtractFileName(Opendialog.FileName));
  end;

end;

procedure TfmNoteEdit.mnAttachDelClick(Sender: TObject);
begin
  if msgquestion(format('Удалить файл [%s]?',[fdqNoteAttach['filename']])) then begin
    if DM.Get_Ini_Int_Par('FileStorePlace')=1 then begin
      DeleteFile(DM.Get_Ini_Str_Par('FileStoreDir')+'\NoteFile\'+inttostr(fdqNoteAttach['id']))
    end;
    fdqNoteAttach.Delete
  end;

end;

procedure TfmNoteEdit.mnAttachSaveClick(Sender: TObject);
var
  filename:string;
begin
  if fdqNoteAttach.RecordCount>0 then begin
    sdAttach.FileName:=fdqNoteAttach['filename'];
    if sdAttach.Execute then begin
       //msgok(savedialog.FileName)
        filename:=sdAttach.FileName;
        if fileexists(filename) then begin
          if msgquestion(format('Файл [%s] уже существует. Перезаписать?',[filename])) then begin
            DeleteFile(filename);
          end
          else
            abort
        end;
        saveAttachAsFile(filename);
        msgok(format('Файл [%s] успешно сохранен в каталоге [%s]!',[ExtractFileName(filename),ExtractFilePath(filename)]))
    end;
  end;

end;

procedure TfmNoteEdit.mnCopyBufClick(Sender: TObject);
begin
  Clipboard.AsText:=dbrNoteContent.SelText;

end;

procedure TfmNoteEdit.mnCreateNoteNewByLinkClick(Sender: TObject);
var
  ns_, nstoc_, old_note_id_, Source_id_:longint;
begin
  if msgquestion('Создать новую свою заметку, относящуюся к текущей?') then begin
    PostMessage(handle, WM_CREATE_LINK_NOTE, fdqNote['id'], 0);
    close;
  end;
end;

procedure TfmNoteEdit.mnEditClick(Sender: TObject);
var
  b,c,v:boolean;
  tc:TCustomDBRichEditEh;
begin
  //dbrNoteContent.EditButtons[0].Visible:=true;
  //
  //dbrNoteContent.EditButtons[0].Click(sender,b);
  tc:=TCustomDBRichEditEh(dbrNoteContent);
  b:=false; c:=false; v:=true;
  //tc.EditButtonDown(tc.FButtonsBox.BtnCtlList[0].EditButtonControl,b,c,v);
  tc.EditButtonClick(tc.FButtonsBox.BtnCtlList[0].EditButtonControl);
end;

procedure TfmNoteEdit.mnFileOpenClick(Sender: TObject);
var
  fn:string;
begin
  fn:=tmppath+fdqNoteAttach['filename'];
  saveAttachAsFile(fn);
  ShellExecute(0, nil, PChar(fn), nil,nil, SW_SHOWNORMAL);

end;

procedure TfmNoteEdit.mnGotoNoteClick(Sender: TObject);
var
  new_source_id_, nn_:longint;
  nn:integer;
begin
  nn:=mtenotelink['note2_id'];
  lcb.log(inttostr(nn));
  PostMessage(handle, WM_GOTO_NOTE, nn, 0);
end;

procedure TfmNoteEdit.mnGotoSourceClick(Sender: TObject);
var
  stid_:longint;
  is_mine:integer;
begin
  if fmSourceEdit<>nil then begin
     fmSourceEdit.Close;
     Application.ProcessMessages;
  end;
  stid_:=null2int(mteNoteSource['stoc_id']);
  is_mine:=dm.sqlc.ExecSQLScalar('select is_mine from source where id=:IID',[mteNoteSource['source_id']]);
  fmSourceEdit:=TfmSourceEdit.CreateWithData(mteNoteSource['source_id'],0,is_mine,DBEdit,fmmain);
  close;
  Application.ProcessMessages;
  fmSourceEdit.show;

end;

procedure TfmNoteEdit.mnGotoTagClick(Sender: TObject);
begin
  if fmKeyWordCommander<>nil then begin
     fmKeyWordCommander.Close;
     Application.ProcessMessages
  end;
  fmKeyWordCommander := TfmKeyWordCommander.Create(self,'',nil,fdqNoteKeyword['keyword_id']);
  fmKeyWordCommander.show;
  fmKeyWordCommander.BringToFront;

end;

procedure TfmNoteEdit.mnKWDelClick(Sender: TObject);
begin
  if fdqNoteKeyword.RecordCount>0 then begin
    if msgquestion(format('Удалить ключевое слово [%s] для текущей заметки?',[fdqNoteKeyword['kword']])) then begin
      dm.sqlc.ExecSQL('delete from note_keyword where id=:NKID ',[fdqNoteKeyword['id']]);
      fdqNoteKeyword.Refresh;
    end;
  end;

end;

procedure TfmNoteEdit.mnNoteLinkAddClick(Sender: TObject);
var
  mr:integer;
begin
  fmNoteLinkAdd:=TfmNoteLinkAdd.CreateWithAlias(nil,'fmNoteLinkAdd');
  fmNoteLinkAdd.Caption:=format('Создание связи с заметкой [%s]',[fdqNote['name']]);
  fmNoteLinkAdd.source_id:=source_id;
  fmNoteLinkAdd.srcnotename:=fdqNote['Name'];
  fmNoteLinkAdd.note_id:=fdqNote['id'];
  mr:=fmNoteLinkAdd.ShowModal;
  if mr=mrok then begin
    fdqNoteLink.Refresh;
    mteNoteLink.Refresh;
    fmmain.NoteListNeedRefresh:=true;
  end;


end;

procedure TfmNoteEdit.mnNoteLinkDelClick(Sender: TObject);
var
  sql_:string;
  clt_:longint;
begin
 if msgquestion(format('Удалить связь [%s] с заметкой [%s]?',
                          [mteNoteLink['link_type_name'], mteNoteLink['note2_name']])) then begin
   dm.sqlc.ExecSQL('delete from note_link where id='+inttostr(mteNoteLink['id']));
   //fdqLinkType.Locate('id',mteNoteLink['link_type'],[]);
   clt_:=null2int(dm.sqlc.ExecSQLScalar('select corr_link_type from link_type where id=:III',[mteNoteLink['link_type']]));
   if clt_>0 then begin
     sql_:='delete from note_link where link_type='+inttostr(clt_);
     sql_:=sql_+ ' and note1_id='+inttostr(fdqNoteLink['note2_id']);
     sql_:=sql_+' and note2_id='+inttostr(fdqNoteLink['note1_id']);
     dm.sqlc.ExecSQL(sql_);
   end;
   fdqNoteLink.Refresh;
   mteNoteLink.Refresh;
   fmmain.NoteListNeedRefresh:=true;


 end;

end;

procedure TfmNoteEdit.mnNoteSourceAddClick(Sender: TObject);
begin
  fdqNoteSource.Close;
  fdqNoteSource.Params.ParamValues['NID']:=note_id;
  fdqNoteSource.open;
  fdqNoteSource.Insert;
  fmNoteSource:=TfmNoteSource.CreateWithData(0,fdqNote['id'],0,0,dbInsert,fmmain);
  fmNoteSource.Caption:=format('Назначение источника на заметку %s',[fdqNote['name']]);
  fmNoteSource.ShowModal;
  fdqNoteSource.Refresh;
  mteNoteSource.Refresh

end;

procedure TfmNoteEdit.mnNoteSourceDelClick(Sender: TObject);
var
  sql_:string;
begin
 if fdqNoteSource.RecordCount>0 then begin
   if msgquestion(format('Удалить назначение заметки [%s] на источник/проект [%s]?',
                            [fdqNote['name'], mteNoteSource['sourcename']])) then begin
     dm.sqlc.ExecSQL('delete from note_source where id='+inttostr(mteNoteSource['id']));
     fdqNoteSource.Refresh;
     mteNoteSource.Refresh;
   end;
 end;

end;

procedure TfmNoteEdit.mnNoteSourceEditClick(Sender: TObject);
begin
  fmNoteSource:=TfmNoteSource.CreateWithData(mtenotesource['id'],0,0,0,dbEdit,fmmain);
  fmNoteSource.Caption:=format('Назначение источника на заметку %s',[fdqNote['name']]);
  fmNoteSource.ShowModal;
  fdqNoteSource.Refresh;
  mteNoteSource.Refresh
end;

procedure TfmNoteEdit.mnPasteBufClick(Sender: TObject);
begin
  dbrNoteContent.PasteFromClipboard

end;

procedure TfmNoteEdit.mnStrItAddClick(Sender: TObject);
var
  id_: longint;
  nn:string;
begin
  fmNoteType:=TfmNoteType.CreateData(fdqNote['id'],fdqNoteStrucIt,dbgStrucItem,fmmain);
  fmNoteType.Caption:=format('Добавление типа заметки [%s]',[fdqNote['name']]);
  fmNoteType.ShowModal;

end;

procedure TfmNoteEdit.mnStrItDelClick(Sender: TObject);
begin
  if fdqNoteStrucIt.RecordCount>0 then begin
    if msgquestion(format('Удалить тип заметок [%s]?',[fdqNoteStrucIt['si_name']])) then begin
      dm.sqlc.ExecSQL('delete from note_structure_item where id=:SS',[fdqNoteStrucIt['id']]);
      fdqNoteStrucIt.Refresh;
    end;
  end;

end;

procedure TfmNoteEdit.mnToRtfClick(Sender: TObject);
var
  //Stream : TStringStream;
  txt:string;
  fname:string;
begin
  dbrNoteContent.PlainText:=False;
  fname:=tmppath+'\note_'+inttostr(note_id)+'.rtf';
  try
    //dbrNoteContent.Lines.SaveToFile(fname);
    String2TextFile(RemoveColor(fdqNote['Content'],TStyleManager.ActiveStyle.GetSystemColor(clWindowText)),fname);
    ShellExecute(0, nil, PChar(fname), nil, nil, SW_SHOWNORMAL);
  except
    msgerror(Format('Файл [%s] уже открыт в сторонной программе. Закройте стороннюю программу и попробуйте еще раз!',[fname]))
  end;

end;

procedure TfmNoteEdit.mnUrlAddClick(Sender: TObject);
var InpStr: String;
begin
  if inputstr('Ввод данных','Укажите новый URL:',InpStr) then begin
    if dm.check_url(InpStr) then begin
      fdqNoteurl.Insert;
      fdqNoteurl['url']:=InpStr;
      fdqNoteurl['note_id']:=self.note_id;
      fdqNoteurl.post;
    end;
  end;

end;

procedure TfmNoteEdit.mnurldelClick(Sender: TObject);
begin
  if fdqNoteUrl.RecordCount>0 then
    if msgquestion(Format('Удалить URL [%s]?',[fdqNoteUrl['url']])) then
       fdqNoteUrl.Delete
end;

procedure TfmNoteEdit.mnurleditClick(Sender: TObject);
var is_:string;
begin
  if fdqNoteUrl.RecordCount>0 then begin
    is_:=fdqNoteurl['url'];
    if inputstr('Редактирование данных','Укажите URL:',is_) then begin
      if dm.check_url(is_,0,self.note_id) then begin
        fdqNoteUrl.edit;
        fdqNoteUrl['url']:=is_;
        fdqNoteUrl.post;
      end;
    end;
  end;

end;

procedure TfmNoteEdit.mnUrlGoClick(Sender: TObject);
var
  u_:string;
begin
  if fdqNoteUrl.RecordCount>0 then begin
    u_:=fdqNoteurl['url'];
    ShellExecute(Application.Handle,PChar('open'),PChar(u_), PChar(0), nil, SW_NORMAL);
  end;
end;

procedure TfmNoteEdit.pmKWAddClick(Sender: TObject);
var
  id_,name_id_: longint;
  nn:string;
begin
     if getKeyword(id_,name_id_,self,'Назначение ключевого слова на заметку ['+fdqNote['name']+']',
       'Выберете ключевое слово:','Закрепить тэг за заметкой',
       ' select * from (Select %s as name, kwn.id kw_name_id, k.id kw_id from keyword_name kwn, keyword k '+
       ' where k.id=kwn.keyword_id and k.id not in '+
       ' (select keyword_id from note_keyword where note_id='+inttostr(fdqNote['id'])+')) order by ru_lower(name)',
       true,
       'Введите новое ключевое слово:','Закрепить новый тзг за заметкой'
       )
     then begin
       dm.sqlc.ExecSQL('insert into note_keyword (note_id, keyword_id, keyword_name_id) values(:NN,:KK,:NKW)',
                       [fdqNote['id'],id_,name_id_]);
      fdqNoteKeyword.Refresh;
      RefrNoteDouble
     end;

end;

{procedure TfmNoteEdit.pcMainDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  AText: string;
  APoint: TPoint;
  W,H:integer;
  i, index, rindex:integer;
begin
  //lcbs.log('tabindex='+inttostr(tabindex));
  index:=tabindex; rindex:=0;
  for i:=0 to (Control as TPageControl).PageCount-1 do begin // первая вкладка нужна всегда
    //if i then
    if not (Control as TPageControl).Pages[i].TabVisible then
       inc(index);
    if i>=index then break;

  end;
  //lcbs.log('index='+inttostr(index));
  with (Control as TPageControl), Canvas do
  begin
      //Brush.Color := rgb(255,255,221);
        font.color:=TTabsheet(Pages[index]).Fontcolor;
        Brush.Color:=TTabsheet(Pages[index]).Brushcolor;
//        font.color:=clgreen;

      //font.color:=clgreen;
      //font.Style:=[fsBold];
    FillRect(Rect);
    AText := (Control as TPageControl).Pages[Index].Caption+'   ';
    h:=rect.bottom-rect.top;
    w:=rect.right-rect.left;
    APoint.x := W div 2 - TextWidth(AText) div 2+5;
    APoint.y := H div 2 - TextHeight(AText) div 2;
    TextRect(Rect, Rect.Left + APoint.x, Rect.Top + APoint.y, AText);
  end;

end;                                     }

procedure TfmNoteEdit.SetNoteShowMode(note_show_mode:integer);
begin
  case note_show_mode of
    0:begin
         pntop.Visible:=false;
         gbsource.Visible:=false;
      end;
    1:begin
         pntop.Visible:=true;
         gbsource.Visible:=false;
      end;
    2:begin
         pntop.Visible:=false;
         gbsource.Visible:=true;
      end;
    3:begin
         pntop.Visible:=true;
         gbsource.Visible:=true;
      end;
  end;
end;



procedure TfmNoteEdit.tsGenShow(Sender: TObject);
begin
   RecoverDBRDefFontColorPrUp(dbrNoteContent,real_update);
end;

procedure TfmNoteEdit.RefrNoteDouble;
begin
  mteNoteDubl.Close;
  fdqNoteDubl.Close;
  fdqNoteDubl.Params.ParamValues['NNN']:=fdqnote['id'];
  fdqNoteDubl.Open();
  mteNoteDubl.Open();
  tsDublicate.TabVisible:=fdqNoteDubl.RecordCount>0
end;

procedure TfmNoteEdit.sbNoteCopyClick(Sender: TObject);
var
  new_note_id_:longint;
begin
  if msgquestion(Format('Скопировать заметку [%s]?',[fdqnote['name']])) then begin
    fmmain.NoteListNeedRefresh:=true;
    dm.sqlc.ExecSQL('insert into note (subpart_id,name,original_text,content,content_plain,date_time_create,fast_text,note_show_mode,splitter_param,h_splitter_param) '+
                        ' select subpart_id,name||'' копия '',original_text,content,content_plain,datetime(''now''),fast_text,note_show_mode,splitter_param,h_splitter_param from note where id=:IDD',[note_id]);
    new_note_id_:=dm.sqlc.ExecSQLScalar('SELECT last_insert_rowid()');
    dm.sqlc.ExecSQL('insert into note_source (note_id, source_id,stoc_id,Page_from) select :NEWN, source_id, stoc_id, Page_from from note_source where note_id=:OLDN',[new_note_id_,note_id]);
    dm.sqlc.ExecSQL('insert into note_keyword (note_id, keyword_id, keyword_name_id) select :NEWN, keyword_id, keyword_name_id from note_keyword where note_id=:OLDN',[new_note_id_,note_id]);
    dm.sqlc.ExecSQL('insert into note_structure_item (note_id, structure_item_id) select :NEWN, structure_item_id from note_structure_item where note_id=:OLDN',[new_note_id_,note_id]);

    PostMessage(handle, WM_GOTO_NOTE, new_note_id_, 0);
  end;


end;

procedure TfmNoteEdit.sbNoteDelClick(Sender: TObject);
begin
  if msgquestion(format('Удалить заметку [%s]?',[fdqnote['name']])) then begin
    fmmain.NoteListNeedRefresh:=true;
    if (fdqNoteLink.RecordCount>0) or (fdqNoteKeyword.RecordCount>0) then begin
      if not msgquestion(format('К заметке [%s] есть ключевые слова или связанные заметки. Все равно удалять?',[fdqnote['name']])) then
        exit;
    end;
    if null2str(fdqNote['telegram_message_id'])<>'' then
      dm.sqlc.ExecSQL('update telegram_fast_note set status=0 where telegram_message_id=:TMI',[fdqNote['telegram_message_id']]);

    dm.sqlc.ExecSQL('delete from note_attach where note_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note_keyword where note_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note_link where note1_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note_link where note2_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note_source where note_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note_structure_item where note_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note_url where note_id=:NN',[note_id]);
    dm.sqlc.ExecSQL('delete from note where id=:NN',[note_id]);
    close;
  end;

end;

procedure TfmNoteEdit.saveAttachAsFile(fname:string);
var
  q:TFdQuery;
  ms:TMemoryStream;
begin
     q := TFDQuery.Create(nil);
     q.Connection:=dm.sqlc;
     q.SQL.Text := 'select * from note_attach where id='+inttostr(fdqNoteAttach['id']);
     q.open;
     if DM.Get_Ini_Int_Par('FileStorePlace')=0 then begin
       ms:=TMemoryStream.Create;
       TBlobField(q.FieldByName('content')).SaveToStream(ms);
       ms.Seek(0, soFromBeginning);
       ms.SaveToFile(fname);
       ms.Free;
     end
     else begin
       CopyFile(PWideChar(DM.Get_Ini_Str_Par('FileStoreDir')+'\NoteFile\'+inttostr(fdqNoteAttach['id'])),
                PWideChar(fname),false);
     end;
     q.Free;
end;


initialization
  TCustomStyleEngine.RegisterStyleHook(TCustomTabControl, TTabColorControlStyleHook);


end.
