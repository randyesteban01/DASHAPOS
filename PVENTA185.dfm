object frmBuscaRNC: TfrmBuscaRNC
  Left = 269
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Buscar RNC'
  ClientHeight = 376
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Razon Social'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 622
    Height = 336
    Align = alBottom
    DataSource = dsRNC
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'rnc_cedula'
        Title.Caption = 'RNC / Cedula'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razon_social'
        Title.Caption = 'Raz'#243'n Social'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombre_comercial'
        Title.Caption = 'Nombre Comercial'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'actividad_economica'
        Title.Caption = 'Actividad economica'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'direccion'
        Title.Caption = 'Direccion'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Title.Caption = 'Numero'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'urbanizacion'
        Title.Caption = 'Urbanizacion'
        Width = 242
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefono'
        Title.Caption = 'Telefono'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estatus'
        Title.Caption = 'Estatus'
        Width = 40
        Visible = True
      end>
  end
  object edrazon: TEdit
    Left = 80
    Top = 16
    Width = 121
    Height = 21
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 16
    Width = 57
    Height = 21
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object Memo1: TMemo
    Left = 88
    Top = 144
    Width = 329
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
    Visible = False
  end
  object QRNC: TADOQuery
    Connection = DM.ADOSIGMA
    Parameters = <>
    SQL.Strings = (
      'select'
      'rnc_cedula, razon_social, nombre_comercial,'
      'actividad_economica, direccion, numero, urbanizacion,'
      'telefono, estatus'
      'from'
      'rnc')
    Left = 208
    Top = 144
    object QRNCrnc_cedula: TStringField
      FieldName = 'rnc_cedula'
      Size = 30
    end
    object QRNCrazon_social: TStringField
      FieldName = 'razon_social'
      Size = 200
    end
    object QRNCnombre_comercial: TStringField
      FieldName = 'nombre_comercial'
      Size = 200
    end
    object QRNCactividad_economica: TStringField
      FieldName = 'actividad_economica'
      Size = 2000
    end
    object QRNCdireccion: TStringField
      FieldName = 'direccion'
      Size = 200
    end
    object QRNCnumero: TStringField
      FieldName = 'numero'
      Size = 200
    end
    object QRNCurbanizacion: TStringField
      FieldName = 'urbanizacion'
      Size = 200
    end
    object QRNCtelefono: TStringField
      FieldName = 'telefono'
      Size = 200
    end
    object QRNCestatus: TStringField
      FieldName = 'estatus'
      Size = 2000
    end
  end
  object dsRNC: TDataSource
    DataSet = QRNC
    Left = 240
    Top = 144
  end
end
