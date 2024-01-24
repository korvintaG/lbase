object fmTaskList: TfmTaskList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1076#1072#1095
  ClientHeight = 202
  ClientWidth = 792
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgTask: TDBGridEh
    Left = 0
    Top = 41
    Width = 792
    Height = 161
    Align = alClient
    AutoFitColWidths = True
    DataSource = dsTask
    DrawMemoText = True
    DynProps = <>
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = pmTask
    ReadOnly = True
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    TabOrder = 0
    OnDblClick = dbgTaskDblClick
    OnKeyDown = dbgTaskKeyDown
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'pname'
        Footers = <>
        Width = 186
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ptname'
        Footers = <>
        MaxWidth = 160
        MinWidth = 90
        Width = 129
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 189
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'deadline'
        Footers = <>
        MaxWidth = 90
        MinWidth = 90
        Width = 90
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'status'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '3'
          '2')
        MaxWidth = 80
        MinWidth = 80
        PickList.Strings = (
          #1057#1086#1079#1076#1072#1085#1072
          #1053#1072#1095#1072#1090#1072
          #1047#1072#1074#1077#1088#1096#1077#1085#1072
          #1054#1090#1084#1077#1085#1077#1085#1072)
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'date_time_close'
        Footers = <>
        MaxWidth = 90
        MinWidth = 90
        Width = 90
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 41
    Align = alTop
    TabOrder = 1
    object lbFiltrStatus: TLabel
      Left = 8
      Top = 9
      Width = 148
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1079#1072#1076#1072#1095':'
    end
    object dbcFiltrStatus: TDBComboBoxEh
      Left = 170
      Top = 6
      Width = 167
      Height = 21
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1042#1089#1077
        #1057#1086#1079#1076#1072#1085#1086
        #1042' '#1088#1072#1073#1086#1090#1077
        #1040#1082#1090#1080#1074#1085#1099#1077
        #1047#1072#1074#1077#1088#1096#1077#1085#1086
        #1054#1090#1084#1077#1085#1077#1085#1086)
      KeyItems.Strings = (
        '-1'
        '0'
        '1'
        '10'
        '3'
        '2')
      TabOrder = 0
      Visible = True
      OnChange = dbcFiltrStatusChange
    end
  end
  object fdqTask: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select task.*,'
      
        '(select GROUP_CONCAT(distinct source_fullname_by_id(tp.source_id' +
        ',1)) from task_source tp'
      'where task_id=task.id and is_mine=1) as "pname::TEXT",'
      
        '(select name from task pt where pt.id=ifnull(task.task_id,0)) as' +
        ' "ptname::TEXT"'
      ' from task')
    Left = 144
    Top = 72
    object fdqTaskid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqTaskname: TWideMemoField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'name'
      Origin = 'name'
      BlobType = ftWideMemo
    end
    object fdqTaskcontent: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      BlobType = ftWideMemo
    end
    object fdqTasktype_: TIntegerField
      FieldName = 'type_'
      Origin = 'type_'
      Required = True
    end
    object fdqTaskdeadline: TDateTimeField
      DisplayLabel = #1050#1088#1072#1081#1085#1080#1081' '#1089#1088#1086#1082
      FieldName = 'deadline'
      Origin = 'deadline'
    end
    object fdqTaskdate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqTaskstatus: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object fdqTaskdate_time_close: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
      FieldName = 'date_time_close'
      Origin = 'date_time_close'
    end
    object fdqTasktask_id: TIntegerField
      FieldName = 'task_id'
      Origin = 'task_id'
    end
    object fdqTaskpname: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1050' '#1087#1088#1086#1077#1082#1090#1091
      FieldName = 'pname'
      Origin = 'pname'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqTaskptname: TWideMemoField
      DisplayLabel = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1072#1103' '#1079#1072#1076#1072#1095#1072
      FieldName = 'ptname'
      BlobType = ftWideMemo
      Size = 300
    end
  end
  object dsTask: TDataSource
    DataSet = fdqTask
    Left = 216
    Top = 72
  end
  object pmTask: TPopupMenu
    OnPopup = pmTaskPopup
    Left = 280
    Top = 88
    object mnSort: TMenuItem
      Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      object mnByID: TMenuItem
        Caption = #1042' '#1087#1086#1088#1103#1076#1082#1077' '#1089#1086#1079#1076#1072#1085#1080#1103
        OnClick = mnByIDClick
      end
      object mnByIDDesc: TMenuItem
        Tag = 1
        Caption = #1042' '#1087#1086#1088#1103#1076#1082#1077' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnByIDClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnByProj: TMenuItem
        Tag = 2
        Caption = #1055#1086' '#1087#1088#1086#1077#1082#1090#1072#1084
        OnClick = mnByIDClick
      end
      object mnByProjDesc: TMenuItem
        Caption = #1055#1086' '#1087#1088#1086#1077#1082#1090#1072#1084' '#1087#1086' '#1091#1073#1099#1074#1072#1085#1080#1102
        OnClick = mnByIDClick
      end
    end
    object mnInsert: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091
      ShortCut = 16429
      OnClick = mnInsertClick
    end
    object mnDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
      ShortCut = 16430
      OnClick = mnDelClick
    end
  end
end
