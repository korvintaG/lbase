object fmSourceList: TfmSourceList
  Left = 0
  Top = 0
  Caption = 'fmSourceList'
  ClientHeight = 370
  ClientWidth = 812
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 33
    Align = alTop
    TabOrder = 0
    Visible = False
  end
  object gbLeft: TGroupBox
    Left = 0
    Top = 33
    Width = 404
    Height = 337
    Align = alLeft
    Caption = #1055#1072#1087#1082#1080'/'#1080#1089#1090#1086#1095#1085#1080#1082#1080
    TabOrder = 1
    object dbgLeftSourceList: TDBGridEh
      AlignWithMargins = True
      Left = 170
      Top = 112
      Width = 172
      Height = 100
      AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
      AutoFitColWidths = True
      DataSource = dsLeftSource
      DrawMemoText = True
      DynProps = <>
      GridLineParams.DataHorzLines = False
      GridLineParams.DataVertLines = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
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
          Checkboxes = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'fullname'
          Footers = <>
          ImageList = fmmain.TreeImage
          MinWidth = 50
          ShowImageAndText = True
          Width = 332
          OnGetCellParams = dbgLeftSourceListColumns0GetCellParams
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnLeftCont: TPanel
      Left = 64
      Top = 135
      Width = 100
      Height = 100
      TabOrder = 1
      Visible = False
      object memLeftDir: TMemo
        Left = 1
        Top = 1
        Width = 98
        Height = 98
        Align = alClient
        Lines.Strings = (
          'memLeftDir')
        TabOrder = 0
      end
    end
  end
  object gbRight: TGroupBox
    Left = 404
    Top = 33
    Width = 408
    Height = 337
    Align = alClient
    TabOrder = 2
    object pnRightCont: TPanel
      Tag = 1
      Left = 56
      Top = 130
      Width = 100
      Height = 100
      TabOrder = 0
      Visible = False
      object memRightDir: TMemo
        Tag = 1
        Left = 1
        Top = 1
        Width = 98
        Height = 98
        Align = alClient
        Lines.Strings = (
          'memRightDir')
        TabOrder = 0
      end
    end
    object dbgRightSourceList: TDBGridEh
      Tag = 1
      AlignWithMargins = True
      Left = 162
      Top = 64
      Width = 149
      Height = 100
      AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
      AutoFitColWidths = True
      DataSource = dsRightSource
      DrawMemoText = True
      DynProps = <>
      GridLineParams.DataHorzLines = False
      GridLineParams.DataVertLines = False
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghAutoFitRowHeight, dghExtendVertLines]
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
          Checkboxes = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'fullname'
          Footers = <>
          ImageList = fmmain.TreeImage
          MinWidth = 50
          ShowImageAndText = True
          Width = 332
          OnGetCellParams = dbgLeftSourceListColumns0GetCellParams
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pmMain: TPopupMenu
    OwnerDraw = True
    OnPopup = pmMainPopup
    Left = 384
    Top = 32
    object mnMode: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      object mnModeShowContent: TMenuItem
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1091
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
      object N9: TMenuItem
        Caption = '-'
      end
      object mnSortByName: TMenuItem
        Tag = 2
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object mnSortByNameDesc: TMenuItem
        Tag = 3
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1072#1079#1074#1072#1085#1080#1102' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mnSortAuthor: TMenuItem
        Tag = 4
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1074#1090#1086#1088#1091' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object mnSortAuthorDesc: TMenuItem
        Tag = 5
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1072#1074#1090#1086#1088#1091'  '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object mnSortState: TMenuItem
        Tag = 6
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1087#1086' '#1074#1086#1079#1088#1072#1089#1090#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
      object mnSortStateDesc: TMenuItem
        Tag = 7
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnSortByDateClick
      end
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082
      ShortCut = 16429
      OnClick = mnAddClick
    end
    object mnAddFolder: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1087#1082#1091
      ShortCut = 16462
      OnClick = mnAddFolderClick
    end
    object mnDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnDelClick
    end
    object mnEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16397
      OnClick = mnEditClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnChooseTheSame: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089' '#1076#1088#1091#1075#1086#1081' '#1089#1090#1086#1088#1086#1085#1099' '#1090#1072#1082#1086#1081' '#1078#1077' '#1082#1072#1090#1072#1083#1086#1075
      ShortCut = 16467
    end
    object mnChangePanel: TMenuItem
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1084#1077#1089#1090#1072#1084#1080' '#1087#1072#1085#1077#1083#1080
      ShortCut = 16469
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnChangeStatus: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1077
      object mnStatus0: TMenuItem
        Caption = #1053#1077' '#1085#1072#1095#1072#1090#1086
        ShortCut = 49230
        OnClick = mnStatus0Click
      end
      object mnStatus1: TMenuItem
        Tag = 1
        Caption = #1042' '#1087#1088#1086#1094#1077#1089#1089#1077
        ShortCut = 49232
        OnClick = mnStatus0Click
      end
      object mnStatus3: TMenuItem
        Tag = 3
        Caption = #1047#1072#1074#1077#1088#1096#1077#1085
        ShortCut = 49221
        OnClick = mnStatus0Click
      end
    end
    object mnMove: TMenuItem
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100
      ShortCut = 117
      OnClick = mnMoveClick
    end
  end
  object fdqLeftSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from %s as source')
    Left = 56
    Top = 278
    object fdqLeftSourcefullname: TWideMemoField
      DisplayLabel = #1055#1072#1087#1082#1072'/'#1080#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'fullname'
      BlobType = ftWideMemo
      Size = 250
    end
    object fdqLeftSourceid: TIntegerField
      FieldName = 'id'
    end
    object fdqLeftSourceis_dir: TIntegerField
      FieldName = 'is_dir'
    end
    object fdqLeftSourceis_mine: TIntegerField
      FieldName = 'is_mine'
    end
    object fdqLeftSourcestatus: TIntegerField
      FieldName = 'status'
    end
    object fdqLeftSourcesource_type_id: TIntegerField
      FieldName = 'source_type_id'
    end
    object fdqLeftSourcesource_classification_id: TIntegerField
      FieldName = 'source_classification_id'
    end
    object fdqLeftSourcename: TWideMemoField
      FieldName = 'name'
      BlobType = ftWideMemo
      Size = 250
    end
  end
  object dsLeftSource: TDataSource
    DataSet = mteLeftSource
    Left = 331
    Top = 279
  end
  object FDQTmpSourceFill: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'insert into %s (source_classification_id,id,is_dir,is_mine,fulln' +
        'ame,themes,source_type_id,status,name)'
      'select * from ('
      ''
      'select source_classification_id, id, 0 is_dir, is_mine, '
      'source_fullname_by_id(s.id,0)  as "fullname::TEXT",'
      
        '(SELECT GROUP_CONCAT(t.name_main) FROM source_keyword st, keywor' +
        'd t '
      
        ' WHERE source_id=s.id and keyword_id=t.id) as "themes::TEXT", so' +
        'urce_type_id, status, name'
      'from source s'
      ''
      'union all'
      ''
      
        'select source_classification_id, id, 1 as is_dir, is_mine, sc.na' +
        'me fullname, '#39#39' themes, 0 as source_type_id, 0 as status, '#39#39' as ' +
        'name'
      'from source_classification sc'
      ''
      'union all'
      ''
      
        'select :STID source_classification_id, -3 as id ,1 is_dir, :ISM ' +
        'is_mine, '#39' ...'#39' as fullnamename, '#39#39' themes, 0 as source_type_id,' +
        ' 0 as status, '#39#39' as name'
      'where :STID<>0'
      ''
      'union all'
      ''
      
        'select :STID source_classification_id, -1 as id ,1 is_dir, :ISM ' +
        'is_mine, '#39#1042#1089#1077' %s'#39' as fullnamename, '#39#39' themes, 0 as source_type_i' +
        'd, 0 as status, '#39#39' as name'
      
        'where :STID=0 and exists (select * from source where is_mine=0) ' +
        'and exists (select * from source_classification where is_mine=:I' +
        'SM)'
      ')'
      
        'where is_mine=:ISM and (source_classification_id=:STID or :STID=' +
        '-1 and is_dir=0)')
    Left = 392
    Top = 96
    ParamData = <
      item
        Name = 'STID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ISM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object WideMemoField1: TWideMemoField
      DisplayLabel = #1055#1072#1087#1082#1072'/'#1080#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'fullname'
      BlobType = ftWideMemo
      Size = 250
    end
    object LargeintField1: TLargeintField
      FieldName = 'id'
    end
    object LargeintField2: TLargeintField
      FieldName = 'is_dir'
    end
    object LargeintField3: TLargeintField
      FieldName = 'is_mine'
    end
    object LargeintField4: TLargeintField
      FieldName = 'source_type_id'
    end
    object LargeintField5: TLargeintField
      FieldName = 'status'
    end
    object LargeintField6: TLargeintField
      FieldName = 'source_classification_id'
    end
  end
  object mteLeftSource: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeLeftSource
    Left = 246
    Top = 279
  end
  object dsdeLeftSource: TDataSetDriverEh
    KeyFields = 'id, is_dir'
    ProviderDataSet = fdqLeftSource
    Left = 151
    Top = 279
  end
  object mteRightSource: TMemTableEh
    Tag = 1
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeRightSource
    Left = 611
    Top = 276
  end
  object dsdeRightSource: TDataSetDriverEh
    Tag = 1
    KeyFields = 'id, is_dir'
    ProviderDataSet = fdqRightSource
    Left = 536
    Top = 277
  end
  object dsRightSource: TDataSource
    Tag = 1
    DataSet = mteRightSource
    Left = 675
    Top = 278
  end
  object fdqRightSource: TFDQuery
    Tag = 1
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from %s as source')
    Left = 451
    Top = 278
    object WideMemoField2: TWideMemoField
      DisplayLabel = #1055#1072#1087#1082#1072'/'#1080#1089#1090#1086#1095#1085#1080#1082
      FieldName = 'fullname'
      BlobType = ftWideMemo
      Size = 250
    end
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
    object IntegerField2: TIntegerField
      FieldName = 'is_dir'
    end
    object IntegerField3: TIntegerField
      FieldName = 'is_mine'
    end
    object IntegerField4: TIntegerField
      FieldName = 'status'
    end
    object IntegerField5: TIntegerField
      FieldName = 'source_type_id'
    end
    object IntegerField6: TIntegerField
      FieldName = 'source_classification_id'
    end
    object WideMemoField3: TWideMemoField
      FieldName = 'name'
      BlobType = ftWideMemo
      Size = 250
    end
  end
end
