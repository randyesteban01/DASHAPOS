object frmDevuelta: TfrmDevuelta
  Left = 344
  Top = 245
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Devuelta'
  ClientHeight = 240
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 137
    Top = 16
    Width = 255
    Height = 25
    Caption = 'DEVUELTA DEL CLIENTE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbdevuelta: TStaticText
    Left = 8
    Top = 56
    Width = 513
    Height = 120
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0.00'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 184
    Width = 329
    Height = 41
    Caption = 'PRESIONE ENTER PARA SALIR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
