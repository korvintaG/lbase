object fmKWEdit: TfmKWEdit
  Left = 0
  Top = 0
  Caption = 'fmKWEdit'
  ClientHeight = 336
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSynonym: TDBGridEh
    Left = 0
    Top = 105
    Width = 194
    Height = 190
    Align = alLeft
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
    DataSource = dsKeywordName
    DrawMemoText = True
    DynProps = <>
    Flat = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    PopupMenu = pmSynonym
    ReadOnly = True
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 1
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 188
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object gbNote: TGroupBox
    Left = 0
    Top = 0
    Width = 418
    Height = 105
    Align = alTop
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1083#1102#1095#1077#1074#1086#1075#1086' '#1089#1083#1086#1074#1072' '
    TabOrder = 0
    object mmNote: TMemo
      Left = 2
      Top = 15
      Width = 414
      Height = 88
      Align = alTop
      TabOrder = 0
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 295
    Width = 418
    Height = 41
    Align = alBottom
    TabOrder = 3
    object btOk: TButton
      Left = 155
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btOkClick
    end
  end
  object dbgAntonym: TDBGridEh
    Left = 194
    Top = 105
    Width = 224
    Height = 190
    Align = alClient
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
    AutoFitColWidths = True
    Color = 13092863
    DataSource = dsAntonym
    DrawMemoText = True
    DynProps = <>
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    PopupMenu = pmAntonym
    ReadOnly = True
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 2
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 188
        OnGetCellParams = dbgAntonymColumns0GetCellParams
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object fdqKeywordName: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from keyword_name where keyword_id=:KID '
      'order by order_,id')
    Left = 24
    Top = 216
    ParamData = <
      item
        Name = 'KID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqKeywordNameid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqKeywordNamekeyword_id: TIntegerField
      FieldName = 'keyword_id'
      Origin = 'keyword_id'
      Required = True
    end
    object fdqKeywordNamename: TWideMemoField
      DisplayLabel = #1042#1072#1088#1080#1072#1085#1090#1099' '#1085#1072#1079#1074#1072#1085#1080#1103'/'#1089#1080#1085#1086#1085#1080#1084#1099
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqKeywordNameorder_: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
  end
  object dsKeywordName: TDataSource
    DataSet = fdqKeywordName
    Left = 115
    Top = 216
  end
  object pmSynonym: TPopupMenu
    Left = 142
    Top = 131
    object mnAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnAddClick
    end
    object mnEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16397
      OnClick = mnEditClick
    end
    object mnDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnUp: TMenuItem
      Caption = #1055#1086#1076#1085#1103#1090#1100' '#1074#1099#1096#1077
      ShortCut = 16469
    end
    object mnDown: TMenuItem
      Caption = #1054#1087#1091#1089#1090#1080#1090#1100' '#1085#1080#1078#1077
      ShortCut = 16452
    end
  end
  object fdqAntonym: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select kl2.id as id, k.id as kwid, k.name_w_synonym as name'
      'from keyword k, keyword_link2 kl2 '
      'where :KID in (keyword1_id,keyword2_id) '
      '  and link_type=2'
      '  and '
      '    (keyword1_id=k.id and k.id<>:KID or'
      '     keyword2_id=k.id and k.id<>:KID '
      '    )'
      'order by order_,id')
    Left = 248
    Top = 213
    ParamData = <
      item
        Name = 'KID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqAntonymid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqAntonymkwid: TFDAutoIncField
      FieldName = 'kwid'
      Origin = 'kwid'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqAntonymname: TWideMemoField
      DisplayLabel = #1040#1085#1090#1086#1085#1080#1084#1099
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
  end
  object dsAntonym: TDataSource
    DataSet = fdqAntonym
    Left = 320
    Top = 213
  end
  object pmAntonym: TPopupMenu
    Left = 367
    Top = 138
    object mnAAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnAAddClick
    end
    object mnADel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnADelClick
    end
  end
end
