unit TwoPanelControlForm;

interface

uses
  Vcl.Forms, System.Classes, Vcl.ExtCtrls, Winapi.Messages, ComCtrls, Vcl.Graphics, dbctrlseh,
  Vcl.StdCtrls,dbGridEh, data.db,
  richedit, AliasForm, vcl.menus, Urlpanels;

const
  par_Nav='_Navigation';
  par_class='_class';
  par_mode='_mode';
  par_modemax='_modemax';

type
  TPanelTagInfo=class
      class_id, class_id_a:longint; // �������������� ������� ������� �  ���������������
      gbPanel, gbPanel_a:TGroupBox; // GroupBox ������� ������� � ���������������
      dbg, dbg_a:TDBGridEh; // ����� ������� ������� � ���������������
      pnCont, pnCont_a:TPanel; // ������ ������� (�� ���������, �������, ....) ������� � ���������������
      class_full_name, class_full_name_a:string; // ������ ���� ���������������
      class_name, class_name_a:string; // ����� ���������������
      dsu, dsu_a:TdataSet; // dataSet ������� ������� � ���������������
      tag_name, tag_name_a:string; // 'Left' ��� 'Right'
  end;

  // 2-� ��������� ��������� �� ���������������
  TfmTwoPanelControl=class(TAliasParamForm)
    private
      // �������� � DataSet, ��� ����������� ������ ���� �������� ��������� ���������
      m_class_left_id, m_class_right_id:integer; // ID ����� ����� � ������
      m_pm_main:TPopUpMenu; // �������� popUpMenu
      m_dsu_left, m_dsu_right:TdataSet; // DataSet
      m_gb_left_panel, m_gb_right_panel:TGroupBox; // GroupBox - �������� ������
      m_dbg_left, m_dbg_right:TDBGridEh; // �����
      m_pn_cont_left, m_pn_cont_right:TPanel; // ������ ������� (�� ���������, ������� � �.�.)
      m_last_class_id:longint; // ��������� �������� �������������

      // ������� ���������
      m_view_mode:integer; // =0 - ����� �������, ������ ����, =1-������ �������, ����� ����, =3 - ��� ��������
      m_view_maximized:boolean;  // ����������� ��������� ��������� ������ �����?

      // ��������������� ����������
      m_panel_root_caption:string; // �������� ������� ������, ������ ���������
      m_last_scrool_tag:array[0..1] of longint; // ��� ��������� - ����� �� �������������� ������-������ ���� � �� ��

      procedure init; // ������������� ������ � 2-��������� �����������
      function get_alias_def_class(tag_:integer):string; // �������� alias ��� ���������� �������� �� ��������� ��� ������
      function get_alias_nav(tag_:integer):string;  // �������� alias ��� ���������
      function get_def_class(tag_:integer):longint; // �������� ����� �� ��������� ��� ������
      function get_last_scrool_tag(tag_:integer):integer; // �������� ��������� ������������ � scrool ID �� ����
      function get_sub_class(tag_:integer;class_id_:longint):longint; // �������� �������� ��� ID ����� ������
      procedure actualize_pm_main_check;  // ���������� check popapmenu � ����������� �� ������ �����������
      procedure dbg_main_cell_click(Column: TColumnEh); // �������� �� ����� ������ �� ������ � �������� �����
      procedure dbg_main_key_down(Sender: TObject; var Key: Word; Shift: TShiftState); // �������� �� ������� ������� � �������� �����
      procedure menu_action_change_panels(Sender: TObject); // �������� ������ ���� � ������ �������
      procedure menu_action_choose_the_same(Sender: TObject); // ������� �� ������ ������ ��� �� ����
      procedure menu_action_set_mode_maximized(Sender: TObject);  // ����� ��������� 1 ������ �� ��� ����
      procedure menu_action_set_mode_show_content(Sender: TObject); // ����� ��������� � ���������� �����������
      procedure menu_action_set_mode_2_panel(Sender: TObject); // ����� ��������� 2-���������
      procedure mode_view_recover; // ������������ ����� �����������
      procedure mode_view_save; // ��������� ����� �����������
      procedure set_def_class(tag_:integer;class_id_:longint); // ���������� ID ����� �� ��������� ��� ������� ���������� ������
      procedure set_panel_class_caption(tag_:integer); // ��������� ��������� ������
      procedure set_last_scrool_tag(tag_:integer;value_:longint);
      procedure class_enter(tag_:integer;class_id_, subclass_id_:longint); // ���� � �����
      procedure class_exit(tag_:integer;old_class_id_, new_class_id_:longint); // ����� �� �����

    public
      IgnoreDSUScroolEvent:boolean;

      constructor CreateWithAlias(AOwner_: TComponent; alias_,PanelRootCaption_:string);
      procedure AssignControls(pmMain_:TPopupMenu;  // ��������� ������������ �������� ���������, ������ � ������������ �����, �.�. �� ��� ����� �� ���
                            gbLeftPanel_, gbRightPanel_:TGroupBox;
                            dbgLeft_, dbgRight_:TDBGridEh;
                            pnContLeft_, pnContRight_:TPanel;
                            dsuLeft_, dsuRight_:TdataSet);

      function GetTagPTI(tag_:integer):TPanelTagInfo;overload; virtual;  // �������� PTI � ���������� �� tag_
      function GetAnotherTag(tag_:integer):integer; // �������� ID ������������� ������
      function GetCurClass:longint; // �������� ������� �������������

      function GetFocusTag:integer; // �������� ID ������� ������

      procedure ClassUp(Sender_: TObject); // ����� ����� '...' - �����
      procedure DsuAfterScroll(DataSet_: TDataSet); virtual; // �������� ����� ������ ��������� dataset
      procedure GetTagPTI(tag_:integer; PTI_:TPanelTagInfo;is_fast_:boolean=false); overload; virtual; // �������� PTI � ����������� �� tag_
      procedure ResetLastScroolTag; // ����� ��������� ����������
      procedure SetAlias(alias_:string); // ��������� ����� alias (����� ��� ����������� ID � ��������� ������)
      procedure SetPanelClass(tag_:integer;class_id_:integer); overload; // ��������� ��� ������ ID ����� � ��������� ������ ��������
      procedure SetPanelClass(tag_:integer); overload; // ��������� ������ �������� ��� ����������� ������
      procedure SetViewMode(mode_:integer;maximized_:boolean); overload; virtual; // ���������� ����� �����������
      procedure SetViewMode(); overload; virtual; // ��������������� ����� �����������

      // ���� ������ ������� ��� ������������� (!!!!!) ����������� � �������� �����������

      function GetClassClassId(class_id_:longint):longint; virtual; abstract; // �������� ID ����� �� ID ��������
      function GetClassNameFull(class_id_:longint):string; virtual; abstract; // �������� ������ ���� �� ID
      function GetClassName(class_id_:longint):string; virtual; abstract; // �������� �������� �������������� �� ID
      procedure DbgDblClick(Sender_: TObject); virtual; abstract; // ������� ������ ����� �� ��������� �����
      procedure DsuAfterScroolHandle(DataSet_:TDataSet); virtual; abstract; // �������� �������� ��� ��������� ��������� �������
      procedure FormResize(Sender_: TObject);virtual; abstract; // �������� ��� ����� ������� �����
      procedure SetPanelClassAddAction(tag_:integer); virtual; abstract; // �������������� �������� �� ������ ������ ��������������
    published
      property ViewMaximized: boolean read m_view_maximized; // ����� ���������� ������ �� ��� ����?
      property ViewMode: Integer read m_view_mode; //  ����� �����������
      property ClassLeftId: Integer read m_class_left_id; //  ����� class_id
      property ClassRightId: Integer read m_class_right_id; // ������ class_id

  end;

