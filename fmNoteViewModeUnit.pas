unit fmNoteViewModeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmNoteViewMode = class(TForm)
    pnFast: TPanel;
    cbShowFastNode: TCheckBox;
    pnBottom: TPanel;
    btSaveNote: TButton;
    btSavetNoteAnd: TButton;
    pnRight: TPanel;
    cbOriginal: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateWithData(cur_mode_:integer;Source_id_, note_id_:longint; AOwner: TComponent);
    function get_set_mode:integer;
  end;

var
  fmNoteViewMode: TfmNoteViewMode;

implementation

{$R *.dfm}

uses dmdataunit;

function TfmNoteViewMode.get_set_mode:integer;
begin
  if cbShowFastNode.Checked and cbOriginal.Checked then
     Result:=3
  else if cbShowFastNode.Checked and not cbOriginal.Checked then
     Result:=1
  else if not cbShowFastNode.Checked and not cbOriginal.Checked then
     Result:=0
  else
     Result:=2
end;


constructor TfmNoteViewMode.CreateWithData(cur_mode_:integer;Source_id_,note_id_:longint; AOwner: TComponent);
begin
  Create(AOwner);
  if cur_mode_=0 then begin
    cbShowFastNode.Checked:=false;
    cbOriginal.Checked:=false;
  end
  else if cur_mode_=1 then begin
    cbShowFastNode.Checked:=true;
    cbOriginal.Checked:=false;
  end
  else if cur_mode_=2 then begin
    cbShowFastNode.Checked:=false;
    cbOriginal.Checked:=true;
  end
  else begin
    cbShowFastNode.Checked:=true;
    cbOriginal.Checked:=true;
  end;
  //if fmmain.sqlc.ExecSQLScalar('select count(*) from note_source where note_id=:NN',[note_id_])=1 then begin
  if Source_id_>0 then begin
    if dm.sqlc.ExecSQLScalar('select is_mine from source where id=:NN ',[Source_id_])=0 then
      btSavetNoteAnd.Caption:='Установить для заметки и для всего источника'
    else
      btSavetNoteAnd.Caption:='Установить для заметки и для всего проекта'
  end
  else
    btSavetNoteAnd.Visible:=false;



end;

end.
