object fmTaskEdit: TfmTaskEdit
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
  ClientHeight = 365
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pcMainTaskEdit: TPageControl
    Left = 0
    Top = 41
    Width = 600
    Height = 283
    ActivePage = tsGeneral
    Align = alClient
    TabOrder = 1
    object tsGeneral: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      object lbContent: TLabel
        Left = 17
        Top = 40
        Width = 68
        Height = 13
        Caption = #1057#1091#1090#1100' '#1079#1072#1076#1072#1095#1080':'
      end
      object lbDeadLine: TLabel
        Left = 12
        Top = 125
        Width = 73
        Height = 13
        Caption = #1050#1088#1072#1081#1085#1080#1081' '#1089#1088#1086#1082':'
      end
      object lbStatus: TLabel
        Left = 244
        Top = 125
        Width = 79
        Height = 13
        Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1076#1072#1095#1080':'
      end
      object lbParent: TLabel
        Left = 32
        Top = 15
        Width = 53
        Height = 13
        Caption = #1056#1086#1076#1080#1090#1077#1083#1100':'
      end
      object dbmContent: TDBMemoEh
        Left = 90
        Top = 40
        Width = 407
        Height = 77
        AutoSize = False
        DataField = 'content'
        DataSource = dsTask
        DynProps = <>
        EditButtons = <>
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
      object dbgNoteSource: TDBGridEh
        Left = 8
        Top = 147
        Width = 569
        Height = 102
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsTaskProject
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        PopupMenu = pmTaskProject
        RowHeight = 4
        RowLines = 1
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 1
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'sourcename'
            Footers = <>
            Width = 332
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'stocname'
            Footers = <>
            Width = 195
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbdDeadLine: TDBDateTimeEditEh
        Left = 90
        Top = 122
        Width = 121
        Height = 21
        DataField = 'deadline'
        DataSource = dsTask
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 2
        Visible = True
      end
      object dbcStatus: TDBComboBoxEh
        Left = 330
        Top = 122
        Width = 121
        Height = 21
        DataField = 'status'
        DataSource = dsTask
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1057#1086#1079#1076#1072#1085
          #1042' '#1088#1072#1073#1086#1090#1077
          #1047#1072#1074#1077#1088#1096#1077#1085
          #1054#1090#1084#1077#1085#1077#1085)
        KeyItems.Strings = (
          '0'
          '1'
          '3'
          '2')
        TabOrder = 4
        Visible = True
        OnChange = dbcStatusChange
      end
      object dbdClose: TDBDateTimeEditEh
        Left = 461
        Top = 122
        Width = 125
        Height = 21
        Hint = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
        DataField = 'date_time_close'
        DataSource = dsTask
        DynProps = <>
        Enabled = False
        EditButtons = <>
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = True
        EditFormat = 'DD/MM/YYYY HH:NN'
      end
      object dbltask_id: TDBLookupComboboxEh
        Left = 90
        Top = 12
        Width = 407
        Height = 21
        DynProps = <>
        DataField = 'task_id'
        DataSource = dsTask
        EditButtons = <>
        KeyField = 'id'
        ListField = 'name_pname'
        ListSource = dsTaskList
        TabOrder = 5
        Visible = True
      end
    end
    object tsChilds: TTabSheet
      Caption = #1044#1086#1095#1077#1088#1085#1080#1077' '#1087#1086#1076#1079#1072#1076#1072#1095#1080
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 592
        Height = 255
        Align = alClient
        DataSource = dsTaskChild
        DrawMemoText = True
        DynProps = <>
        PopupMenu = pmChildTask
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pname'
            Footers = <>
            Width = 186
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Width = 189
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'deadline'
            Footers = <>
            MaxWidth = 90
            MinWidth = 90
            Width = 90
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'status'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '3'
              '2')
            MaxWidth = 80
            MinWidth = 80
            PickList.Strings = (
              #1057#1086#1079#1076#1072#1085#1072
              #1053#1072#1095#1072#1090#1072
              #1047#1072#1074#1077#1088#1096#1077#1085#1072
              #1054#1090#1084#1077#1085#1077#1085#1072)
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'date_time_close'
            Footers = <>
            MaxWidth = 90
            MinWidth = 90
            Width = 90
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsKeyword: TTabSheet
      Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
      ImageIndex = 2
      object dbgKeyword: TDBGridEh
        Left = 0
        Top = 0
        Width = 592
        Height = 255
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsKeyword
        DrawMemoText = True
        DynProps = <>
        PopupMenu = pmKeyword
        ReadOnly = True
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ImageList = fmmain.TreeImage
            ShowImageAndText = True
            Width = 199
            OnGetCellParams = dbgKeywordColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'class_name_after'
            Footers = <>
            Width = 228
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsSource: TTabSheet
      Caption = #1057#1074#1103#1079#1072#1085#1085#1099#1077' '#1080#1089#1090#1086#1095#1085#1080#1082#1080
      ImageIndex = 3
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 592
        Height = 255
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsTaskSource
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        PopupMenu = pmTaskSource
        RowHeight = 4
        RowLines = 1
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'sourcename'
            Footers = <>
            Width = 332
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'stocname'
            Footers = <>
            Width = 195
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 324
    Width = 600
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btOk: TButton
      Left = 233
      Top = 3
      Width = 159
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btOkClick
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 41
    Align = alTop
    TabOrder = 2
    object lbName: TLabel
      Left = 8
      Top = 6
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object dbeName: TDBEditEh
      Left = 90
      Top = 4
      Width = 407
      Height = 21
      DataField = 'name'
      DataSource = dsTask
      DynProps = <>
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
  end
  object fdqTask: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from task ')
    Left = 72
    object fdqTaskid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqTaskname: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqTaskcontent: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqTasktype_: TIntegerField
      FieldName = 'type_'
      Origin = 'type_'
      Required = True
    end
    object fdqTaskdeadline: TDateTimeField
      FieldName = 'deadline'
      Origin = 'deadline'
    end
    object fdqTaskdate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqTaskstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object fdqTaskdate_time_close: TDateTimeField
      FieldName = 'date_time_close'
      Origin = 'date_time_close'
    end
    object fdqTasktask_id: TIntegerField
      FieldName = 'task_id'
      Origin = 'task_id'
    end
  end
  object dsTask: TDataSource
    DataSet = fdqTask
    Left = 24
  end
  object fdqTaskProject: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select tp.*,'
      'source_fullname_by_id(tp.source_id,1) as "sourcename::TEXT" ,'
      'stoc_fullname(tp.stoc_id) as "stocname::TEXT"'
      ''
      ''
      'from task_source tp where tp.task_id=:NID and is_mine=1')
    Left = 316
    Top = 91
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqTaskProjectsourcename: TWideMemoField
      DisplayLabel = #1055#1088#1086#1077#1082#1090
      FieldName = 'sourcename'
      BlobType = ftWideMemo
      Size = 1000
    end
    object fdqTaskProjectid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqTaskProjecttask_id: TIntegerField
      FieldName = 'task_id'
      Origin = 'task_id'
      Required = True
    end
    object fdqTaskProjectsource_id: TIntegerField
      FieldName = 'source_id'
    end
    object fdqTaskProjectstoc_id: TIntegerField
      FieldName = 'stoc_id'
    end
    object fdqTaskProjectstocname: TWideMemoField
      DisplayLabel = #1054#1075#1083#1072#1074#1083#1077#1085#1080#1077
      FieldName = 'stocname'
      BlobType = ftWideMemo
      Size = 300
    end
  end
  object dsTaskProject: TDataSource
    DataSet = fdqTaskProject
    Left = 316
    Top = 139
  end
  object pmTaskProject: TPopupMenu
    Left = 260
    Top = 115
    object mnNoteSourceAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnNoteSourceAddClick
    end
    object mnNoteSourceDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnNoteSourceDelClick
    end
    object mnGotoSource: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1080#1089#1090#1086#1095#1085#1080#1082'/'#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      ShortCut = 16455
    end
  end
  object fdqTaskList: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select task.*,'
      
        'name||'#39'/'#39'||(select GROUP_CONCAT(distinct source_fullname_by_id(t' +
        'p.source_id,1)) from task_source tp'
      'where task_id=task.id and is_mine=1) as "name_pname::TEXT"'
      ' from task')
    Left = 16
    Top = 88
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideMemoField1: TWideMemoField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object WideMemoField2: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      BlobType = ftWideMemo
    end
    object IntegerField1: TIntegerField
      FieldName = 'type_'
      Origin = 'type_'
      Required = True
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1050#1088#1072#1081#1085#1080#1081' '#1089#1088#1086#1082
      FieldName = 'deadline'
      Origin = 'deadline'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'date_time_close'
      Origin = 'date_time_close'
    end
    object IntegerField3: TIntegerField
      FieldName = 'task_id'
      Origin = 'task_id'
    end
    object fdqTaskListname_pname: TWideMemoField
      FieldName = 'name_pname'
      BlobType = ftWideMemo
      Size = 400
    end
  end
  object dsTaskList: TDataSource
    DataSet = fdqTaskList
    Left = 76
    Top = 89
  end
  object fdqTaskChild: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select task.*,'
      
        '(select GROUP_CONCAT(distinct source_fullname_by_id(tp.source_id' +
        ',1)) '
      
        ' from task_source tp where task_id=task.id and is_mine=1) as "pn' +
        'ame::TEXT"'
      'from task'
      'where task_id=:TID')
    Left = 36
    Top = 257
    ParamData = <
      item
        Name = 'TID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqTaskChildid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqTaskChildname: TWideMemoField
      DisplayLabel = #1047#1072#1076#1072#1095#1072
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqTaskChildcontent: TWideMemoField
      DisplayLabel = #1055#1088#1086#1077#1082#1090
      FieldName = 'content'
      Origin = 'content'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqTaskChildtype_: TIntegerField
      FieldName = 'type_'
      Origin = 'type_'
      Required = True
    end
    object fdqTaskChilddeadline: TDateTimeField
      FieldName = 'deadline'
      Origin = 'deadline'
    end
    object fdqTaskChilddate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqTaskChildstatus: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object fdqTaskChilddate_time_close: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'date_time_close'
      Origin = 'date_time_close'
    end
    object fdqTaskChildtask_id: TIntegerField
      FieldName = 'task_id'
      Origin = 'task_id'
    end
    object fdqTaskChildpname: TWideMemoField
      DisplayLabel = #1055#1088#1086#1077#1082#1090
      FieldName = 'pname'
      BlobType = ftWideMemo
      Size = 300
    end
  end
  object dsTaskChild: TDataSource
    DataSet = fdqTaskChild
    Left = 100
    Top = 257
  end
  object pmChildTask: TPopupMenu
    Left = 76
    Top = 217
    object mnChildAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1095#1077#1088#1085#1102#1102' '#1079#1072#1076#1072#1095#1091
      ShortCut = 16429
      OnClick = mnChildAddClick
    end
    object mnChildDetach: TMenuItem
      Caption = #1054#1090#1082#1088#1077#1087#1080#1090#1100' '#1076#1086#1095#1077#1088#1085#1102#1102' '#1079#1072#1076#1072#1095#1091
      ShortCut = 16452
    end
  end
  object fdqKeyword: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select tk.id, tk.keyword_name_id, kn.keyword_id, kn.name, class_' +
        'name_after ,'
      'keyword_use_count(tk.keyword_id) as "keyword_use_count::INT"'
      'from task_keyword tk, keyword_name kn, keyword k'
      
        'where tk.task_id=:TID and tk.keyword_name_id=kn.id and kn.keywor' +
        'd_id=k.id')
    Left = 492
    Top = 81
    ParamData = <
      item
        Name = 'TID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqKeywordid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqKeywordkeyword_name_id: TIntegerField
      FieldName = 'keyword_name_id'
      Origin = 'keyword_name_id'
      Required = True
    end
    object fdqKeywordkeyword_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'keyword_id'
      Origin = 'keyword_id'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqKeywordname: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqKeywordclass_name_after: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1052#1077#1089#1090#1086' '#1074' '#1080#1077#1088#1072#1088#1093#1080#1080
      FieldName = 'class_name_after'
      Origin = 'class_name_after'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqKeywordkeyword_use_count: TIntegerField
      FieldName = 'keyword_use_count'
    end
  end
  object dsKeyword: TDataSource
    DataSet = fdqKeyword
    Left = 548
    Top = 81
  end
  object pmKeyword: TPopupMenu
    Left = 516
    Top = 129
    object mnKWAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      ShortCut = 16429
      OnClick = mnKWAddClick
    end
  end
  object fdqTaskSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select tp.*,'
      'source_fullname_by_id(tp.source_id,1) as "sourcename::TEXT" ,'
      'stoc_fullname(tp.stoc_id) as "stocname::TEXT"'
      ''
      ''
      'from task_source tp where tp.task_id=:NID and is_mine=0')
    Left = 316
    Top = 227
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object WideMemoField3: TWideMemoField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'sourcename'
      BlobType = ftWideMemo
      Size = 1000
    end
    object FDAutoIncField2: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'task_id'
      Origin = 'task_id'
      Required = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'source_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'stoc_id'
    end
    object WideMemoField4: TWideMemoField
      DisplayLabel = #1054#1075#1083#1072#1074#1083#1077#1085#1080#1077
      FieldName = 'stocname'
      BlobType = ftWideMemo
      Size = 300
    end
  end
  object dsTaskSource: TDataSource
    DataSet = fdqTaskSource
    Left = 316
    Top = 275
  end
  object pmTaskSource: TPopupMenu
    Left = 260
    Top = 251
    object mnSourceAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnSourceAddClick
    end
    object mnSourceDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnSourceDelClick
    end
    object mnSourceGoto: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1080#1089#1090#1086#1095#1085#1080#1082'/'#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      ShortCut = 16455
    end
  end
end