implementation

uses
  dmdataunit, extend_data, extend_dialog,
  vcl.controls, winapi.windows, system.sysutils;

constructor TfmTwoPanelControl.CreateWithAlias(AOwner_: TComponent; alias_,PanelRootCaption_:string);
begin
  alias:=alias_;
  IgnoreDSUScroolEvent:=false;
  m_panel_root_caption:=PanelRootCaption_;
  ResetLastScroolTag;
  init;
  m_class_left_id:=get_def_class(0);
  m_class_right_id:=get_def_class(1);
  inherited CreateWithAlias (AOwner_,alias_);
end;


procedure TfmTwoPanelControl.AssignControls(pmMain_:TPopupMenu;
    gbLeftPanel_, gbRightPanel_:TGroupBox; dbgLeft_, dbgRight_:TDBGridEh;
    pnContLeft_, pnContRight_:TPanel;dsuLeft_, dsuRight_:TdataSet);
var
  i,j:integer;
  ti:Tmenuitem;
begin
  m_pm_main:=pmMain_;
  m_gb_left_panel:=gbLeftPanel_;
  m_gb_right_panel:=gbRightPanel_;
  m_dbg_left:=dbgLeft_;
  m_dbg_right:=dbgRight_;
  m_pn_cont_left:=pnContLeft_;
  m_pn_cont_right:=pnContRight_;
  m_dsu_left:=dsuLeft_;
  m_dsu_right:=dsuRight_;
  for i:=0 to m_pm_main.Items.Count-1 do begin
    if m_pm_main.Items[i].Name='mnChooseTheSame' then
      m_pm_main.Items[i].OnClick:=menu_action_choose_the_same;

    if m_pm_main.Items[i].Name='mnChangePanel' then
      m_pm_main.Items[i].OnClick:=menu_action_change_panels;
    if m_pm_main.Items[i].Name='mnMode' then begin
      ti:=m_pm_main.Items[i];
      for j:=0 to ti.Count-1 do begin
        if ti.Items[j].Name='mnModeMaximized' then
             ti.Items[j].OnClick:=menu_action_set_mode_maximized;
        if ti.Items[j].Name='mnModeShowContent' then
             ti.Items[j].OnClick:=menu_action_set_mode_show_content;
        if ti.Items[j].Name='mnMode2Panel' then
             ti.Items[j].OnClick:=menu_action_set_mode_2_panel
      end;
    end;
  end;

  m_dbg_left.OnKeyDown:=dbg_main_key_down;
  m_dbg_right.OnKeyDown:=dbg_main_key_down;
  m_dbg_left.OnCellClick:=dbg_main_cell_click;
  m_dbg_right.OnCellClick:=dbg_main_cell_click;
  m_dsu_left.AfterScroll:=DsuAfterScroll;
  m_dsu_right.AfterScroll:=DsuAfterScroll;


  mode_view_recover
