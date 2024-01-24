object fmGetSTOC: TfmGetSTOC
  Left = 0
  Top = 0
  Caption = #1042#1074#1086#1076' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'/'#1087#1088#1086#1077#1082#1090#1072' '#1089' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1077#1084
  ClientHeight = 193
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
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
    DataField = ''
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
    ModalResult = 1
    TabOrder = 1
    OnClick = btSaveClick
  end
  object dblStoc: TDBLookupComboboxEh
    Left = 16
    Top = 76
    Width = 745
    Height = 21
    DynProps = <>
    DataField = ''
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
    DynProps = <>
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object fdqSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select s.*,'
      'source_fullname_by_id(id,1) as "fullname::TEXT"'
      'from source s'
      '%s'
      'order by name')
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
