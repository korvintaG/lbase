object fmKeywordStat: TfmKeywordStat
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1082#1083#1102#1095#1077#1074#1099#1084' '#1089#1083#1086#1074#1072#1084
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 447
    Height = 202
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = True
    DataSource = dsStatKW
    DynProps = <>
    TabOrder = 0
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'date_'
        Footers = <>
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'nn'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object fdqStatKW: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select date(date_time_create) date_, count(*) nn '
      'from keyword'
      'group by date(date_time_create)'
      'order by date(date_time_create) desc')
    Left = 80
    Top = 24
    object fdqStatKWdate_: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'date_'
      Origin = 'date_'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object fdqStatKWnn: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074
      FieldName = 'nn'
      Origin = 'nn'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsStatKW: TDataSource
    DataSet = fdqStatKW
    Left = 192
    Top = 32
  end
end
