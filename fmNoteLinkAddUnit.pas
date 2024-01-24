п»їunit fmNoteLinkAddUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, display_service, DBGridEh,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh, DBLookupEh , aliasform;

type
  TfmNoteLinkAdd = class(TForm)
    lbLinkType: TLabel;
    gbSelNote: TGroupBox;
    lbSource: TLabel;
    lbNote: TLabel;
    dblSource: TDBLookupComboboxEh;
    dblNote: TDBLookupComboboxEh;
    btSignID: TButton;
    dblLinkType: TDBLookupComboboxEh;
    gbDetail: TGroupBox;
    btAdd: TButton;
    meDetail: TMemo;
    fdqnoteall: TFDQuery;
    fdqnoteallid: TFDAutoIncField;
    dsnoteall: TDataSource;
    fdqSource: TFDQuery;
    fdqSourceid: TFDAutoIncField;
    fdqSourceis_mine: TIntegerField;
    fdqSourcefullname: TWideMemoField;
    dsSource: TDataSource;
    fdqLinkType: TFDQuery;
    fdqLinkTypeid: TFDAutoIncField;
    fdqLinkTypename: TWideMemoField;
    fdqLinkTypecorr_link_type: TIntegerField;
    dsLinkType: TDataSource;
    fdqnoteallname: TWideMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dblSourceChange(Sender: TObject);
    procedure btSignIDClick(Sender: TObject);
    procedure dblLinkTypeChange(Sender: TObject);
    procedure dblNoteChange(Sender: TObject);
    procedure btAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    source_id, note_id:integer;
    srcnotename:string;
    procedure fillDetail;
  end;

var
  fmNoteLinkAdd: TfmNoteLinkAdd;

implementation

{$R *.dfm}

uses extend_data, dmDataUnit, extend_dialog;

procedure TfmNoteLinkAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
  fmNoteLinkAdd:=nil;

end;


procedure TfmNoteLinkAdd.FormShow(Sender: TObject);
begin
  dblsource.KeyValue:=source_id;
  if fdqnoteall.Active then
    fdqnoteall.close;
  fdqnoteall.Params.ParamValues['SID']:=source_id;
  fdqnoteall.Params.ParamValues['NID']:=note_id;
  fdqnoteall.Open();
  fdqSource.Open();
  fdqLinkType.Open();
end;

procedure TfmNoteLinkAdd.btAddClick(Sender: TObject);
begin
  dm.sqlc.ExecSQL('insert into note_link (link_type,note1_id, note2_id) values('+inttostr(dblLinkType.KeyValue)+','+inttostr(note_id)+','+inttostr(dblNote.KeyValue)+')');
  fdqLinkType.Locate('id',dblLinkType.KeyValue,[]);
  if null2int(fdqLinkType['corr_link_type'])>0 then begin
    dm.sqlc.ExecSQL('insert into note_link (link_type,note2_id, note1_id) values('+inttostr(fdqLinkType['corr_link_type'])+','+inttostr(note_id)+','+inttostr(dblNote.KeyValue)+')');
  end;
  modalresult:=mrok;
  //close;


end;

procedure TfmNoteLinkAdd.btSignIDClick(Sender: TObject);
var InpInt: Integer;
begin
  if InputInt('Р’РІРѕРґ РґР°РЅРЅС‹С…','РЈРєР°Р¶РёС‚Рµ ID Р·Р°РјРµС‚РєРё, СЃРІСЏР·СЊ СЃ РєРѕС‚РѕСЂРѕР№ Р’С‹ С…РѕС‚РёС‚Рµ СѓСЃС‚Р°РЅРѕРІРёС‚СЊ:',InpInt) then begin
    if dm.sqlc.ExecSQLScalar('select count(*) from note where id=:IID',[InpInt])>0 then begin
      try
        dblSource.KeyValue:=null2int(dm.sqlc.ExecSQLScalar('select min(source_id) from note_source where note_id=:IID',[InpInt]));
      except
        dblSource.KeyValue:=0;
      end;
      dblSourceChange(sender);
      Application.ProcessMessages;
      if fdqnoteall.Locate('ID',InpInt) then begin
        dblnote.KeyValue:=InpInt;
        fillDetail
      end
      else
        msgerror('ID Р·Р°РјРµС‚РєРё РЅРµ РЅР°Р№РґРµРЅРѕ РїРѕ СѓРєР°Р·Р°РЅРЅС‹Рј Р’Р°РјРё С„РёР»СЊС‚СЂР°Рј!');
    end;
  end;

end;

procedure TfmNoteLinkAdd.dblLinkTypeChange(Sender: TObject);
begin
  fillDetail
end;

procedure TfmNoteLinkAdd.dblNoteChange(Sender: TObject);
begin
  fillDetail
end;

procedure TfmNoteLinkAdd.dblSourceChange(Sender: TObject);
begin
  source_id:=dblSource.KeyValue;
  if fdqnoteall.Active then
    fdqnoteall.close;
  fdqnoteall.Params.ParamValues['SID']:=source_id;
  fdqnoteall.Params.ParamValues['NID']:=note_id;
  fdqnoteall.Open();

end;

procedure TfmNoteLinkAdd.fillDetail;
begin
  meDetail.Lines.Clear;
  meDetail.Lines.Add('('+dblnote.Text+')');
  meDetail.Lines.Add('  | ');
  meDetail.Lines.Add('  | ');
  meDetail.Lines.Add(dbllinktype.Text);
  meDetail.Lines.Add('  | ');
  meDetail.Lines.Add(' Л… ');
  meDetail.Lines.Add('('+srcnotename+')');
  btAdd.Enabled:=(dblnote.Text<>'') and (dbllinktype.Text<>'')
end;

end.
