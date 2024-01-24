object fmKeywordCommander: TfmKeywordCommander
  Left = 0
  Top = 0
  Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
  ClientHeight = 508
  ClientWidth = 892
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
  object gbLeft: TGroupBox
    Left = 0
    Top = 0
    Width = 409
    Height = 473
    TabOrder = 0
    object pnLeftCont: TPanel
      Left = 4
      Top = 153
      Width = 389
      Height = 320
      TabOrder = 1
      Visible = False
      object dbgLeftNotes: TDBGridEh
        Left = 3
        Top = 99
        Width = 300
        Height = 150
        TabStop = False
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsLeftNote
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ReadOnly = True
        RowHeight = 4
        RowLines = 1
        RowSizingAllowed = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        OnDblClick = dbgRightnotesDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ImageList = fmmain.TreeImage
            MinWidth = 50
            ShowImageAndText = True
            Width = 222
            OnGetCellParams = dbgRightnotesColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'subname'
            Footers = <>
            ImageList = fmmain.TreeImage
            MinWidth = 50
            ShowImageAndText = True
            Width = 321
            OnGetCellParams = dbgRightnotesColumns1GetCellParams
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbrLeftNoteCont: TDBRichEditEh
        Left = 7
        Top = 254
        Width = 346
        Height = 45
        TabStop = False
        Color = 15202559
        DataField = 'content'
        DataSource = dsLeftNote
        EditButtons = <>
        ParentFont = True
        ReadOnly = True
        TabOrder = 1
        OnEnter = dbrLeftNoteContEnter
        OnExit = dbrRightNoteContExit
        OnMouseUp = dbrLeftNoteContMouseUp
      end
      object memLeft: TMemo
        Left = 305
        Top = 110
        Width = 81
        Height = 89
        TabOrder = 2
        Visible = False
      end
      object memLeftKWDef: TMemo
        Left = 304
        Top = 3
        Width = 59
        Height = 81
        ReadOnly = True
        TabOrder = 3
        Visible = False
      end
    end
    object dbgKWLeft: TDBGridEh
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 236
      Height = 127
      AutoFitColWidths = True
      DataSource = dsKeywordLeft
      DrawMemoText = True
      DynProps = <>
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
      PopupMenu = pmMain
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      RowSizingAllowed = True
      SearchPanel.SearchScope = gssCurrentColumnEh
      SelectionDrawParams.SelectionStyle = gsdsClassicEh
      TabOrder = 0
      TitleParams.RowLines = -1
      OnDblClick = DbgDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          ImageList = fmmain.TreeImage
          ShowImageAndText = True
          Width = 120
          WordWrap = True
          OnGetCellParams = dbgKWLeftColumns0GetCellParams
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'class_name_after'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10526880
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Visible = False
          Width = 120
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object gbRight: TGroupBox
    Left = 471
    Top = -2
    Width = 413
    Height = 475
    TabOrder = 1
    object pnRightCont: TPanel
      Tag = 1
      Left = 3
      Top = 153
      Width = 400
      Height = 300
      TabOrder = 1
      Visible = False
      object dbgRightnotes: TDBGridEh
        Tag = 1
        Left = 3
        Top = 109
        Width = 310
        Height = 123
        TabStop = False
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsRightnote
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ReadOnly = True
        RowHeight = 4
        RowLines = 1
        RowSizingAllowed = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        OnDblClick = dbgRightnotesDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ImageList = fmmain.TreeImage
            MinWidth = 50
            ShowImageAndText = True
            Width = 157
            OnGetCellParams = dbgRightnotesColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'subname'
            Footers = <>
            ImageList = fmmain.TreeImage
            MinWidth = 50
            ShowImageAndText = True
            Width = 157
            OnGetCellParams = dbgRightnotesColumns1GetCellParams
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbrRightNoteCont: TDBRichEditEh
        Tag = 1
        Left = 3
        Top = 238
        Width = 366
        Height = 50
        TabStop = False
        Color = 15202559
        DataField = 'content'
        DataSource = dsRightnote
        EditButtons = <>
        ParentFont = True
        ReadOnly = True
        TabOrder = 1
        OnEnter = dbrLeftNoteContEnter
        OnExit = dbrRightNoteContExit
        OnMouseUp = dbrLeftNoteContMouseUp
      end
      object memRight: TMemo
        Left = 319
        Top = 109
        Width = 65
        Height = 89
        TabOrder = 2
        Visible = False
      end
      object memRightKWDef: TMemo
        Left = 320
        Top = 11
        Width = 57
        Height = 81
        ReadOnly = True
        TabOrder = 3
        Visible = False
      end
    end
    object dbgKWRight: TDBGridEh
      Tag = 1
      Left = 2
      Top = 15
      Width = 296
      Height = 133
      AutoFitColWidths = True
      DataSource = dsKeywordRight
      DrawMemoText = True
      DynProps = <>
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
      PopupMenu = pmMain
      ReadOnly = True
      RowHeight = 4
      RowLines = 1
      RowSizingAllowed = True
      SearchPanel.SearchScope = gssCurrentColumnEh
      SelectionDrawParams.SelectionStyle = gsdsClassicEh
      TabOrder = 0
      TitleParams.RowLines = -1
      OnDblClick = DbgDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          ImageList = fmmain.TreeImage
          ShowImageAndText = True
          Width = 120
          OnGetCellParams = dbgKWLeftColumns0GetCellParams
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'class_name_after'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 10526880
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Footers = <>
          Visible = False
          Width = 120
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object fdqKeywordLeft: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from tmp_left_keyword'
      'where 1=1')
    Left = 46
    Top = 29
    object fdqKeywordLeftid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqKeywordLeftclass_keyword_id: TIntegerField
      FieldName = 'class_keyword_id'
      Origin = 'class_keyword_id'
      Required = True
    end
    object fdqKeywordLeftis_dir: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1072#1087#1082#1072'?'
      FieldName = 'is_dir'
      Origin = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqKeywordLeftdate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqKeywordLeftorder_: TIntegerField
      FieldName = 'order_'
    end
    object fdqKeywordLefttype_: TIntegerField
      FieldName = 'type_'
    end
    object fdqKeywordLeftnote_cnt: TIntegerField
      FieldName = 'note_cnt'
    end
    object fdqKeywordLeftsubfolder_cnt: TIntegerField
      FieldName = 'subfolder_cnt'
    end
    object fdqKeywordLeftname: TWideMemoField
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name'
      BlobType = ftWideMemo
      Size = 100
    end
    object fdqKeywordLeftclass_name_after: TWideMemoField
      FieldName = 'class_name_after'
      BlobType = ftWideMemo
      Size = 250
    end
    object fdqKeywordLeftsource_cnt: TIntegerField
      FieldName = 'source_cnt'
    end
    object fdqKeywordLeftdef: TWideMemoField
      FieldName = 'def'
      BlobType = ftWideMemo
      Size = 400
    end
    object fdqKeywordLeftinterest_count: TIntegerField
      FieldName = 'interest_count'
    end
    object fdqKeywordLeftclass_name_before: TWideMemoField
      FieldName = 'class_name_before'
      BlobType = ftWideMemo
      Size = 250
    end
  end
  object dsKeywordLeft: TDataSource
    DataSet = mteKeywordLeft
    Left = 241
    Top = 55
  end
  object pmMain: TPopupMenu
    OwnerDraw = True
    OnPopup = pmMainPopup
    Left = 376
    Top = 16
    object mnMode: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      object mnModeShowContent: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1084#1077#1090#1082#1080
        ShortCut = 16465
      end
      object mnModeMaximized: TMenuItem
        Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1085#1072' '#1074#1089#1077' '#1086#1082#1085#1086
        ShortCut = 16437
      end
      object mnMode2Panel: TMenuItem
        Caption = #1044#1074#1091#1087#1072#1085#1077#1083#1100#1085#1099#1081' '#1088#1077#1078#1080#1084
        ShortCut = 16434
      end
    end
    object mnChangePanel: TMenuItem
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1087#1072#1085#1077#1083#1080' '#1084#1077#1089#1090#1072#1084#1080
      ShortCut = 16469
    end
    object mnChooseTheSame: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089' '#1076#1088#1091#1075#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1090#1072#1082#1086#1081' '#1078#1077' '#1082#1072#1090#1072#1083#1086#1075
      ShortCut = 16467
    end
    object mnShowIer: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074' '#1080#1077#1088#1072#1088#1093#1080#1080
      ShortCut = 16453
      OnClick = mnShowIerClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnAddClick
    end
    object mnEditEh: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16397
      OnClick = mnEditEhClick
    end
    object mnDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnDelClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnMove: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
      ShortCut = 117
      OnClick = mnMoveClick
    end
    object mnMakeSynonym: TMenuItem
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086' '#1089#1080#1085#1086#1085#1080#1084#1086#1084' '#1076#1088#1091#1075#1086#1075#1086
      ShortCut = 16473
      OnClick = mnMakeSynonymClick
    end
    object mnJoin: TMenuItem
      Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1089' '#1076#1088#1091#1075#1080#1084' '#1082#1083#1102#1095#1077#1074#1099#1084' '#1089#1083#1086#1074#1086#1084
      ShortCut = 16458
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mnUp: TMenuItem
      Caption = #1042#1099#1096#1077
      ShortCut = 16456
    end
    object mnDown: TMenuItem
      Caption = #1053#1080#1078#1077
      ShortCut = 16450
    end
    object mnSortAlhaBet: TMenuItem
      Caption = #1042#1077#1088#1085#1091#1090#1100' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1091' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnUpLevel: TMenuItem
      Caption = #1055#1086#1076#1085#1103#1090#1100' '#1074#1074#1077#1088#1093' '#1087#1086' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1102
    end
    object mnDownLevel: TMenuItem
      Caption = #1054#1087#1091#1089#1090#1080#1090#1100' '#1074#1085#1080#1079' '#1087#1086' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1102
    end
    object mnMoveToAny: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1083#1100#1085#1099#1081' '#1091#1088#1086#1074#1077#1085#1100
      ShortCut = 16461
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnRunProc: TMenuItem
      Caption = '... '#1080' '#1086#1089#1090#1072#1090#1100#1089#1103
    end
    object mnRunProcClose: TMenuItem
      Caption = '... '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object mnKWAnalize: TMenuItem
      Caption = #1040#1085#1072#1083#1080#1079' '#1079#1072#1084#1077#1090#1086#1082' '#1087#1086' '#1089#1083#1086#1074#1091
      ShortCut = 16449
    end
    object mnNoteAdd: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1084#1077#1090#1082#1091' '#1087#1086' '#1082#1083#1102#1095#1077#1074#1086#1084#1091' '#1089#1083#1086#1074#1091
      ShortCut = 16462
      OnClick = mnNoteAddClick
    end
    object mnFind: TMenuItem
      Caption = #1055#1086#1080#1089#1082#1072#1090#1100' '#1074' '#1048#1085#1090#1077#1088#1085#1077#1090
      ShortCut = 16455
      OnClick = mnFindClick
    end
  end
  object fdqKeywordRight: TFDQuery
    Tag = 1
    Connection = DM.sqlc
    FetchOptions.AssignedValues = [evAutoFetchAll]
    SQL.Strings = (
      'select * from tmp_right_keyword'
      'where 1=1')
    Left = 504
    Top = 32
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'class_keyword_id'
      Origin = 'class_keyword_id'
      Required = True
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1072#1087#1082#1072'?'
      FieldName = 'is_dir'
      Origin = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object IntegerField3: TIntegerField
      FieldName = 'order_'
    end
    object IntegerField4: TIntegerField
      FieldName = 'type_'
    end
    object fdqKeywordRightnote_cnt: TIntegerField
      FieldName = 'note_cnt'
    end
    object fdqKeywordRightsubfolder_cnt: TIntegerField
      FieldName = 'subfolder_cnt'
    end
    object fdqKeywordRightname: TWideMemoField
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name'
      BlobType = ftWideMemo
      Size = 100
    end
    object fdqKeywordRightclass_name_after: TWideMemoField
      FieldName = 'class_name_after'
      BlobType = ftWideMemo
      Size = 250
    end
    object fdqKeywordRightsource_cnt: TIntegerField
      FieldName = 'source_cnt'
    end
    object fdqKeywordRightdef: TWideMemoField
      FieldName = 'def'
      BlobType = ftWideMemo
      Size = 400
    end
    object fdqKeywordRightinterest_count: TIntegerField
      FieldName = 'interest_count'
    end
    object fdqKeywordRightclass_name_before: TWideMemoField
      FieldName = 'class_name_before'
      BlobType = ftWideMemo
      Size = 250
    end
  end
  object dsKeywordRight: TDataSource
    Tag = 1
    DataSet = mteKeywordRight
    Left = 712
    Top = 40
  end
  object dsRightnote: TDataSource
    DataSet = mteRightNote
    Left = 720
    Top = 288
  end
  object fdqRightnote: TFDQuery
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from tmp_right_keyword_cont'
      'order by name,subname')
    Left = 536
    Top = 296
    object fdqRightnoteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqRightnotetype_: TIntegerField
      FieldName = 'type_'
      Origin = 'type_'
      Required = True
    end
    object fdqRightnotecont_id: TIntegerField
      FieldName = 'cont_id'
      Origin = 'cont_id'
      Required = True
    end
    object fdqRightnotename: TWideMemoField
      DisplayLabel = #1056#1072#1079#1076#1077#1083
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object fdqRightnotecontent: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      BlobType = ftWideMemo
    end
    object fdqRightnotesource_type: TIntegerField
      FieldName = 'source_type'
      Origin = 'source_type'
    end
    object fdqRightnotesubtype: TIntegerField
      FieldName = 'subtype'
      Origin = 'subtype'
    end
    object fdqRightnoteattach_cnt: TIntegerField
      FieldName = 'attach_cnt'
      Origin = 'attach_cnt'
    end
    object fdqRightnoteurl_cnt: TIntegerField
      FieldName = 'url_cnt'
      Origin = 'url_cnt'
    end
    object fdqRightnotelink_cnt: TIntegerField
      FieldName = 'link_cnt'
      Origin = 'link_cnt'
    end
    object fdqRightnotesubname: TWideMemoField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083
      FieldName = 'subname'
      BlobType = ftWideMemo
      Size = 1000
    end
  end
  object dsLeftNote: TDataSource
    DataSet = mteLeftNote
    Left = 207
    Top = 304
  end
  object FDQTmpKeywordFill: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'insert into %s (id, name, class_keyword_id, date_time_create, or' +
        'der_ , is_dir, type_, note_cnt, source_cnt, subfolder_cnt, class' +
        '_name_after, def, interest_count, class_name_before)'
      ''
      
        'select -3 as id ,'#39' ...'#39' as name_main,:CKW class_keyword_id, date' +
        'time() as date_time_create, -100 order_, 1 as is_dir, 0 as type_' +
        ', '
      
        '    0 as all_cnt,  0 as source_cnt, 0 as subfolder_cnt, '#39#39' as cl' +
        'ass_name_after, '#39#39' as def, 0 as interest_count, '#39#39' as class_name' +
        '_before'
      'where :CKW<>0'
      ''
      'union all'
      ''
      
        'select -1 as id ,'#39#1042#1089#1077' '#1082#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072' '#1087'/'#1087#39' as name_main,:CKW clas' +
        's_keyword_id, datetime() as date_time_create, -100 order_, 1 as ' +
        'is_dir, 0 as type_, '
      
        '    0 as all_cnt, 0 as source_cnt, 0 as subfolder_cnt, '#39#39' as cla' +
        'ss_name_after , '#39#39' as def, 0 as interest_count, '#39#39' as class_name' +
        '_before'
      
        'where :CKW=0 and exists (select * from keyword where class_keywo' +
        'rd_id<>:CKW) and :KWUT=1'
      ''
      'union all'
      ''
      
        'select -4 as id ,'#39#1054#1084#1086#1085#1080#1084#1099' ('#1076#1091#1073#1083#1080')'#39' as name_main,:CKW class_keywo' +
        'rd_id, datetime() as date_time_create, -100 order_, 1 as is_dir,' +
        ' 0 as type_, '
      
        '    0 as all_cnt, 0 as source_cnt, 0 as subfolder_cnt, '#39#39' as cla' +
        'ss_name_after , '#39#39' as def, 0 as interest_count, '#39#39' as class_name' +
        '_before'
      
        'where :CKW=0 and exists (select * from keyword where (select cou' +
        'nt(*) from keyword k where k.name_main=keyword.name_main)>=2) an' +
        'd :KWUT=1'
      ''
      'union all'
      ''
      ''
      'select'
      'id, name_w_synonym, class_keyword_id, date_time_create, order_,'
      
        '(case when (select count(*) from keyword k where class_keyword_i' +
        'd=keyword.id)=0 then 0 else 1 end) as "is_dir::INT",'
      
        '(select count(*) from tmp_filter_keyword_out where keyword_id=ke' +
        'yword.id and type_=1) as "type_::INT",'
      'all_use_count as "all_cnt::INT",'
      
        '(select count(*) from source_keyword where keyword_id=keyword.id' +
        ') as "source_cnt::INT",'
      
        '(select count(*) from keyword ks, keyword kss  where ks.class_ke' +
        'yword_id=keyword.id and kss.class_keyword_id=ks.id ) as "subfold' +
        'er_cnt::INT",'
      'class_name_after, note as def,'
      '(select count(*) from note_keyword '
      
        'where keyword_id in (select keyword_id from interest_keyword whe' +
        're interest_id in (select ik.interest_id from interest_keyword i' +
        'k where ik.keyword_id=keyword.id) and keyword_id<>keyword.id) '
      
        'and not exists (select * from note_keyword nk where keyword_id=k' +
        'eyword.id and note_id=note_keyword.note_id )) as "interest_count' +
        '::INT", '
      'class_name_before'
      ''
      'from keyword '
      
        'where (class_keyword_id=:CKW or :CKW=-1) or (:CKW=-4 and (select' +
        ' count(*) from keyword k where k.name_main=keyword.name_main)>=2' +
        ')')
    Left = 376
    Top = 80
    ParamData = <
      item
        Name = 'CKW'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'KWUT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField3: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField6: TIntegerField
      FieldName = 'class_keyword_id'
      Origin = 'class_keyword_id'
      Required = True
    end
    object IntegerField7: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1072#1087#1082#1072'?'
      FieldName = 'is_dir'
      Origin = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object IntegerField8: TIntegerField
      FieldName = 'order_'
    end
    object IntegerField9: TIntegerField
      FieldName = 'type_'
    end
    object WideMemoField1: TWideMemoField
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name_main'
      BlobType = ftWideMemo
      Size = 250
    end
    object IntegerField11: TIntegerField
      FieldName = 'subfolder_cnt'
    end
    object FDQTmpKeywordFillclass_name_after: TWideMemoField
      FieldName = 'class_name_after'
      BlobType = ftWideMemo
      Size = 250
    end
    object FDQTmpKeywordFillall_cnt: TIntegerField
      FieldName = 'all_cnt'
    end
  end
  object dsdeKeywordLeft: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = fdqKeywordLeft
    Left = 106
    Top = 53
  end
  object mteKeywordLeft: TMemTableEh
    AutoCalcFields = False
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeKeywordLeft
    Left = 174
    Top = 30
  end
  object dsdeKeywordRight: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = fdqKeywordRight
    Left = 566
    Top = 48
  end
  object mteKeywordRight: TMemTableEh
    Tag = 1
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeKeywordRight
    Left = 631
    Top = 32
  end
  object mteLeftNote: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeKeftNote
    AfterScroll = mteLeftNoteAfterScroll
    Left = 144
    Top = 288
  end
  object dsdeKeftNote: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = fdqLeftNote
    Left = 87
    Top = 305
  end
  object mteRightNote: TMemTableEh
    Tag = 1
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeRightNote
    AfterScroll = mteLeftNoteAfterScroll
    Left = 648
    Top = 296
  end
  object dsdeRightNote: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = fdqRightnote
    Left = 584
    Top = 317
  end
  object fdqLeftNote: TFDQuery
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from tmp_left_keyword_cont'
      'order by name,subname')
    Left = 32
    Top = 296
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'type_'
      Origin = 'type_'
      Required = True
    end
    object IntegerField10: TIntegerField
      FieldName = 'cont_id'
      Origin = 'cont_id'
      Required = True
    end
    object WideMemoField2: TWideMemoField
      DisplayLabel = #1056#1072#1079#1076#1077#1083
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object WideMemoField3: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      BlobType = ftWideMemo
    end
    object IntegerField12: TIntegerField
      FieldName = 'source_type'
      Origin = 'source_type'
    end
    object IntegerField13: TIntegerField
      FieldName = 'subtype'
      Origin = 'subtype'
    end
    object IntegerField14: TIntegerField
      FieldName = 'attach_cnt'
      Origin = 'attach_cnt'
    end
    object IntegerField15: TIntegerField
      FieldName = 'url_cnt'
      Origin = 'url_cnt'
    end
    object IntegerField16: TIntegerField
      FieldName = 'link_cnt'
      Origin = 'link_cnt'
    end
    object WideMemoField4: TWideMemoField
      DisplayLabel = #1055#1086#1076#1088#1072#1079#1076#1077#1083
      FieldName = 'subname'
      BlobType = ftWideMemo
      Size = 1000
    end
  end
end
