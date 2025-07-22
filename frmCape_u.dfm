object frmCape: TfrmCape
  Left = 170
  Top = 145
  Width = 1183
  Height = 398
  Caption = 'Manage the Cape excursion'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lblOld: TLabel
    Left = 56
    Top = 240
    Width = 193
    Height = 32
    Caption = 'Choose the activity which will not be offered any longer'
    WordWrap = True
  end
  object lblNEW: TLabel
    Left = 280
    Top = 240
    Width = 182
    Height = 16
    Caption = 'Choose the replacement activity'
  end
  object dbgCape: TDBGrid
    Left = 56
    Top = 32
    Width = 1089
    Height = 177
    DataSource = dmCape.dsrCape
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnReplace: TButton
    Left = 496
    Top = 240
    Width = 137
    Height = 25
    Caption = 'Replace activity'
    TabOrder = 1
    OnClick = btnReplaceClick
  end
  object cbxOldActivity: TComboBox
    Left = 56
    Top = 296
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 2
    Text = 'cbxOldActivity'
  end
  object cbxNewActivity: TComboBox
    Left = 280
    Top = 296
    Width = 145
    Height = 24
    ItemHeight = 16
    TabOrder = 3
    Text = 'cbxNewActivity'
  end
end
