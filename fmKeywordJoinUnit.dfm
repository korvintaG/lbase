object fmKeywordJoin: TfmKeywordJoin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077' / '#1089#1084#1077#1085#1072' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074
  ClientHeight = 216
  ClientWidth = 444
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
  object lbOld: TLabel
    Left = 11
    Top = 4
    Width = 261
    Height = 13
    Caption = #1057#1090#1072#1088#1086#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086', '#1082#1086#1090#1086#1088#1086#1077' '#1085#1091#1078#1085#1086' '#1079#1072#1084#1077#1085#1080#1090#1100':'
  end
  object lbNew: TLabel
    Left = 11
    Top = 50
    Width = 348
    Height = 13
    Caption = #1053#1086#1074#1086#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086', '#1082#1086#1090#1086#1088#1086#1077' '#1085#1091#1078#1085#1086' '#1087#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1074#1079#1072#1084#1077#1085' '#1089#1090#1072#1088#1086#1075#1086':'
  end
  object lbSource: TLabel
    Left = 11
    Top = 99
    Width = 165
    Height = 13
    Caption = #1054#1075#1088#1072#1085#1080#1095#1080#1090#1100' '#1079#1072#1084#1077#1085#1091' '#1080#1089#1090#1086#1095#1085#1080#1082#1086#1084':'
  end
  object dblOld: TDBLookupComboboxEh
    Left = 8
    Top = 24
    Width = 428
    Height = 21
    DynProps = <>
    DataField = ''
    DropDownBox.Rows = 17
    DropDownBox.Width = 600
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsKeywordName
    TabOrder = 0
    Visible = True
  end
  object dblNew: TDBLookupComboboxEh
    Left = 8
    Top = 71
    Width = 428
    Height = 21
    DynProps = <>
    DataField = ''
    DropDownBox.Rows = 17
    DropDownBox.Width = 600
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsKeywordName
    TabOrder = 1
    Visible = True
  end
  object dblSource: TDBLookupComboboxEh
    Left = 8
    Top = 119
    Width = 428
    Height = 21
    DynProps = <>
    DataField = ''
    DropDownBox.Rows = 17
    DropDownBox.Width = 600
    EditButtons = <>
    KeyField = 'id'
    ListField = 'fullname'
    ListSource = dsSource
    TabOrder = 2
    Visible = True
    OnChange = dblSourceChange
    OnClick = dblSourceChange
  end
  object cbDelOld: TCheckBox
    Left = 8
    Top = 151
    Width = 313
    Height = 17
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1072#1088#1086#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086' '#1087#1086#1089#1083#1077' '#1079#1072#1084#1077#1085#1099
    TabOrder = 3
  end
  object btJoin: TButton
    Left = 87
    Top = 177
    Width = 241
    Height = 25
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' / '#1089#1084#1077#1085#1080#1090#1100' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
    TabOrder = 4
    OnClick = btJoinClick
  end
  object fdqKeywordName: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select kn.id, name ||class_name_after as "name::TEXT" , k.id kw_' +
        'id'
      'from keyword_name kn, keyword k'
      'where kn.keyword_id=k.id'
      'order by name ||class_name_after')
    Left = 304
    Top = 15
    object fdqKeywordNameid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqKeywordNamename: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqKeywordNamekw_id: TIntegerField
      FieldName = 'kw_id'
    end
  end
  object dsKeywordName: TDataSource
    DataSet = fdqKeywordName
    Left = 368
    Top = 15
  end
  object fdqSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select id, is_mine, source_fullname_by_id(s.id,1)  as "fullname:' +
        ':TEXT"'
      'from source s'
      'order by source_fullname_by_id(s.id,1)')
    Left = 224
    Top = 100
    object fdqSourceid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqSourceis_mine: TIntegerField
      FieldName = 'is_mine'
      Origin = 'is_mine'
      Required = True
    end
    object fdqSourcefullname: TWideMemoField
      FieldName = 'fullname'
      BlobType = ftWideMemo
      Size = 300
    end
  end
  object dsSource: TDataSource
    DataSet = fdqSource
    Left = 288
    Top = 100
  end
end