end;

procedure TfmTwoPanelControl.ResetLastScroolTag; // ����� ��������� ����������
begin
  m_last_scrool_tag[0]:=-1000;
  m_last_scrool_tag[1]:=-1000;
end;


procedure TfmTwoPanelControl.init;
begin
  dm.sqlc.ExecSQL('delete from parameter where name like '''+alias+par_nav+'%''')
end;

procedure TfmTwoPanelControl.class_enter(tag_:integer;class_id_, subclass_id_:longint);
var
  calias:string;
begin
  calias:=self.get_alias_nav(tag_)+'_'+int2str(class_id_);
  dm.Set_Ini_Int_Par(calias,subclass_id_);
  set_def_class(tag_,subclass_id_)
end;

procedure TfmTwoPanelControl.class_exit(tag_:integer;old_class_id_, new_class_id_:longint);
var
  sqlt:string;
begin
  sqlt:='delete from parameter where name like '''+self.get_alias_nav(tag_)+'_'+int2str(old_class_id_)+'%''';
  dm.sqlc.ExecSQL(sqlt);
  set_def_class(tag_,new_class_id_)
end;

procedure TfmTwoPanelControl.set_def_class(tag_:integer;class_id_:longint);
begin
  dm.Set_Ini_Int_Par(self.get_alias_def_class(tag_),class_id_);
