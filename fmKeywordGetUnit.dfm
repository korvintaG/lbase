object fmKeywordGet: TfmKeywordGet
  Left = 0
  Top = 0
  Caption = 'fmKeywordGet'
  ClientHeight = 189
  ClientWidth = 636
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
  object gbChoose: TGroupBox
    Left = 0
    Top = 41
    Width = 636
    Height = 58
    Align = alTop
    Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1082#1083#1102#1095#1077#1074#1086#1075#1086' '#1089#1083#1086#1074#1072
    PopupMenu = pmSetup
    TabOrder = 0
    object sbSetup: TSpeedButton
      Left = 5
      Top = 22
      Width = 23
      Height = 22
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000220B0000220B00000001000000010000292929003131
        2900E78C31002121390031313900293142004242420042424A00524A4A005A52
        4A00E79C4A00F7AD5A00846B63009C6B6300A56B6B0094736B009C736B00A573
        6B00AD736B00D6946B00A5737300A57B7300C68C7300CE94730018297B00AD84
        7B00B58C7B00BD8C7B00C6947B00D69C7B00EFBD7B00636B8400CE9C8400D69C
        8400D6A58400DEA58400EFC68400F7CE8400948C8C00B5A58C00D6B58C00F7CE
        8C00182994006B739400949494009C9C9400EFC69400F7CE940010219C008C8C
        9C00C6B59C00DEC69C00E7C69C00E7CE9C00EFCE9C00F7CE9C00F7D69C000821
        A5001029A500A5A5A500EFCEA5005263AD00D6B5AD00DECEAD00F7D6AD00F7DE
        AD00FFDEAD00B5A5B500ADB5B500F7D6B500F7DEB500FFDEB500D6B5BD00D6CE
        BD00E7CEBD00F7DEBD008C9CC600EFD6C600E7DEC600F7E7C600FFE7C600EFE7
        CE00FFEFCE006373D600F7E7D600FFE7D600FFEFD600C6BDDE00F7EFDE00FFF7
        DE00425AE700637BE700F7EFE700FFF7E7005A73EF006B7BEF00CECEEF00FFF7
        EF00FFFFEF00BDC6F700FFFFF700FF00FF004263FF00426BFF007B94FF009CB5
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0065650D0D0D0D
        0D0D0D0D0D0D0D0D0E65656510504640382F2424242424240D656565104F4B40
        3C362E241E1E1E1E0D6565651054524B4740362E241E1E1E0D65656514592626
        262634362E241E1E0D6565651564012B3A032840362E241E0D6565651964045B
        683033473C362E240D6565651A6A0608092A5332453C362E0D6565651B6A6A5C
        54545B5A4A403C360D6565651C6A2626262651574D4540340F656565206A013B
        3D054959524F3F270C656565206A076867184E5D4A0E0E0E0E656565226A001F
        313963643E0E0A020E656565226A442C2C4C6669480E0B0E65656565225C6464
        6461605E430E0E6565656565131D1D1D17161616120E65656565}
      PopupMenu = pmSetup
      OnClick = sbSetupClick
    end
    object dblKeyword: TDBLookupComboboxEh
      Left = 32
      Top = 23
      Width = 428
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.Rows = 17
      DropDownBox.Width = 600
      EditButtons = <>
      KeyField = 'kw_name_id'
      ListField = 'name'
      ListSource = dsKeyWordToAdd
      PopupMenu = pmSetup
      TabOrder = 0
      Visible = True
    end
    object btAddKeyword: TButton
      Left = 469
      Top = 16
      Width = 156
      Height = 35
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1090#1101#1075
      ModalResult = 1
      PopupMenu = pmSetup
      TabOrder = 1
      WordWrap = True
      OnClick = btAddKeywordClick
    end
  end
  object gbAddNew: TGroupBox
    Left = 0
    Top = 99
    Width = 636
    Height = 90
    Align = alTop
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1080' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1082#1083#1102#1095#1077#1074#1086#1075#1086' '#1089#1083#1086#1074#1072
    TabOrder = 1
    Visible = False
    object lbAddNew: TLabel
      Left = 8
      Top = 24
      Width = 166
      Height = 13
      Alignment = taRightJustify
      Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1074#1086#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086':'
    end
    object lbTheme: TLabel
      Left = 8
      Top = 60
      Width = 139
      Height = 13
      Alignment = taRightJustify
      Caption = #1050#1086#1088#1085#1077#1074#1086#1077' '#1082#1083#1102#1095#1077#1074#1086#1077' '#1089#1083#1086#1074#1086':'
    end
    object dbeNewKeyWord: TDBEditEh
      Left = 179
      Top = 21
      Width = 239
      Height = 21
      DynProps = <>
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object btAddNewKeyword: TButton
      Left = 424
      Top = 19
      Width = 198
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1077#1097#1077' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1081' '#1090#1101#1075
      ModalResult = 1
      TabOrder = 1
      OnClick = btAddNewKeywordClick
    end
    object dblRootTag: TDBLookupComboboxEh
      Left = 150
      Top = 57
      Width = 472
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.Rows = 17
      EditButtons = <>
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsKeywordRoot
      TabOrder = 2
      Visible = True
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 636
    Height = 41
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 279
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1086#1083#1085#1086#1075#1086' '#1087#1091#1090#1080' '#1082#1083#1102#1095#1077#1074#1086#1075#1086' '#1089#1083#1086#1074#1072':'
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbcIerMode: TDBComboBoxEh
      Left = 287
      Top = 5
      Width = 226
      Height = 21
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1048#1077#1088#1072#1088#1093#1080#1103' '#1089' '#1083#1080#1089#1090#1072
        #1048#1077#1088#1072#1088#1093#1080#1103' '#1089' '#1082#1086#1088#1085#1103)
      KeyItems.Strings = (
        '0'
        '1')
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnChange = dbcIerModeChange
    end
  end
  object dsKeyWordToAdd: TDataSource
    Left = 320
    Top = 48
  end
  object pmSetup: TPopupMenu
    OnPopup = pmSetupPopup
    Left = 593
    Top = 65525
    object mnRootFormWay: TMenuItem
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1087#1086#1089#1086#1073' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1086#1083#1085#1086#1075#1086' '#1087#1091#1090#1080' '#1082#1083#1102#1095#1077#1074#1086#1075#1086' '#1089#1083#1086#1074#1072
      OnClick = mnRootFormWayClick
    end
    object mnAddNew: TMenuItem
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1082#1083#1102#1095#1077#1074#1086#1075#1086' '#1089#1083#1086#1074#1072
      OnClick = mnAddNewClick
    end
  end
  object fdqKeywordRoot: TFDQuery
    Connection = DM.sqlc
    SQL.Strings = (
      'select kn.id, %s as "name::TEXT" '
      'from keyword_name kn, keyword k'
      'where kn.keyword_id=k.id'
      'order by %s')
    Left = 128
    Top = 123
    object fdqKeywordRootid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdqKeywordRootname: TWideMemoField
      FieldName = 'name'
      Origin = 'name'
      Required = True
      BlobType = ftWideMemo
    end
  end
  object dsKeywordRoot: TDataSource
    DataSet = fdqKeywordRoot
    Left = 232
    Top = 123
  end
end