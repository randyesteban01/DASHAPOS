object Form1: TForm1
  Left = 192
  Top = 125
  Width = 1305
  Height = 675
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmo1: TMemo
    Left = 120
    Top = 48
    Width = 929
    Height = 297
    Lines.Strings = (
      
        '{"Status":"Successful","Host":{"Value":6,"Description":"Credit"}' +
        ',"Mode":{"Value":"C@5","Description":"Sale with CHIP(EMV)"},"Car' +
        'd":'
      
        '{"Product":"Visa","CardNumber":"454098******5117","HolderName":"' +
        'JHONATTAN GOMEZ"},"Transaction":'
      
        '{"AuthorizationNumber":"014011","Reference":1,"RetrievalReferenc' +
        'e":129923000093,"DataTime":"10/26/2021 11:07:31 '
      
        'PM","ApplicationIdentifier":"A0000000031010","LoyaltyDeferredNum' +
        'ber":null,"TID":null},"Batch":6,"TerminalID":"80029126","Merchan' +
        'tID":"349011300","Reserved":null,"Signature":null}')
    TabOrder = 0
  end
  object edt1: TEdit
    Left = 128
    Top = 464
    Width = 977
    Height = 21
    TabOrder = 1
    Text = 'edt1'
  end
  object btn1: TButton
    Left = 128
    Top = 520
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 2
    OnClick = btn1Click
  end
end
