program lbase;



{$R *.dres}

uses
  Vcl.Forms,
  lcb_unit,
  VCL.Controls,
  extend_diskutil,
  primitive_simple,
  winapi.windows,
  extend_ini,
  sevenzip,
  extend_data,
  display_service,
  vcl.filectrl,
  fmMainUnit in 'fmMainUnit.pas' {fmmain},
  fmSetDBUnit in 'fmSetDBUnit.pas' {fmSetDB},
  fmSetupUnit in 'fmSetupUnit.pas' {fmSetup},
  fmNoteListunit in 'fmNoteListunit.pas' {fmNoteList},
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Styles.HyperLink,
  dmDataUnit in 'dmDataUnit.pas' {DM: TDataModule},
  fmAuthorListUnit in 'fmAuthorListUnit.pas' {fmAuthorList},
  fmNoteEditUnit in 'fmNoteEditUnit.pas' {fmNoteEdit},
  fmKeywordGetUnit in 'fmKeywordGetUnit.pas' {fmKeywordGet},
  fmSourceListUnit in 'fmSourceListUnit.pas' {fmSourceList},
  fmKeywordCommanderUnit in 'fmKeywordCommanderUnit.pas' {fmKeywordCommander},
  fmTelegramUnit in 'fmTelegramUnit.pas' {fmTelegram},
  fmNoteSourceUnit in 'fmNoteSourceUnit.pas' {fmNoteSource},
  fmNoteTypeUnit in 'fmNoteTypeUnit.pas' {fmNoteType},
  fmSourceEditUnit in 'fmSourceEditUnit.pas' {fmSourceEdit},
  fmSourceAuthorUnit in 'fmSourceAuthorUnit.pas' {fmSourceAuthor},
  fmNoteViewModeUnit in 'fmNoteViewModeUnit.pas' {fmNoteViewMode},
  fmKWEditUnit in 'fmKWEditUnit.pas' {fmKWEdit},
  fmKeywordJoinUnit in 'fmKeywordJoinUnit.pas' {fmKeywordJoin},
  fmNoteStatUnit in 'fmNoteStatUnit.pas' {fmNoteStat},
  fmKeywordStatUnit in 'fmKeywordStatUnit.pas' {fmKeywordStat},
  fmAboutUnit in 'fmAboutUnit.pas' {fmAbout},
  fmNoteLinkAddUnit in 'fmNoteLinkAddUnit.pas' {fmNoteLinkAdd},
  fmTaskListUnit in 'fmTaskListUnit.pas' {fmTaskList},
  fmTaskEditUnit in 'fmTaskEditUnit.pas' {fmTaskEdit},
  fmGetSTOCUnit in 'fmGetSTOCUnit.pas' {fmGetSTOC},
  fmFilterUnit in 'fmFilterUnit.pas' {fmFilter},
  fmFilterEditUnit in 'fmFilterEditUnit.pas' {fmFilterEdit};

{$R *.res}
const
  ProgramMutax='LuhmannBox';

var
  mr_:integer;
  force_exit:boolean;

  {procedure ExtractStyles;
  var
    filename:string;
    tarc:TGUID;
  begin
    if not directoryexists(tmppath+'Styles') then
       ForceDirectories(tmppath+'Styles');
    filename:=tmppath+'Styles\styles.7z';
    extend_diskutil.ExtractFileFromAppResource('styles',filename);
    tarc:=CLSID_CFormat7z;
    with CreateInArchive(tarc) do begin
      OpenFile(FileName);
      ExtractTo(tmppath+'Styles');
      close;
    end;
  end;}


begin
  set_tmppath(c_GetTempPath+'LuhmanBox\');
  lcb:=TLogCustomBufferSimple.create(tmppath);
  lcb.init();
  extend_ini.PrjIniFileName:=tmppath+'lbase.ini';

  //ExtractStyles;
  //LoadVCLStyles;


  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  fmSetDB:=TfmSetDB.Create(nil);
  //fmSetDB.key:=key_;
  mr_:=fmSetDB.ShowModal;
  force_exit:=false;

  fmFilter:=nil;
  fmSetup:=nil;
  fmNoteList:=nil;
  fmAuthorList:=nil;
  fmNoteEdit:=nil;
  fmKeywordGet:=nil;
  fmSourceList:=nil;
  fmKeywordCommander:=nil;
  fmTelegram:=nil;
  fmNoteSource:=nil;
  fmNoteType:=nil;
  fmSourceEdit:=nil;
  fmSourceAuthor:=nil;
  fmNoteViewMode:=nil;
  fmKWEdit:=nil;
  fmKeywordJoin:=nil;
  fmNoteStat:=nil;
  fmKeywordStat:=nil;
  fmAbout:=nil;
  fmNoteLinkAdd:=nil;
  fmTaskList:=nil;
  fmTaskEdit:=nil;
  fmGetSTOC:=nil;
  fmFilterEdit:=nil;

  if mr_=mrOk then begin
    //TStyleManager.TrySetStyle('Amakrits');
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfmmain, fmmain);
  if fmMain.setdata(fmSetDB.filename, dbEdit) then
      fmmain.Show
    else begin
      TerminateProcess( GetCurrentProcess, 0 );
    end;
  end

  else if mr_=mrRetry then begin
    Application.CreateForm(Tdm, dm);
    Application.CreateForm(TfmMain, fmMain);
    if fmMain.setdata(fmSetDB.filename, dbInsert) then
      fmmain.Show
    else begin
      TerminateProcess( GetCurrentProcess, 0 );
    end;
  end
  else
    exit;

  if not force_exit then
    Application.Run;
end.
