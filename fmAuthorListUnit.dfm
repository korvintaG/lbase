object fmAuthorList: TfmAuthorList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1074#1090#1086#1088#1086#1074
  ClientHeight = 202
  ClientWidth = 447
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
    Top = 3
    Width = 441
    Height = 196
    Align = alClient
    AutoFitColWidths = True
    DataSource = dsAuthor
    DrawMemoText = True
    DynProps = <>
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmAuthor
    ReadOnly = True
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 0
    OnDblClick = mnEditClick
    OnKeyPress = dbgAuthorsKeyPress
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 167
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pmAuthor: TPopupMenu
    OnPopup = pmAuthorPopup
    Left = 104
    Top = 104
    object mnAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16462
      OnClick = mnAddClick
    end
    object mnDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnDelClick
    end
    object mnEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1072#1074#1090#1086#1088#1072' ('#1076#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1086#1082' '#1084#1099#1096#1100#1102')'
      ShortCut = 16397
      OnClick = mnEditClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object mnSortByDate: TMenuItem
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object mnSortByDateDesc: TMenuItem
        Tag = 1
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1076#1072#1090#1077'-'#1074#1088#1077#1084#1077#1085#1080' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mnSortByName: TMenuItem
        Tag = 2
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object mnSortByNameDesc: TMenuItem
        Tag = 3
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1083#1092#1072#1074#1080#1090#1091' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
    end
  end
  object fdqAuthor: TFDQuery
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    SQL.Strings = (
      'select *  from author'
      '')
    Left = 323
    Top = 22
    object fdqAuthorname: TWideMemoField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqAuthornotes: TWideMemoField
      FieldName = 'notes'
      BlobType = ftWideMemo
    end
    object fdqAuthordate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqAuthorid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object dsAuthor: TDataSource
    DataSet = fdqAuthor
    Left = 376
    Top = 20
  end
end
