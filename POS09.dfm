object frmBuscaProducto: TfrmBuscaProducto
  Left = 293
  Top = 190
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'BUSCAR PRODUCTO'
  ClientHeight = 468
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 636
    Height = 62
    AutoSize = True
    ButtonHeight = 58
    ButtonWidth = 57
    Caption = 'ToolBar1'
    TabOrder = 0
    object btsalir: TSpeedButton
      Left = 0
      Top = 2
      Width = 84
      Height = 58
      Caption = '[ESC] SALIR'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000007020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
        00000000007020007020000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
        00000000007020007020000000FFFFFFFFFFFFFFFFFF00000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        000000000000000000000000000000000000FFFFFFFFFFFF0000000000000000
        00000000007020007020000000FFFFFFFFFFFFFFFFFF000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000010
        20000000007020007020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000097
        2F000000007020007020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000972F0097
        2F000000000000007020000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000102000972F0097
        2F00000000000000000000000000000000000000000000000000000000000000
        0000000000001020000000000000007020000000000000FFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000972F00972F0097
        2F00000000000000000000000000000000000000000000000000000000102000
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000972F00972F00972F0097
        2F00000000000000000000000000702000972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000000000000972F00972F00972F00972F0097
        2F00972F00972F00972F00972F00972F00972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000000000972F00972F00972F00972F00972F0097
        2F00972F00972F00972F00972F00972F00972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000000000000972F00972F00972F00972F00972F00972F0097
        2F00972F00972F00972F00972F00972F00972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000000000000972F00972F00972F00972F00972F00972F0097
        2F00972F00972F00972F00972F00972F00972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000000000000972F00972F00972F00972F00972F00972F0097
        2F00972F00972F00972F00972F00972F00972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000000000972F00972F00972F00972F00972F0097
        2F00972F00972F00972F00972F00972F00972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000000000000972F00972F00972F00972F0097
        2F00972F00972FFFFFFFFFFFFFFFFFFF00972FFFFFFF00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000972F00972F00972F0097
        2F00000000000000000000000000702000972F00972F00972F00972F00972F00
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000972F00972F0097
        2F00000000000000000000000000000000000000000000000000000000102000
        972F00972F00972F000000000000007020007020000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000102000972F0097
        2F00000000000000000000000000000000000000000000000000000000000000
        0000000000001020000000000000007020000000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000972F0097
        2F000000000000007020000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFF
        FF000000007020007020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000070
        20000000007020007020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
        00000000007020007020000000FFFFFFFFFFFFFFFFFF000000000000000000FF
        FFFFFFFFFF000000000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000007020007020000000FFFFFFFFFFFFFFFFFF000000000000000000FF
        FFFFFFFFFF000000000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000007020007020000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFF
        FF000000007020000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFF
        FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = btsalirClick
    end
    object btseleccionar: TSpeedButton
      Left = 84
      Top = 2
      Width = 141
      Height = 58
      Caption = '[ENTER] SELECCIONAR'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0000000000007F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF00000000FFFF00FFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00
        000000FFFF00FFFF00FFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00
        000000FFFF00FFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000000000000000FF000000000000
        FFFF00FFFF00FFFF0000007F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00000000000000
        FFFF00FFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFF00007F00007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFF00FFFF00
        FFFF00FFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FF0000FF0000FF00007F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF0000007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FFFFFFFF0000FF0000FF00007FFFFFFFFFFFFFFFFFFF0000000000
        00000000000000000000000000FFFFFF00000000000000FFFF00FFFF00FFFF00
        FFFF00FFFF0000007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFF00FFFF00
        FFFF000000FF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        0000000000000000000000000000000000000000000000FFFF00FFFF00FFFF00
        0000FFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFF00FFFF000000FF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFFFF0000000000
        0000000000000000000000000000000000000000000000FFFF000000FFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFF0000000000
        00000000000000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        0000FF0000FFFFFFFF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        0000FF0000FF0000FF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        0000FF0000FFFFFFFF0000FF0000FF0000FF00007FFFFFFFFFFFFF0000000000
        00000000000000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        0000FF0000FFFFFFFF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        0000FF0000FFFFFFFF0000FF0000FF0000FF00007FFFFFFFFFFFFF0000000000
        00000000000000000000000000000000000000000000000000000000FFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        0000FF0000FF0000FFFFFFFF0000FF0000FF00007FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFF0000FF0000FF0000FF0000FF00007FFFFFFFFFFFFFFFFFFF0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000FFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF00007F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 62
    Width = 636
    Height = 406
    Align = alClient
    Ctl3D = False
    DataSource = dsProductos
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'pro_roriginal'
        Title.Alignment = taCenter
        Title.Caption = 'Ref. Original'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pro_nombre'
        Title.Caption = 'Nombre del Producto'
        Width = 362
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'exi_cantidad'
        Title.Alignment = taCenter
        Title.Caption = 'Existencia'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Title.Alignment = taCenter
        Width = 68
        Visible = True
      end>
  end
  object QProductos: TADOQuery
    Connection = DM.ADOSIGMA
    BeforeOpen = QProductosBeforeOpen
    OnCalcFields = QProductosCalcFields
    Parameters = <
      item
        Name = 'emp'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'alm'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select'
      
        'p.pro_nombre, p.pro_precio1, e.exi_cantidad, p.pro_precio2, p.pr' +
        'o_roriginal,'
      'p.pro_codigo, p.pro_precio3, p.pro_precio4'
      'from'
      'productos p, existencias e'
      'where'
      'p.pro_codigo = e.pro_codigo'
      'and p.emp_codigo = e.emp_codigo'
      'and p.emp_codigo = :emp'
      'and e.alm_codigo = :alm'
      'order by'
      'p.pro_nombre')
    Left = 280
    Top = 200
    object QProductospro_nombre: TStringField
      FieldName = 'pro_nombre'
      Size = 80
    end
    object QProductospro_precio1: TBCDField
      FieldName = 'pro_precio1'
      currency = True
      Precision = 15
      Size = 2
    end
    object QProductospro_precio2: TBCDField
      FieldName = 'pro_precio2'
      currency = True
      Precision = 15
      Size = 2
    end
    object QProductospro_roriginal: TStringField
      FieldName = 'pro_roriginal'
      Size = 50
    end
    object QProductospro_codigo: TIntegerField
      FieldName = 'pro_codigo'
    end
    object QProductosPrecio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Precio'
      currency = True
      Calculated = True
    end
    object QProductospro_precio3: TBCDField
      FieldName = 'pro_precio3'
      Precision = 15
      Size = 2
    end
    object QProductospro_precio4: TBCDField
      FieldName = 'pro_precio4'
      Precision = 15
      Size = 2
    end
    object QProductosexi_cantidad: TBCDField
      FieldName = 'exi_cantidad'
      Precision = 15
      Size = 2
    end
  end
  object dsProductos: TDataSource
    DataSet = QProductos
    Left = 312
    Top = 200
  end
end
