object fmNoteViewMode: TfmNoteViewMode
  Left = 0
  Top = 0
  Caption = 'fmNoteViewMode'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnFast: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 41
    Align = alTop
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 0
    object cbShowFastNode: TCheckBox
      Left = 122
      Top = 13
      Width = 217
      Height = 17
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1073#1099#1089#1090#1088#1091#1102' '#1079#1072#1084#1077#1090#1082#1091
      TabOrder = 0
    end
  end
  object pnBottom: TPanel
    Left = 0
    Top = 161
    Width = 447
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btSaveNote: TButton
      Left = 13
      Top = 9
      Width = 145
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1083#1103' '#1079#1072#1084#1077#1090#1082#1080
      ModalResult = 1
      TabOrder = 0
    end
    object btSavetNoteAnd: TButton
      Left = 164
      Top = 9
      Width = 268
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1083#1103' '#1079#1072#1084#1077#1090#1082#1080' '#1080' '#1076#1083#1103' '#1074#1089#1077#1075#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      ModalResult = 6
      TabOrder = 1
    end
  end
  object pnRight: TPanel
    Left = 0
    Top = 41
    Width = 105
    Height = 120
    Align = alLeft
    Color = 14215400
    ParentBackground = False
    TabOrder = 2
    object cbOriginal: TCheckBox
      Left = 4
      Top = 34
      Width = 97
      Height = 41
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1076#1086#1093#1085#1086#1074#1080#1074#1096#1080#1081' '#1086#1088#1080#1075#1080#1085#1072#1083
      TabOrder = 0
      WordWrap = True
    end
  end
end
