object fmNoteLinkAdd: TfmNoteLinkAdd
  Left = 0
  Top = 0
  Caption = 'fmNoteLinkAdd'
  ClientHeight = 364
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbLinkType: TLabel
    Left = 59
    Top = 130
    Width = 244
    Height = 13
    Alignment = taRightJustify
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1089#1074#1103#1079#1080' - '#1074#1099#1096#1077#1091#1082#1072#1079#1072#1085#1085#1072#1103' '#1079#1072#1084#1077#1090#1082#1072'...'
  end
  object gbSelNote: TGroupBox
    Left = 2
    Top = 8
    Width = 585
    Height = 108
    Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1079#1072#1084#1077#1090#1082#1091
    TabOrder = 0
    object lbSource: TLabel
      Left = 8
      Top = 22
      Width = 52
      Height = 13
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082':'
    end
    object lbNote: TLabel
      Left = 8
      Top = 51
      Width = 46
      Height = 13
      Caption = #1047#1072#1084#1077#1090#1082#1072':'
    end
    object dblSource: TDBLookupComboboxEh
      Left = 64
      Top = 19
      Width = 511
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.SpecRow.CellsText = ' '
      DropDownBox.SpecRow.ShortCut = 16430
      DropDownBox.SpecRow.Value = '0'
      DropDownBox.SpecRow.Visible = True
      DropDownBox.Width = 600
      EditButtons = <>
      KeyField = 'id'
      ListField = 'fullname'
      ListSource = dsSource
      TabOrder = 0
      Visible = True
      OnChange = dblSourceChange
    end
    object dblNote: TDBLookupComboboxEh
      Left = 57
      Top = 48
      Width = 518
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.Rows = 15
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsnoteall
      TabOrder = 1
      Visible = True
      OnChange = dblNoteChange
    end
    object btSignID: TButton
      Left = 57
      Top = 75
      Width = 145
      Height = 25
      Caption = #1054#1079#1085#1072#1095#1080#1090#1100' '#1087#1086' ID '#1079#1072#1084#1077#1090#1082#1080
      TabOrder = 2
      OnClick = btSignIDClick
    end
  end
  object dblLinkType: TDBLookupComboboxEh
    Left = 309
    Top = 127
    Width = 177
    Height = 21
    DynProps = <>
    DataField = ''
    EditButtons = <>
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsLinkType
    TabOrder = 1
    Visible = True
    OnChange = dblLinkTypeChange
  end
  object gbDetail: TGroupBox
    Left = 2
    Top = 159
    Width = 585
    Height = 199
    Caption = 
      #1055#1086' '#1085#1072#1078#1072#1090#1080#1102' '#1082#1085#1086#1087#1082#1080' "'#1044#1086#1073#1072#1074#1080#1090#1100'" '#1085#1080#1078#1077#1091#1082#1072#1079#1072#1085#1085#1072#1103' '#1089#1074#1103#1079#1100' '#1073#1091#1076#1077#1090' '#1091#1089#1090#1072#1085#1086#1074#1083#1077 +
      #1085#1072':'
    TabOrder = 2
    object btAdd: TButton
      Left = 240
      Top = 167
      Width = 113
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1074#1103#1079#1100
      Enabled = False
      TabOrder = 0
      OnClick = btAddClick
    end
    object meDetail: TMemo
      Left = 8
      Top = 23
      Width = 567
      Height = 138
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object fdqnoteall: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select n.id,'
      ''
      'name'
      'from note n'
      'where '
      
        '  (ifnull(:SID,0)=0 or exists (select * from note_source ns wher' +
        'e note_id=n.id and ifnull(:SID,0) in (0,-1,ns.source_id) ))'
      '  and n.id<>:NID '
      'order by "fullsname::TEXT"')
    Left = 176
    Top = 65531
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqnoteallid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqnoteallname: TWideMemoField
      FieldName = 'name'
      BlobType = ftWideMemo
      Size = 400
    end
  end
  object dsnoteall: TDataSource
    DataSet = fdqnoteall
    Left = 248
    Top = 65532
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
  object fdqLinkType: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from link_type')
    Left = 352
    Top = 232
    object fdqLinkTypeid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqLinkTypename: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqLinkTypecorr_link_type: TIntegerField
      FieldName = 'corr_link_type'
      Origin = 'corr_link_type'
    end
  end
  object dsLinkType: TDataSource
    DataSet = fdqLinkType
    Left = 424
    Top = 240
  end
end
