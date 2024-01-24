object fmSourceEdit: TfmSourceEdit
  Left = 0
  Top = 0
  Caption = 'fmSourceEdit'
  ClientHeight = 491
  ClientWidth = 875
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
  object pcSource: TPageControl
    Left = 0
    Top = 33
    Width = 875
    Height = 424
    ActivePage = tsMain
    Align = alClient
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = #1043#1083#1072#1074#1085#1072#1103
      ImageIndex = 1
      object lbState: TLabel
        Left = 27
        Top = 40
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077':'
      end
      object lbType: TLabel
        Left = 7
        Top = 15
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = #1058#1080#1087' '#1080#1089#1090#1086#1095#1085#1080#1082#1072':'
      end
      object lbNoteView: TLabel
        Left = 272
        Top = 15
        Width = 118
        Height = 13
        Alignment = taRightJustify
        Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1079#1072#1084#1077#1090#1086#1082':'
      end
      object lbNotes: TLabel
        Left = 272
        Top = 42
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = #1041#1080#1073#1083'.'#1080#1085#1092#1086':'
      end
      object Label1: TLabel
        Left = 2
        Top = 71
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = #1052#1077#1089#1090#1086' '#1085#1072' '#1087#1086#1083#1082#1077':'
      end
      object dblSourceType: TDBLookupComboboxEh
        Left = 91
        Top = 12
        Width = 170
        Height = 21
        DynProps = <>
        DataField = 'source_type_id'
        DataSource = dsSource
        DropDownBox.Rows = 21
        EditButtons = <>
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsSourceType
        TabOrder = 0
        Visible = True
      end
      object dbcStatus: TDBComboBoxEh
        Left = 91
        Top = 37
        Width = 170
        Height = 21
        DataField = 'status'
        DataSource = dsSource
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1053#1077' '#1085#1072#1095#1072#1090#1086
          #1042' '#1087#1088#1086#1094#1077#1089#1089#1077
          #1047#1072#1074#1077#1088#1096#1077#1085)
        KeyItems.Strings = (
          '0'
          '1'
          '3')
        TabOrder = 1
        Visible = True
      end
      object dbcNoteShowMode: TDBComboBoxEh
        Left = 396
        Top = 12
        Width = 292
        Height = 21
        DataField = 'note_show_mode'
        DataSource = dsSource
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1086#1087'.'#1087#1072#1088#1072#1084#1077#1090#1088#1099
          #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1073#1099#1089#1090#1088#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
          #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074#1076#1086#1093#1085#1086#1074#1080#1074#1096#1080#1081' '#1086#1088#1080#1075#1080#1085#1072#1083
          #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1080' '#1073#1099#1089#1090#1088#1091#1102' '#1079#1072#1084#1077#1090#1082#1091' '#1080' '#1086#1088#1080#1075#1080#1085#1072#1083)
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3')
        TabOrder = 2
        Visible = True
      end
      object dbeNotes: TDBEditEh
        Left = 336
        Top = 39
        Width = 352
        Height = 21
        DataField = 'notes'
        DataSource = dsSource
        DynProps = <>
        EditButtons = <>
        TabOrder = 3
        Visible = True
      end
      object dbgAuthor: TDBGridEh
        Left = 8
        Top = 96
        Width = 269
        Height = 95
        AutoFitColWidths = True
        DataSource = dsSourceAuthor
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmAuthor
        ReadOnly = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 4
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'author_name'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbgurl: TDBGridEh
        Left = 283
        Top = 96
        Width = 402
        Height = 95
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsSourceURL
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmUrl
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 5
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'url'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbgKeyword: TDBGridEh
        Left = 9
        Top = 200
        Width = 268
        Height = 108
        AutoFitColWidths = True
        DataSource = dsSourceKeyword
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmKeyword
        ReadOnly = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 6
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ImageList = fmmain.TreeImage
            ShowImageAndText = True
            OnGetCellParams = dbgKeywordColumns0GetCellParams
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbgFiles: TDBGridEh
        Left = 283
        Top = 199
        Width = 402
        Height = 109
        AutoFitColWidths = True
        DataSource = dsSourceAttach
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmAttach
        ReadOnly = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 7
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'filename'
            Footers = <>
            MinWidth = 50
            Width = 323
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'file_size'
            Footers = <>
            MinWidth = 50
            Width = 70
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dblClass: TDBLookupComboboxEh
        Left = 91
        Top = 68
        Width = 597
        Height = 21
        DynProps = <>
        DataField = 'source_classification_id'
        DataSource = dsSource
        DropDownBox.Rows = 14
        EditButtons = <>
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsSourceClassification
        TabOrder = 8
        Visible = True
      end
    end
    object tsSTOC: TTabSheet
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
      ImageIndex = 1
      object gbLeft: TGroupBox
        Left = 0
        Top = 0
        Width = 353
        Height = 396
        Align = alLeft
        TabOrder = 0
        object dbgLeftSTOC: TDBGridEh
          AlignWithMargins = True
          Left = 12
          Top = 304
          Width = 189
          Height = 109
          AutoFitColWidths = True
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dsLeftSTOC
          DrawMemoText = True
          DynProps = <>
          GridLineParams.DataHorzLines = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
          ParentCtl3D = False
          PopupMenu = pmMain
          ReadOnly = True
          RowHeight = 4
          RowLines = 1
          RowSizingAllowed = True
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
              Width = 220
              OnGetCellParams = dbgLeftSTOCColumns0GetCellParams
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnLeftCont: TPanel
          Left = 10
          Top = 7
          Width = 329
          Height = 202
          Padding.Left = 3
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object memLeftLink: TRichEdit
            Left = 4
            Top = 1
            Width = 324
            Height = 40
            Align = alTop
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'memLeftLink')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Zoom = 100
          end
          object pnLeftNote: TPanel
            Left = 4
            Top = 41
            Width = 324
            Height = 160
            Align = alClient
            TabOrder = 1
            object gbLeftFastNote: TGroupBox
              Left = 1
              Top = 1
              Width = 322
              Height = 50
              Align = alTop
              Caption = #1041#1099#1089#1090#1088#1072#1103' '#1079#1072#1084#1077#1090#1082#1072
              TabOrder = 0
              object dbmLeftFastNote: TDBMemo
                Left = 2
                Top = 15
                Width = 318
                Height = 33
                Align = alClient
                Color = clInfoBk
                DataField = 'fast_text'
                DataSource = dsLeftnote
                TabOrder = 0
              end
            end
            object gbLeftIdea: TGroupBox
              Left = 160
              Top = 64
              Width = 169
              Height = 41
              Caption = #1057#1091#1090#1100' '#1080#1076#1077#1080
              TabOrder = 1
              object dbrLeftIdea: TDBRichEditEh
                Left = 2
                Top = 15
                Width = 165
                Height = 24
                Align = alClient
                Color = clInfoBk
                DataField = 'content'
                DataSource = dsLeftnote
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HideScrollBars = False
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 0
                OnEnter = dbrLeftIdeaEnter
                OnExit = dbrLeftIdeaEnter
              end
            end
            object gbLeftOriginal: TGroupBox
              Left = 1
              Top = 51
              Width = 145
              Height = 108
              Align = alLeft
              Caption = #1054#1088#1080#1075#1080#1085#1072#1083
              TabOrder = 2
              object dbmLeftOriginal: TDBMemo
                Left = 2
                Top = 15
                Width = 141
                Height = 91
                Align = alClient
                Color = clInfoBk
                DataField = 'original_text'
                DataSource = dsLeftnote
                TabOrder = 0
              end
            end
          end
          object memLeftDir: TMemo
            Left = 68
            Top = 13
            Width = 191
            Height = 38
            Lines.Strings = (
              'memRightDir')
            TabOrder = 2
          end
          object dbgSTOCKWLeft: TDBGridEh
            Left = 156
            Top = 120
            Width = 145
            Height = 73
            AutoFitColWidths = True
            DataSource = dsSTOCKWLeft
            DrawMemoText = True
            DynProps = <>
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmSTOCKW
            ReadOnly = True
            SelectionDrawParams.SelectionStyle = gsdsClassicEh
            TabOrder = 3
            Visible = False
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'name'
                Footers = <>
                ImageList = fmmain.TreeImage
                ShowImageAndText = True
                OnGetCellParams = dbgSTOCKWLeftColumns0GetCellParams
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'class_name_after'
                Footers = <>
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
      object gbRight: TGroupBox
        Left = 353
        Top = 0
        Width = 514
        Height = 396
        Align = alClient
        TabOrder = 1
        object pnRightCont: TPanel
          Left = 2
          Top = 7
          Width = 510
          Height = 202
          Padding.Left = 3
          ParentBackground = False
          TabOrder = 0
          Visible = False
          object memRightLink: TRichEdit
            Left = 4
            Top = 1
            Width = 505
            Height = 40
            Align = alTop
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              'memRightLink')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Zoom = 100
          end
          object pnRightNote: TPanel
            Left = 4
            Top = 41
            Width = 505
            Height = 160
            Align = alClient
            TabOrder = 1
            object gbRightFastNote: TGroupBox
              Left = 1
              Top = 1
              Width = 503
              Height = 50
              Align = alTop
              Caption = #1041#1099#1089#1090#1088#1072#1103' '#1079#1072#1084#1077#1090#1082#1072
              TabOrder = 0
              object dbmRightFastNote: TDBMemo
                Left = 2
                Top = 15
                Width = 499
                Height = 33
                Align = alClient
                Color = clInfoBk
                DataField = 'fast_text'
                DataSource = dsRightNote
                TabOrder = 0
              end
            end
            object gbRightIdea: TGroupBox
              Left = 160
              Top = 64
              Width = 169
              Height = 41
              Caption = #1057#1091#1090#1100' '#1080#1076#1077#1080
              TabOrder = 1
              object dbrRightIdea: TDBRichEditEh
                Left = 2
                Top = 15
                Width = 165
                Height = 24
                Align = alClient
                Color = clInfoBk
                DataField = 'content'
                DataSource = dsRightNote
                EditButtons = <>
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                HideScrollBars = False
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 0
                OnEnter = dbrRightIdeaEnter
                OnExit = dbrRightIdeaEnter
              end
            end
            object gbRightOriginal: TGroupBox
              Left = 1
              Top = 51
              Width = 145
              Height = 100
              Caption = #1054#1088#1080#1075#1080#1085#1072#1083
              TabOrder = 2
              object dbmRightOriginal: TDBMemo
                Left = 2
                Top = 15
                Width = 141
                Height = 83
                Align = alClient
                Color = clInfoBk
                DataField = 'original_text'
                DataSource = dsRightNote
                TabOrder = 0
              end
            end
          end
          object memRightDir: TMemo
            Left = 121
            Top = 13
            Width = 279
            Height = 38
            Lines.Strings = (
              'memRightDir')
            TabOrder = 2
          end
          object dbgSTOCKWRight: TDBGridEh
            Tag = 1
            Left = 328
            Top = 104
            Width = 145
            Height = 73
            AutoFitColWidths = True
            DataSource = dsSTOCKWRight
            DrawMemoText = True
            DynProps = <>
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            PopupMenu = pmSTOCKW
            ReadOnly = True
            SelectionDrawParams.SelectionStyle = gsdsClassicEh
            TabOrder = 3
            Visible = False
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'name'
                Footers = <>
                ImageList = fmmain.TreeImage
                ShowImageAndText = True
                OnGetCellParams = dbgSTOCKWLeftColumns0GetCellParams
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'class_name_after'
                Footers = <>
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object dbgRightSTOC: TDBGridEh
          Tag = 1
          Left = 13
          Top = 305
          Width = 276
          Height = 120
          AutoFitColWidths = True
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dsRightSTOC
          DrawMemoText = True
          DynProps = <>
          GridLineParams.DataHorzLines = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
          ParentCtl3D = False
          PopupMenu = pmMain
          ReadOnly = True
          RowHeight = 4
          RowLines = 1
          RowSizingAllowed = True
          SelectionDrawParams.SelectionStyle = gsdsClassicEh
          TabOrder = 1
          TitleParams.RowLines = -1
          Visible = False
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
              Width = 220
              OnGetCellParams = dbgLeftSTOCColumns0GetCellParams
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 875
    Height = 33
    Align = alTop
    TabOrder = 1
    object lbName: TLabel
      Left = 8
      Top = 7
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    end
    object dbeName: TDBEditEh
      Left = 66
      Top = 4
      Width = 626
      Height = 21
      DataField = 'name'
      DataSource = dsSource
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 457
    Width = 875
    Height = 34
    Align = alBottom
    TabOrder = 2
    object btOk: TButton
      Left = 270
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btOkClick
    end
    object btRTF: TButton
      Left = 614
      Top = 6
      Width = 75
      Height = 25
      Caption = #1042#1099#1074#1086#1076' '#1074' RTF'
      TabOrder = 1
      OnClick = btRTFClick
    end
  end
  object fdqSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select p.*, source_fullname_by_id(id,1) as "fullname::TEXT"'
      'from source p'
      ''
      '')
    Left = 200
    object fdqSourceid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSourcename: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqSourcenotes: TWideMemoField
      FieldName = 'notes'
      Origin = 'notes'
      BlobType = ftWideMemo
    end
    object fdqSourcesource_type_id: TIntegerField
      FieldName = 'source_type_id'
      Origin = 'source_type_id'
    end
    object fdqSourcedate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqSourcenote_show_mode: TIntegerField
      FieldName = 'note_show_mode'
      Origin = 'note_show_mode'
      Required = True
    end
    object fdqSourcestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object fdqSourcecur_stoc_id: TIntegerField
      FieldName = 'cur_stoc_id'
      Origin = 'cur_stoc_id'
    end
    object fdqSourceis_mine: TIntegerField
      FieldName = 'is_mine'
      Origin = 'is_mine'
      Required = True
    end
    object fdqSourcefullname: TWideMemoField
      FieldName = 'fullname'
      BlobType = ftWideMemo
      Size = 250
    end
    object fdqSourcesource_classification_id: TIntegerField
      FieldName = 'source_classification_id'
    end
    object fdqSourcetelegram_message_id: TWideMemoField
      FieldName = 'telegram_message_id'
      BlobType = ftWideMemo
      Size = 100
    end
    object fdqSourcedate_time_update: TDateTimeField
      FieldName = 'date_time_update'
    end
  end
  object dsSource: TDataSource
    DataSet = fdqSource
    Left = 258
  end
  object fdqLeftSTOC: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select distinct id, name, stoc_id, source_id, order_, is_dir as ' +
        '"is_dir::INT", ntype as "ntype::TEXT", link_cnt as "link_cnt::IN' +
        'T" , linka_cnt as "linka_cnt::INT", attach_cnt as "attach_cnt::I' +
        'NT", url_cnt as "url_cnt::INT"'
      'from ('
      
        '      select -1 as id ,'#39' '#1042#1089#1077' '#1079#1072#1084#1077#1090#1082#1080#39' as name,0 stoc_id,:SID as ' +
        'source_id,-101 as order_, 1 is_dir, '#39' '#39' ntype, 0 link_cnt, 0 lin' +
        'ka_cnt, 0 attach_cnt, 0 url_cnt'
      
        '      where :ST=0 and exists (select * from source_toc where sou' +
        'rce_id=:SID) and exists (select * from note_source where source_' +
        'id=:SID) '
      '      union all '
      ''
      
        '      select -3 as id ,'#39' ...'#39' as name,:ST stoc_id,:SID as source' +
        '_id,-100 as order_, 1 is_dir, '#39' '#39' ntype, 0 link_cnt, 0 linka_cnt' +
        ',0 attach_cnt, 0 url_cnt'
      '      where :ST<>0'
      '      union all'
      ''
      
        '      select note.id, name , stoc_id, source_id, order_, 0 as is' +
        '_dir, '
      
        '           (select GROUP_CONCAT(distinct is_mine) from note_sour' +
        'ce, source where note_id=note.id and note_source.source_id=sourc' +
        'e.id ) ntype,'
      
        '           (select count(*) from note_link where note.id in (not' +
        'e1_id,note2_id)) link_cnt,'
      
        '           (select count(*) from note_link, note_source ns where' +
        ' note.id in (note1_id,note2_id) and ns.note_id in (note1_id,note' +
        '2_id) and ns.source_id<>:SID) linka_cnt,'
      
        '           (select count(*) from note_attach where note.id =note' +
        '_id) attach_cnt,'
      
        '           (select count(*) from note_url where note.id =note_id' +
        ') url_cnt'
      '      from  note_source , note'
      
        '      where  note.id=note_source.note_id and note_source.source_' +
        'id=:SID and (ifnull(note_source.stoc_id,0)=:ST or :ST=-1)'
      '      union all '
      ''
      
        '      select id, name , stoc_id, source_id, order_, 1 is_dir , '#39 +
        ' '#39' ntype, 0 link_cnt, 0 linka_cnt, 0 attach_cnt, 0 url_cnt'
      '      from  source_toc st ) st'
      
        'where (:ST=-1 and is_dir=0 or ifnull(stoc_id,0)=:ST and id<>-3 o' +
        'r id=-3 and :ST<>0) and source_id=:SID %s'
      'order by %s')
    Left = 24
    Top = 371
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ST'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqLeftSTOCid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqLeftSTOCname: TWideMemoField
      DisplayLabel = #1069#1083'-'#1090' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1103'/'#1079#1072#1084#1077#1090#1082#1072
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqLeftSTOCstoc_id: TIntegerField
      FieldName = 'stoc_id'
      Origin = 'stoc_id'
    end
    object fdqLeftSTOCsource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqLeftSTOCorder_: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
    object fdqLeftSTOCis_dir: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'is_dir'
      Origin = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqLeftSTOCntype: TWideMemoField
      FieldName = 'ntype'
      BlobType = ftWideMemo
      Size = 10
    end
    object fdqLeftSTOClink_cnt: TIntegerField
      FieldName = 'link_cnt'
    end
    object fdqLeftSTOCattach_cnt: TIntegerField
      FieldName = 'attach_cnt'
    end
    object fdqLeftSTOClinka_cnt: TIntegerField
      FieldName = 'linka_cnt'
    end
    object fdqLeftSTOCurl_cnt: TIntegerField
      FieldName = 'url_cnt'
    end
  end
  object dsLeftSTOC: TDataSource
    DataSet = mteLeftSTOC
    Left = 24
    Top = 416
  end
  object fdqLeftnote: TFDQuery
    AfterScroll = fdqLeftnoteAfterScroll
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select n.*'
      'from note n'
      'where n.id=:NID'
      '')
    Left = 168
    Top = 368
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqLeftnoteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqLeftnotesubpart_id: TIntegerField
      FieldName = 'subpart_id'
      Origin = 'subpart_id'
    end
    object fdqLeftnotename: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqLeftnoteoriginal_text: TWideMemoField
      FieldName = 'original_text'
      Origin = 'original_text'
      BlobType = ftWideMemo
    end
    object fdqLeftnotecontent: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqLeftnotecontent_plain: TWideMemoField
      FieldName = 'content_plain'
      Origin = 'content_plain'
      BlobType = ftWideMemo
    end
    object fdqLeftnotedate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqLeftnotefast_text: TWideMemoField
      FieldName = 'fast_text'
      Origin = 'fast_text'
      BlobType = ftWideMemo
    end
    object fdqLeftnotenote_show_mode: TIntegerField
      FieldName = 'note_show_mode'
      Origin = 'note_show_mode'
      Required = True
    end
    object fdqLeftnotesplitter_param: TIntegerField
      FieldName = 'splitter_param'
      Origin = 'splitter_param'
    end
    object fdqLeftnoteh_splitter_param: TIntegerField
      FieldName = 'h_splitter_param'
      Origin = 'h_splitter_param'
    end
    object fdqLeftnotedate_time_update: TDateTimeField
      FieldName = 'date_time_update'
      Origin = 'date_time_update'
    end
    object fdqLeftnoteform_width: TIntegerField
      FieldName = 'form_width'
      Origin = 'form_width'
    end
  end
  object dsLeftnote: TDataSource
    DataSet = fdqLeftnote
    Left = 168
    Top = 416
  end
  object pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 744
    object mnMode: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      object mnModeShowContent: TMenuItem
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1086#1076#1077#1088#1078#1080#1084#1086#1077' '#1079#1072#1084#1077#1090#1086#1082
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
    object mnSort: TMenuItem
      Caption = #1042#1072#1088#1080#1072#1085#1090#1099' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
      object mnSortAll: TMenuItem
        Caption = #1055#1072#1087#1082#1080' '#1074#1084#1077#1089#1090#1077' '#1089' '#1079#1072#1084#1077#1090#1082#1072#1084#1080
        OnClick = mnSortAllClick
      end
      object mnSortFolderUp: TMenuItem
        Tag = 1
        Caption = #1055#1072#1087#1082#1080' '#1074#1089#1077#1075#1076#1072' '#1089#1074#1077#1088#1093#1091
        OnClick = mnSortAllClick
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object mnAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1103
      ShortCut = 16462
      OnClick = mnAddClick
    end
    object mnNoteCreate: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1084#1077#1090#1082#1091' '#1082' '#1101#1083#1077#1084#1077#1085#1090#1091' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1103
      ShortCut = 16429
      OnClick = mnNoteCreateClick
    end
    object mnEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16397
      OnClick = mnEditClick
    end
    object mnDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnDelClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object mnChangePanel: TMenuItem
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' '#1087#1072#1085#1077#1083#1080
      ShortCut = 16469
    end
    object mnChooseTheSame: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089' '#1076#1088#1091#1075#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1090#1086#1090' '#1078#1077' '#1082#1072#1090#1072#1083#1086#1075
      ShortCut = 16467
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnMove: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
      ShortCut = 117
      OnClick = mnMoveClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnSortByName: TMenuItem
      Caption = #1055#1077#1088#1077#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
      OnClick = mnSortByNameClick
    end
    object mnUpper: TMenuItem
      Caption = #1042#1099#1096#1077' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
      ShortCut = 16456
      OnClick = mnUpperClick
    end
    object mnDowner: TMenuItem
      Caption = #1053#1080#1078#1077' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091
      ShortCut = 16450
      OnClick = mnDownerClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnFolder2Rtf: TMenuItem
      Caption = #1042#1099#1074#1086#1076' '#1087#1072#1087#1082#1080' '#1074' RTF'
      OnClick = mnFolder2RtfClick
    end
    object mnFolder2RtfWOriginal: TMenuItem
      Caption = #1042#1099#1074#1086#1076' '#1087#1072#1087#1082#1080' '#1074' RTF '#1089' '#1086#1088#1080#1075#1080#1085#1072#1083#1100#1085#1099#1084' '#1090#1077#1082#1089#1090#1086#1084
    end
    object mnMoveStoc: TMenuItem
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1087#1072#1087#1082#1091' '#1074' '#1076#1088#1091#1075#1086#1081' '#1080#1089#1090#1086#1095#1085#1080#1082'/'#1087#1088#1086#1077#1082#1090
    end
  end
  object pmNote: TPopupMenu
    Left = 789
    object mnNoteAdd: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
      ShortCut = 16462
    end
    object mnNoteAttach: TMenuItem
      Caption = #1055#1088#1080#1082#1088#1077#1087#1080#1090#1100' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1091#1102' '#1079#1072#1084#1077#1090#1082#1091' '#1082' '#1101#1083'-'#1090#1091' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1103
      ShortCut = 16449
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object mnNoteUp: TMenuItem
      Caption = #1042#1099#1096#1077
      ShortCut = 16469
    end
    object mnNoteDown: TMenuItem
      Caption = #1053#1080#1078#1077
      ShortCut = 16452
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnNoteDeattach: TMenuItem
      Caption = #1054#1090#1082#1088#1077#1087#1080#1090#1100' '#1079#1072#1084#1077#1090#1082#1091' '#1086#1090' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      ShortCut = 16463
    end
  end
  object pmAuthor: TPopupMenu
    Left = 240
    Top = 160
    object mnAuthorAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1074#1090#1086#1088#1072
      ShortCut = 16429
      OnClick = mnAuthorAddClick
    end
    object mnAuthorDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '
      ShortCut = 16430
      OnClick = mnAuthorDelClick
    end
  end
  object fdqSourceAuthor: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select sa.*, aa.name as "author_name::TEXT" from source_author s' +
        'a, author  aa'
      'where sa.source_id=:SID and aa.id=author_id')
    Left = 128
    Top = 157
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqSourceAuthorid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSourceAuthorsource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqSourceAuthorauthor_id: TIntegerField
      FieldName = 'author_id'
      Origin = 'author_id'
      Required = True
    end
    object fdqSourceAuthorauthor_name: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'author_name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
  end
  object dsSourceAuthor: TDataSource
    DataSet = fdqSourceAuthor
    Left = 128
    Top = 203
  end
  object fdqSourceURL: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from source_url where source_id=:SID order by id')
    Left = 424
    Top = 156
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqSourceURLid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSourceURLsource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqSourceURLurl: TWideMemoField
      FieldName = 'url'
      Origin = 'url'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object dsSourceURL: TDataSource
    DataSet = fdqSourceURL
    Left = 426
    Top = 202
  end
  object pmUrl: TPopupMenu
    Left = 656
    Top = 160
    object mnUrlAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnUrlAddClick
    end
    object mnurldel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnurldelClick
    end
    object mnurledit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16397
      OnClick = mnurleditClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnUrlGo: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1087#1086' '#1089#1089#1099#1083#1082#1077
      ShortCut = 16455
      OnClick = mnUrlGoClick
    end
  end
  object pmKeyword: TPopupMenu
    Left = 240
    Top = 264
    object mnKeywordAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      ShortCut = 16429
      OnClick = mnKeywordAddClick
    end
    object MenuItem1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1077#1088#1072#1088#1093#1080#1095#1077#1089#1082#1080
      ShortCut = 16457
    end
    object mnKeywordDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '
      ShortCut = 16430
      OnClick = mnKeywordDelClick
    end
  end
  object fdqSourceKeyword: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select sk.*, kn.name as "name::TEXT",'
      'keyword_use_count(sk.keyword_id) as "keyword_use_count::INT"'
      ' from source_keyword sk, keyword_name kn'
      ' where source_id=:SID and sk.keyword_name_id=kn.id')
    Left = 127
    Top = 264
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqSourceKeywordkeyword_id: TIntegerField
      FieldName = 'keyword_id'
    end
    object fdqSourceKeywordname: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name'
      Origin = 'name_main'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqSourceKeywordkeyword_use_count: TIntegerField
      FieldName = 'keyword_use_count'
    end
  end
  object dsSourceKeyword: TDataSource
    DataSet = fdqSourceKeyword
    Left = 126
    Top = 314
  end
  object fdqSourceAttach: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select id, source_id, filename, file_size from source_attach whe' +
        're source_id=:SID')
    Left = 424
    Top = 264
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqSourceAttachid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqSourceAttachfilename: TWideMemoField
      DisplayLabel = #1048#1084#1103' '#1092#1072#1081#1083#1072
      FieldName = 'filename'
      Origin = 'filename'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqSourceAttachsource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqSourceAttachfile_size: TIntegerField
      DisplayLabel = #1056#1072#1079#1084#1077#1088
      FieldName = 'file_size'
      Origin = 'file_size'
    end
  end
  object dsSourceAttach: TDataSource
    DataSet = fdqSourceAttach
    Left = 426
    Top = 311
  end
  object OpenDialog: TOpenDialog
    Left = 576
    Top = 264
  end
  object sdAttach: TSaveDialog
    Left = 577
    Top = 315
  end
  object pmAttach: TPopupMenu
    Left = 656
    Top = 280
    object mnAttachAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnAttachAddClick
    end
    object mnAttachDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnAttachDelClick
    end
    object mnFileOpen: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ShortCut = 16455
      OnClick = mnFileOpenClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mbAttachSave: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1092#1072#1081#1083
      ShortCut = 16467
      OnClick = mbAttachSaveClick
    end
  end
  object fdqRightSTOC: TFDQuery
    Tag = 1
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select distinct id, name, stoc_id, source_id, order_, is_dir as ' +
        '"is_dir::INT", ntype as "ntype::TEXT", link_cnt as "link_cnt::IN' +
        'T" , linka_cnt as "linka_cnt::INT" ,attach_cnt as "attach_cnt::I' +
        'NT"'
      'from ('
      
        '      select -1 as id ,'#39' '#1042#1089#1077' '#1079#1072#1084#1077#1090#1082#1080#39' as name,0 stoc_id,:SID as ' +
        'source_id,-101 as order_, 1 is_dir, '#39' '#39' ntype, 0 link_cnt, 0 lin' +
        'ka_cnt, 0 attach_cnt'
      
        '      where :ST=0 and exists (select * from source_toc where sou' +
        'rce_id=:SID) and exists (select * from note_source where source_' +
        'id=:SID) '
      '      union all '
      ''
      
        '      select -3 as id ,'#39' ...'#39' as name,:ST stoc_id,:SID as source' +
        '_id,-100 as order_, 1 is_dir, '#39' '#39' ntype, 0 link_cnt, 0 linka_cnt' +
        ',0 attach_cnt'
      '      where :ST<>0'
      '      union all'
      ''
      
        '      select note.id, name , stoc_id, source_id, order_, 0 as is' +
        '_dir, '
      
        '           (select GROUP_CONCAT(distinct is_mine) from note_sour' +
        'ce, source where note_id=note.id and note_source.source_id=sourc' +
        'e.id ) ntype,'
      
        '           (select count(*) from note_link where note.id in (not' +
        'e1_id,note2_id)) link_cnt,'
      
        '           (select count(*) from note_link, note_source ns where' +
        ' note.id in (note1_id,note2_id) and ns.note_id in (note1_id,note' +
        '2_id) and ns.source_id<>:SID) linka_cnt,'
      
        '           (select count(*) from note_attach where note.id =note' +
        '_id) attach_cnt'
      '      from  note_source , note'
      
        '      where  note.id=note_source.note_id and note_source.source_' +
        'id=:SID and (ifnull(note_source.stoc_id,0)=:ST or :ST=-1)'
      '      union all '
      ''
      
        '      select id, name , stoc_id, source_id, order_, 1 is_dir , '#39 +
        ' '#39' ntype, 0 link_cnt, 0 linka_cnt, 0 attach_cnt'
      '      from  source_toc st ) st'
      
        'where (:ST=-1 and is_dir=0 or ifnull(stoc_id,0)=:ST and id<>-3 o' +
        'r id=-3 and :ST<>0) and source_id=:SID %s'
      'order by  %s')
    Left = 400
    Top = 368
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ST'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideMemoField1: TWideMemoField
      DisplayLabel = #1069#1083'-'#1090' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1103'/'#1079#1072#1084#1077#1090#1082#1072
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object IntegerField2: TIntegerField
      FieldName = 'stoc_id'
      Origin = 'stoc_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
    object IntegerField5: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'is_dir'
      Origin = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqRightSTOCntype: TWideMemoField
      FieldName = 'ntype'
      BlobType = ftWideMemo
      Size = 10
    end
    object fdqRightSTOClink_cnt: TIntegerField
      FieldName = 'link_cnt'
    end
    object fdqRightSTOCattach_cnt: TIntegerField
      FieldName = 'attach_cnt'
    end
    object fdqRightSTOClinka_cnt: TIntegerField
      FieldName = 'linka_cnt'
    end
    object fdqRightSTOCurl_cnt: TIntegerField
      FieldName = 'url_cnt'
    end
  end
  object dsRightSTOC: TDataSource
    DataSet = mteRightSTOC
    Left = 400
    Top = 415
  end
  object FDqRightNote: TFDQuery
    AfterScroll = FDqRightNoteAfterScroll
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select n.*'
      'from note n'
      'where n.id=:NID'
      '')
    Left = 560
    Top = 368
    ParamData = <
      item
        Name = 'NID'
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
      FieldName = 'subpart_id'
      Origin = 'subpart_id'
    end
    object WideMemoField2: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object WideMemoField3: TWideMemoField
      FieldName = 'original_text'
      Origin = 'original_text'
      BlobType = ftWideMemo
    end
    object WideMemoField4: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      Required = True
      BlobType = ftWideMemo
    end
    object WideMemoField5: TWideMemoField
      FieldName = 'content_plain'
      Origin = 'content_plain'
      BlobType = ftWideMemo
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object WideMemoField6: TWideMemoField
      FieldName = 'fast_text'
      Origin = 'fast_text'
      BlobType = ftWideMemo
    end
    object IntegerField7: TIntegerField
      FieldName = 'note_show_mode'
      Origin = 'note_show_mode'
      Required = True
    end
    object IntegerField8: TIntegerField
      FieldName = 'splitter_param'
      Origin = 'splitter_param'
    end
    object IntegerField9: TIntegerField
      FieldName = 'h_splitter_param'
      Origin = 'h_splitter_param'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'date_time_update'
      Origin = 'date_time_update'
    end
    object IntegerField10: TIntegerField
      FieldName = 'form_width'
      Origin = 'form_width'
    end
  end
  object dsRightNote: TDataSource
    DataSet = FDqRightNote
    Left = 560
    Top = 416
  end
  object mteLeftSTOC: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeLeftSTOC
    ReadOnly = True
    Left = 92
    Top = 417
  end
  object dsdeLeftSTOC: TDataSetDriverEh
    KeyFields = 'id, is_dir'
    ProviderDataSet = fdqLeftSTOC
    Left = 96
    Top = 371
  end
  object dsdeRightSTOC: TDataSetDriverEh
    Tag = 1
    KeyFields = 'id, is_dir'
    ProviderDataSet = fdqRightSTOC
    Left = 480
    Top = 369
  end
  object mteRightSTOC: TMemTableEh
    Tag = 1
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeRightSTOC
    ReadOnly = True
    Left = 482
    Top = 416
  end
  object FDqSourceClassification: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from tmp_source_classification order by name')
    Left = 812
    Top = 184
    object FDAutoIncField4: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideMemoField7: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object IntegerField11: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
  end
  object dsSourceClassification: TDataSource
    DataSet = FDqSourceClassification
    Left = 812
    Top = 249
  end
  object fdqSourceType: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from source_type order by name')
    Left = 327
    object fdqSourceTypeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSourceTypename: TWideMemoField
      DisplayLabel = #1058#1080#1087' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqSourceTypecr_type: TIntegerField
      FieldName = 'cr_type'
      Origin = 'cr_type'
      Required = True
    end
  end
  object dsSourceType: TDataSource
    DataSet = fdqSourceType
    Left = 407
  end
  object dsProjectClassification: TDataSource
    DataSet = fdqProjectClassification
    Left = 808
    Top = 120
  end
  object fdqProjectClassification: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from tmp_project_classification order by name')
    Left = 812
    Top = 64
    object FDAutoIncField5: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideMemoField8: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object IntegerField12: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
  end
  object fdqSTOCKWRight: TFDQuery
    Tag = 1
    Connection = DM.sqlc
    SQL.Strings = (
      'select sk.*, kn.name as "name::TEXT" , class_name_after,'
      'keyword_use_count(k.id) as "kwcount::INT" '
      'from stoc_keyword sk, keyword_name kn, keyword k'
      
        ' where stoc_id=:SID and sk.keyword_name_id=kn.id and k.id=kn.key' +
        'word_id')
    Left = 765
    Top = 337
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqSTOCKWRightid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSTOCKWRightsource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqSTOCKWRightstoc_id: TIntegerField
      FieldName = 'stoc_id'
      Origin = 'stoc_id'
      Required = True
    end
    object fdqSTOCKWRightkeyword_id: TIntegerField
      FieldName = 'keyword_id'
      Origin = 'keyword_id'
      Required = True
    end
    object fdqSTOCKWRightkeyword_name_id: TIntegerField
      FieldName = 'keyword_name_id'
      Origin = 'keyword_name_id'
    end
    object fdqSTOCKWRightname: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqSTOCKWRightclass_name_after: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1052#1077#1089#1090#1086' '#1074' '#1080#1077#1088#1072#1088#1072#1093#1080#1080
      FieldName = 'class_name_after'
      Origin = 'class_name_after'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqSTOCKWRightkwcount: TIntegerField
      FieldName = 'kwcount'
    end
  end
  object dsSTOCKWRight: TDataSource
    DataSet = fdqSTOCKWRight
    Left = 709
    Top = 385
  end
  object fdqSTOCKWLeft: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select sk.*, kn.name as "name::TEXT" , class_name_after,'
      'keyword_use_count(k.id) as "kwcount::INT" '
      'from stoc_keyword sk, keyword_name kn, keyword k'
      
        ' where stoc_id=:SID and sk.keyword_name_id=kn.id and k.id=kn.key' +
        'word_id')
    Left = 301
    Top = 345
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqSTOCKWLeftid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSTOCKWLeftsource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqSTOCKWLeftstoc_id: TIntegerField
      FieldName = 'stoc_id'
      Origin = 'stoc_id'
      Required = True
    end
    object fdqSTOCKWLeftkeyword_id: TIntegerField
      FieldName = 'keyword_id'
      Origin = 'keyword_id'
      Required = True
    end
    object fdqSTOCKWLeftkeyword_name_id: TIntegerField
      FieldName = 'keyword_name_id'
      Origin = 'keyword_name_id'
    end
    object fdqSTOCKWLeftname: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqSTOCKWLeftclass_name_after: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1052#1077#1089#1090#1086' '#1074' '#1080#1077#1088#1072#1088#1093#1080#1080
      FieldName = 'class_name_after'
      Origin = 'class_name_after'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqSTOCKWLeftkwcount: TIntegerField
      FieldName = 'kwcount'
    end
  end
  object dsSTOCKWLeft: TDataSource
    DataSet = fdqSTOCKWLeft
    Left = 245
    Top = 393
  end
  object pmSTOCKW: TPopupMenu
    Left = 840
    object mnSTOCKWAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnSTOCKWAddClick
    end
    object mnSTOCKWDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnSTOCKWDelClick
    end
  end
end
