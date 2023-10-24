unit fmSetDBUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmSetDB = class(TForm)
    lbTitle: TLabel;
    btOpen: TButton;
    btCreate: TButton;
    pnOpenLast: TPanel;
    lbLastDBFileName: TLabel;
    btOpenLast: TButton;
    cbAutoOpen: TCheckBox;
    btExit: TButton;
    btCreateDemo: TButton;
    opendialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure btCreateClick(Sender: TObject);
    procedure btOpenClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure btCreateDemoClick(Sender: TObject);
    procedure btOpenLastClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    LastDbFileName:String;
    filename:string;
    SetModalResult:integer;
  end;

var
  fmSetDB: TfmSetDB;

implementation
uses extend_dialog, extend_ini, extend_diskutil;

{$R *.dfm}

procedure TfmSetDB.btCreateClick(Sender: TObject);
begin
 savedialog.FileName:='';
 if savedialog.Execute then begin
    filename:=savedialog.FileName;
    if fileexists(filename) then begin
      if msgquestion(format('Файл [%s] уже существует. Перезаписать?',[filename])) then begin
        DeleteFile(filename);
      end
      else
        abort

    end;

    extend_ini.SetStringValue('DB','LastFileName',filename);
    self.ModalResult:=mrRetry;
 end;

end;

procedure TfmSetDB.btCreateDemoClick(Sender: TObject);
var
  Stream: TResourceStream;
begin
 savedialog.FileName:='demo';
 if savedialog.Execute then begin
    filename:=savedialog.FileName;
    if fileexists(filename) then begin
      if msgquestion(format('Файл [%s] уже существует. Перезаписать?',[filename])) then begin
        DeleteFile(filename);
      end
      else
        abort

    end;
    extend_diskutil.ExtractFileFromAppResource('demo_db',filename);
    self.ModalResult:=mrok;

 end;

end;

procedure TfmSetDB.btExitClick(Sender: TObject);
begin
  close
end;

procedure TfmSetDB.btOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then begin
    filename:=OpenDialog.files.CommaText;
    extend_ini.SetStringValue('DB','LastFileName',filename);
    self.ModalResult:=mrok;
  end
  else
    abort

end;

procedure TfmSetDB.btOpenLastClick(Sender: TObject);
begin
    filename:=LastDbFileName;
    extend_ini.SetBoolValue('DB','AutoOpen',cbAutoOpen.Checked);
    self.ModalResult:=mrok;

end;

procedure TfmSetDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if SetModalResult>=0 then begin
    Application.ProcessMessages;
    Sleep (1000);
    ModalResult:=SetModalResult;
  end;

end;

procedure TfmSetDB.FormCreate(Sender: TObject);
begin
  SetModalResult:=-1;
  LastDbFileName := extend_ini.GetStringValue('DB', 'LastFileName', '');
  if LastDbFileName<>'' then begin
    if FileExists(LastDbFileName) then begin
      lbLastDbFileName.Caption:=LastDbFileName;
      cbAutoOpen.Checked:=extend_ini.GetBoolValue('DB','AutoOpen',false);
      if cbAutoOpen.Checked then begin
         btOpenLastClick(sender);
         SetModalResult:=mrok;
         PostMessage(Self.Handle, WM_CLOSE, mrok, 0);
      end;
    end
    else begin
      pnOpenLast.Visible:=false;
      extend_ini.SetBoolValue('DB','AutoOpen',false);
    end;
  end
  else begin
    pnOpenLast.Visible:=false;
  end;

end;

end.
