unit fmSetupUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FileCtrl,
  VCLTee.TeCanvas, DBCtrlsEh, Vcl.CheckLst, Vcl.Mask, Vcl.ComCtrls,   display_service, aliasform;

type

  TfmSetup = class(TForm)
    Label1: TLabel;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    lbNoteView: TLabel;
    cbUseNoteTypization: TCheckBox;
    cbUseTagForSource: TCheckBox;
    cbKWUni: TCheckBox;
    gbKWNoteShow: TGroupBox;
    clbKWShowNote: TCheckListBox;
    tsTelegram: TTabSheet;
    lbTelegramSaveNote: TLabel;
    leTelegramPhone: TLabeledEdit;
    dbnTelegramFastNoteDay: TDBNumberEditEh;
    tsColor: TTabSheet;
    lbColorScheme: TLabel;
    cbColorScheme: TComboBox;
    gbSourceList: TGroupBox;
    lbSLNotRead: TLabel;
    lbSLInProcess: TLabel;
    bcSLNotRead: TButtonColor;
    bcSLInProcess: TButtonColor;
    gbKWCommander: TGroupBox;
    lbKWDef: TLabel;
    lbKWBkgAntonym: TLabel;
    lbKWBkgOmonym: TLabel;
    lbKWBkg: TLabel;
    lbKWFont: TLabel;
    lbKWInterest: TLabel;
    bcKWDef: TButtonColor;
    bcKWBkgAntonym: TButtonColor;
    bcKWBkgOmonym: TButtonColor;
    bcKWFontAntonym: TButtonColor;
    bcKWFontOmonym: TButtonColor;
    bcKWBkgInterest: TButtonColor;
    bcKWFontInterest: TButtonColor;
    pnBottom: TPanel;
    btSave: TButton;
    cbNoteShowMode: TComboBox;
    cbNoteSourceKeyword: TCheckBox;
    Store: TTabSheet;
    leStoreDir: TLabeledEdit;
    cbStorePlace: TComboBoxEx;
    lbStorePlace: TLabel;
    dbnScale: TDBNumberEditEh;
    lbScale: TLabel;
    lbeThemeFile: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure cbStorePlaceChange(Sender: TObject);
    procedure cbStorePlaceEnter(Sender: TObject);
  private
    { Private declarations }
    StorePlaceOld: integer;
  public
    { Public declarations }
  end;

var
  fmSetup: TfmSetup;

implementation

{$R *.dfm}

uses fmMainUnit, vcl.themes, extend_ini, dmDataUnit, extend_dialog, data_service;

procedure TfmSetup.btSaveClick(Sender: TObject);
var
  s:vcl.themes.TStyleManager.TStyleServicesHandle;
begin

  if (DM.Get_Ini_Int_Par('FileStorePlace')=0) and (self.cbStorePlace.ItemIndex=1) then begin
    if msgquestion('Перенести все файлы из базы в каталог ['+self.leStoreDir.Text+']? ВНИМАНИЕ!!! Отменить нельзя будет!') then begin
       if not MoveFilesToDir then
         exit
       else begin
         self.cbStorePlace.Enabled:=false;
         msgok('Все файлы успешно перенесены в указанный каталог! Из базы все файлы удалены! Не забудьте почистить мусор, чтобы уменьшить размер файла данных!');
       end;

    end
    else
      exit;

  end;
  dm.Set_Ini_Int_Par('def_show_mode',cbNoteShowMode.ItemIndex);
  //DM.Set_Ini_Int_Par('def_source_view',dbcSourceView.ItemIndex);
  DM.Set_Ini_Int_Par('KW_Uni_Trend',integer(self.cbKWUni.Checked));
  DM.Set_Ini_Int_Par('use_note_typization',integer(self.cbUseNoteTypization.Checked));
  DM.Set_Ini_Int_Par('use_tag_for_source',integer(self.cbUseTagForSource.Checked));

  DM.Set_Ini_Int_Par('KW_Note_Source',integer(cbNoteSourceKeyword.Checked));
  DM.Set_Ini_Int_Par('KW_Note_Show_Interest',integer(clbKWShowNote.Checked[0]));
  DM.Set_Ini_Int_Par('KW_Note_Show_Antonym',integer(clbKWShowNote.Checked[1]));
  DM.Set_Ini_Int_Par('KW_Note_Show_Omonym',integer(clbKWShowNote.Checked[2]));
  DM.Set_Ini_Str_Par('TelegramPhone',leTelegramPhone.Text);
  DM.Set_Ini_Int_Par('FileStorePlace',self.cbStorePlace.ItemIndex);
  DM.Set_Ini_Str_Par('FileStoreDir',leStoreDir.Text);
  DM.Set_Ini_Int_Par('TelegramNoteSaveDay',dbnTelegramFastNoteDay.Value);
  DM.Set_Ini_Int_Par('Color_SLNotRead',bcSLNotRead.SymbolColor);
  DM.Set_Ini_Int_Par('Color_SLInProcess',bcSLInProcess.SymbolColor);
  DM.Set_Ini_Int_Par('Color_KWDef',bcKWDef.SymbolColor);
  DM.Set_Ini_Int_Par('Color_KWBkgAntonym',bcKWBkgAntonym.SymbolColor);
  DM.Set_Ini_Int_Par('Color_KWBkgOmonym',bcKWBkgOmonym.SymbolColor);
  DM.Set_Ini_Int_Par('Color_KWFontAntonym',bcKWFontAntonym.SymbolColor);
  DM.Set_Ini_Int_Par('Color_KWFontOmonym',bcKWFontOmonym.SymbolColor);
  if DM.Get_Ini_Int_Par('ScaleBy',100)<>dbnscale.Value then
    msgok('Для вступления в силу коэф-та увеличения нужно перегрузить программу!');
  DM.Set_Ini_Int_Par('ScaleBy',dbnscale.Value);
  DM.Set_Ini_Int_Par('Color_KWBkgInterest',bcKWBkgInterest.SymbolColor);
  DM.Set_Ini_Int_Par('Color_KWFontInterest',bcKWFontInterest.SymbolColor);
  DM.Set_Ini_Str_Par('ColorStyle',self.cbColorScheme.Text);
  if self.cbColorScheme.Text<>'' then begin
    TStyleManager.TrySetStyle(self.cbColorScheme.Text);
    Application.ProcessMessages;
  end
  else begin
    TStyleManager.SetStyle(TStyleManager.SystemStyle);
    Application.ProcessMessages;
  end;
  if lbeThemeFile.Text<>'' then begin
    s:=TStyleManager.LoadFromFile(lbeThemeFile.Text);
    //s.
  end;



