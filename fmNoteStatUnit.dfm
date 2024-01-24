object fmNoteStat: TfmNoteStat
  Left = 0
  Top = 0
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086' '#1079#1072#1084#1077#1090#1082#1072#1084
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
    DataSource = dsStatNote
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
  object fdqStatNote: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select date(date_time_create) date_, count(*) nn '
      'from note'
      'group by date(date_time_create)'
      'order by date(date_time_create) desc')
    Left = 80
    Top = 24
    object fdqStatNotedate_: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'date_'
      Origin = 'date_'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object fdqStatNotenn: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1079#1072#1084#1077#1090#1086#1082
      FieldName = 'nn'
      Origin = 'nn'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsStatNote: TDataSource
    DataSet = fdqStatNote
    Left = 192
    Top = 32
  end
end
