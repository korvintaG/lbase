unit fmFilterUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  dmDataUnit,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfmFilter = class(TForm)
    dbgAuthors: TDBGridEh;
    pnTop: TPanel;
    btShare: TButton;
    pmFilter: TPopupMenu;
    mnAdd: TMenuItem;
    mdDel: TMenuItem;
    mnEdit: TMenuItem;
    fdqFilter: TFDQuery;
    fdqFilterid: TFDAutoIncField;
    fdqFiltername: TWideMemoField;
    fdqFilterarea_type: TIntegerField;
    fdqFilteruse_type: TIntegerField;
    fdqFilterdate_time_create: TDateTimeField;
    fdqFilteris_active: TIntegerField;
    dsFilter: TDataSource;
    sdAttach: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgAuthorsDblClick(Sender: TObject);
    procedure btShareClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFilter: TfmFilter;

implementation

{$R *.dfm}

uses fmFilterEditUnit, extend_dialog, extend_diskutil;

procedure TfmFilter.btShareClick(Sender: TObject);
var
  filename:string;
  sqls_:string;
  f: tStringList;
  List: TStringList;
  fdq_:TFdquery;
  i:integer;
begin
    if dm.to_filter then begin
      if msgquestion('Создать новую базу данных на основании уже открытой с учетом указанных фильтров?') then begin
        sdAttach.FileName:='share.db';
        sdAttach.DefaultExt:='db';
        if sdAttach.Execute then begin
           //msgok(savedialog.FileName)
            filename:=sdAttach.FileName;
            if fileexists(filename) then begin
              if msgquestion(format('Файл %s уже существует. Перезаписать?',[filename])) then begin
                DeleteFile(filename);
              end
              else
                abort
            end;

            copyfile(PWideChar(DM.sqlc.Params.Database),PWideChar(filename),true);
            dm.sqlcshare.Params.Database:=filename;
            dm.sqlcshare.connected:=true;

            sqls_:= GetStrFromAppResource('cut_db_filter_source_project'); dm.sqlcshare.ExecSQL(sqls_);
            sqls_:= GetStrFromAppResource('clear_tmp_filter'); dm.sqlcshare.ExecSQL(sqls_);
            sqls_:= GetStrFromAppResource('clear_service_info'); dm.sqlcshare.ExecSQL(sqls_);


            dm.sqlcshare.Commit;
            dm.sqlcshare.ExecSQL('VACUUM;');
            dm.sqlcshare.connected:=false;
            Application.ProcessMessages;

            msgok(format('Файл [%s] успешно сохранен в каталоге [%s]!',
              [ExtractFileName(filename),ExtractFilePath(filename)]));
        end;
      end;
    end;


end;

procedure TfmFilter.dbgAuthorsDblClick(Sender: TObject);
var
  str_:string;
begin
  if fmFilterEdit<>nil then begin
    fmFilterEdit.Close;
    Application.ProcessMessages
  end;
  fmFilterEdit:=TfmFilterEdit.Create(self);
  fmFilterEdit.Show;

end;

procedure TfmFilter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmFilter:=nil;
end;

procedure TfmFilter.FormCreate(Sender: TObject);
begin
  fdqFilter.Open();
end;

end.
