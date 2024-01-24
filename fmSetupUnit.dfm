object fmSetup: TfmSetup
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 330
  ClientWidth = 368
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
  object Label1: TLabel
    Left = 0
    Top = 19
    Width = 68
    Height = 13
    Caption = #1053#1077' '#1087#1088#1086#1095#1080#1090#1072#1085':'
  end
  object pcMain: TPageControl
    Left = 0
    Top = 0
    Width = 368
    Height = 289
    ActivePage = tsMain
    Align = alClient
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089
      object lbNoteView: TLabel
        Left = 8
        Top = 8
        Width = 327
        Height = 13
        Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1085#1086#1074#1099#1093' '#1079#1072#1084#1077#1090#1086#1082', '#1076#1086#1073#1072#1074#1083#1103#1077#1084#1099#1093' '#1073#1077#1079' '#1080#1089#1090#1086#1095#1085#1080#1082#1072':'
      end
      object lbScale: TLabel
        Left = 12
        Top = 237
        Width = 222
        Height = 13
        Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1091#1074#1077#1083#1080#1095#1077#1085#1080#1103' '#1101#1082#1088#1072#1085#1072' ('#1086#1090' 100) :'
      end
      object cbUseNoteTypization: TCheckBox
        Left = 12
        Top = 79
        Width = 221
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1080#1087#1080#1079#1072#1094#1080#1102' '#1079#1072#1084#1077#1090#1086#1082'?'
        TabOrder = 2
      end
      object cbUseTagForSource: TCheckBox
        Left = 12
        Top = 100
        Width = 330
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1082#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072' '#1076#1083#1103' '#1080#1089#1090#1086#1095#1085#1080#1082#1086#1074'/'#1087#1088#1086#1077#1082#1090#1086#1074'?'
        TabOrder = 3
      end
      object cbKWUni: TCheckBox
        Left = 12
        Top = 56
        Width = 271
        Height = 17
        Caption = #1057#1090#1088#1077#1084#1080#1090#1100#1089#1103' '#1082' '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1089#1090#1080' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074'?'
        TabOrder = 1
      end
      object gbKWNoteShow: TGroupBox
        Left = 8
        Top = 148
        Width = 327
        Height = 81
        Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1079#1072#1084#1077#1090#1086#1082' '#1087#1086' '#1082#1083#1102#1095#1077#1074#1099#1084' '#1089#1083#1086#1074#1072#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object clbKWShowNote: TCheckListBox
          Left = 2
          Top = 16
          Width = 323
          Height = 63
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            #1042#1099#1074#1086#1076#1080#1090#1100' '#1080' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084' '#1080#1085#1090#1077#1088#1077#1089#1086#1074
            #1042#1099#1074#1086#1076#1080#1090#1100' '#1079#1072#1084#1077#1090#1082#1080' '#1087#1086' '#1072#1085#1090#1086#1085#1080#1084#1072#1084
            #1042#1099#1074#1086#1076#1080#1090#1100' '#1079#1072#1084#1077#1090#1082#1080' '#1087#1086' '#1086#1084#1086#1085#1080#1084#1072#1084' ')
          ParentFont = False
          TabOrder = 0
        end
      end
      object cbNoteShowMode: TComboBox
        Left = 12
        Top = 27
        Width = 321
        Height = 21
        Style = csDropDownList
        TabOrder = 0
        Items.Strings = (
          #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1086#1087'.'#1087#1072#1088#1072#1084#1077#1090#1088#1099
          #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1073#1099#1089#1090#1088#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
          #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1074#1076#1086#1093#1085#1086#1074#1080#1074#1096#1080#1081' '#1086#1088#1080#1075#1080#1085#1072#1083
          #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1080' '#1073#1099#1089#1090#1088#1091#1102' '#1079#1072#1084#1077#1090#1082#1091' '#1080' '#1086#1088#1080#1075#1080#1085#1072#1083)
      end
      object cbNoteSourceKeyword: TCheckBox
        Left = 12
        Top = 122
        Width = 330
        Height = 17
        Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1082#1083#1102#1095#1077#1074#1099#1077' '#1089#1083#1086#1074#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1086#1074' '#1082#1072#1082' '#1079#1072#1084#1077#1090#1086#1082'?'
        TabOrder = 5
      end
      object dbnScale: TDBNumberEditEh
        Left = 240
        Top = 235
        Width = 95
        Height = 21
        DynProps = <>
        EditButtons = <>
        MaxValue = 500.000000000000000000
        MinValue = 100.000000000000000000
        TabOrder = 6
        Visible = True
      end
    end
    object tsTelegram: TTabSheet
      Caption = 'Telegram'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 364
      ExplicitHeight = 271
      object lbTelegramSaveNote: TLabel
        Left = 8
        Top = 41
        Width = 226
        Height = 13
        Caption = #1057#1082#1086#1083#1100#1082#1086' '#1076#1085#1077#1081' '#1093#1088#1072#1085#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' Telegram:'
      end
      object leTelegramPhone: TLabeledEdit
        Left = 128
        Top = 10
        Width = 205
        Height = 21
        EditLabel.Width = 116
        EditLabel.Height = 13
        EditLabel.Caption = #8470' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1090#1077#1083#1077#1075#1088#1072#1084
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object dbnTelegramFastNoteDay: TDBNumberEditEh
        Left = 240
        Top = 38
        Width = 93
        Height = 21
        DynProps = <>
        EditButtons = <>
        MaxValue = 365.000000000000000000
        MinValue = 1.000000000000000000
        TabOrder = 1
        Visible = True
      end
    end
    object tsColor: TTabSheet
      Caption = #1062#1074#1077#1090#1072
      ImageIndex = 2
      object lbColorScheme: TLabel
        Left = 11
        Top = 5
        Width = 108
        Height = 13
        Caption = #1048#1084#1103' '#1094#1074#1077#1090#1086#1074#1086#1081' '#1089#1093#1077#1084#1099':'
      end
      object cbColorScheme: TComboBox
        Left = 125
        Top = 2
        Width = 206
        Height = 21
        Style = csDropDownList
        DropDownCount = 18
        TabOrder = 0
      end
      object gbSourceList: TGroupBox
        Left = 7
        Top = 71
        Width = 324
        Height = 48
        Caption = #1057#1087#1080#1089#1086#1082' '#1080#1089#1090#1086#1095#1085#1080#1082#1086#1074'/'#1087#1088#1086#1077#1082#1090#1086#1074
        TabOrder = 1
        object lbSLNotRead: TLabel
          Left = 10
          Top = 19
          Width = 68
          Height = 13
          Caption = #1053#1077' '#1087#1088#1086#1095#1080#1090#1072#1085':'
        end
        object lbSLInProcess: TLabel
          Left = 149
          Top = 19
          Width = 59
          Height = 13
          Caption = #1042' '#1087#1088#1086#1094#1077#1089#1089#1077':'
        end
        object bcSLNotRead: TButtonColor
          Left = 83
          Top = 14
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          StyleElements = []
        end
        object bcSLInProcess: TButtonColor
          Left = 214
          Top = 14
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          StyleElements = []
        end
      end
      object gbKWCommander: TGroupBox
        Left = 7
        Top = 123
        Width = 324
        Height = 132
        Caption = #1057#1087#1080#1089#1086#1082' '#1082#1083#1102#1095#1077#1074#1099#1093' '#1089#1083#1086#1074
        TabOrder = 2
        object lbKWDef: TLabel
          Left = 10
          Top = 19
          Width = 203
          Height = 13
          Caption = #1064#1088#1080#1092#1090' '#1087#1088#1080' '#1085#1072#1083#1080#1095#1080#1080' '#1088#1072#1089#1096#1080#1092#1088#1086#1074#1082#1080' '#1090#1101#1075#1072':'
        end
        object lbKWBkgAntonym: TLabel
          Left = 10
          Top = 58
          Width = 55
          Height = 13
          Caption = #1040#1085#1090#1086#1085#1080#1084#1099':'
        end
        object lbKWBkgOmonym: TLabel
          Left = 10
          Top = 83
          Width = 50
          Height = 13
          Caption = #1054#1084#1086#1085#1080#1084#1099':'
        end
        object lbKWBkg: TLabel
          Left = 88
          Top = 38
          Width = 20
          Height = 13
          Caption = #1060#1086#1085
        end
        object lbKWFont: TLabel
          Left = 139
          Top = 38
          Width = 36
          Height = 13
          Caption = #1064#1088#1080#1092#1090
        end
        object lbKWInterest: TLabel
          Left = 10
          Top = 108
          Width = 54
          Height = 13
          Caption = #1048#1085#1090#1077#1088#1077#1089#1099':'
        end
        object bcKWDef: TButtonColor
          Left = 214
          Top = 14
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
          StyleElements = []
        end
        object bcKWBkgAntonym: TButtonColor
          Left = 74
          Top = 53
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
          StyleElements = []
        end
        object bcKWBkgOmonym: TButtonColor
          Left = 74
          Top = 78
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          StyleElements = []
        end
        object bcKWFontAntonym: TButtonColor
          Left = 131
          Top = 53
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 3
          StyleElements = []
        end
        object bcKWFontOmonym: TButtonColor
          Left = 131
          Top = 78
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 4
          StyleElements = []
        end
        object bcKWBkgInterest: TButtonColor
          Left = 74
          Top = 103
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 5
          StyleElements = []
        end
        object bcKWFontInterest: TButtonColor
          Left = 131
          Top = 103
          Width = 49
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 6
          StyleElements = []
        end
      end
      object lbeThemeFile: TLabeledEdit
        Left = 72
        Top = 38
        Width = 259
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = #1060#1072#1081#1083' '#1090#1077#1084#1099': '
        LabelPosition = lpLeft
        TabOrder = 3
      end
    end
    object Store: TTabSheet
      Caption = #1061#1088#1072#1085#1077#1085#1080#1077
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 364
      ExplicitHeight = 271
      object lbStorePlace: TLabel
        Left = 6
        Top = 6
        Width = 216
        Height = 13
        Caption = #1052#1077#1089#1090#1086' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1087#1088#1080#1089#1086#1077#1076#1080#1085#1103#1077#1084#1099#1093' '#1092#1072#1081#1083#1086#1074':'
      end
      object leStoreDir: TLabeledEdit
        Left = 3
        Top = 69
        Width = 350
        Height = 21
        EditLabel.Width = 212
        EditLabel.Height = 13
        EditLabel.Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1093#1088#1072#1085#1077#1085#1080#1103' '#1092#1072#1081#1083#1086#1074':'
        TabOrder = 0
      end
      object cbStorePlace: TComboBoxEx
        Left = 3
        Top = 26
        Width = 350
        Height = 22
        ItemsEx = <
          item
            Caption = #1061#1088#1072#1085#1080#1090#1100' '#1074#1085#1091#1090#1088#1080' '#1074' SQLite '#1073#1072#1079#1077
          end
          item
            Caption = #1061#1088#1072#1085#1080#1090#1100' '#1074' '#1091#1082#1072#1079#1072#1085#1085#1086#1084' '#1074#1085#1077#1096#1085#1077#1084' '#1082#1072#1090#1072#1083#1086#1075#1077
          end>
        Style = csExDropDownList
        TabOrder = 1
        OnChange = cbStorePlaceChange
        OnEnter = cbStorePlaceEnter
        DropDownCount = 2
      end
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 289
    Width = 368
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btSave: TButton
      Left = 83
      Top = 6
      Width = 169
      Height = 25
      Hint = #1050#1083#1099#1094#1085#1080#1090#1077' '#1076#1074#1072#1078#1076#1099' '#1076#1083#1103' '#1089#1084#1077#1085#1099' '#1080#1083#1080' Del '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btSaveClick
    end
  end
end
