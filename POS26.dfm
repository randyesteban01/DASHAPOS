object frmSerieFactura: TfrmSerieFactura
  Left = 234
  Top = 151
  Width = 403
  Height = 317
  Caption = '# de Serie del producto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pBottom: TPanel
    Left = 268
    Top = 28
    Width = 119
    Height = 251
    Align = alRight
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 16
      Width = 90
      Height = 75
      TabOrder = 0
      Kind = bkAll
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 112
      Width = 90
      Height = 75
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pTop: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 28
    Align = alTop
    TabOrder = 1
  end
end