end;

procedure TfmSetup.cbStorePlaceChange(Sender: TObject);
begin
  self.leStoreDir.Enabled:=cbStorePlace.ItemIndex=1
end;

procedure TfmSetup.cbStorePlaceEnter(Sender: TObject);
begin
  StorePlaceOld:=cbStorePlace.ItemIndex
end;

procedure TfmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    fmmain.mnParams.Enabled:=true;
    action:=cafree;
    fmsetup:=nil;

end;

procedure TfmSetup.FormCreate(Sender: TObject);
var
  ts:TStringList;
  i:integer;
begin
  ts:=TStringList.Create;
  ts.add('');
  for I := 0 to length(TStyleManager.StyleNames)-1 do
              ts.Add(TStyleManager.StyleNames[i]);
  ts.Sort;
  for I := 0 to length(TStyleManager.StyleNames) do
    self.cbColorScheme.Items.Add(ts[i]);
  ts.Free;
  cbColorScheme.ItemIndex:=cbColorScheme.Items.IndexOf(DM.Get_Ini_Str_Par('ColorStyle',''));


  fmmain.mnParams.Enabled:=false;
  cbNoteShowMode.ItemIndex:=DM.Get_Ini_Int_Par('def_show_mode',0);
  //dbcSourceView.ItemIndex:=DM.Get_Ini_Int_Par('def_source_view',0);
  cbNoteSourceKeyword.Checked:=DM.Get_Ini_Int_Par('KW_Note_Source',0)=1;
  self.cbKWUni.Checked:=DM.Get_Ini_Int_Par('KW_Uni_Trend',0)=1;
  self.cbUseNoteTypization.Checked:=DM.Get_Ini_Int_Par('use_note_typization',1)=1;
  self.cbUseTagForSource.Checked:=DM.Get_Ini_Int_Par('use_tag_for_source',1)=1;
  self.cbStorePlace.ItemIndex:=DM.Get_Ini_Int_Par('FileStorePlace');
  dbnscale.Value:=DM.Get_Ini_Int_Par('ScaleBy',100);

  leStoreDir.Text:=DM.Get_Ini_Str_Par('FileStoreDir');
  self.cbStorePlace.Enabled:=self.cbStorePlace.ItemIndex=0; // только в одну сторону
  cbStorePlaceChange(nil);

  bcSLNotRead.SymbolColor:=DM.Get_Ini_Int_Par('Color_SLNotRead',clRed);
  bcSLInProcess.SymbolColor:=DM.Get_Ini_Int_Par('Color_SLInProcess',clBlue);
  bcKWDef.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWDef',clBlue);

  bcKWBkgAntonym.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWBkgAntonym',$00C7C7FF);
  bcKWBkgOmonym.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWBkgOmonym',clGray);
  bcKWFontAntonym.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWFontAntonym',clWindowText);
  bcKWFontOmonym.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWFontOmonym',clWindowText);
  bcKWBkgInterest.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWBkgInterest',14215400);
  bcKWFontInterest.SymbolColor:=DM.Get_Ini_Int_Par('Color_KWFontInterest',clWindowText);


  clbKWShowNote.Checked[0]:=DM.Get_Ini_Int_Par('KW_Note_Show_Interest',0)=1;
  clbKWShowNote.Checked[1]:=DM.Get_Ini_Int_Par('KW_Note_Show_Antonym',0)=1;
  clbKWShowNote.Checked[2]:=DM.Get_Ini_Int_Par('KW_Note_Show_Omonym',0)=1;
  leTelegramPhone.Text:=DM.Get_Ini_Str_Par('TelegramPhone');
  dbnTelegramFastNoteDay.Value:=DM.Get_Ini_Int_Par('TelegramNoteSaveDay',30);

end;

end.
