object fmTelegram: TfmTelegram
  Left = 0
  Top = 0
  Caption = #1041#1099#1089#1090#1088#1099#1077' '#1079#1072#1084#1077#1090#1082#1080' '#1089' Telegram'
  ClientHeight = 478
  ClientWidth = 932
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
  object memLog: TMemo
    Left = 0
    Top = 0
    Width = 932
    Height = 438
    Align = alClient
    Lines.Strings = (
      'memLog')
    TabOrder = 0
    Visible = False
  end
  object dbgFastNote: TDBGridEh
    Left = 0
    Top = 0
    Width = 932
    Height = 438
    Align = alClient
    AutoFitColWidths = True
    IncludeImageModules = [iimJpegImageModuleEh, iimGIFImageModuleEh, iimPNGImageModuleEh]
    Ctl3D = True
    DataSource = dsFastNote
    DrawGraphicData = True
    DrawMemoText = True
    DynProps = <>
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
    ParentCtl3D = False
    ParentShowHint = False
    PopupMenu = pmFastNote
    ReadOnly = True
    RowHeight = 4
    RowLines = 1
    RowSizingAllowed = True
    SelectionDrawParams.SelectionStyle = gsdsClassicEh
    SelectionDrawParams.DrawFocusFrame = True
    SelectionDrawParams.DrawFocusFrameStored = True
    ShowHint = True
    SortLocal = True
    TabOrder = 1
    VertScrollBar.SmoothStep = True
    Visible = False
    OnDblClick = dbgFastNoteDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'date_time_create'
        Footers = <>
        MaxWidth = 120
        MinWidth = 120
        Width = 120
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'message_type'
        Footers = <>
        MaxWidth = 100
        MinWidth = 99
        Width = 99
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'text'
        Footers = <>
        Width = 265
        WordWrap = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'web_page_type'
        Footers = <>
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'web_page_title'
        Footers = <>
        Width = 120
        WordWrap = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'web_page_url'
        Footers = <>
        Width = 120
        WordWrap = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'file'
        Footers = <>
        ShowImageAndText = True
        Width = 140
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'file_ext'
        Footers = <>
        MaxWidth = 50
        MinWidth = 30
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 438
    Width = 932
    Height = 40
    Align = alBottom
    TabOrder = 2
    object btStart: TButton
      Left = 248
      Top = 5
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1088#1086#1089
      TabOrder = 0
      OnClick = btStartClick
    end
    object btShow: TButton
      Left = 432
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100
      TabOrder = 1
      OnClick = btShowClick
    end
  end
  object TC: TTelegramClient
    OnReceive = TCReceive
    SyncEvents = True
    SyncMethodsCallback = True
    Timeout = 10.000000000000000000
    Parameters.DatabaseDirectory = 'tdlib'
    Parameters.FilesDirectory = 'tdlib_files'
    Parameters.SystemLanguageCode = 'ru'
    Parameters.DeviceModel = 'Desktop'
    Parameters.ApplicationVersion = '0.1'
    ApiId = 20191529
    ApiHash = '0a999ef7eea958705b1bda3723b68ee8'
    OnNeedAuthCode = TCNeedAuthCode
    OnRegistration = TCRegistration
    OnNeedAuthPassword = TCNeedAuthPassword
    OnNeedAuthConfirm = TCNeedAuthConfirm
    OnError = TCError
    Left = 19
    Top = 8
  end
  object fdqFastNote: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select '
      
        '  id,telegram_message_id,text, status, file_unique_id, file_remo' +
        'te_id, file_session_id, '
      
        '  local_file_name, date_time_create, web_page_url, web_page_type' +
        ', web_page_title, file_ext, message_type,'
      ' get_telegram_file(id) as "file::BLOB",'
      'cast(telegram_message_id as text) as "tmid::TEXT" '
      'from telegram_fast_note tfn '
      'where status=:ST'
      'order by telegram_message_id desc'
      '')
    Left = 116
    Top = 99
    ParamData = <
      item
        Name = 'ST'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqFastNoteid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqFastNotetelegram_message_id: TIntegerField
      FieldName = 'telegram_message_id'
      Origin = 'telegram_message_id'
      Required = True
    end
    object fdqFastNotetext: TWideMemoField
      FieldName = 'text'
      Origin = 'text'
      BlobType = ftWideMemo
    end
    object fdqFastNotestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object fdqFastNotefile_unique_id: TWideMemoField
      FieldName = 'file_unique_id'
      Origin = 'file_unique_id'
      BlobType = ftWideMemo
    end
    object fdqFastNotefile_remote_id: TWideMemoField
      FieldName = 'file_remote_id'
      Origin = 'file_remote_id'
      BlobType = ftWideMemo
    end
    object fdqFastNotefile_session_id: TIntegerField
      FieldName = 'file_session_id'
      Origin = 'file_session_id'
    end
    object fdqFastNotefile: TBlobField
      FieldName = 'file'
      Origin = 'file'
    end
    object fdqFastNotelocal_file_name: TWideMemoField
      FieldName = 'local_file_name'
      Origin = 'local_file_name'
      BlobType = ftWideMemo
    end
    object fdqFastNotedate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqFastNotetmid: TWideMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tmid'
      Origin = 'tmid'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqFastNoteweb_page_url: TWideMemoField
      FieldName = 'web_page_url'
      Origin = 'web_page_url'
      BlobType = ftWideMemo
    end
    object fdqFastNoteweb_page_type: TWideMemoField
      FieldName = 'web_page_type'
      Origin = 'web_page_type'
      BlobType = ftWideMemo
    end
    object fdqFastNoteweb_page_title: TWideMemoField
      FieldName = 'web_page_title'
      Origin = 'web_page_title'
      BlobType = ftWideMemo
    end
    object fdqFastNotefile_ext: TWideMemoField
      FieldName = 'file_ext'
      Origin = 'file_ext'
      BlobType = ftWideMemo
    end
    object fdqFastNotemessage_type: TWideMemoField
      FieldName = 'message_type'
      Origin = 'message_type'
      BlobType = ftWideMemo
    end
  end
  object mteFastNote: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeFastNote
    Left = 352
    Top = 99
  end
  object dsdeFastNote: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = fdqFastNote
    Left = 270
    Top = 98
  end
  object dsFastNote: TDataSource
    DataSet = mteFastNote
    Left = 192
    Top = 98
  end
  object pmFastNote: TPopupMenu
    Left = 856
    Top = 16
    object mnCreateNote: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1084#1077#1090#1082#1091' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      ShortCut = 16429
      OnClick = mnCreateNoteClick
    end
    object mnNewNoteAttach: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1084#1077#1090#1082#1091' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1089' '#1092#1072#1081#1083#1072#1084#1080
      ShortCut = 16461
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnNewSource: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      ShortCut = 16467
      OnClick = mnNewSourceClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnMarkCurrent: TMenuItem
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1077#1082#1091#1097#1091#1102' '#1082#1072#1082' '#1086#1090#1088#1072#1073#1086#1090#1072#1085#1085#1091#1102
      ShortCut = 16452
      OnClick = mnMarkCurrentClick
    end
    object mnMarkAsRead: TMenuItem
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1080' '#1085#1080#1078#1077' '#1082#1072#1082' '#1086#1090#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077
      OnClick = mnMarkAsReadClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnShowWhat: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1095#1090#1086'?'
    end
  end
end
