object fmFilterEdit: TfmFilterEdit
  Left = 0
  Top = 0
  Caption = 'fmFilterEdit'
  ClientHeight = 467
  ClientWidth = 956
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 956
    Height = 81
    Align = alTop
    Alignment = taLeftJustify
    TabOrder = 0
    object Label1: TLabel
      Left = 43
      Top = 7
      Width = 99
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072':'
    end
    object Label2: TLabel
      Left = 10
      Top = 55
      Width = 132
      Height = 13
      Caption = #1058#1080#1087' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103' '#1092#1080#1083#1100#1090#1088#1072':'
    end
    object Label3: TLabel
      Left = 32
      Top = 32
      Width = 110
      Height = 13
      Caption = #1054#1073#1083#1072#1089#1090#1100' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103':'
    end
    object dbeName: TDBEditEh
      Left = 146
      Top = 4
      Width = 324
      Height = 21
      DataField = 'name'
      DataSource = fmFilter.dsFilter
      DynProps = <>
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object dbcUseType: TDBComboBoxEh
      Left = 146
      Top = 53
      Width = 215
      Height = 21
      DataField = 'use_type'
      DataSource = fmFilter.dsFilter
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1042#1082#1083#1102#1095#1072#1103' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077
        #1048#1089#1082#1083#1102#1095#1072#1103' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077)
      KeyItems.Strings = (
        '0'
        '1'
        '')
      TabOrder = 1
      Visible = True
    end
    object dbcActive: TDBCheckBoxEh
      Left = 463
      Top = 33
      Width = 117
      Height = 17
      Caption = #1060#1080#1083#1100#1090#1088' '#1072#1082#1090#1080#1074#1085#1099#1081'?'
      DataField = 'is_active'
      DataSource = fmFilter.dsFilter
      DynProps = <>
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object btSave: TButton
      Left = 504
      Top = 2
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btSaveClick
    end
    object dbcArea: TDBComboBoxEh
      Left = 146
      Top = 28
      Width = 215
      Height = 21
      DataField = 'area_type'
      DataSource = fmFilter.dsFilter
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1040#1074#1090#1086#1088#1099
        #1048#1089#1090#1086#1095#1085#1080#1082#1080
        #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
        #1048#1085#1090#1077#1088#1077#1089#1099
        #1055#1088#1086#1077#1082#1090#1099)
      KeyItems.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4')
      TabOrder = 4
      Visible = True
      OnCloseUp = dbcAreaCloseUp
    end
  end
  object pcMain: TPageControl
    Left = 0
    Top = 81
    Width = 956
    Height = 386
    ActivePage = tsSource
    Align = alClient
    TabOrder = 1
    object tsAuthor: TTabSheet
      Caption = #1040#1074#1090#1086#1088#1099
      ImageIndex = 1
      object dbgAuthor: TDBGridEh
        Left = 0
        Top = 0
        Width = 948
        Height = 358
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsAuthor
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        OnDblClick = dbgAuthorDblClick
        OnKeyDown = dbgAuthorKeyDown
        Columns = <
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'in_filter'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            MaxWidth = 50
            MinWidth = 50
            Width = 50
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Width = 220
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsSource: TTabSheet
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080
      ImageIndex = 2
      object dbgSource: TDBGridEh
        Left = 0
        Top = 0
        Width = 948
        Height = 358
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsSource
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmSource
        ReadOnly = True
        TabOrder = 0
        OnDblClick = dbgSourceDblClick
        OnKeyDown = dbgSourceKeyDown
        Columns = <
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'in_filter'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            MaxWidth = 50
            MinWidth = 50
            Width = 50
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Width = 220
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsKW: TTabSheet
      Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
      object pnBottom: TPanel
        Left = 0
        Top = 0
        Width = 948
        Height = 358
        Align = alClient
        TabOrder = 0
        object dbgKWIer: TDBGridEh
          Left = 1
          Top = 25
          Width = 946
          Height = 332
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsKeywordIer
          DrawMemoText = True
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          OnDblClick = dbgKWIerDblClick
          OnKeyDown = dbgKWIerKeyDown
          Columns = <
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'in_filter'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              MaxWidth = 50
              MinWidth = 50
              Width = 50
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'is_dir'
              Footers = <>
              MaxWidth = 9
              MinWidth = 8
              Width = 9
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'name_main'
              Footers = <>
              Width = 220
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnListTop: TPanel
          Left = 1
          Top = 1
          Width = 946
          Height = 24
          Align = alTop
          Color = cl3DLight
          ParentBackground = False
          TabOrder = 1
          object lbRoot: TLabel
            Left = 32
            Top = 6
            Width = 31
            Height = 13
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'lbRoot'
            ParentBiDiMode = False
          end
          object btUp: TButton
            Left = 5
            Top = 6
            Width = 19
            Height = 16
            BiDiMode = bdRightToLeftReadingOnly
            Caption = '...'
            ParentBiDiMode = False
            TabOrder = 0
            OnClick = btUpClick
          end
        end
      end
    end
    object tsInt: TTabSheet
      Caption = #1048#1085#1090#1077#1088#1077#1089#1099
      ImageIndex = 3
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 948
        Height = 358
        Align = alClient
        TabOrder = 0
        object dbgInt: TDBGridEh
          Left = 1
          Top = 25
          Width = 946
          Height = 332
          Align = alClient
          AutoFitColWidths = True
          DataSource = dsInterest
          DrawMemoText = True
          DynProps = <>
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          OnDblClick = dbgIntDblClick
          OnKeyDown = dbgIntKeyDown
          Columns = <
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'in_filter'
              Footers = <>
              KeyList.Strings = (
                '1'
                '0')
              MaxWidth = 50
              MinWidth = 50
              Width = 50
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'is_dir'
              Footers = <>
              MaxWidth = 9
              MinWidth = 8
              Width = 9
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Width = 220
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 946
          Height = 24
          Align = alTop
          Color = cl3DLight
          ParentBackground = False
          TabOrder = 1
          object lbRootI: TLabel
            Left = 32
            Top = 6
            Width = 31
            Height = 13
            BiDiMode = bdRightToLeftNoAlign
            Caption = 'lbRoot'
            ParentBiDiMode = False
          end
          object btUpI: TButton
            Left = 5
            Top = 3
            Width = 19
            Height = 16
            BiDiMode = bdRightToLeftReadingOnly
            Caption = '...'
            ParentBiDiMode = False
            TabOrder = 0
            OnClick = btUpIClick
          end
        end
      end
    end
    object tsProject: TTabSheet
      Caption = #1055#1088#1086#1077#1082#1090#1099
      ImageIndex = 4
      object dbgProject: TDBGridEh
        Left = 0
        Top = 0
        Width = 948
        Height = 358
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsProject
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmProject
        ReadOnly = True
        TabOrder = 0
        OnDblClick = dbgProjectDblClick
        OnKeyDown = dbgProjectKeyDown
        Columns = <
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'in_filter'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            MaxWidth = 50
            MinWidth = 50
            Width = 50
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Width = 220
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object fdqKeywordIer: TFDQuery
    AutoCalcFields = False
    DetailFields = 'id'
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select id, name_main, class_keyword_id, date_time_create,'
      'kw_mark_status(id,:FID) as "in_filter::INT",'
      
        '(case when (select count(*) from keyword k where class_keyword_i' +
        'd=keyword.id)=0 then " " else "/" end) as "is_dir::TEXT"'
      
        '--(select count(*) from filter_keyword where keyword_id=keyword.' +
        'id and filter_id=:FID) as "in_filter::INT"'
      'from keyword '
      'where class_keyword_id=:CKW'
      'order by ifnull(order_,0), name_main')
    Left = 16
    Top = 144
    ParamData = <
      item
        Name = 'FID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CKW'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqKeywordIerid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqKeywordIerclass_keyword_id: TIntegerField
      FieldName = 'class_keyword_id'
      Origin = 'class_keyword_id'
      Required = True
    end
    object fdqKeywordIerdate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqKeywordIerin_filter: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1084#1077#1090#1082#1072
      FieldName = 'in_filter'
      Origin = 'in_filter'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqKeywordIeris_dir: TWideMemoField
      DisplayLabel = '/'
      FieldName = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqKeywordIername_main: TWideMemoField
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'name_main'
      BlobType = ftWideMemo
      Size = 100
    end
  end
  object dsKeywordIer: TDataSource
    DataSet = fdqKeywordIer
    Left = 16
    Top = 200
  end
  object fdqAuthor: TFDQuery
    AutoCalcFields = False
    DetailFields = 'id'
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select id, name, date_time_create,'
      
        '(select count(*) from filter_author where author_id=author.id an' +
        'd filter_id=:FID) as "in_filter::INT"'
      'from author'
      'order by name')
    Left = 104
    Top = 144
    ParamData = <
      item
        Name = 'FID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqAuthorid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqAuthorname: TWideMemoField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqAuthordate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqAuthorin_filter: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1084#1077#1090#1082#1072
      FieldName = 'in_filter'
      Origin = 'in_filter'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsAuthor: TDataSource
    DataSet = fdqAuthor
    Left = 104
    Top = 200
  end
  object fdqSource: TFDQuery
    AutoCalcFields = False
    DetailFields = 'id'
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select id, date_time_create,'
      
        'name||'#39'-'#39'||ifnull((SELECT GROUP_CONCAT(a.name) FROM source_autho' +
        'r sa, author a '
      ' WHERE source_id=s.id and author_id=a.id),'#39' '#39') as "name::TEXT",'
      
        '(select count(*) from filter_source where source_id=s.id and fil' +
        'ter_id=:FID) as "in_filter::INT"'
      'from source s'
      'where ifnull(is_mine,0)=0'
      '')
    Left = 168
    Top = 144
    ParamData = <
      item
        Name = 'FID'
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
    object WideMemoField1: TWideMemoField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object IntegerField1: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1084#1077#1090#1082#1072
      FieldName = 'in_filter'
      Origin = 'in_filter'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsSource: TDataSource
    DataSet = fdqSource
    Left = 160
    Top = 200
  end
  object pmSource: TPopupMenu
    Left = 156
    Top = 257
    object mnSourceSortDate: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080
      OnClick = mnSourceSortDateClick
    end
    object mnSourceSortName: TMenuItem
      Tag = 1
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
      OnClick = mnSourceSortDateClick
    end
  end
  object fdqInterest: TFDQuery
    AutoCalcFields = False
    DetailFields = 'id'
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select id, name, class_interest_id, date_time_create,'
      'interest_mark_status(id,:FID) as "in_filter::INT",'
      
        '(case when (select count(*) from interest k where class_interest' +
        '_id=interest.id)=0 then " " else "/" end) as "is_dir::TEXT"'
      
        '--(select count(*) from filter_keyword where keyword_id=keyword.' +
        'id and filter_id=:FID) as "in_filter::INT"'
      'from interest'
      'where class_interest_id=:CKW'
      'order by ifnull(order_,0), name')
    Left = 240
    Top = 144
    ParamData = <
      item
        Name = 'FID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CKW'
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
    object WideMemoField2: TWideMemoField
      DisplayLabel = #1048#1085#1090#1077#1088#1077#1089
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object IntegerField3: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1084#1077#1090#1082#1072
      FieldName = 'in_filter'
      Origin = 'in_filter'
      ProviderFlags = []
      ReadOnly = True
    end
    object WideMemoField3: TWideMemoField
      DisplayLabel = '/'
      FieldName = 'is_dir'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqInterestclass_interest_id: TIntegerField
      FieldName = 'class_interest_id'
    end
  end
  object dsInterest: TDataSource
    DataSet = fdqInterest
    Left = 240
    Top = 200
  end
  object fdqProject: TFDQuery
    AutoCalcFields = False
    DetailFields = 'id'
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.KeyFields = 'id'
    SQL.Strings = (
      'select id, date_time_create,'
      'name,'
      
        '(select count(*) from filter_project where project_id=s.id and f' +
        'ilter_id=:FID) as "in_filter::INT"'
      'from source s'
      'where ifnull(is_mine,0)=1'
      '')
    Left = 312
    Top = 144
    ParamData = <
      item
        Name = 'FID'
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
    object WideMemoField4: TWideMemoField
      DisplayLabel = #1052#1086#1081' '#1087#1088#1086#1077#1082#1090
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object IntegerField2: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #1055#1086#1084#1077#1090#1082#1072
      FieldName = 'in_filter'
      Origin = 'in_filter'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsProject: TDataSource
    DataSet = fdqProject
    Left = 312
    Top = 200
  end
  object pmProject: TPopupMenu
    Left = 308
    Top = 257
    object mnProjectSortDate: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080
      OnClick = mnProjectSortDateClick
    end
    object mnProjectSortName: TMenuItem
      Tag = 1
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102
    end
  end
end
