unit AliasForm;

interface

uses
  Vcl.Forms, System.Classes, Vcl.ExtCtrls, Winapi.Messages, ComCtrls, Vcl.Graphics, dbctrlseh,
  Vcl.StdCtrls,
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
  public
     alias:string;
     constructor CreateWithAlias(AOwner: TComponent; alias_:string);
     destructor Destroy; override;
     constructor Create(AOwner: TComponent);override;
     procedure RestoreFormParams(ignore_maximized_:boolean=false);
     procedure SaveFormParams();
  end;

  TForm=class(TAliasParamForm);


implementation

uses vcl.themes, Winapi.Windows,
     sysutils, extend_diskutil, System.IOUtils, data_service,  Vcl.Styles, firedac.comp.client,
     fmKeyWordCommanderUnit, fmNoteEditUnit, fmSourceEditUnit, shellapi, fmmainunit,
     data.db, dmDataUnit, extend_data, extend_dialog;

constructor TAliasParamForm.CreateWithAlias(AOwner: TComponent; alias_:string);
begin
  create(AOwner);
  alias:=alias_;
  RestoreFormParams();
end;

destructor TAliasParamForm.Destroy;
begin
  if alias<>'' then
    SaveFormParams();
  inherited
end;

procedure TAliasParamForm.FormWinChangeState(var Msg: TMessage);
begin
  if (Msg.wParam = SC_MAXIMIZE) then begin
    SaveFormParams();
  end;
    inherited;

  if (Msg.wParam = SC_RESTORE) then begin
    RestoreFormParams(true);
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
begin
  fm:=dm.Get_Ini_Int_Par(alias+par_form_max);
  if (fm=1) and not ignore_maximized_ then
    self.WindowState:= wsMaximized
  else begin
    fh:=dm.Get_Ini_Int_Par(alias+par_form_height);
    if fh>0 then
      self.Height:=fh;

    fw:=dm.Get_Ini_Int_Par(alias+par_form_width);
    if fw>0 then
      self.width:=fw;

    ft:=dm.Get_Ini_Int_Par(alias+par_form_top);
    if ft>0 then
      self.top:=ft;

    fl:=dm.Get_Ini_Int_Par(alias+par_form_left);
    if fl>0 then
      self.left:=fl;
  end;
end;

procedure TAliasParamForm.SaveFormParams();
begin
  if self.WindowState = wsMaximized then
    dm.Set_Ini_Int_Par(alias+par_form_max,1)
  else begin
    dm.Set_Ini_Int_Par(alias+par_form_max,0);
    dm.Set_Ini_Int_Par(alias+par_form_height,self.Height);
    dm.Set_Ini_Int_Par(alias+par_form_width,self.Width);
    dm.Set_Ini_Int_Par(alias+par_form_top,self.top);
    dm.Set_Ini_Int_Par(alias+par_form_left,self.left);
  end;
end;



begin
end.