end;

function TfmTwoPanelControl.get_def_class(tag_:integer):longint;
var
  res:longint;
begin
  res:=dm.Get_Ini_Int_Par(self.get_alias_def_class(tag_),0);
  if res<0 then
    res:=0;
  result:=res;
end;


function TfmTwoPanelControl.get_alias_nav(tag_:integer):string;
begin
  result:=alias+par_nav+int2str(tag_);
end;

function TfmTwoPanelControl.get_alias_def_class(tag_:integer):string;
begin
  result:=alias+par_class+int2str(tag_);
end;

procedure TfmTwoPanelControl.mode_view_save;
begin
  dm.Set_Ini_Int_Par(alias+par_mode,m_view_mode);
  dm.Set_Ini_Int_Par(alias+par_modemax,bool2int(m_view_maximized));
end;

procedure TfmTwoPanelControl.mode_view_recover;
begin
  m_view_maximized:=dm.Get_Ini_Int_Par(alias+par_modemax,1)=1;
  m_view_mode:=dm.Get_Ini_Int_Par(alias+par_mode,0);
  if m_view_mode=-1 then begin // ������������� �� ������ �������
     m_view_maximized:=true;
     m_view_mode:=0;
  end;

end;


function TfmTwoPanelControl.get_sub_class(tag_:integer;class_id_:longint):longint;
var
  calias:string;
begin
  calias:=self.get_alias_nav(tag_)+'_'+int2str(class_id_);
  result:=dm.Get_Ini_Int_Par(calias,0);
end;


procedure TfmTwoPanelControl.SetAlias(alias_:string);
begin
  alias:=alias_;
  init;
end;


procedure TfmTwoPanelControl.SetPanelClass(tag_:integer;class_id_:integer);
var
  old_class:longint;
  PTI:TPanelTagInfo;
begin
  PTI:=GetTagPTI(tag_);
  if tag_=0 then begin
    old_class:=m_class_left_id;
    m_class_left_id:=class_id_;
    m_last_class_id:=class_id_;
  end
  else begin
    old_class:=m_class_right_id;
    m_class_right_id:=class_id_;
    m_last_class_id:=class_id_;
  end;
  SetPanelClassAddAction(tag_);
  set_panel_class_caption(tag_);
  if (class_id_=-1) or (old_class=-1) then
    FormResize(nil);
  class_enter(tag_,old_class,class_id_);
  PTI.dsu.AfterScroll(PTI.dsu);
end;


procedure TfmTwoPanelControl.SetPanelClass(tag_:integer);
begin
  SetPanelClassAddAction(tag_);
  set_panel_class_caption(tag_);
end;



function TfmTwoPanelControl.GetTagPTI(tag_:integer):TPanelTagInfo;
var
  PTI:TPanelTagInfo;
begin
  PTI:=TPanelTagInfo.Create;
  GetTagPTI(tag_,PTI);
  Result:=PTI;
end;



