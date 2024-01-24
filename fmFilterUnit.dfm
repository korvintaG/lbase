object fmFilter: TfmFilter
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1090#1088#1099' '#1076#1083#1103' '#1101#1082#1089#1087#1086#1088#1090#1072
  ClientHeight = 464
  ClientWidth = 1028
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
  object dbgAuthors: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 1022
    Height = 417
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    AutoFitColWidths = True
    DataSource = dsFilter
    DrawMemoText = True
    DynProps = <>
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmFilter
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 0
    OnDblClick = dbgAuthorsDblClick
    Columns = <
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'is_active'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        MaxWidth = 64
        MinWidth = 64
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ReadOnly = True
        Width = 167
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'area_type'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
        PickList.Strings = (
          #1040#1074#1090#1086#1088#1099
          #1048#1089#1090#1086#1095#1085#1080#1082#1080
          #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
          #1048#1085#1090#1077#1088#1077#1089#1099
          #1055#1088#1086#1077#1082#1090#1099)
        ReadOnly = True
        Width = 142
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'use_type'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1042#1082#1083#1102#1095#1072#1103' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077
          #1048#1089#1082#1083#1102#1095#1072#1103' '#1087#1086#1084#1077#1095#1077#1085#1085#1099#1077)
        ReadOnly = True
        Width = 155
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'date_time_create'
        Footers = <>
        ReadOnly = True
        Width = 118
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1028
    Height = 41
    Align = alTop
    TabOrder = 1
    object btShare: TButton
      Left = 17
      Top = 6
      Width = 233
      Height = 25
      Caption = #1055#1086#1076#1077#1083#1080#1090#1100#1089#1103' '#1092#1080#1083#1100#1090#1088#1086#1074#1072#1085#1085#1086#1081' '#1073#1072#1079#1086#1081' '
      TabOrder = 0
      OnClick = btShareClick
    end
  end
  object pmFilter: TPopupMenu
    Left = 104
    Top = 104
    object mnAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
    end
    object mdDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
    end
    object mnEdit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ShortCut = 16397
    end
  end
  object fdqFilter: TFDQuery
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    SQL.Strings = (
      'select *  from filter'
      '')
    Left = 283
    Top = 118
    object fdqFilterid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqFiltername: TWideMemoField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqFilterarea_type: TIntegerField
      DisplayLabel = #1054#1073#1083#1072#1089#1090#1100' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'area_type'
      Origin = 'area_type'
      Required = True
    end
    object fdqFilteruse_type: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1087#1088#1080#1084#1077#1085#1077#1085#1080#1103
      FieldName = 'use_type'
      Origin = 'use_type'
      Required = True
    end
    object fdqFilterdate_time_create: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103' '#1089#1086#1079#1076#1072#1085#1080#1103
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqFilteris_active: TIntegerField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1099#1081'?'
      FieldName = 'is_active'
      Origin = 'is_active'
      Required = True
    end
  end
  object dsFilter: TDataSource
    DataSet = fdqFilter
    Left = 176
    Top = 108
  end
  object sdAttach: TSaveDialog
    Left = 504
    Top = 256
  end
end
