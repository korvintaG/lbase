object fmNoteType: TfmNoteType
  Left = 0
  Top = 0
  Caption = 'fmNoteType'
  ClientHeight = 122
  ClientWidth = 651
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
  object gbAddExists: TGroupBox
    Left = 0
    Top = 0
    Width = 649
    Height = 49
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1090#1080#1087#1072' '#1079#1072#1084#1077#1090#1082#1080
    TabOrder = 0
    object lbChoose: TLabel
      Left = 9
      Top = 20
      Width = 75
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1077#1090#1077' '#1090#1080#1087':'
    end
    object dblStrucItem: TDBLookupComboboxEh
      Left = 90
      Top = 17
      Width = 231
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.Rows = 25
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsNoteTypeToAdd
      TabOrder = 0
      Visible = True
    end
    object btAddStrucItem: TButton
      Left = 346
      Top = 15
      Width = 247
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1090#1080#1087' '#1079#1072#1084#1077#1090#1082#1080
      TabOrder = 1
      OnClick = btAddStrucItemClick
    end
  end
  object gbAddNew: TGroupBox
    Left = 0
    Top = 55
    Width = 649
    Height = 66
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1080' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1090#1080#1087#1072' '#1079#1072#1084#1077#1090#1082#1080
    TabOrder = 1
    object lbAddNew: TLabel
      Left = 9
      Top = 24
      Width = 103
      Height = 13
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1099#1081' '#1090#1080#1087':'
    end
    object dbeNewStrucItem: TDBEditEh
      Left = 143
      Top = 21
      Width = 165
      Height = 21
      DynProps = <>
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object btAddNewStrucItem: TButton
      Left = 336
      Top = 19
      Width = 297
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1077#1097#1077' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1080#1087' '#1079#1072#1084#1077#1090#1082#1080
      TabOrder = 1
      OnClick = btAddNewStrucItemClick
    end
  end
  object fdqNoteTypeToAdd: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from Structure_Item k'
      
        'where not exists (select * from note_Structure_item where note_i' +
        'd=:NID and Structure_Item_id=k.id)'
      'order by name')
    Left = 192
    Top = 56
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteTypeToAddid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteTypeToAddname: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object dsNoteTypeToAdd: TDataSource
    DataSet = fdqNoteTypeToAdd
    Left = 216
    Top = 24
  end
end