procedure TfmTwoPanelControl.GetTagPTI(tag_:integer; PTI_:TPanelTagInfo;is_fast_:boolean=false); // �������� ���������� tag_* � ����������� �� tag_
begin
  if tag_=0 then begin
      PTI_.class_id:=m_class_left_id;
      PTI_.class_id_a:=m_class_right_id;
      PTI_.gbPanel:=m_gb_left_panel;
      PTI_.gbPanel_a:=m_gb_right_panel;
      PTI_.dbg:=m_dbg_left;
      PTI_.dbg_a:=m_dbg_right;
      PTI_.pnCont:=m_pn_cont_left;
      PTI_.pnCont_a:=m_pn_cont_right;
      PTI_.dsu:=m_dsu_left;
      PTI_.dsu_a:=m_dsu_right;
      PTI_.tag_name:='Left';
      PTI_.tag_name_a:='Right';
  end
  else begin
      PTI_.class_id_a:=m_class_left_id;
      PTI_.class_id:=m_class_right_id;
      PTI_.gbPanel_a:=m_gb_left_panel;
      PTI_.gbPanel:=m_gb_right_panel;
      PTI_.dbg_a:=m_dbg_left;
      PTI_.dbg:=m_dbg_right;
      PTI_.pnCont_a:=m_pn_cont_left;
      PTI_.pnCont:=m_pn_cont_right;
      PTI_.dsu_a:=m_dsu_left;
      PTI_.dsu:=m_dsu_right;
      PTI_.tag_name_a:='Left';
      PTI_.tag_name:='Right';

  end;
  if is_fast_ then begin
    PTI_.class_full_name:='�� ��������';
    PTI_.class_full_name_a:='�� ��������';
    PTI_.class_name:='�� ��������';
    PTI_.class_name_a:='�� ��������';
  end
  else begin
    PTI_.class_full_name:=GetClassNameFull(PTI_.class_id);
    PTI_.class_full_name_a:=GetClassNameFull(PTI_.class_id_a);
    PTI_.class_name:=GetClassName(PTI_.class_id);
    PTI_.class_name_a:=GetClassName(PTI_.class_id_a);
  end;

end;

function TfmTwoPanelControl.GetFocusTag:integer;
begin
  if self.m_dbg_left.Focused then begin
     Result:=0;
  end
  else begin
     Result:=1;
  end;
end;

procedure TfmTwoPanelControl.SetViewMode;
begin
  SetViewMode(self.m_view_mode,self.m_view_maximized)
end;


procedure TfmTwoPanelControl.SetViewMode(mode_:integer;maximized_:boolean);
var
  PTI:TPanelTagInfo;
begin
  PTI:=GetTagPTI(GetFocusTag);
  if (PTI.class_id<0) and (mode_=3) then begin
    msgerror('������ �������� ���� ��� �����������!');
    exit;
  end;

  m_view_mode:=mode_;
  m_view_maximized:=maximized_;

  if m_view_maximized then begin // ����������� ���� ������ �� ��� ����
    PTI:=GetTagPTI(m_view_mode);
    PTI.dbg.Visible:=true;
    PTI.dbg.Align:=alClient;
    PTI.gbPanel_a.Visible:=false;
    PTI.gbPanel.Visible:=true;
    PTI.gbPanel.Align:=alClient;
  end
  else begin
    if m_view_mode=3 then begin // ������������
      PTI:=GetTagPTI(0); // ��� ������� ����� ���
      PTI.pnCont.Visible:=false;
      PTI.pnCont_a.Visible:=false;

      PTI.gbPanel.Visible:=true;
      PTI.gbPanel_a.Visible:=true;
      PTI.dbg.align:=alClient;
      PTI.dbg_a.align:=alClient;
      PTI.dbg.Visible:=true;
      PTI.dbg_a.Visible:=true;
      m_gb_left_panel.Align:=alLeft;
      m_gb_right_panel.Align:=alClient;
      set_panel_class_caption(0);
      set_panel_class_caption(1);
    end
    else begin // ������������� � ���������� �����������
      PTI:=GetTagPTI(m_view_mode);
      PTI.gbPanel.Visible:=true;
      PTI.gbPanel_a.Visible:=true;
      if m_view_mode=0 then begin // �����
        PTI.gbPanel.align:=alLeft;
        PTI.gbPanel_a.align:=alClient;
      end
      else begin // ������
        PTI.gbPanel.align:=alClient;
        PTI.gbPanel_a.align:=alLeft;
      end;

      PTI.dbg.Visible:=true;
      PTI.dbg.align:=alclient;
      PTI.dbg_a.Visible:=false;
      PTI.pnCont.Visible:=false;
      PTI.pnCont_a.Visible:=true;
      PTI.pnCont_a.align:=alclient;
    end;
  end;
  mode_view_save();
  actualize_pm_main_check;
  FormResize(nil)
