object fmSourceAuthor: TfmSourceAuthor
  Left = 0
  Top = 0
  Caption = 'fmSourceAuthor'
  ClientHeight = 121
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object gbExistingAuthor: TGroupBox
    Left = 1
    Top = 0
    Width = 544
    Height = 49
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1072#1074#1090#1086#1088#1072
    TabOrder = 0
    object lbExistingAuthor: TLabel
      Left = 9
      Top = 20
      Width = 93
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1072#1074#1090#1086#1088#1072':'
    end
    object dblAuthor: TDBLookupComboboxEh
      Left = 108
      Top = 17
      Width = 248
      Height = 21
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsAuthorToAdd
      TabOrder = 0
      Visible = True
    end
    object btAddAuthor: TButton
      Left = 362
      Top = 15
      Width = 175
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1072#1074#1090#1086#1088#1072
      TabOrder = 1
      OnClick = btAddAuthorClick
    end
  end
  object gbNewAuthor: TGroupBox
    Left = 1
    Top = 55
    Width = 544
    Height = 66
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1080' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1072#1074#1090#1086#1088#1072
    TabOrder = 1
    object lbNewAuthor: TLabel
      Left = 9
      Top = 24
      Width = 124
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1086#1075#1086' '#1072#1074#1090#1086#1088#1072':'
    end
    object dbeNewAuthor: TDBEditEh
      Left = 140
      Top = 21
      Width = 238
      Height = 21
      DynProps = <>
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object btAddNewAuthor: TButton
      Left = 384
      Top = 19
      Width = 153
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1072#1074#1090#1086#1088#1072
      TabOrder = 1
      OnClick = btAddNewAuthorClick
    end
  end
  object fdqAuthorToAdd: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from author a'
      'where not exists '
      ' (select * from source_author where source_id=:SID '
      'and author_id=a.id)'
      'order by name')
    Left = 218
    Top = 40
    ParamData = <
      item
        Name = 'SID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqAuthorToAddid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqAuthorToAddname: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqAuthorToAddnotes: TWideMemoField
      FieldName = 'notes'
      Origin = 'notes'
      BlobType = ftWideMemo
    end
  end
  object dsAuthorToAdd: TDataSource
    DataSet = fdqAuthorToAdd
    Left = 306
    Top = 32
  end
end
