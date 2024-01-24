object fmNoteList: TfmNoteList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1084#1077#1090#1086#1082'/'#1080#1076#1077#1081
  ClientHeight = 390
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNoteList: TDBGridEh
    Left = 0
    Top = 91
    Width = 513
    Height = 299
    Align = alLeft
    AllowedOperations = []
    AutoFitColWidths = True
    ColumnDefValues.EndEllipsis = True
    ColumnDefValues.Title.EndEllipsis = True
    ColumnDefValues.Title.TitleButton = True
    ColumnDefValues.Title.ToolTips = True
    ColumnDefValues.ToolTips = True
    Ctl3D = False
    DataSource = dsNote
    DrawGraphicData = True
    DrawMemoText = True
    DynProps = <>
    Flat = True
    GridLineParams.DataHorzLines = True
    GridLineParams.DataVertLines = False
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentCtl3D = False
    ParentShowHint = False
    PopupMenu = pmNoteList
    ReadOnly = True
    RowHeight = 5
    RowLines = 1
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    SelectionDrawParams.DrawFocusFrame = True
    SelectionDrawParams.DrawFocusFrameStored = True
    ShowHint = True
    TabOrder = 0
    TitleParams.FillStyle = cfstGradientEh
    TitleParams.HorzLines = True
    TitleParams.Images = fmmain.TreeImage
    TitleParams.RowHeight = 5
    TitleParams.RowLines = 1
    TitleParams.VTitleMargin = 0
    OnDblClick = dbgNoteListDblClick
    OnKeyDown = dbgNoteListKeyDown
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ImageList = fmmain.TreeImage
        ShowImageAndText = True
        Width = 475
        OnGetCellParams = dbgNoteListColumns0GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'attachcount'
        Footers = <>
        ImageList = fmmain.TreeImage
        MaxWidth = 20
        MinWidth = 20
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1081#1083#1099
        Title.Hint = #1055#1088#1080#1089#1086#1077#1076#1080#1085#1077#1085#1085#1099#1077' '#1092#1072#1081#1083#1099
        Title.ImageIndex = 41
        Width = 20
        OnGetCellParams = dbgNoteListColumns1GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'urlcount'
        Footers = <>
        ImageList = fmmain.TreeImage
        MaxWidth = 20
        MinWidth = 20
        Title.Alignment = taCenter
        Title.Caption = 'WEB-'#1089#1089#1099#1083#1082#1080
        Title.Hint = 'WEB-'#1089#1089#1099#1083#1082#1080
        Title.ImageIndex = 43
        Width = 20
        OnGetCellParams = dbgNoteListColumns2GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'lkcount'
        Footers = <>
        ImageList = fmmain.TreeImage
        MaxWidth = 20
        MinWidth = 20
        Title.Alignment = taCenter
        Title.Hint = #1057#1074#1103#1079#1080' '#1084#1077#1078#1076#1091' '#1079#1072#1084#1077#1090#1082#1072#1084#1080
        Title.ImageIndex = 42
        Width = 20
        OnGetCellParams = dbgNoteListColumns3GetCellParams
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnRight: TGroupBox
    Left = 513
    Top = 91
    Width = 381
    Height = 299
    Align = alClient
    TabOrder = 1
    object reLinks: TRichEdit
      Left = 2
      Top = 15
      Width = 377
      Height = 74
      Align = alTop
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'reLinks')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Zoom = 100
    end
    object gbFastNote: TGroupBox
      Left = 2
      Top = 89
      Width = 377
      Height = 72
      Align = alTop
      Caption = #1041#1099#1089#1090#1088#1072#1103' '#1079#1072#1084#1077#1090#1082#1072
      TabOrder = 1
      object dbmFastNote: TDBMemo
        Left = 2
        Top = 15
        Width = 373
        Height = 55
        Align = alClient
        Color = clInfoBk
        DataField = 'fast_text'
        DataSource = dsNote
        TabOrder = 0
      end
    end
    object gbOriginal: TGroupBox
      Left = 2
      Top = 161
      Width = 145
      Height = 136
      Align = alLeft
      Caption = #1054#1088#1080#1075#1080#1085#1072#1083
      TabOrder = 2
      object dbmOriginal: TDBMemo
        Left = 2
        Top = 15
        Width = 141
        Height = 119
        Align = alClient
        Color = clInfoBk
        DataField = 'original_text'
        DataSource = dsNote
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object gbRightIdea: TGroupBox
      Left = 147
      Top = 161
      Width = 232
      Height = 136
      Align = alClient
      Caption = #1057#1091#1090#1100' '#1080#1076#1077#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      object dbrIdea: TDBRichEditEh
        Left = 2
        Top = 15
        Width = 228
        Height = 119
        Align = alClient
        Color = clInfoBk
        Ctl3D = True
        DataField = 'content'
        DataSource = dsNote
        EditButtons = <>
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HideScrollBars = False
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnEnter = dbrIdeaEnter
        OnMouseDown = dbrIdeaMouseDown
        OnMouseUp = dbrIdeaMouseUp
      end
    end
  end
  object pnSearch: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 91
    Align = alTop
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object lbSource: TLabel
      Left = 5
      Top = 35
      Width = 73
      Height = 13
      Caption = #1055#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1091':'
    end
    object clbFindItem: TCheckListBox
      Left = 425
      Top = 7
      Width = 350
      Height = 68
      Columns = 2
      ItemHeight = 13
      Items.Strings = (
        #1055#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1079#1072#1084#1077#1090#1082#1080
        #1055#1086' '#1090#1077#1082#1089#1090#1091' '#1079#1072#1084#1077#1090#1082#1080
        #1055#1086' '#1090#1077#1082#1089#1090#1091' '#1073#1099#1089#1090#1088#1086#1081' '#1079#1072#1084#1077#1090#1082#1080
        #1055#1086' '#1089#1090#1088#1086#1082#1072#1084' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
        #1055#1086' '#1082#1083#1102#1095#1077#1074#1086#1084#1091' '#1089#1083#1086#1074#1091
        #1055#1086' '#1089#1089#1099#1083#1082#1077' '#1085#1072' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1077
        #1055#1086' ID '#1079#1072#1084#1077#1090#1082#1080)
      TabOrder = 0
    end
    object leFindStr: TLabeledEdit
      Left = 127
      Top = 6
      Width = 274
      Height = 21
      EditLabel.Width = 119
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1076#1089#1090#1088#1086#1082#1072' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072':'
      LabelPosition = lpLeft
      TabOrder = 1
      OnKeyPress = leFindStrKeyPress
    end
    object dblSource: TDBLookupComboboxEh
      Left = 84
      Top = 32
      Width = 317
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.Rows = 19
      DropDownBox.SpecRow.CellsText = ' '
      DropDownBox.SpecRow.ShortCut = 16430
      DropDownBox.SpecRow.Value = '0'
      DropDownBox.SpecRow.Visible = True
      DropDownBox.Width = 600
      EditButtons = <>
      KeyField = 'id'
      ListField = 'fullname'
      TabOrder = 2
      Visible = True
    end
    object cbUseCase: TCheckBox
      Left = 5
      Top = 58
      Width = 193
      Height = 17
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1088#1077#1075#1080#1089#1090#1088' '#1087#1088#1080' '#1087#1086#1080#1089#1082#1077'?'
      TabOrder = 3
    end
    object btFind: TButton
      Left = 326
      Top = 58
      Width = 75
      Height = 25
      Caption = #1048#1089#1082#1072#1090#1100
      TabOrder = 4
      OnClick = btFindClick
    end
    object btFindCancel: TButton
      Left = 235
      Top = 58
      Width = 82
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 34
      Images = fmmain.TreeImage
      TabOrder = 5
      Visible = False
      OnClick = btFindCancelClick
    end
  end
  object pmNoteList: TPopupMenu
    OnPopup = pmNoteListPopup
    Left = 440
    Top = 120
    object mnViewMode: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      object mnViewModeSimple: TMenuItem
        Caption = #1058#1086#1083#1100#1082#1086' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1084#1077#1090#1086#1082
        ShortCut = 16437
        OnClick = mnViewModeSimpleClick
      end
      object mnViewCont: TMenuItem
        Tag = 1
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1090#1077#1082#1091#1097#1077#1081' '#1079#1072#1084#1077#1090#1082#1080
        ShortCut = 16465
        OnClick = mnViewModeSimpleClick
      end
    end
    object mnSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object mnSortDate: TMenuItem
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortDateClick
      end
      object mnSortDateDesc: TMenuItem
        Tag = 1
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortDateClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnSortdateUp: TMenuItem
        Tag = 2
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortDateClick
      end
      object mnSortdateUpDesc: TMenuItem
        Tag = 3
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortDateClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnSortName: TMenuItem
        Tag = 4
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102'  '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortDateClick
      end
      object mnSortNameDesc: TMenuItem
        Tag = 5
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102'  '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortDateClick
      end
    end
    object mnSearchPossible: TMenuItem
      Caption = #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080' '#1087#1086#1080#1089#1082#1072
      object mnSearchOff: TMenuItem
        Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1086
        OnClick = mnSearchOffClick
      end
      object mnSearchFast: TMenuItem
        Tag = 1
        Caption = #1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082
        OnClick = mnSearchOffClick
      end
      object mnSearchFull: TMenuItem
        Tag = 2
        Caption = #1055#1086#1083#1085#1099#1081' '#1087#1086#1080#1089#1082
        OnClick = mnSearchOffClick
      end
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnNoteAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1084#1077#1090#1082#1091'/'#1080#1076#1077#1102
      ShortCut = 16429
      OnClick = mnNoteAddClick
    end
    object mnNoteDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1084#1077#1090#1082#1091
      ShortCut = 16430
    end
    object mnNoteGoto: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1084#1077#1090#1082#1080' ('#1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1100#1102')'
      ShortCut = 16397
    end
  end
  object fdqNote: TFDQuery
    AfterScroll = fdqNoteAfterScroll
    IndexesActive = False
    Connection = DM.sqlc
    SQL.Strings = (
      'select nn.*,'
      
        '(select count(*) from note_link where nn.id =note1_id) "lkcount:' +
        ':INT",'
      
        '(select count(*) from note_attach where nn.id =note_id) "attachc' +
        'ount::INT",'
      
        '(select count(*) from note_source where nn.id =note_id) "srccoun' +
        't::INT",'
      
        '(select count(*) from note_url where nn.id =note_id) "urlcount::' +
        'INT",'
      
        '(select GROUP_CONCAT(distinct is_mine) from note_source, source ' +
        'where note_id=nn.id and note_source.source_id=source.id ) "ntype' +
        '::TEXT"'
      'from note nn'
      'where 1=1'
      '')
    Left = 232
    Top = 264
    object fdqNoteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNotesubpart_id: TIntegerField
      FieldName = 'subpart_id'
      Origin = 'subpart_id'
    end
    object fdqNotename: TWideMemoField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1084#1077#1090#1082#1080'/'#1080#1076#1077#1080
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNoteoriginal_text: TWideMemoField
      FieldName = 'original_text'
      Origin = 'original_text'
      BlobType = ftWideMemo
    end
    object fdqNotecontent: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      ReadOnly = True
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNotelkcount: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1057#1074#1103#1079#1080
      FieldName = 'lkcount'
      Origin = 'lkcount'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqNotedate_time_create: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1084#1077#1090#1082#1080
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqNotefast_text: TWideMemoField
      FieldName = 'fast_text'
      Origin = 'fast_text'
      BlobType = ftWideMemo
    end
    object fdqNotenote_show_mode: TIntegerField
      FieldName = 'note_show_mode'
      Origin = 'note_show_mode'
      Required = True
    end
    object fdqNotecontent_plain: TWideMemoField
      FieldName = 'content_plain'
      Origin = 'content_plain'
      BlobType = ftWideMemo
    end
    object fdqNotedate_time_update: TDateTimeField
      FieldName = 'date_time_update'
    end
    object fdqNotentype: TWideMemoField
      FieldName = 'ntype'
      BlobType = ftWideMemo
      Size = 100
    end
    object fdqNoteattachcount: TIntegerField
      FieldName = 'attachcount'
    end
    object fdqNotesrccount: TIntegerField
      FieldName = 'srccount'
    end
    object fdqNoteurlcount: TIntegerField
      FieldName = 'urlcount'
    end
    object fdqNotesplitter_param: TIntegerField
      FieldName = 'splitter_param'
    end
    object fdqNoteform_width: TIntegerField
      FieldName = 'form_width'
    end
  end
  object dsNote: TDataSource
    DataSet = fdqNote
    Left = 280
    Top = 264
  end
end
