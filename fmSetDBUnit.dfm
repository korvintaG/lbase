object fmSetDB: TfmSetDB
  Left = 0
  Top = 0
  Caption = 'fmSetDB'
  ClientHeight = 269
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTitle: TLabel
    AlignWithMargins = True
    Left = 19
    Top = 8
    Width = 262
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1057#1080#1089#1090#1077#1084#1072' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1080#1076#1077#1081' '#171#1071#1097#1080#1082' '#1051#1091#1084#1072#1085#1072#187
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 14573611
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btOpen: TButton
    Left = 19
    Top = 42
    Width = 249
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1081' '#1092#1072#1081#1083' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    TabOrder = 0
    OnClick = btOpenClick
  end
  object btCreate: TButton
    Left = 19
    Top = 200
    Width = 249
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1072#1081#1083' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    TabOrder = 3
    OnClick = btCreateClick
  end
  object pnOpenLast: TPanel
    Left = 8
    Top = 73
    Width = 273
    Height = 80
    TabOrder = 1
    object lbLastDBFileName: TLabel
      Left = 11
      Top = 40
      Width = 84
      Height = 13
      Caption = 'lbLastDBFileName'
    end
    object btOpenLast: TButton
      Left = 11
      Top = 9
      Width = 249
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
      TabOrder = 0
      OnClick = btOpenLastClick
    end
    object cbAutoOpen: TCheckBox
      Left = 9
      Top = 56
      Width = 234
      Height = 17
      Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1086#1090#1082#1088#1099#1074#1072#1090#1100' '#1087#1088#1080' '#1074#1093#1086#1076#1077
      TabOrder = 1
    end
  end
  object btExit: TButton
    Left = 113
    Top = 234
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = btExitClick
  end
  object btCreateDemo: TButton
    Left = 19
    Top = 166
    Width = 249
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080' '#1086#1090#1082#1088#1099#1090#1100' '#1076#1077#1084#1086' '#1092#1072#1081#1083
    TabOrder = 2
    OnClick = btCreateDemoClick
  end
  object opendialog: TOpenDialog
    DefaultExt = 'db'
    Filter = 'DBFile|*.db'
    Left = 272
    Top = 120
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'db'
    Filter = 'DBFile|*.db'
    Left = 272
    Top = 184
  end
end
