object fmNoteSource: TfmNoteSource
  Left = 0
  Top = 0
  Caption = 'fmNoteSource'
  ClientHeight = 170
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbSource: TLabel
    Left = 16
    Top = 8
    Width = 92
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082'/'#1087#1088#1086#1077#1082#1090':'
  end
  object lbStoc: TLabel
    Left = 16
    Top = 57
    Width = 68
    Height = 13
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
  end
  object lbPageFrom: TLabel
    Left = 16
    Top = 115
    Width = 61
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1080#1094#1072' '#1089':'
  end
  object dblSource: TDBLookupComboboxEh
    Left = 8
    Top = 27
    Width = 745
    Height = 21
    DynProps = <>
    DataField = 'source_id'
    DataSource = dsNoteSource
    DropDownBox.Rows = 17
    EditButtons = <>
    KeyField = 'id'
    ListField = 'fullname'
    ListSource = dsSource
    TabOrder = 0
    Visible = True
    OnChange = dblSourceChange
  end
  object btSave: TButton
    Left = 416
    Top = 128
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btSaveClick
  end
  object dblStoc: TDBLookupComboboxEh
    Left = 16
    Top = 76
    Width = 745
    Height = 21
    DynProps = <>
    DataField = 'stoc_id'
    DataSource = dsNoteSource
    DropDownBox.Rows = 17
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsSTOC_Tmp
    TabOrder = 2
    Visible = True
  end
  object dbnPageFrom: TDBNumberEditEh
    Left = 88
    Top = 112
    Width = 121
    Height = 21
    DataField = 'Page_from'
    DataSource = dsNoteSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object fdqNoteSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from note_source where id=:IID or :INS=1')
    Left = 264
    Top = 112
    ParamData = <
      item
        Name = 'IID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'INS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteSourceid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteSourcenote_id: TIntegerField
      FieldName = 'note_id'
      Origin = 'note_id'
      Required = True
    end
    object fdqNoteSourcesource_id: TIntegerField
      FieldName = 'source_id'
      Origin = 'source_id'
      Required = True
    end
    object fdqNoteSourcestoc_id: TIntegerField
      FieldName = 'stoc_id'
      Origin = 'stoc_id'
    end
    object fdqNoteSourcePage_from: TFloatField
      FieldName = 'Page_from'
      Origin = 'Page_from'
    end
    object fdqNoteSourcePage_to: TFloatField
      FieldName = 'Page_to'
      Origin = 'Page_to'
    end
    object fdqNoteSourceorder_: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
  end
  object dsNoteSource: TDataSource
    DataSet = fdqNoteSource
    Left = 312
    Top = 120
  end
  object fdqSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select s.*,'
      ''
      '(SELECT GROUP_CONCAT(a.name) FROM source_author sa, author a '
      ' WHERE source_id=s.id and author_id=a.id) as "authors::TEXT",'
      ''
      
        '(SELECT GROUP_CONCAT(kwn.name) FROM source_keyword st, keyword t' +
        ' , keyword_name kwn'
      
        ' WHERE kwn.keyword_id=t.id and source_id=s.id and st.keyword_id=' +
        't.id) as "themes::TEXT",'
      ''
      'source_fullname_by_id(id,1) as "fullname::TEXT"'
      ''
      'from source s'
      
        'order by name, (SELECT GROUP_CONCAT(a.name) FROM source_author s' +
        'a, author a '
      ' WHERE source_id=s.id and author_id=a.id)')
    Left = 88
    Top = 128
    object fdqSourceid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSourcename: TWideMemoField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 80
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
    object fdqSourceauthors: TWideMemoField
      DisplayLabel = #1040#1074#1090#1086#1088#1099' '
      FieldName = 'authors'
      ReadOnly = True
      BlobType = ftWideMemo
      Size = 1000
    end
    object fdqSourcefullname: TWideMemoField
      DisplayLabel = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      FieldName = 'fullname'
      BlobType = ftWideMemo
      Size = 1000
    end
    object fdqSourcesource_type_id: TIntegerField
      FieldName = 'source_type_id'
      Origin = 'source_type_id'
    end
    object fdqSourcedate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqSourcethemes: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1058#1077#1084#1072
      FieldName = 'themes'
      Origin = 'themes'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqSourcenote_show_mode: TIntegerField
      FieldName = 'note_show_mode'
      Origin = 'note_show_mode'
      Required = True
    end
  end
  object dsSource: TDataSource
    DataSet = fdqSource
    Left = 144
    Top = 128
  end
  object dsSTOC_Tmp: TDataSource
    DataSet = fdqSTOC_Tmp
    Left = 355
    Top = 142
  end
  object fdqSTOC_Tmp: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from tmp_stoc order by order_')
    Left = 355
    Top = 112
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object WideMemoField1: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqSTOC_Tmporder_: TIntegerField
      FieldName = 'order_'
      Origin = 'order_'
    end
  end
end