end;


procedure TfmTwoPanelControl.ClassUp(Sender_: TObject);
var
  PTI:TPanelTagInfo;
  tag:integer;
  dst,old_class, new_class:longint;
begin
  tag:=(Sender_ as TDBGrideh).Tag;
  PTI:=GetTagPTI(tag);
  old_class:=PTI.class_id;
  new_class:=GetClassClassId(PTI.class_id);
  SetPanelClass(tag,new_class);
  set_panel_class_caption(tag);
  class_exit(tag,old_class,new_class);
  dst:=get_sub_class(tag,new_class);
  if dst>0 then
     PTI.dsu.Locate('ID',dst,[]);
  PTI.dbg.SetFocus;
  if PTI.dbg.SearchPanel.Enabled then begin
     PTI.dbg.SearchPanel.SearchingText:='';
     PTI.dbg.SearchPanel.CancelSearchFilter;
     PTI.dbg.SearchPanel.Enabled:=false;
  end;
end;


procedure TfmTwoPanelControl.set_panel_class_caption(tag_:integer);
var
  pix:integer;
  PTI:TPanelTagInfo;
begin
  if m_view_maximized then begin
    if (m_view_mode<>tag_) then
      exit;
  end
  else
    if (m_view_mode<>3) and (tag_<>m_view_mode) then
      exit;

  PTI:=GetTagPTI(tag_);
  if PTI.class_id=0 then
    PTI.gbPanel.Caption:=self.m_panel_root_caption
  else
    PTI.gbPanel.Caption:=GetClassNameFull(PTI.class_id);
  Canvas.Font.Size := PTI.gbPanel.Font.Size;
  Canvas.Font.Name := PTI.gbPanel.Font.name;
  pix:=Canvas.TextWidth(PTI.gbPanel.Caption);
  if pix>PTI.gbPanel.ClientWidth-10 then begin
    pix:=round((PTI.gbPanel.ClientWidth-10)/pix*length(PTI.gbPanel.Caption))-5;
    PTI.gbPanel.Caption:='...'+copy(PTI.gbPanel.Caption,length(PTI.gbPanel.Caption)-pix);
  end;
end;


procedure TfmTwoPanelControl.menu_action_change_panels(Sender: TObject);
var
  c1,c2,id1,id2:longint;
  tag:integer;
  id:longint;
  PTI:TPanelTagInfo;
begin
  if m_view_maximized then
    Exit;
  PTI:=TPanelTagInfo.Create;
  tag:=GetFocusTag;
  GetTagPTI(tag,PTI);
  c1:=PTI.class_id;
  c2:=PTI.class_id_a;
  id1:=PTI.dsu['id'];
  id2:=PTI.dsu_a['id'];
  SetPanelClass(tag,c2);
  SetPanelClass(GetAnotherTag(tag),c1);
  ResetLastScroolTag;
  if m_view_mode<>3 then begin
    if m_view_mode=0 then
       SetViewMode(1,false)
    else
       SetViewMode(0,false);
  end;

  if m_view_mode<>3 then begin
    set_panel_class_caption(0);
    set_panel_class_caption(1);
    //DsuAfterScroll(PTI.dsu_a);
    FormResize(sender);
    PTI.dsu_a.Locate('id',id1,[]);
  end
  else begin
    PTI.dsu_a.Locate('id',id1,[]);
    PTI.dsu.Locate('id',id2,[]);
    set_panel_class_caption(0);
    set_panel_class_caption(1);
  end;
  //SendMessage(PTI.dbg_a.Handle, WM_SETFOCUS, 0, 0);
  PTI.dbg_a.SetFocus;
  PTI.Destroy
end;


function TfmTwoPanelControl.GetAnotherTag(tag_:integer):integer;
begin
  if tag_=0 then
    result:=1
  else
    result:=0
