unit AliasForm;

interface

uses
  Vcl.Forms, System.Classes, Vcl.ExtCtrls, Winapi.Messages, ComCtrls, Vcl.Graphics, dbctrlseh,
  Vcl.StdCtrls,vcl.menus,
  richedit;

const
  par_form_max='_Maximized';
  par_form_top='_Top';
  par_form_left='_Left';
  par_form_height='_Height';
  par_form_Width='_Width';


type
  TAliasParamForm=class(TForm)
  private
    procedure FormWinChangeState(var Msg: TMessage); message WM_SYSCOMMAND;
    procedure handle_menu_item(MI:TMenuItem);
  public
     alias:string;
     constructor CreateWithAlias(AOwner: TComponent; alias_:string);
     destructor Destroy; override;
     constructor Create(AOwner: TComponent);override;
     procedure RestoreFormParams(ignore_maximized_:boolean=false);
     procedure SaveFormParams();
     procedure PopupMeasureItem(Sender: TObject; ACanvas: TCanvas;   var Width,   Height: Integer);
     procedure scale_menu;
     procedure scale_form;

  end;

  TForm=class(TAliasParamForm);


implementation

uses vcl.themes, Winapi.Windows, LCB_unit,
     sysutils, extend_diskutil, System.IOUtils, data_service,  Vcl.Styles, firedac.comp.client,
     fmKeyWordCommanderUnit, fmNoteEditUnit, fmSourceEditUnit, shellapi, fmmainunit,
     data.db, dmDataUnit, extend_data, extend_dialog;

constructor TAliasParamForm.CreateWithAlias(AOwner: TComponent; alias_:string);
begin
  create(AOwner);
  alias:=alias_;
  scale_form;
  RestoreFormParams();
  scale_menu;
end;

procedure TAliasParamForm.scale_form;
var
  scale, i:integer;
begin
  scale:=dm.Get_Ini_Int_Par('ScaleBy',100);
  if scale<>100 then begin
    self.ScaleBy(scale,100);
  end;
  for i := 0 to ComponentCount - 1 do begin
        if (Components[i] is TDbRichEditEh)  then begin
          (Components[i] as TDbRichEditEh).ParentFont:=true;
          (Components[i] as TDbRichEditEh).ParentColor:=true;
        end;

  end;

end;
procedure TAliasParamForm.handle_menu_item(MI:TMenuItem);
var
  i:integer;
begin
  for i := 0 to Mi.Count - 1 do begin
     Mi.Items[i].OnMeasureItem := PopupMeasureItem;
     handle_menu_item(Mi.Items[i]);
  end;

end;

procedure TAliasParamForm.scale_menu;
var
  scale, i, j, k, l:integer;
  mm,kk:TMenuItem;
  pp:TPopupMenu;
begin
  scale:=dm.Get_Ini_Int_Par('ScaleBy',100);
  if scale<>100 then begin
    Screen.MenuFont.Size:=round(9*(scale/100));
    for i := 0 to ComponentCount - 1 do begin
        if (Components[i] is TPopupMenu)  then
        begin
          pp:=(Components[i] as TPopupMenu);
          pp.ownerdraw:=true;
          for j := 0 to pp.Items.Count - 1 do begin
            pp.Items[j].OnMeasureItem := PopupMeasureItem;
            mm:=pp.Items[j];
            for k:=0 to pp.Items[j].Count-1 do
              mm.Items[k].OnMeasureItem:= PopupMeasureItem;
          end;
        end;
        if (Components[i] is TMainMenu)  then
        begin
          (Components[i] as TMainMenu).ownerdraw:=true;
          for j := 0 to (Components[i] as TMainMenu).Items.Count - 1 do begin
            handle_menu_item((Components[i] as TMainMenu).Items[j])
          end;
        end;
    end;
  end;

end;


destructor TAliasParamForm.Destroy;
begin
  if alias<>'' then
    SaveFormParams();
  inherited
end;

procedure TAliasParamForm.FormWinChangeState(var Msg: TMessage);
begin
  if self.parent=nil then begin
    inherited;
  end
  else begin
    if (Msg.wParam = SC_MAXIMIZE) then begin
      SaveFormParams();
    end;
    if (Msg.wParam = SC_RESTORE) then begin
      RestoreFormParams(true);
    end;
  end;
end;

constructor TAliasParamForm.Create(AOwner: TComponent);
begin
  alias:='';
  inherited create(aowner)
end;


procedure TAliasParamForm.RestoreFormParams(ignore_maximized_:boolean=false);
var
  th, fh, fw, ft, fl, fm :integer;
  scale:integer;
begin
  scale:=dm.Get_Ini_Int_Par('ScaleBy',100);
  fm:=dm.Get_Ini_Int_Par(alias+par_form_max);
  if (fm=1) and not ignore_maximized_ then
    self.WindowState:= wsMaximized
  else begin
    if self.borderstyle<>bsToolWindow  then begin
      fh:=round(dm.Get_Ini_Int_Par(alias+par_form_height)*(scale/100));
      if fh>0 then
        self.Height:=fh;

      fw:=round(dm.Get_Ini_Int_Par(alias+par_form_width)*(scale/100));
      if fw>0 then
        self.width:=fw;

      lcb.log('RestoreFormParams h='+inttostr(fh)+' w='+inttostr(fw));
    end;

    ft:=dm.Get_Ini_Int_Par(alias+par_form_top);
    if ft>0 then
      self.top:=round(ft*(scale/100));

    fl:=dm.Get_Ini_Int_Par(alias+par_form_left);
    if fl>0 then
      self.left:=round(fl*(scale/100));
  end;

end;

procedure TAliasParamForm.SaveFormParams();
var
  scale, h, w:integer;
begin
  scale:=dm.Get_Ini_Int_Par('ScaleBy',100);
  if self.WindowState = wsMaximized then
    dm.Set_Ini_Int_Par(alias+par_form_max,1)
  else begin
    dm.Set_Ini_Int_Par(alias+par_form_max,0);
    h:=round(self.Height*(100/scale));
    w:=round(self.Width*(100/scale));
    lcb.log('SaveFormParams h='+inttostr(h)+' w='+inttostr(w));
    dm.Set_Ini_Int_Par(alias+par_form_height,h);
    dm.Set_Ini_Int_Par(alias+par_form_width,w);
    dm.Set_Ini_Int_Par(alias+par_form_top,round(self.top*(100/scale)));
    dm.Set_Ini_Int_Par(alias+par_form_left,round(self.left*(100/scale)));
  end;
end;

procedure TAliasParamForm.PopupMeasureItem(Sender: TObject; ACanvas: TCanvas;
  var Width,   Height: Integer);
begin
  Height := ACanvas.TextHeight('.') + 2;
end;




begin
end.
