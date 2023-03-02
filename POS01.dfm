object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 668
  Top = 627
  Height = 283
  Width = 323
  object ADOSIGMA: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=dayelcris;Persist Security Info=Tru' +
      'e;User ID=randy;Initial Catalog=Dasha_Manuel2;Data Source=.\SQL2' +
      '019'
    ConnectionTimeout = 120
    ConnectOptions = coAsyncConnect
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    BeforeConnect = ADOSIGMABeforeConnect
    Left = 200
    Top = 192
  end
  object Query1: TADOQuery
    Connection = ADOSIGMA
    Parameters = <>
    Left = 256
    Top = 192
  end
  object QEmpresa: TADOQuery
    Connection = ADOSIGMA
    Parameters = <>
    SQL.Strings = (
      'select'
      'emp_codigo, emp_nombre, emp_direccion,'
      'emp_localidad, emp_telefono, emp_fax, emp_rnc,'
      'code_rnc'
      'from'
      'empresas'
      'where'
      'emp_codigo = 1')
    Left = 16
    Top = 8
    object QEmpresaemp_codigo: TIntegerField
      FieldName = 'emp_codigo'
    end
    object QEmpresaemp_nombre: TStringField
      FieldName = 'emp_nombre'
      Size = 60
    end
    object QEmpresaemp_direccion: TStringField
      FieldName = 'emp_direccion'
      Size = 60
    end
    object QEmpresaemp_localidad: TStringField
      FieldName = 'emp_localidad'
      Size = 60
    end
    object QEmpresaemp_telefono: TStringField
      FieldName = 'emp_telefono'
      Size = 30
    end
    object QEmpresaemp_fax: TStringField
      FieldName = 'emp_fax'
      Size = 30
    end
    object QEmpresaemp_rnc: TStringField
      FieldName = 'emp_rnc'
      Size = 30
    end
    object QEmpresacode_rnc: TStringField
      FieldName = 'code_rnc'
      Size = 100
    end
  end
  object adoMultiUso: TADOQuery
    Connection = ADOSIGMA
    Parameters = <>
    Left = 24
    Top = 88
  end
  object QParametros: TADOQuery
    Connection = ADOSIGMA
    Parameters = <
      item
        Name = 'EMP_CODIGO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from PARAMETROS'
      'WHERE'
      'EMP_CODIGO = :EMP_CODIGO')
    Left = 88
    Top = 8
    object QParametrosEMP_CODIGO: TIntegerField
      FieldName = 'EMP_CODIGO'
    end
    object QParametrosPAR_ALMACENVENTA: TIntegerField
      FieldName = 'PAR_ALMACENVENTA'
    end
    object QParametrosPAR_CODIGOCLIENTE: TStringField
      FieldName = 'PAR_CODIGOCLIENTE'
      Size = 1
    end
    object QParametrosPAR_CODIGOPRODUCTO: TStringField
      FieldName = 'PAR_CODIGOPRODUCTO'
      Size = 1
    end
    object QParametrosPAR_FACFORMA: TStringField
      FieldName = 'PAR_FACFORMA'
      Size = 1
    end
    object QParametrosPAR_FORMATODES: TIntegerField
      FieldName = 'PAR_FORMATODES'
    end
    object QParametrosPAR_FORMATODEV: TIntegerField
      FieldName = 'PAR_FORMATODEV'
    end
    object QParametrosPAR_FORMATONC: TIntegerField
      FieldName = 'PAR_FORMATONC'
    end
    object QParametrosPAR_FORMATOND: TIntegerField
      FieldName = 'PAR_FORMATOND'
    end
    object QParametrosPAR_FORMATORC: TIntegerField
      FieldName = 'PAR_FORMATORC'
    end
    object QParametrosPAR_FORMATORI: TIntegerField
      FieldName = 'PAR_FORMATORI'
    end
    object QParametrosPAR_ITBIS: TBCDField
      FieldName = 'PAR_ITBIS'
      Precision = 15
      Size = 2
    end
    object QParametrosPAR_MOVNDE: TIntegerField
      FieldName = 'PAR_MOVNDE'
    end
    object QParametrosPAR_TFACODIGO: TIntegerField
      FieldName = 'PAR_TFACODIGO'
    end
    object QParametrosPAR_TIPOPRECIO: TStringField
      FieldName = 'PAR_TIPOPRECIO'
      Size = 7
    end
    object QParametrosPAR_CONTROLAMAXIMO: TStringField
      FieldName = 'PAR_CONTROLAMAXIMO'
      Size = 5
    end
    object QParametrosPAR_CONTROLAMINIMO: TStringField
      FieldName = 'PAR_CONTROLAMINIMO'
      Size = 5
    end
    object QParametrosPAR_DEBAJOCOSTO: TStringField
      FieldName = 'PAR_DEBAJOCOSTO'
      Size = 5
    end
    object QParametrosPAR_COMBOCOTIZACION: TStringField
      FieldName = 'PAR_COMBOCOTIZACION'
      Size = 5
    end
    object QParametrosPAR_COMBOIMPDETALLE: TStringField
      FieldName = 'PAR_COMBOIMPDETALLE'
      Size = 5
    end
    object QParametrosPAR_COMBOREBAJA: TStringField
      FieldName = 'PAR_COMBOREBAJA'
      Size = 5
    end
    object QParametrosPAR_VENDIGITOSLOTE: TIntegerField
      FieldName = 'PAR_VENDIGITOSLOTE'
    end
    object QParametrosPAR_VENPERMITIR: TStringField
      FieldName = 'PAR_VENPERMITIR'
      Size = 5
    end
    object QParametrosPAR_VENVERIFICA: TStringField
      FieldName = 'PAR_VENVERIFICA'
      Size = 1
    end
    object QParametrosPAR_CONTEOLIMPIA: TStringField
      FieldName = 'PAR_CONTEOLIMPIA'
      Size = 1
    end
    object QParametrosPAR_PREDESCGLOBAL: TStringField
      FieldName = 'PAR_PREDESCGLOBAL'
      Size = 5
    end
    object QParametrosPAR_PREDESCRIP1: TStringField
      FieldName = 'PAR_PREDESCRIP1'
      Size = 10
    end
    object QParametrosPAR_PREDESCRIP2: TStringField
      FieldName = 'PAR_PREDESCRIP2'
      Size = 18
    end
    object QParametrosPAR_PREDESCRIP3: TStringField
      FieldName = 'PAR_PREDESCRIP3'
      Size = 10
    end
    object QParametrosPAR_PREDESCRIP4: TStringField
      FieldName = 'PAR_PREDESCRIP4'
      Size = 10
    end
    object QParametrosPAR_FACANULA: TStringField
      FieldName = 'PAR_FACANULA'
      Size = 5
    end
    object QParametrosPAR_FACDIASANULA: TIntegerField
      FieldName = 'PAR_FACDIASANULA'
    end
    object QParametrosPAR_FACDIASMODIFICA: TIntegerField
      FieldName = 'PAR_FACDIASMODIFICA'
    end
    object QParametrosPAR_FACDISPONIBLE: TStringField
      FieldName = 'PAR_FACDISPONIBLE'
      Size = 5
    end
    object QParametrosPAR_FACMODIFICA: TStringField
      FieldName = 'PAR_FACMODIFICA'
      Size = 5
    end
    object QParametrosPAR_FACSELPRECIO: TStringField
      FieldName = 'PAR_FACSELPRECIO'
      Size = 5
    end
    object QParametrosPAR_FACTEMPORAL: TStringField
      FieldName = 'PAR_FACTEMPORAL'
      Size = 5
    end
    object QParametrosPAR_DEVDIAS: TIntegerField
      FieldName = 'PAR_DEVDIAS'
    end
    object QParametrosPAR_DEVEFECTIVO: TStringField
      FieldName = 'PAR_DEVEFECTIVO'
      Size = 5
    end
    object QParametrosPAR_FORMATOCUADRE: TIntegerField
      FieldName = 'PAR_FORMATOCUADRE'
    end
    object QParametrosPAR_AHORA1: TDateTimeField
      FieldName = 'PAR_AHORA1'
    end
    object QParametrosPAR_AHORA2: TDateTimeField
      FieldName = 'PAR_AHORA2'
    end
    object QParametrosPAR_BHORA1: TDateTimeField
      FieldName = 'PAR_BHORA1'
    end
    object QParametrosPAR_BHORA2: TDateTimeField
      FieldName = 'PAR_BHORA2'
    end
    object QParametrosPAR_FACMODPRECIO: TStringField
      FieldName = 'PAR_FACMODPRECIO'
      Size = 5
    end
    object QParametrosPAR_FORMATOCON: TIntegerField
      FieldName = 'PAR_FORMATOCON'
    end
    object QParametrosPAR_CAJA: TStringField
      FieldName = 'PAR_CAJA'
      Size = 1
    end
    object QParametrosPAR_IMPCODIGOBARRA: TStringField
      FieldName = 'PAR_IMPCODIGOBARRA'
      Size = 5
    end
    object QParametrosCPA_CODIGOCLIENTE: TIntegerField
      FieldName = 'CPA_CODIGOCLIENTE'
    end
    object QParametrosPAR_LIMITEINICIAL: TBCDField
      FieldName = 'PAR_LIMITEINICIAL'
      Precision = 15
      Size = 2
    end
    object QParametrosPAR_MOVCK: TIntegerField
      FieldName = 'PAR_MOVCK'
    end
    object QParametrosPAR_MOVCARGO: TIntegerField
      FieldName = 'PAR_MOVCARGO'
    end
    object QParametrosPAR_PRECIOLETRA_0: TStringField
      FieldName = 'PAR_PRECIOLETRA_0'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_1: TStringField
      FieldName = 'PAR_PRECIOLETRA_1'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_2: TStringField
      FieldName = 'PAR_PRECIOLETRA_2'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_3: TStringField
      FieldName = 'PAR_PRECIOLETRA_3'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_4: TStringField
      FieldName = 'PAR_PRECIOLETRA_4'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_5: TStringField
      FieldName = 'PAR_PRECIOLETRA_5'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_6: TStringField
      FieldName = 'PAR_PRECIOLETRA_6'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_7: TStringField
      FieldName = 'PAR_PRECIOLETRA_7'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_8: TStringField
      FieldName = 'PAR_PRECIOLETRA_8'
      Size = 1
    end
    object QParametrosPAR_PRECIOLETRA_9: TStringField
      FieldName = 'PAR_PRECIOLETRA_9'
      Size = 1
    end
    object QParametrosPAR_NUEVOUSADO: TStringField
      FieldName = 'PAR_NUEVOUSADO'
      Size = 5
    end
    object QParametrosPAR_TEXTOBARRA1: TStringField
      FieldName = 'PAR_TEXTOBARRA1'
      Size = 60
    end
    object QParametrosPAR_TEXTOBARRA2: TStringField
      FieldName = 'PAR_TEXTOBARRA2'
      Size = 60
    end
    object QParametrosPAR_TEXTOBARRA3: TStringField
      FieldName = 'PAR_TEXTOBARRA3'
      Size = 60
    end
    object QParametrosPAR_TEXTOBARRA4: TStringField
      FieldName = 'PAR_TEXTOBARRA4'
      Size = 60
    end
    object QParametrosPAR_TEXTOBARRA5: TStringField
      FieldName = 'PAR_TEXTOBARRA5'
      Size = 60
    end
    object QParametrosPAR_OPC5TALINEA: TStringField
      FieldName = 'PAR_OPC5TALINEA'
    end
    object QParametrosPAR_TEXTOBARRA6: TStringField
      FieldName = 'PAR_TEXTOBARRA6'
      Size = 60
    end
    object QParametrosPAR_OPC1RALINEA: TStringField
      FieldName = 'PAR_OPC1RALINEA'
    end
    object QParametrosPAR_PREGUNTAPEQ: TStringField
      FieldName = 'PAR_PREGUNTAPEQ'
      Size = 5
    end
    object QParametrosPAR_IGUALAREF: TStringField
      FieldName = 'PAR_IGUALAREF'
      Size = 1
    end
    object QParametrosPAR_ITBISDEFECTO: TStringField
      FieldName = 'PAR_ITBISDEFECTO'
      Size = 1
    end
    object QParametrosPAR_FPADESEM: TIntegerField
      FieldName = 'PAR_FPADESEM'
    end
    object QParametrosPAR_FACBAJARLINEA: TStringField
      FieldName = 'PAR_FACBAJARLINEA'
      Size = 5
    end
    object QParametrosPAR_FACTOTALIZAPIE: TStringField
      FieldName = 'PAR_FACTOTALIZAPIE'
      Size = 5
    end
    object QParametrosPAR_FACREPITEPROD: TStringField
      FieldName = 'PAR_FACREPITEPROD'
      Size = 5
    end
    object QParametrosPAR_DEBAJOPRECIO: TStringField
      FieldName = 'PAR_DEBAJOPRECIO'
      Size = 5
    end
    object QParametrosPAR_FACCONITBIS: TStringField
      FieldName = 'PAR_FACCONITBIS'
      Size = 5
    end
    object QParametrosPAR_FACESCALA: TStringField
      FieldName = 'PAR_FACESCALA'
      Size = 5
    end
    object QParametrosPAR_FACMEDIDA: TStringField
      FieldName = 'PAR_FACMEDIDA'
      Size = 5
    end
    object QParametrosPAR_PRECIOEMP: TStringField
      FieldName = 'PAR_PRECIOEMP'
      Size = 7
    end
    object QParametrosPAR_PRECIOUND: TStringField
      FieldName = 'PAR_PRECIOUND'
      Size = 7
    end
    object QParametrosPAR_FISICOSOLOLLENO: TStringField
      FieldName = 'PAR_FISICOSOLOLLENO'
      Size = 5
    end
    object QParametrosPAR_DEVFORMA: TStringField
      FieldName = 'PAR_DEVFORMA'
      Size = 1
    end
    object QParametrosPAR_FORMATOCOT: TIntegerField
      FieldName = 'PAR_FORMATOCOT'
    end
    object QParametrosPAR_INVMOSTRARVENCE: TStringField
      FieldName = 'PAR_INVMOSTRARVENCE'
      Size = 5
    end
    object QParametrosPAR_VERIMAGEN: TStringField
      FieldName = 'PAR_VERIMAGEN'
      Size = 5
    end
    object QParametrosPAR_TKMENSAJE1: TStringField
      FieldName = 'PAR_TKMENSAJE1'
      Size = 40
    end
    object QParametrosPAR_TKMENSAJE2: TStringField
      FieldName = 'PAR_TKMENSAJE2'
      Size = 40
    end
    object QParametrosPAR_TKMENSAJE3: TStringField
      FieldName = 'PAR_TKMENSAJE3'
      Size = 40
    end
    object QParametrosPAR_TKMENSAJE4: TStringField
      FieldName = 'PAR_TKMENSAJE4'
      Size = 40
    end
    object QParametrosPAR_TKCLAVEDELETE: TStringField
      FieldName = 'PAR_TKCLAVEDELETE'
      Size = 30
    end
    object QParametrosPAR_TKCLAVEMODIFICA: TStringField
      FieldName = 'PAR_TKCLAVEMODIFICA'
      Size = 30
    end
    object QParametrosPAR_COMBINAORIGINAL: TStringField
      FieldName = 'PAR_COMBINAORIGINAL'
      Size = 30
    end
    object QParametrosPAR_COMBINAFABRIC: TStringField
      FieldName = 'PAR_COMBINAFABRIC'
      Size = 30
    end
    object QParametrosPAR_TKCLAVECREDITO: TStringField
      FieldName = 'PAR_TKCLAVECREDITO'
      Size = 30
    end
    object QParametrosPAR_TKCLAVECANCELA: TStringField
      FieldName = 'PAR_TKCLAVECANCELA'
      Size = 30
    end
    object QParametrosPAR_INVEMPRESA: TIntegerField
      FieldName = 'PAR_INVEMPRESA'
    end
    object QParametrosPAR_INVALMACEN: TIntegerField
      FieldName = 'PAR_INVALMACEN'
    end
    object QParametrosMON_CODIGO: TIntegerField
      FieldName = 'MON_CODIGO'
    end
    object QParametrosPAR_SOLGENERACHEQUE: TStringField
      FieldName = 'PAR_SOLGENERACHEQUE'
      Size = 5
    end
    object QParametrospar_invprecioconduce: TStringField
      FieldName = 'par_invprecioconduce'
      Size = 5
    end
    object QParametrospar_mailservidor: TStringField
      FieldName = 'par_mailservidor'
      Size = 60
    end
    object QParametrospar_mailcorreo: TStringField
      FieldName = 'par_mailcorreo'
      Size = 60
    end
    object QParametrospar_mailusuario: TStringField
      FieldName = 'par_mailusuario'
      Size = 60
    end
    object QParametrospar_mailclave: TStringField
      FieldName = 'par_mailclave'
      Size = 60
    end
    object QParametrospar_mailpuerto: TStringField
      FieldName = 'par_mailpuerto'
      Size = 60
    end
    object QParametrospar_itbisincluido: TStringField
      FieldName = 'par_itbisincluido'
      Size = 5
    end
    object QParametroscaj_codigo: TIntegerField
      FieldName = 'caj_codigo'
    end
    object QParametrospar_domicilio: TStringField
      FieldName = 'par_domicilio'
      Size = 5
    end
    object QParametrospar_monto_domicilio: TBCDField
      FieldName = 'par_monto_domicilio'
      Precision = 15
      Size = 2
    end
    object QParametrospar_copias_domicilio: TIntegerField
      FieldName = 'par_copias_domicilio'
    end
    object QParametrospar_beneficio: TBCDField
      FieldName = 'par_beneficio'
      Precision = 15
      Size = 2
    end
    object QParametrospar_tkclavereimprime: TStringField
      FieldName = 'par_tkclavereimprime'
      Size = 30
    end
    object QParametrospar_igualartelefonocliente: TStringField
      FieldName = 'par_igualartelefonocliente'
      Size = 5
    end
    object QParametrospar_valor_punto: TBCDField
      FieldName = 'par_valor_punto'
      Precision = 15
      Size = 2
    end
    object QParametrospar_punto_principal: TBCDField
      FieldName = 'par_punto_principal'
      Precision = 15
      Size = 2
    end
    object QParametrospar_punto_depen: TBCDField
      FieldName = 'par_punto_depen'
      Precision = 15
      Size = 2
    end
    object QParametrospar_redondeo: TStringField
      FieldName = 'par_redondeo'
      Size = 5
    end
    object QParametrospar_barra_header: TMemoField
      FieldName = 'par_barra_header'
      BlobType = ftMemo
    end
    object QParametrospar_fac_preimpresa: TStringField
      FieldName = 'par_fac_preimpresa'
      Size = 5
    end
    object QParametrospar_preciound_m: TStringField
      FieldName = 'par_preciound_m'
      Size = 7
    end
    object QParametrospar_precioemp_m: TStringField
      FieldName = 'par_precioemp_m'
      Size = 7
    end
    object QParametrospar_fac_oferta: TStringField
      FieldName = 'par_fac_oferta'
      Size = 5
    end
    object QParametrospar_nombre_familia: TStringField
      FieldName = 'par_nombre_familia'
      Size = 15
    end
    object QParametrospar_nombre_depto: TStringField
      FieldName = 'par_nombre_depto'
      Size = 15
    end
    object QParametrospar_nombre_color: TStringField
      FieldName = 'par_nombre_color'
      Size = 15
    end
    object QParametrospar_nombre_marca: TStringField
      FieldName = 'par_nombre_marca'
      Size = 15
    end
    object QParametrospar_inv_compra_centro_costo: TStringField
      FieldName = 'par_inv_compra_centro_costo'
      Size = 5
    end
    object QParametrospar_imprime_logo: TStringField
      FieldName = 'par_imprime_logo'
      Size = 5
    end
    object QParametrospar_arch_copiar_colector: TStringField
      FieldName = 'par_arch_copiar_colector'
      Size = 50
    end
    object QParametrospar_arch_recibe_colector: TStringField
      FieldName = 'par_arch_recibe_colector'
      Size = 50
    end
    object QParametrospar_delimitador_envia: TStringField
      FieldName = 'par_delimitador_envia'
      Size = 1
    end
    object QParametrospar_delimitador_recibe: TStringField
      FieldName = 'par_delimitador_recibe'
      Size = 1
    end
    object QParametrospar_modifica_fecha_factura: TStringField
      FieldName = 'par_modifica_fecha_factura'
      Size = 5
    end
    object QParametrospar_pago_mayor_balance: TStringField
      FieldName = 'par_pago_mayor_balance'
      Size = 5
    end
    object QParametrospar_nota_orden_servicio: TMemoField
      FieldName = 'par_nota_orden_servicio'
      BlobType = ftMemo
    end
    object QParametrospar_controlar: TStringField
      FieldName = 'par_controlar'
      Size = 5
    end
    object QParametrospar_formato_preimpreso: TStringField
      FieldName = 'par_formato_preimpreso'
    end
    object QParametrospar_usuario_cuadra: TStringField
      FieldName = 'par_usuario_cuadra'
      Size = 5
    end
    object QParametrospar_inv_entrada_modifica_precio: TStringField
      FieldName = 'par_inv_entrada_modifica_precio'
      Size = 5
    end
    object QParametrospar_movtk: TStringField
      FieldName = 'par_movtk'
      Size = 3
    end
    object QParametrospar_visualizadesc: TStringField
      FieldName = 'par_visualizadesc'
      Size = 5
    end
    object QParametrospar_visualiza_selectivo: TStringField
      FieldName = 'par_visualiza_selectivo'
      Size = 5
    end
    object QParametrospar_cantidad_primero: TStringField
      FieldName = 'par_cantidad_primero'
      Size = 50
    end
    object QParametrospar_busqueda_porciento: TStringField
      FieldName = 'par_busqueda_porciento'
      Size = 5
    end
    object QParametrospar_busqueda_cxp: TStringField
      FieldName = 'par_busqueda_cxp'
      Size = 10
    end
    object QParametrospar_moneda_local: TIntegerField
      FieldName = 'par_moneda_local'
    end
    object QParametrospar_envio: TMemoField
      FieldName = 'par_envio'
      BlobType = ftMemo
    end
    object QParametrospar_nota_cotizacion: TMemoField
      FieldName = 'par_nota_cotizacion'
      BlobType = ftMemo
    end
    object QParametrospar_almacendevolucion: TIntegerField
      FieldName = 'par_almacendevolucion'
    end
    object QParametrospar_boletos_monto: TBCDField
      FieldName = 'par_boletos_monto'
      Precision = 15
      Size = 2
    end
    object QParametrospar_boletos_cantidad: TIntegerField
      FieldName = 'par_boletos_cantidad'
    end
    object QParametrospar_ticket_itbis: TStringField
      FieldName = 'par_ticket_itbis'
      Size = 5
    end
    object QParametrospar_ftp_site: TStringField
      FieldName = 'par_ftp_site'
      Size = 50
    end
    object QParametrospar_ftp_usuario: TStringField
      FieldName = 'par_ftp_usuario'
      Size = 50
    end
    object QParametrospar_ftp_password: TStringField
      FieldName = 'par_ftp_password'
      Size = 50
    end
    object QParametrospar_ftp_ruta: TStringField
      FieldName = 'par_ftp_ruta'
      Size = 50
    end
    object QParametrospar_empresa_1: TIntegerField
      FieldName = 'par_empresa_1'
    end
    object QParametrospar_empresa_2: TIntegerField
      FieldName = 'par_empresa_2'
    end
    object QParametrospar_porciento_empresa_1: TBCDField
      FieldName = 'par_porciento_empresa_1'
      Precision = 19
    end
    object QParametrospar_porciento_empresa_2: TBCDField
      FieldName = 'par_porciento_empresa_2'
      Precision = 19
    end
    object QParametrospar_empresa_porciento_comprobante: TIntegerField
      FieldName = 'par_empresa_porciento_comprobante'
    end
    object QParametrospar_dividir_facturacion: TStringField
      FieldName = 'par_dividir_facturacion'
      Size = 5
    end
    object QParametrospar_modifica_precio_automatico: TStringField
      FieldName = 'par_modifica_precio_automatico'
      Size = 5
    end
    object QParametrospar_inv_forma_inventario: TStringField
      FieldName = 'par_inv_forma_inventario'
      Size = 1
    end
    object QParametrospar_visualizar_cant_empaque: TStringField
      FieldName = 'par_visualizar_cant_empaque'
      Size = 5
    end
    object QParametrospar_imprimir_calculo_empaque: TStringField
      FieldName = 'par_imprimir_calculo_empaque'
      Size = 5
    end
    object QParametrospar_inv_transferencia_auto: TStringField
      FieldName = 'par_inv_transferencia_auto'
      Size = 5
    end
    object QParametrospar_boletos_monto_patrocinador: TBCDField
      FieldName = 'par_boletos_monto_patrocinador'
      Precision = 15
      Size = 2
    end
    object QParametrospar_boletos_cantidad_patrocinador: TIntegerField
      FieldName = 'par_boletos_cantidad_patrocinador'
    end
    object QParametrospar_busqueda_dejar_ultimo: TStringField
      FieldName = 'par_busqueda_dejar_ultimo'
      Size = 5
    end
    object QParametrospar_compras_visualiza_diferencia: TStringField
      FieldName = 'par_compras_visualiza_diferencia'
      Size = 5
    end
    object QParametrospar_genera_puntos_credito: TStringField
      FieldName = 'par_genera_puntos_credito'
      Size = 5
    end
    object QParametrospar_inv_unidad_medida: TStringField
      FieldName = 'par_inv_unidad_medida'
      Size = 5
    end
    object QParametrospar_numerofactura_tipo: TStringField
      FieldName = 'par_numerofactura_tipo'
      Size = 5
    end
    object QParametrospar_facturarcero: TStringField
      FieldName = 'par_facturarcero'
      Size = 5
    end
    object QParametrospar_textobarra7: TStringField
      FieldName = 'par_textobarra7'
      Size = 60
    end
    object QParametrospar_opc6talinea: TStringField
      FieldName = 'par_opc6talinea'
    end
    object QParametrospar_opc7malinea: TStringField
      FieldName = 'par_opc7malinea'
    end
    object QParametrosIdioma: TStringField
      FieldName = 'Idioma'
      Size = 1
    end
    object QParametrospar_compras_valores_aut: TStringField
      FieldName = 'par_compras_valores_aut'
      Size = 5
    end
    object QParametrospar_inv_imprime_comentario: TStringField
      FieldName = 'par_inv_imprime_comentario'
      Size = 5
    end
    object QParametrosmensaje_ticket: TMemoField
      FieldName = 'mensaje_ticket'
      BlobType = ftMemo
    end
    object QParametrospar_aplica_desc_por_rango_venta: TStringField
      FieldName = 'par_aplica_desc_por_rango_venta'
      Size = 5
    end
    object QParametrosPAR_CODIGO_ABRE_CAJA: TStringField
      FieldName = 'PAR_CODIGO_ABRE_CAJA'
      Size = 50
    end
    object QParametrospar_Marca_Printer: TStringField
      FieldName = 'par_Marca_Printer'
      Size = 50
    end
    object QParametrospar_puerto_Printer: TStringField
      FieldName = 'par_puerto_Printer'
      Size = 10
    end
    object QParametrospar_velocidad_Printer: TIntegerField
      FieldName = 'par_velocidad_Printer'
    end
  end
  object adoMultiUsoII: TADOQuery
    Connection = ADOSIGMA
    Parameters = <>
    Left = 96
    Top = 96
  end
  object QQuery: TADOQuery
    Connection = ADOSIGMA
    Parameters = <>
    Left = 248
    Top = 144
  end
end