end;


procedure TfmTwoPanelControl.actualize_pm_main_check;
var
  i,j:integer;
  ti:Tmenuitem;
begin
  for i:=0 to m_pm_main.Items.Count-1 do begin
    if m_pm_main.Items[i].Name='mnMode' then begin
      ti:=m_pm_main.Items[i];
      for j:=0 to ti.Count-1 do begin
        if ti.Items[j].Name='mnModeMaximized' then
             ti.Items[j].Checked:=m_view_maximized;
        if ti.Items[j].Name='mnModeShowContent' then
             ti.Items[j].Checked:=not m_view_maximized and (m_view_mode<>3);
        if ti.Items[j].Name='mnMode2Panel' then
             ti.Items[j].Checked:=not m_view_maximized and (m_view_mode=3);
      end;
    end;
  end;
end;

procedure TfmTwoPanelControl.menu_action_set_mode_maximized(Sender: TObject);
var
  tag:integer;
begin
  tag:=GetFocusTag;
  SetViewMode(tag,true);
end;


procedure TfmTwoPanelControl.menu_action_set_mode_show_content(Sender: TObject);
var
  tag:integer;
  PTI:TPanelTagInfo;
begin
  tag:=GetFocusTag;
  PTI:=GetTagPTI(tag);
  SetViewMode(tag,false);
  DsuAfterScroll(PTI.dsu);
  FormResize(sender);
end;

procedure TfmTwoPanelControl.menu_action_set_mode_2_panel(Sender: TObject);
begin
  SetViewMode(3,false);
  FormResize(sender);
end;

procedure TfmTwoPanelControl.menu_action_choose_the_same(Sender: TObject);
var
  tag :integer;
  PTI:TPanelTagInfo;
begin
  tag:=GetFocusTag;
  PTI:=GetTagPTI(tag);
  SetPanelClass(GetAnotherTag(tag),PTI.class_id);
end;


procedure TfmTwoPanelControl.dbg_main_key_down(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN: begin
    DbgDblClick(sender);
    Exit;
    end;
  VK_BACK:begin
    ClassUp(sender);
    Exit;
    end;
  VK_TAB: begin
    abort;
  end;
  end;
  inherited

end;


procedure TfmTwoPanelControl.dbg_main_cell_click(Column: TColumnEh);
var
  ds:TDataSet;
  cg:TDBGridEh;
begin
  cg:=(Column.Grid as TDbGridEh);
  ds:=cg.DataSource.DataSet;
  ds.AfterScroll(ds);
end;

function TfmTwoPanelControl.get_last_scrool_tag(tag_:integer):integer;
begin
  result:=m_last_scrool_tag[tag_]
end;

procedure TfmTwoPanelControl.set_last_scrool_tag(tag_:integer;value_:longint);
begin
  m_last_scrool_tag[tag_]:=value_
end;

procedure TfmTwoPanelControl.DsuAfterScroll(DataSet_: TDataSet);  // �������� ����� ������ ��������� dataset
var
  PTI:TPanelTagInfo;
  tag:integer;
begin
  if IgnoreDSUScroolEvent then
    exit;

  if not DataSet_.Active then
    exit;

  if ViewMaximized or (ViewMode=3) then
    Exit;

  tag:=DataSet_.tag;
  PTI:=GetTagPTI(tag);

  if tag<>ViewMode then
    exit;

  if PTI.dbg.SearchPanel.Active then
     exit;

  if get_last_scrool_tag(tag)=DataSet_['id'] then
     exit
  else
     set_last_scrool_tag(tag,DataSet_['id']);

  DsuAfterScroolHandle(DataSet_);

end;

function TfmTwoPanelControl.GetCurClass:longint;
begin
  case ViewMode of
  0:Result:=self.ClassLeftId;
  1:Result:=self.ClassRightId;
  3:Result:=self.m_last_class_id;
  end;
end;




begin
end.
