unit display_service;

interface

uses
  Vcl.Forms, System.Classes, Vcl.ExtCtrls, Winapi.Messages, ComCtrls, Vcl.Graphics, dbctrlseh,
  Vcl.StdCtrls,
  richedit;

const
  par_sort='_sort';
  par_search='_searh';
  par_filter='_filter';

  source_proj:array[0..1,1..8] of string=(('источников','источника','источники','источник','источникам','источнику','источником','source'),
                                          ('моих проектов','моего проекта','мои проекты','мой проект','моим проектам','моему проекту','моим проектом','project'));



  {********** P. Below's TTabsheet mod to add Color property ****}
  {TColorTabSheet = class(ComCtrls.TTabSheet)
  private
    PFontColor: TColor;
    PBrushColor: TColor;
    procedure SetFontColor(Value: TColor);
    procedure SetBrushColor(Value: TColor);
    //procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); message WM_ERASEBKGND;
  public
    constructor Create(aOwner: TComponent); override;
    property FontColor: TColor read PFontColor write SetFontColor;
    property BrushColor: TColor read PBrushColor write SetBrushColor;
  end;}
 {***************************************************************}



procedure LoadVCLStyles;
procedure RecoverDBRDefFontColorPrUp(dbr_:TCustomRichEdit;var real_update:boolean);
procedure RecoverDBRDefFontColor(dbr_:TCustomRichEdit);
function get_note_picture(ntype_:string; nscnt_:integer):integer;
function get_new_note_picture(attach_cnt_,url_cnt_,link_cnt_:integer):integer;
function get_keyword_picture(cnt_:integer):integer;
function get_source_picture(is_mine_:integer; source_type_:integer):integer;

function GetStocDefDel(source_id_, stoc_id_:longint; tag_:integer):longint;
procedure NoteEdit(note_id_:longint);

function GetDefSourceClass:longint;




implementation

uses vcl.themes, Winapi.Windows, lcb_unit, fmSourceListUnit,
     sysutils, extend_diskutil, System.IOUtils, data_service,  Vcl.Styles, firedac.comp.client,
     fmKeyWordCommanderUnit, fmNoteEditUnit, fmSourceEditUnit, shellapi, fmmainunit,
     data.db, dmDataUnit, extend_data, extend_dialog;

procedure LoadVCLStyles;
var
  f, s : string;
  i:integer;
begin
    s:=tmppath+'Styles';
    i:=0;
    for f in TDirectory.GetFiles(s, '*.vsf') do
     try
       if TStyleManager.IsValidStyle(f) then begin
        TStyleManager.LoadFromFile(f);
       end;
     except
     end;
end;

function get_new_note_picture(attach_cnt_,url_cnt_,link_cnt_:integer):integer;
begin
  result:=12;
  if (attach_cnt_>0) and (url_cnt_=0) and (link_cnt_=0) then
    result:=56;
  if (attach_cnt_=0) and (url_cnt_>0) and (link_cnt_=0) then
    result:=57;
  if (attach_cnt_=0) and (url_cnt_=0) and (link_cnt_>0) then
    result:=58;
  if (attach_cnt_>0) and (url_cnt_>0) and (link_cnt_=0) then
    result:=52;
  if (attach_cnt_>0) and (url_cnt_>0) and (link_cnt_>0) then
    result:=53;
  if (attach_cnt_>0) and (url_cnt_=0) and (link_cnt_>0) then
    result:=54;
  if (attach_cnt_=0) and (url_cnt_>0) and (link_cnt_>0) then
    result:=55;

end;

function get_note_picture(ntype_:string; nscnt_:integer):integer;
begin
    if ntype_='' then
      Result := 24
    else if (pos('0',ntype_)>0) and (pos('1',ntype_)>0) then
      Result := 25
    else if (pos('0',ntype_)>0) then
      Result := 2
    else if nscnt_>1 then
      Result := 40
    else
      Result := 28

end;



function get_keyword_picture(cnt_:integer):integer;
begin
      if cnt_=0 then
          Result:=17
      else if cnt_ =1 then
        Result:=14
      else if cnt_=2 then
        Result:=13
      else
        Result:=20

end;

function GetStocDefdel(source_id_, stoc_id_:longint; tag_:integer):longint;
begin
  Result:=dm.Get_Ini_Int_Par('SourceTOCNavigation_'+inttostr(source_id_)+'_'+inttostr(stoc_id_)+'_'+inttostr(tag_),1);
  //Result:=null2int(fmmain.sqlc.ExecSQLScalar('select def_stoc_id from source_toc_navigation where source_id=:SID and stoc_id=:STID and tag=:TT',[source_id_, stoc_id_, tag_]));
end;


function get_source_picture(is_mine_:integer; source_type_:integer):integer;
begin
    if is_mine_=1 then
      Result := 28 //12
    else begin
      case source_type_ of
      1: Result:= 2; // книга
      2: Result:= 4; // видео
      4: Result:=6; // WWW
      5: Result:= 10;// публикация
      6: Result:= 7 ;  // Telegram
      7: Result:= 11;  // email
      8: Result:= 23; // статья
      9: Result:= 29;  // беседа
      10: Result:= 30; // лекция
      11: Result:= 39; // рецензия
      else
        Result := 5;
      end;
      if source_type_>1000 then
          Result := 40;
      if source_type_=0 then
          Result := -1;
    end;

end;



{**********************************************************************}
{**** Impoalment modified TTabsheet to include "Color" property ****}
{**********************************************************************}

{constructor TColorTabSheet.Create(aOwner: TComponent);
begin
  inherited;
  FontColor := clWindowText;
  BrushColor := clBtnFace;
end;

procedure TColorTabSheet.SetFontColor(Value: TColor);
begin
  if FontColor <> Value then
  begin
    PFontColor := Value;
    Invalidate;
  end;
end;

procedure TColorTabSheet.SetBrushColor(Value: TColor);
begin
  if BrushColor <> Value then
  begin
    PBrushColor := Value;
    Invalidate;
  end;
end;}


procedure RecoverDBRDefFontColorPrUp(dbr_:TCustomRichEdit;var real_update:boolean);
var
  ru_:boolean;
begin
  ru_:=real_update;
  RecoverDBRDefFontColor(dbr_);
  real_update:=ru_;
end;

procedure RecoverDBRDefFontColor(dbr_:TCustomRichEdit);
begin
  try
    dbr_.DefAttributes.Color := TStyleManager.ActiveStyle.GetSystemColor(clWindowText);
    //Application.ProcessMessages;
  except

  end;
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


function GetDefSourceClass:longint;
begin
  if fmSourceList<>nil then begin
    result:=fmSourceList.GetCurClass
  end
  else
    result:=0;
end;



begin
end.
