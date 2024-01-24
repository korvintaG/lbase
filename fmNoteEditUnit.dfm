object fmNoteEdit: TfmNoteEdit
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1084#1077#1090#1082#1080
  ClientHeight = 485
  ClientWidth = 1005
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pcMainNoteEdit: TPageControl
    Left = 0
    Top = 35
    Width = 1005
    Height = 409
    ActivePage = tsGen
    Align = alClient
    TabOrder = 0
    object tsGen: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      OnShow = tsGenShow
      object Splitter1: TSplitter
        Left = 0
        Top = 73
        Width = 997
        Height = 7
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = 3
        ExplicitTop = 79
        ExplicitWidth = 300
      end
      object pnTop: TPanel
        Left = 0
        Top = 0
        Width = 997
        Height = 73
        Align = alTop
        Padding.Bottom = 6
        TabOrder = 0
        object gbFast: TGroupBox
          Left = 1
          Top = 1
          Width = 995
          Height = 65
          Align = alClient
          Caption = #1041#1099#1089#1090#1088#1072#1103' '#1079#1072#1084#1077#1090#1082#1072
          TabOrder = 0
          OnDblClick = gbsourceDblClick
          object dbmFastNote: TDBMemoEh
            Left = 2
            Top = 15
            Width = 991
            Height = 48
            ScrollBars = ssVertical
            Align = alClient
            AutoSize = False
            DataField = 'fast_text'
            DataSource = dsNote
            DynProps = <>
            EditButtons = <>
            TabOrder = 0
            Visible = True
            WantReturns = True
            OnChange = dbmFastNoteChange
          end
        end
      end
      object pnMain: TPanel
        Left = 0
        Top = 80
        Width = 997
        Height = 301
        Align = alClient
        TabOrder = 1
        object splVert: TSplitter
          Left = 329
          Top = 1
          Width = 7
          Height = 299
          ExplicitHeight = 303
        end
        object gbsource: TGroupBox
          Left = 1
          Top = 1
          Width = 328
          Height = 299
          Align = alLeft
          Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090', '#1074#1076#1086#1093#1085#1086#1074#1080#1074#1096#1080#1081' '#1085#1072' '#1079#1072#1084#1077#1090#1082#1091':'
          Padding.Left = 6
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 0
          OnDblClick = gbsourceDblClick
          object dbmOriginal: TDBMemoEh
            Left = 8
            Top = 15
            Width = 313
            Height = 277
            ScrollBars = ssVertical
            Align = alClient
            AutoSelect = False
            AutoSize = False
            DataField = 'original_text'
            DataSource = dsNote
            DynProps = <>
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Visible = True
            WantReturns = True
            OnChange = dbmOriginalChange
          end
        end
        object gbNote: TGroupBox
          Left = 336
          Top = 1
          Width = 660
          Height = 299
          Align = alClient
          Caption = #1057#1091#1090#1100' '#1079#1072#1084#1077#1090#1082#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          Padding.Left = 5
          Padding.Right = 6
          Padding.Bottom = 5
          ParentFont = False
          TabOrder = 1
          OnDblClick = gbsourceDblClick
          object dbrNoteContent: TDBRichEditEh
            Left = 7
            Top = 21
            Width = 645
            Height = 271
            Align = alClient
            DataField = 'content'
            DataSource = dsNote
            EditButtons = <
              item
                Style = ebsEllipsisEh
                Visible = False
              end>
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = True
            PopupMenu = pmNote
            TabOrder = 0
            OnChange = dbrNoteContentChange
            OnEnter = dbrNoteContentEnter
            OnExit = dbrNoteContentExit
          end
        end
      end
    end
    object tsSource: TTabSheet
      Caption = #1057#1074#1103#1079#1072#1090#1100' '#1089' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084#1080'/'#1087#1088#1086#1077#1082#1090#1072#1084#1080
      ImageIndex = 3
      object dbgNoteSource: TDBGridEh
        Left = 0
        Top = 0
        Width = 997
        Height = 381
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsNoteSource
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        PopupMenu = pmNoteSource
        RowHeight = 4
        RowLines = 1
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'sourcename'
            Footers = <>
            ImageList = fmmain.TreeImage
            ShowImageAndText = True
            Width = 332
            OnGetCellParams = dbgNoteSourceColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'stocname'
            Footers = <>
            Width = 276
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Page_from'
            Footers = <>
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsTag: TTabSheet
      Caption = #1050#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072
      ImageIndex = 1
      object dbgKeyWord: TDBGridEh
        Left = 0
        Top = 0
        Width = 756
        Height = 381
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = DSNoteKeyword
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmKeyWord
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        Columns = <
          item
            Alignment = taLeftJustify
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'kword'
            Footers = <>
            ImageList = fmmain.TreeImage
            MaxWidth = 210
            ShowImageAndText = True
            Width = 202
            OnGetCellParams = dbgKeyWordColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'kclass'
            Footers = <>
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbgStrucItem: TDBGridEh
        Left = 756
        Top = 0
        Width = 241
        Height = 381
        Align = alRight
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsNoteStrucIt
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmStrucItem
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 1
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'si_name'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsDublicate: TTabSheet
      Caption = #1044#1091#1073#1083#1080#1082#1072#1090#1099'?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      object dbgNoteDubl: TDBGridEh
        Left = 0
        Top = 0
        Width = 997
        Height = 381
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsNoteDubl
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ReadOnly = True
        RowHeight = 4
        RowLines = 1
        RowSizingAllowed = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        OnDblClick = dbgNoteDublDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ImageList = fmmain.TreeImage
            ShowImageAndText = True
            OnGetCellParams = dbgNoteDublColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'sources'
            Footers = <>
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'same_kw'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsNoteLink: TTabSheet
      Caption = #1057#1074#1103#1079#1100' '#1089' '#1079#1072#1084#1077#1090#1082#1072#1084#1080
      ImageIndex = 4
      object dbgLinks: TDBGridEh
        Left = 0
        Top = 0
        Width = 997
        Height = 200
        Align = alTop
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsNoteLink
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        PopupMenu = pmNoteLink
        RowHeight = 4
        RowLines = 1
        RowSizingAllowed = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        TitleParams.RowLines = 2
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'note2_name'
            Footers = <>
            ImageList = fmmain.TreeImage
            ShowImageAndText = True
            Width = 300
            OnGetCellParams = dbgLinksColumns0GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'sources'
            Footers = <>
            Width = 261
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'link_type_name'
            Footers = <>
            MaxWidth = 90
            MinWidth = 90
            Width = 90
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsAdd: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      ImageIndex = 2
      object dbgurl: TDBGridEh
        Left = 0
        Top = 0
        Width = 342
        Height = 381
        Align = alLeft
        AllowedOperations = []
        AutoFitColWidths = True
        DataSource = dsNoteURL
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmUrl
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'url'
            Footers = <>
            Width = 130
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbgFiles: TDBGridEh
        Left = 342
        Top = 0
        Width = 655
        Height = 381
        Align = alClient
        AutoFitColWidths = True
        DataSource = dsNoteAttach
        DrawMemoText = True
        DynProps = <>
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        PopupMenu = pmAttach
        ReadOnly = True
        SelectionDrawParams.SelectionStyle = gsdsClassicEh
        TabOrder = 1
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'filename'
            Footers = <>
            Width = 323
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'file_size'
            Footers = <>
            MinWidth = 70
            Width = 70
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnTool: TPanel
    Left = 0
    Top = 444
    Width = 1005
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btOk: TButton
      Left = 254
      Top = 6
      Width = 147
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      WordWrap = True
      OnClick = btOkClick
    end
    object btSaveAndContinue: TButton
      Left = 416
      Top = 6
      Width = 147
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1100
      TabOrder = 1
      OnClick = btOkClick
    end
  end
  object pnTopGlo: TPanel
    Left = 0
    Top = 0
    Width = 1005
    Height = 35
    Align = alTop
    TabOrder = 2
    object lbName: TLabel
      Left = 76
      Top = 9
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1084#1077#1090#1082#1080':'
    end
    object sbNoteDel: TSpeedButton
      Left = 30
      Top = 5
      Width = 23
      Height = 22
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000E30E0000E30E0000000100000001000031319C003131
        A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
        E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
        FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
        FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
        1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
        0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
        0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
        0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
        1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
        0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
        11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
        0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbNoteDelClick
    end
    object sbNoteCopy: TSpeedButton
      Left = 3
      Top = 5
      Width = 23
      Height = 22
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B000000010000000100008C5A5A009C6B
        63009C6B6B00EFB56B00A57B7300B5847300C68C7B00BD848400B58C8C00FFD6
        A500BDADAD00F7DEBD00D6C6C600F7DEC600FFDEC600FFE7C600EFDECE00F7DE
        CE00F7E7CE00FFE7CE00EFE7D600F7E7D600FFE7D600FFEFD600EFDEDE00EFE7
        DE00F7E7DE00F7EFDE00FFEFDE00FFF7DE00FFF7E700FFF7EF00FFFFEF00FFFF
        F700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00222222222208
        000000000000000000222222222222081E1B1B1B1B1B1B120022222222222208
        1B110D0D0D0D101000222222222222081E090909090909100022220800000008
        1F0D0D0D0D0B1210012222081E1B1B081F120D0D0D0D1510022222081B110D08
        2109090909090914042222081E0909082116161512161E18042222081F0D0D08
        2323232121180C0A052222081F120D0823232321210808080822220821090908
        2323232323080306222222082116160808080808080807222222220823232321
        21180C0A05222222222222082323232121080808082222222222220823232323
        2308030622222222222222080808080808080722222222222222}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbNoteCopyClick
    end
    object dbeName: TDBEditEh
      Left = 178
      Top = 5
      Width = 642
      Height = 22
      Align = alCustom
      DataField = 'name'
      DataSource = dsNote
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = dbeNameChange
    end
  end
  object fdqNoteKeyword: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select nk.*, kn.name kword, k.class_name_after kclass,'
      
        'ifnull((select count(*) from note_keyword nkc where nkc.keyword_' +
        'id=nk.keyword_id),0) as "kwcount::INT" ,'
      
        'ifnull((select count(*) from source_keyword nkc where nkc.keywor' +
        'd_id=nk.keyword_id),0) as "kwscount::INT" '
      'from note_keyword nk, keyword_name kn, keyword k'
      
        'where nk.note_id=:NID and nk.keyword_name_id=kn.id and kn.keywor' +
        'd_id=k.id'
      'order by k.name_main')
    Left = 712
    Top = 192
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteKeywordid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteKeywordnote_id: TIntegerField
      FieldName = 'note_id'
      Origin = 'note_id'
      Required = True
    end
    object fdqNoteKeywordkeyword_id: TIntegerField
      FieldName = 'keyword_id'
      Origin = 'keyword_id'
      Required = True
    end
    object fdqNoteKeywordkeyword_name_id: TIntegerField
      FieldName = 'keyword_name_id'
      Origin = 'keyword_name_id'
      Required = True
    end
    object fdqNoteKeywordkwcount: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'kwcount'
      Origin = 'kwcount'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdqNoteKeywordkword: TWideMemoField
      DisplayLabel = #1050#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086
      FieldName = 'kword'
      BlobType = ftWideMemo
      Size = 100
    end
    object fdqNoteKeywordkclass: TWideMemoField
      DisplayLabel = #1052#1077#1089#1090#1086' '#1074' '#1080#1077#1088#1072#1088#1093#1080#1080
      FieldName = 'kclass'
      BlobType = ftWideMemo
      Size = 250
    end
    object fdqNoteKeywordkwscount: TIntegerField
      FieldName = 'kwscount'
    end
  end
  object DSNoteKeyword: TDataSource
    DataSet = fdqNoteKeyword
    Left = 736
    Top = 240
  end
  object fdqNoteLink: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select nl.id, nl.note1_id, nl.note2_id, nl.link_type, lt.name li' +
        'nk_type_name, n2.name note2_name,'
      
        '(SELECT GROUP_CONCAT(source_fullname_by_id(source_id,1)) FROM no' +
        'te_source ns WHERE note2_id=note_id ) as "sources::TEXT",'
      
        '(select GROUP_CONCAT(distinct is_mine) from note_source, source ' +
        'where note_id=note2_id and note_source.source_id=source.id ) "nt' +
        'ype::TEXT",'
      
        '(select count(*) from note_source where note2_id =note_id) "srcc' +
        'ount::INT"'
      'from note_link nl, note n2, link_type lt'
      'where note1_id=:NID and note2_id=n2.id and link_type=lt.id'
      '')
    Left = 624
    Top = 16
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteLinkid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteLinknote1_id: TIntegerField
      FieldName = 'note1_id'
      Origin = 'note1_id'
      Required = True
    end
    object fdqNoteLinknote2_id: TIntegerField
      FieldName = 'note2_id'
      Origin = 'note2_id'
      Required = True
    end
    object fdqNoteLinklink_type: TIntegerField
      FieldName = 'link_type'
      Origin = 'link_type'
      Required = True
    end
    object fdqNoteLinklink_type_name: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1057#1074#1103#1079#1072#1085#1072' '#1089' '#1090#1077#1082#1091#1097#1077#1081
      FieldName = 'link_type_name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqNoteLinknote2_name: TWideMemoField
      AutoGenerateValue = arDefault
      DisplayLabel = #1047#1072#1084#1077#1090#1082#1072
      FieldName = 'note2_name'
      Origin = 'name'
      ProviderFlags = []
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object fdqNoteLinkntype: TWideMemoField
      FieldName = 'ntype'
      BlobType = ftWideMemo
      Size = 20
    end
    object fdqNoteLinksrccount: TIntegerField
      FieldName = 'srccount'
    end
    object fdqNoteLinksources: TWideMemoField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082#1080'/'#1087#1088#1086#1077#1082#1090#1099
      FieldName = 'sources'
      BlobType = ftWideMemo
      Size = 500
    end
  end
  object dsNoteLink: TDataSource
    DataSet = mteNoteLink
    Left = 560
    Top = 24
  end
  object pmNoteLink: TPopupMenu
    Left = 512
    Top = 64
    object mnNoteLinkAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1074#1103#1079#1100
      ShortCut = 16429
      OnClick = mnNoteLinkAddClick
    end
    object mnNoteLinkDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1074#1103#1079#1100
      ShortCut = 16430
      OnClick = mnNoteLinkDelClick
    end
    object mnGotoNote: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1089#1074#1103#1079#1072#1085#1085#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
      ShortCut = 16455
      OnClick = mnGotoNoteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnCreateNoteNewByLink: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1074#1103#1079#1072#1085#1085#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
      ShortCut = 16462
      OnClick = mnCreateNoteNewByLinkClick
    end
  end
  object fdqNote: TFDQuery
    Connection = DM.sqlc
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.RefreshMode = rmAll
    SQL.Strings = (
      'select nn.*'
      'from note nn'
      '')
    Left = 40
    Top = 248
    object fdqNoteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNotesubpart_id: TIntegerField
      FieldName = 'subpart_id'
      Origin = 'subpart_id'
    end
    object fdqNotename: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNoteoriginal_text: TWideMemoField
      FieldName = 'original_text'
      Origin = 'original_text'
      BlobType = ftWideMemo
    end
    object fdqNotecontent: TWideMemoField
      FieldName = 'content'
      Origin = 'content'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNotecontent_plain: TWideMemoField
      FieldName = 'content_plain'
      Origin = 'content_plain'
      BlobType = ftWideMemo
    end
    object fdqNotedate_time_create: TDateTimeField
      FieldName = 'date_time_create'
      Origin = 'date_time_create'
    end
    object fdqNotefast_text: TWideMemoField
      FieldName = 'fast_text'
      Origin = 'fast_text'
      BlobType = ftWideMemo
    end
    object fdqNotenote_show_mode: TIntegerField
      FieldName = 'note_show_mode'
      Origin = 'note_show_mode'
      Required = True
    end
    object fdqNotesplitter_param: TIntegerField
      FieldName = 'splitter_param'
      Origin = 'splitter_param'
    end
    object fdqNoteh_splitter_param: TIntegerField
      FieldName = 'h_splitter_param'
      Origin = 'h_splitter_param'
    end
    object fdqNotedate_time_update: TDateTimeField
      FieldName = 'date_time_update'
      Origin = 'date_time_update'
    end
    object fdqNoteform_width: TIntegerField
      FieldName = 'form_width'
      Origin = 'form_width'
    end
    object fdqNotetelegram_message_id: TWideMemoField
      FieldName = 'telegram_message_id'
      Origin = 'telegram_message_id'
      BlobType = ftWideMemo
    end
  end
  object dsNote: TDataSource
    DataSet = fdqNote
    OnDataChange = dsNoteDataChange
    Left = 88
    Top = 248
  end
  object pmKeyWord: TPopupMenu
    Left = 800
    Top = 208
    object pmKWAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = pmKWAddClick
    end
    object mnAddIer: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1080#1077#1088#1072#1088#1093#1080#1080
      ShortCut = 16462
    end
    object mnKWDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnKWDelClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnGotoTag: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1082#1083#1102#1095#1077#1074#1086#1084#1091' '#1089#1083#1086#1074#1091
      ShortCut = 16455
      OnClick = mnGotoTagClick
    end
  end
  object fdqNoteURL: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select * from note_url where note_id=:NID order by id')
    Left = 896
    Top = 16
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteURLid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteURLurl: TWideMemoField
      DisplayLabel = 'WEB-'#1089#1089#1099#1083#1082#1072' '#1082' '#1089#1090#1072#1090#1100#1077
      FieldName = 'url'
      Origin = 'url'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNoteURLnote_id: TIntegerField
      FieldName = 'note_id'
      Origin = 'note_id'
      Required = True
    end
    object fdqNoteURLcomment: TWideMemoField
      FieldName = 'comment'
      Origin = 'comment'
      BlobType = ftWideMemo
    end
  end
  object dsNoteURL: TDataSource
    DataSet = fdqNoteURL
    Left = 944
    Top = 16
  end
  object pmUrl: TPopupMenu
    Left = 848
    Top = 8
    object mnUrlAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnUrlAddClick
    end
    object mnurldel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnurldelClick
    end
    object mnurledit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 16397
      OnClick = mnurleditClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnUrlGo: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1087#1086' '#1089#1089#1099#1083#1082#1077
      ShortCut = 16455
      OnClick = mnUrlGoClick
    end
  end
  object dsNoteAttach: TDataSource
    DataSet = fdqNoteAttach
    Left = 522
    Top = 376
  end
  object fdqNoteAttach: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select id, note_id, filename, file_size from note_attach where n' +
        'ote_id=:NID')
    Left = 469
    Top = 360
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteAttachid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqNoteAttachfilename: TWideMemoField
      DisplayLabel = #1048#1084#1103' '#1087#1088#1080#1089#1086#1077#1076#1080#1085#1077#1085#1085#1086#1075#1086' '#1092#1072#1081#1083#1072
      FieldName = 'filename'
      Origin = 'filename'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNoteAttachfile_size: TIntegerField
      DisplayLabel = #1056#1072#1079#1084#1077#1088
      FieldName = 'file_size'
      Origin = 'file_size'
    end
    object fdqNoteAttachnote_id: TIntegerField
      FieldName = 'note_id'
      Origin = 'note_id'
      Required = True
    end
  end
  object pmAttach: TPopupMenu
    Left = 416
    Top = 376
    object mnAttachAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnAttachAddClick
    end
    object mnAttachDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnAttachDelClick
    end
    object mnFileOpen: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ShortCut = 16455
      OnClick = mnFileOpenClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object mnAttachSave: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1092#1072#1081#1083
      ShortCut = 16467
      OnClick = mnAttachSaveClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 516
    Top = 330
  end
  object sdAttach: TSaveDialog
    Left = 427
    Top = 333
  end
  object fdqNoteStrucIt: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select nk.* , si.name si_name'
      'from note_structure_item nk , structure_item si'
      'where note_id=:NID and si.id=nk.structure_item_id'
      'order by si.name')
    Left = 680
    Top = 360
    ParamData = <
      item
        Name = 'NID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteStrucItid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteStrucItnote_id: TIntegerField
      FieldName = 'note_id'
      Origin = 'note_id'
      Required = True
    end
    object fdqNoteStrucItstructure_item_id: TIntegerField
      FieldName = 'structure_item_id'
      Origin = 'structure_item_id'
      Required = True
    end
    object fdqNoteStrucItsi_name: TWideMemoField
      DisplayLabel = #1058#1080#1087' '#1080#1076#1077#1080
      FieldName = 'si_name'
      BlobType = ftWideMemo
      Size = 100
    end
  end
  object dsNoteStrucIt: TDataSource
    DataSet = fdqNoteStrucIt
    Left = 760
    Top = 360
  end
  object pmStrucItem: TPopupMenu
    Left = 824
    Top = 360
    object mnStrItAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnStrItAddClick
    end
    object mnStrItDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnStrItDelClick
    end
  end
  object fdqNoteSource: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      
        'select ns.id, ns.source_id, ns.stoc_id, ns.note_id, ns.page_from' +
        ', ns.page_to, ns.order_,'
      'source_fullname_by_id(ns.source_id,1) as "sourcename::TEXT" ,'
      'stoc_fullname(ns.stoc_id) as "stocname::TEXT",'
      
        '(select is_mine from source where id=ns.source_id) "is_mine::INT' +
        '",'
      
        '(select source_type_id from source where id=ns.source_id) "sourc' +
        'e_type_id::INT"'
      ''
      ''
      'from note_source ns where ns.note_id=:NID')
    Left = 292
    Top = 227
    ParamData = <
      item
        Name = 'NID'
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
      DisplayLabel = #1057':'
      FieldName = 'Page_from'
      Origin = 'Page_from'
    end
    object fdqNoteSourcePage_to: TFloatField
      FieldName = 'Page_to'
      Origin = 'Page_to'
    end
    object fdqNoteSourceorder_: TIntegerField
      FieldName = 'order_'
    end
    object fdqNoteSourcesourcename: TWideMemoField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082'/'#1087#1088#1086#1077#1082#1090
      FieldName = 'sourcename'
      BlobType = ftWideMemo
      Size = 1000
    end
    object fdqNoteSourcestocname: TWideMemoField
      DisplayLabel = #1053#1072' '#1101#1083#1077#1084#1077#1085#1090' '#1086#1075#1083#1072#1074#1083#1077#1085#1080#1103
      FieldName = 'stocname'
      BlobType = ftWideMemo
      Size = 1000
    end
    object fdqNoteSourcesource_type_id: TIntegerField
      FieldName = 'source_type_id'
    end
    object fdqNoteSourceis_mine: TIntegerField
      FieldName = 'is_mine'
    end
  end
  object dsNoteSource: TDataSource
    DataSet = mteNoteSource
    Left = 324
    Top = 179
  end
  object pmNoteSource: TPopupMenu
    Left = 292
    Top = 275
    object mnNoteSourceAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ShortCut = 16429
      OnClick = mnNoteSourceAddClick
    end
    object mnNoteSourceDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 16430
      OnClick = mnNoteSourceDelClick
    end
    object mnNoteSourceEdit: TMenuItem
      Caption = #1055#1088#1072#1074#1080#1090#1100
      ShortCut = 16397
      OnClick = mnNoteSourceEditClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnGotoSource: TMenuItem
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1085#1072' '#1080#1089#1090#1086#1095#1085#1080#1082'/'#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      ShortCut = 16455
      OnClick = mnGotoSourceClick
    end
  end
  object pmNote: TPopupMenu
    Left = 68
    Top = 196
    object mnEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1088#1072#1089#1096#1080#1088#1077#1085#1085#1086#1084' '#1088#1077#1078#1080#1084#1077
      ShortCut = 16397
      OnClick = mnEditClick
    end
    object mnPasteBuf: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
      ShortCut = 16470
      OnClick = mnPasteBufClick
    end
    object mnCopyBuf: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1077' '#1074' '#1073#1091#1092#1077#1088
      ShortCut = 16451
      OnClick = mnCopyBufClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnToRtf: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' RTF-'#1092#1072#1081#1083
      OnClick = mnToRtfClick
    end
  end
  object fdqNoteDubl: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select id, name,'
      
        '(SELECT GROUP_CONCAT(source_fullname_by_id(source_id,1)) FROM no' +
        'te_source ns WHERE note.id=note_id ) as "sources::TEXT",'
      
        '(select GROUP_CONCAT(distinct is_mine) from note_source, source ' +
        'where note_id=note.id and note_source.source_id=source.id ) "nty' +
        'pe::TEXT",'
      
        '(select GROUP_CONCAT(kwn.name) from note_keyword nka,  keyword_n' +
        'ame kwn'
      'where  nka.note_id=note.id and kwn.id=nka.keyword_name_id'
      
        '       and exists (select * from note_keyword nkt where nkt.note' +
        '_id=:NNN and nkt.keyword_id=kwn.keyword_id)) as "same_kw::TEXT",'
      
        '(select count(*) from note_source where note.id =note_id) "srcco' +
        'unt::INT"'
      'from note '
      'where id in ('
      'select note_id from ('
      'select nk2.note_id, count(*)'
      'from note_keyword nk1, note_keyword nk2'
      
        'where :NNN=nk1.note_id and nk1.keyword_id=nk2.keyword_id and nk1' +
        '.note_id<>nk2.note_id'
      'group by nk2.note_id'
      'having count(*)>1))'
      'order by name')
    Left = 300
    Top = 65526
    ParamData = <
      item
        Name = 'NNN'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdqNoteDublid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqNoteDublname: TWideMemoField
      DisplayLabel = #1047#1072#1075#1083#1072#1074#1080#1077' '#1079#1072#1084#1077#1090#1082#1080
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
    object fdqNoteDublsources: TWideMemoField
      DisplayLabel = #1048#1089#1090#1086#1095#1085#1080#1082#1080'/'#1087#1088#1086#1077#1082#1090#1099
      FieldName = 'sources'
      BlobType = ftWideMemo
      Size = 400
    end
    object fdqNoteDublntype: TWideMemoField
      FieldName = 'ntype'
      BlobType = ftWideMemo
      Size = 100
    end
    object fdqNoteDublsame_kw: TWideMemoField
      DisplayLabel = #1054#1073#1097#1080#1077' '#1090#1101#1075#1080
      FieldName = 'same_kw'
      BlobType = ftWideMemo
      Size = 300
    end
    object fdqNoteDublsrccount: TIntegerField
      FieldName = 'srccount'
    end
  end
  object dsNoteDubl: TDataSource
    DataSet = mteNoteDubl
    Left = 252
    Top = 30
  end
  object mteNoteDubl: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeNoteDubl
    Left = 296
    Top = 48
  end
  object dsdeNoteDubl: TDataSetDriverEh
    KeyFields = 'id, is_dir'
    ProviderDataSet = fdqNoteDubl
    Left = 352
    Top = 32
  end
  object mteNoteLink: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeNoteLink
    Left = 584
    Top = 80
  end
  object dsdeNoteLink: TDataSetDriverEh
    KeyFields = 'id, is_dir'
    ProviderDataSet = fdqNoteLink
    Left = 640
    Top = 64
  end
  object mteNoteSource: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = dsdeNoteSource
    Left = 360
    Top = 224
  end
  object dsdeNoteSource: TDataSetDriverEh
    KeyFields = 'id'
    ProviderDataSet = fdqNoteSource
    Left = 360
    Top = 280
  end
end
