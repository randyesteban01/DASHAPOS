
VERSION 1.0 CLASS

BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END

Attribute VB_Name = "EpsonDO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' Este modulo contiene el código a disposicion por parte de IFDRIVERS
' en una base TAL CUAL. Todo receptor del Modulo se considera
' bajo licencia de los derechos de autor de IFDRIVERS para utilizar el
' codigo fuente siempre en modo que el o ella considere conveniente,
' incluida la copia, la compilacion, su modificacion o la redistribucion,
' con o sin modificaciones. Ninguna licencia o patentes de IFDRivers
' este implicita en la presente licencia.
'
' El usuario del codigo fuente debera entender que IFDRIVERS no puede
' Proporcionar apoyo tecnico para el modulo y no sera Responsable
' de las consecuencias del uso del programa.
'
' Todas las comunicaciones, incluida esta, no deben ser removidos
' del modulo sin el consentimiento previo por escrito de IFDRIVERS
' www: http://www.impresoras-fiscales.com.ar/
' email: soporte@impresoras-fiscales.com.ar
'
' Notas para tener en cuenta:
' System Locale vs. Code Locale:
' The system locale is the locale of the user who runs your program — it is used as a reference
' for user input and output and uses Control Panel settings provided by the operating system.
' The code locale is always English/U.S. in Visual Basic, regardless of which international 
' version you use. Code locale determines the programming language and all the locale-specific settings.
'
' Numeric Values and Separators:
' In the United States, the period (.) is used as the decimal separator. In several European countries,
' however, the comma (,) is used as the decimal separator. Similarly, in the United States, 
' a comma is used as the thousands separator to isolate groups of three digits to the left of 
' the decimal separator. In several European countries, a period or a space is used for this purpose.
'
' Note: In Visual Basic, the Str and Val functions always assume a period is the decimal separator. 
' In a majority of locales, this assumption is not valid. Instead, use the CStr, CDbl, CSng, CInt,.
' and CLng functions to provide international conversions from any other data type to the data type you 
' need. These functions use the system locale to determine the decimal separator.
'
' Instrucciones para usar las funciones de alto nivel en Visual Basic 6.0:
'
' 1) Agregue el archivo con esta clase a su proyecto.
' 2) Agregue una referencia al OCX Fiscal Unidrv.ocx en Project, References (VB6.0) o Tools, References(Access)
' 3) Declare y cree la clase en su codigo. Todas las funciones del Activex Fiscal
' seran accesibles tambien desde esta clase: IF_OPEN, IF_CLOSE,etc mas las funciones 
' de alto nivel.
' 
' Por ejemplo:
'
' Dim nError As Long
' Dim m_objEpsonDO As EpsonDO 
'
' Set m_objEpsonDO = new EpsonDO
'
' nError = m_objEpsonDO.IF_OPEN("COM1",9600)
'
' ....etc.
'
Dim WithEvents IFiscal As DriverFiscal

Private Sub Class_Initialize()

Set IFiscal = New DriverFiscal

IFiscal.Printer = "TMT88"

' Opcionalmente configurar las otras propiedades:
' IFiscal.NoEvents = 1
' ......

End Sub

Private Sub Class_Terminate()

Set IFiscal = Nothing

End Sub

Private Sub IFiscal_OnFiscalError(ByVal nPrinterError As Long, ByVal nFiscalError As Long)
 
 Debug.Print "OnFiscalError: Error Impresora: " & Hex$(nPrinterError) & ", Error Controlador: " & Hex$(nFiscalError)

End Sub

Private Sub IFiscal_OnDriverError(ByVal nError As Integer)
 
 Debug.Print "OnDriverError ..."

 Select Case nError
  Case E_drvCommand
    Debug.Print "Error enviando el comando al controlador fiscal"
  Case E_drvNoPort
    Debug.Print "Error en la gestion del puerto de comunicaciones"
  Case E_drvNoPrinter
    Debug.Print "Error en la carga del driver de la impresora"
 End Select

End Sub

Public Function IF_OPEN(strComm As String, nSpeed As Long) As Long

IF_OPEN = IFiscal.IF_OPEN(strComm, nSpeed)

End Function

Public Function IF_READ(nCampo As Long) As String

IF_READ = IFiscal.IF_READ(nCampo)

End Function

Public Function IF_WRITE(strData As String) As Long

IF_WRITE = IFiscal.IF_WRITE(strData)

End Function

Public Function IF_CLOSE() As Long

IF_CLOSE = IFiscal.IF_CLOSE()

End Function

Public Function IF_ERROR1(nBit As Long) As Long

IF_ERROR1 = IFiscal.IF_ERROR1(nBit)

End Function

Public Function IF_ERROR2(nBit As Long) As Long

IF_ERROR2 = IFiscal.IF_ERROR2(nBit)

End Function

Public Sub IF_TRACE(nTrace As Long)

IFiscal.IF_TRACE(nTrace)

End Sub

'*******************************************************************************
' 1. Comandos de Sistema
'*******************************************************************************
' Sincro()
'
' Syntax:
'		Sincro()
' Proposito: 
'		Cancela cualquier comprobante fiscal o no fiscal abierto
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function Sincro() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@Sincro"	

nError = IFiscal.IF_WRITE(strBuff)
 
Sincro = nError

Exit Function

PrinterError:

 If MsgBox("Sincro: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

Sincro = -1

End Function

'*******************************************************************************
' StatusRequest()
'
' Syntax:
'		StatusRequest()
' Proposito: 
'		Obtiene los valores de estado fiscal y de impresora en tiempo real.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function StatusRequest() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@StatusRequest"	

nError = IFiscal.IF_WRITE(strBuff)
 
StatusRequest = nError

Exit Function

PrinterError:

 If MsgBox("StatusRequest: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

StatusRequest = -1

End Function

'*******************************************************************************
' GetInitErrorInfo()
'
' Syntax:
'		GetInitErrorInfo()
' Proposito: 
'		Obtiene el código de error correspondiente si se ha producido un error en el inicio de la impresora fiscal.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetInitErrorInfo() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetInitErrorInfo"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetInitErrorInfo = nError

Exit Function

PrinterError:

 If MsgBox("GetInitErrorInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetInitErrorInfo = -1

End Function

'*******************************************************************************
' GetInternalError()
'
' Syntax:
'		GetInternalError()
' Proposito: 
'		Obtiene el código de error correspondiente si se ha producido un error en operaciones internas.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetInternalError() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetInternalError"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetInternalError = nError

Exit Function

PrinterError:

 If MsgBox("GetInternalError: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetInternalError = -1

End Function

'*******************************************************************************
' SetComSpeed()
'
' Syntax:
'		SetComSpeed(byVar1)
' Proposito: 
'		Configura la velocidad de comunicación del puerto de usuario (host port). La configuración se hará efectiva una vez que se apague y se vuelva a encender la impresora.
' Argumentos: 
'		byVar1	Velocidad
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetComSpeed(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetComSpeed" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
SetComSpeed = nError

Exit Function

PrinterError:

 If MsgBox("SetComSpeed: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetComSpeed = -1

End Function

'*******************************************************************************
' 2. Comandos de diagnóstico
'*******************************************************************************
' GetPrinterStatus()
'
' Syntax:
'		GetPrinterStatus(byVar1)
' Proposito: 
'		Imprime un documento con las características del mecanismo impresor.
' Argumentos: 
'		byVar1	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetPrinterStatus(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetPrinterStatus" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetPrinterStatus = nError

Exit Function

PrinterError:

 If MsgBox("GetPrinterStatus: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetPrinterStatus = -1

End Function

'*******************************************************************************
' RippleTest()
'
' Syntax:
'		RippleTest(byVar1, nVar2)
' Proposito: 
'		Imprime el documento de ripple test.
' Argumentos: 
'		byVar1	Impresión
'		nVar2	Cantidad de lineas (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function RippleTest(byVar1 As String, nVar2 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@RippleTest" & "|" & byVar1 & "|" & Str(nVar2)	

nError = IFiscal.IF_WRITE(strBuff)
 
RippleTest = nError

Exit Function

PrinterError:

 If MsgBox("RippleTest: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

RippleTest = -1

End Function

'*******************************************************************************
' GetFiscalFeatures()
'
' Syntax:
'		GetFiscalFeatures(byVar1)
' Proposito: 
'		Obtiene las características fiscales de la impresora fiscal.
' Argumentos: 
'		byVar1	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetFiscalFeatures(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetFiscalFeatures" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetFiscalFeatures = nError

Exit Function

PrinterError:

 If MsgBox("GetFiscalFeatures: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetFiscalFeatures = -1

End Function

'*******************************************************************************
' GetSysEvents()
'
' Syntax:
'		GetSysEvents()
' Proposito: 
'		Obtiene información acerca de los eventos más recientes ocurridos en el sistema desde el último desbloqueo de fábrica (dip-switch 8 habilitado).
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetSysEvents() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetSysEvents"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetSysEvents = nError

Exit Function

PrinterError:

 If MsgBox("GetSysEvents: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetSysEvents = -1

End Function

'*******************************************************************************
' 3. Comandos de Inicialización
'*******************************************************************************
' GetPrinterVersion()
'
' Syntax:
'		GetPrinterVersion(byVar1)
' Proposito: 
'		Obtiene los datos de serialización que se encuentran configurados en el equipo. Es posible obtener una salida impresa.
' Argumentos: 
'		byVar1	Impresion
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetPrinterVersion(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetPrinterVersion" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetPrinterVersion = nError

Exit Function

PrinterError:

 If MsgBox("GetPrinterVersion: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetPrinterVersion = -1

End Function

'*******************************************************************************
' 4. Comandos de configuración
'*******************************************************************************
' SetDateTime()
'
' Syntax:
'		SetDateTime(strVar1, strVar2)
' Proposito: 
'		Establece el valor del reloj interno de la impresora fiscal.
' Argumentos: 
'		strVar1	Fecha (DDMMCCYY) (max 8 bytes)
'		strVar2	Hora  (HHMMSS) (max 6 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetDateTime(strVar1 As String, strVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetDateTime" & "|" & strVar1 & "|" & strVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SetDateTime = nError

Exit Function

PrinterError:

 If MsgBox("SetDateTime: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetDateTime = -1

End Function

'*******************************************************************************
' GetDateTime()
'
' Syntax:
'		GetDateTime()
' Proposito: 
'		Obtiene los valores actuales de configuración del reloj interno de la impresora fiscal.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetDateTime() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetDateTime"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetDateTime = nError

Exit Function

PrinterError:

 If MsgBox("GetDateTime: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetDateTime = -1

End Function

'*******************************************************************************
' GetInitData()
'
' Syntax:
'		GetInitData(byVar1)
' Proposito: 
'		Obtiene los datos de fiscalización que se encuentran configurados en el equipo. Es posible obtener una salida impresa.
' Argumentos: 
'		byVar1	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetInitData(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetInitData" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetInitData = nError

Exit Function

PrinterError:

 If MsgBox("GetInitData: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetInitData = -1

End Function

'*******************************************************************************
' SetHeader()
'
' Syntax:
'		SetHeader(nVar1, strVar2)
' Proposito: 
'		Configura el valor de las líneas de encabezado que se almacenan en la memoria de trabajo del equipo.
' Argumentos: 
'		nVar1	Nro de línea (1 al 10) (nnn)
'		strVar2	Texto del encabezamiento (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetHeader(nVar1 As Integer, strVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetHeader" & "|" & Str(nVar1) & "|" & strVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SetHeader = nError

Exit Function

PrinterError:

 If MsgBox("SetHeader: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetHeader = -1

End Function

'*******************************************************************************
' GetHeader()
'
' Syntax:
'		GetHeader(nVar1)
' Proposito: 
'		Obtiene los valores de las líneas de encabezado almacenadas en la memoria de trabajo de la impresora fiscal.
' Argumentos: 
'		nVar1	Nro de línea (1 al 10) (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetHeader(nVar1 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetHeader" & "|" & Str(nVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
GetHeader = nError

Exit Function

PrinterError:

 If MsgBox("GetHeader: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetHeader = -1

End Function

'*******************************************************************************
' SetTrailer()
'
' Syntax:
'		SetTrailer(nVar1, strVar2)
' Proposito: 
'		Configura el valor de las líneas de cola que se almacenan en la memoria de trabajo del equipo.
' Argumentos: 
'		nVar1	Nro de línea (1 al 10) (nnn)
'		strVar2	Texto de la línea (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetTrailer(nVar1 As Integer, strVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetTrailer" & "|" & Str(nVar1) & "|" & strVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SetTrailer = nError

Exit Function

PrinterError:

 If MsgBox("SetTrailer: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetTrailer = -1

End Function

'*******************************************************************************
' GetTrailer()
'
' Syntax:
'		GetTrailer(nVar1)
' Proposito: 
'		Obtiene los valores de las líneas de cola almacenadas en la memoria de trabajo de la impresora fiscal.
' Argumentos: 
'		nVar1	Nro de línea (1 al 10) (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetTrailer(nVar1 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetTrailer" & "|" & Str(nVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
GetTrailer = nError

Exit Function

PrinterError:

 If MsgBox("GetTrailer: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetTrailer = -1

End Function

'*******************************************************************************
' SetPaymentMedia()
'
' Syntax:
'		SetPaymentMedia(nVar1, strVar2)
' Proposito: 
'		Configura un tipo de pago para ser utilizado durante el proceso de facturación.
' Argumentos: 
'		nVar1	Número de tipo de pago (nn)
'		strVar2	Texto
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetPaymentMedia(nVar1 As Integer, strVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetPaymentMedia" & "|" & Str(nVar1) & "|" & strVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SetPaymentMedia = nError

Exit Function

PrinterError:

 If MsgBox("SetPaymentMedia: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetPaymentMedia = -1

End Function

'*******************************************************************************
' GetPaymentMedia()
'
' Syntax:
'		GetPaymentMedia(nVar1)
' Proposito: 
'		Obtiene los valores que han sido configurados como tipos de pago.
' Argumentos: 
'		nVar1	Número de tipo de pago (nn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetPaymentMedia(nVar1 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetPaymentMedia" & "|" & Str(nVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
GetPaymentMedia = nError

Exit Function

PrinterError:

 If MsgBox("GetPaymentMedia: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetPaymentMedia = -1

End Function

'*******************************************************************************
' SetVendorLineInfo()
'
' Syntax:
'		SetVendorLineInfo(nVar1, strVar2)
' Proposito: 
'		Configura el valor de las líneas de establecimiento que se almacenan en la memoria de trabajo del equipo.
' Argumentos: 
'		nVar1	Número de línea de establecimiento (nnn)
'		strVar2	Texto (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetVendorLineInfo(nVar1 As Integer, strVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetVendorLineInfo" & "|" & Str(nVar1) & "|" & strVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SetVendorLineInfo = nError

Exit Function

PrinterError:

 If MsgBox("SetVendorLineInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetVendorLineInfo = -1

End Function

'*******************************************************************************
' GetVendorLineInfo()
'
' Syntax:
'		GetVendorLineInfo(nVar1)
' Proposito: 
'		Obtiene los valores de las líneas de establecimiento almacenadas en la memoria de trabajo de la impresora fiscal.
' Argumentos: 
'		nVar1	Número de línea de establecimiento (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetVendorLineInfo(nVar1 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetVendorLineInfo" & "|" & Str(nVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
GetVendorLineInfo = nError

Exit Function

PrinterError:

 If MsgBox("GetVendorLineInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetVendorLineInfo = -1

End Function

'*******************************************************************************
' SetSystemFont()
'
' Syntax:
'		SetSystemFont(byVar1)
' Proposito: 
'		Configura la fuente utilizada por el equipo.
' Argumentos: 
'		byVar1	Fuente a utilizar
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetSystemFont(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetSystemFont" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
SetSystemFont = nError

Exit Function

PrinterError:

 If MsgBox("SetSystemFont: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetSystemFont = -1

End Function

'*******************************************************************************
' GetSystemFont()
'
' Syntax:
'		GetSystemFont()
' Proposito: 
'		Obtiene la fuente utilizada por el equipo.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetSystemFont() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetSystemFont"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetSystemFont = nError

Exit Function

PrinterError:

 If MsgBox("GetSystemFont: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetSystemFont = -1

End Function

'*******************************************************************************
' SetCancelMode()
'
' Syntax:
'		SetCancelMode(nVar1)
' Proposito: 
'		Configurar modo de cancelación de comprobantes fiscales
' Argumentos: 
'		nVar1	Modo de cancelamiento (n)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetCancelMode(nVar1 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetCancelMode" & "|" & Str(nVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
SetCancelMode = nError

Exit Function

PrinterError:

 If MsgBox("SetCancelMode: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetCancelMode = -1

End Function

'*******************************************************************************
' GetCancelMode()
'
' Syntax:
'		GetCancelMode()
' Proposito: 
'		Obtiene el modo de cancelación de los comprobantes fiscales.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetCancelMode() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetCancelMode"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetCancelMode = nError

Exit Function

PrinterError:

 If MsgBox("GetCancelMode: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetCancelMode = -1

End Function

'*******************************************************************************
' 5. Comandos de control de impresora
'*******************************************************************************
' PaperFeed()
'
' Syntax:
'		PaperFeed(nVar1, byVar2)
' Proposito: 
'		Avanza el papel en la estación indicada la cantidad de líneas especificadas.
' Argumentos: 
'		nVar1	Cantidad de líneas a avanzar (nn)
'		byVar2	Estación
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PaperFeed(nVar1 As Integer, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PaperFeed" & "|" & Str(nVar1) & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
PaperFeed = nError

Exit Function

PrinterError:

 If MsgBox("PaperFeed: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PaperFeed = -1

End Function

'*******************************************************************************
' PaperCut()
'
' Syntax:
'		PaperCut()
' Proposito: 
'		Corta el papel en la estación roll.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PaperCut() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PaperCut"	

nError = IFiscal.IF_WRITE(strBuff)
 
PaperCut = nError

Exit Function

PrinterError:

 If MsgBox("PaperCut: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PaperCut = -1

End Function

'*******************************************************************************
' PaperLoad()
'
' Syntax:
'		PaperLoad(byVar1)
' Proposito: 
'		Habilita la carga de papel en la estación slip o de validación.
' Argumentos: 
'		byVar1	estación
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PaperLoad(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PaperLoad" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
PaperLoad = nError

Exit Function

PrinterError:

 If MsgBox("PaperLoad: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PaperLoad = -1

End Function

'*******************************************************************************
' PaperEject()
'
' Syntax:
'		PaperEject(byVar1, byVar2)
' Proposito: 
'		Expulsa el papel de la estación slip o validación.
' Argumentos: 
'		byVar1	estación
'		byVar2	modo
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PaperEject(byVar1 As String, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PaperEject" & "|" & byVar1 & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
PaperEject = nError

Exit Function

PrinterError:

 If MsgBox("PaperEject: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PaperEject = -1

End Function

'*******************************************************************************
' WaitCancel()
'
' Syntax:
'		WaitCancel()
' Proposito: 
'		Cancela la espera de carga o retiro de papel de la estación slip o de validación.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function WaitCancel() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@WaitCancel"	

nError = IFiscal.IF_WRITE(strBuff)
 
WaitCancel = nError

Exit Function

PrinterError:

 If MsgBox("WaitCancel: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

WaitCancel = -1

End Function

'*******************************************************************************
' OpenDrawer()
'
' Syntax:
'		OpenDrawer(byVar1)
' Proposito: 
'		Realiza la apertura de las gavetas de dinero.
' Argumentos: 
'		byVar1	Nro de cajon (1 o 2)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function OpenDrawer(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@OpenDrawer" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
OpenDrawer = nError

Exit Function

PrinterError:

 If MsgBox("OpenDrawer: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

OpenDrawer = -1

End Function

'*******************************************************************************
' 6. Comandos relacionados a los cheques
'*******************************************************************************
' CheckStartMICR()
'
' Syntax:
'		CheckStartMICR(byVar1, byVar2, byVar3)
' Proposito: 
'		Prepara la estación para cargar un cheque y realizar la lectura del mismo.
' Argumentos: 
'		byVar1	Tipo de letra {01}
'		byVar2	Recibir informacion extendida {SN}
'		byVar3	Reemplazar los caracteres no reconocidos por ? (S/N)  {SN}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CheckStartMICR(byVar1 As String, byVar2 As String, byVar3 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CheckStartMICR" & "|" & byVar1 & "|" & byVar2 & "|" & byVar3	

nError = IFiscal.IF_WRITE(strBuff)
 
CheckStartMICR = nError

Exit Function

PrinterError:

 If MsgBox("CheckStartMICR: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CheckStartMICR = -1

End Function

'*******************************************************************************
' CheckEjectMICR()
'
' Syntax:
'		CheckEjectMICR()
' Proposito: 
'		Expulsa el cheque de la estación de slip (MICR).
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CheckEjectMICR() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CheckEjectMICR"	

nError = IFiscal.IF_WRITE(strBuff)
 
CheckEjectMICR = nError

Exit Function

PrinterError:

 If MsgBox("CheckEjectMICR: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CheckEjectMICR = -1

End Function

'*******************************************************************************
' SelectSlipMICR()
'
' Syntax:
'		SelectSlipMICR()
' Proposito: 
'		Selecciona la estación slip cuando se encuentra cargado papel en estación slip para lectura de MICR.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SelectSlipMICR() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SelectSlipMICR"	

nError = IFiscal.IF_WRITE(strBuff)
 
SelectSlipMICR = nError

Exit Function

PrinterError:

 If MsgBox("SelectSlipMICR: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SelectSlipMICR = -1

End Function

'*******************************************************************************
' GetCheckDataMICR()
'
' Syntax:
'		GetCheckDataMICR()
' Proposito: 
'		Obtiene el valor de la última lectura realizada al cargar el cheque.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetCheckDataMICR() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetCheckDataMICR"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetCheckDataMICR = nError

Exit Function

PrinterError:

 If MsgBox("GetCheckDataMICR: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetCheckDataMICR = -1

End Function

'*******************************************************************************
' ClearHeaderMICR()
'
' Syntax:
'		ClearHeaderMICR()
' Proposito: 
'		Realiza la limpieza del cabezal MICR.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ClearHeaderMICR() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ClearHeaderMICR"	

nError = IFiscal.IF_WRITE(strBuff)
 
ClearHeaderMICR = nError

Exit Function

PrinterError:

 If MsgBox("ClearHeaderMICR: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ClearHeaderMICR = -1

End Function

'*******************************************************************************
' CheckResetPos()
'
' Syntax:
'		CheckResetPos(byVar1)
' Proposito: 
'		Prepara el cheque en la posición inicial de impresión.
' Argumentos: 
'		byVar1	Modo {FR}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CheckResetPos(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CheckResetPos" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
CheckResetPos = nError

Exit Function

PrinterError:

 If MsgBox("CheckResetPos: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CheckResetPos = -1

End Function

'*******************************************************************************
' SetScannerArea()
'
' Syntax:
'		SetScannerArea(nVar1, nVar2, nVar3, nVar4)
' Proposito: 
'		Configura los valores de las coordenadas para realizar el scan de imágenes por la estación slip.
' Argumentos: 
'		nVar1	Valor x1 (coordenada superior izquierda) (nnn)
'		nVar2	Valor y1 (coordenada superior izquierda) (nnn)
'		nVar3	Valor x2 (coordenada inferior derecha) (nnn)
'		nVar4	Valor y2 (coordenada inferior derecha) (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetScannerArea(nVar1 As Integer, nVar2 As Integer, nVar3 As Integer, nVar4 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetScannerArea" & "|" & Str(nVar1) & "|" & Str(nVar2) & "|" & Str(nVar3) & "|" & _
            Str(nVar4)	

nError = IFiscal.IF_WRITE(strBuff)
 
SetScannerArea = nError

Exit Function

PrinterError:

 If MsgBox("SetScannerArea: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetScannerArea = -1

End Function

'*******************************************************************************
' GetScannerArea()
'
' Syntax:
'		GetScannerArea()
' Proposito: 
'		Obtiene los valores de configuración de las coordenadas para realizar el scan de imágenes por la estación slip.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetScannerArea() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetScannerArea"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetScannerArea = nError

Exit Function

PrinterError:

 If MsgBox("GetScannerArea: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetScannerArea = -1

End Function

'*******************************************************************************
' SetScannerCropArea()
'
' Syntax:
'		SetScannerCropArea(nVar1, nVar2, nVar3, nVar4, nVar5)
' Proposito: 
'		Configura los valores de las coordenadas para recortar un área cuando se realiza el scan de imágenes por la estación slip.
' Argumentos: 
'		nVar1	Nro de area de recorte (nnn)
'		nVar2	Valor x1 (coordenada superior izquierda) (nnn)
'		nVar3	Valor y1 (coordenada superior izquierda) (nnn)
'		nVar4	Valor x2 (coordenada inferior derecha) (nnn)
'		nVar5	Valor y2 (coordenada inferior derecha) (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetScannerCropArea(nVar1 As Integer, nVar2 As Integer, nVar3 As Integer, _
                             nVar4 As Integer, nVar5 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetScannerCropArea" & "|" & Str(nVar1) & "|" & Str(nVar2) & "|" & Str(nVar3) & "|" & _
            Str(nVar4) & "|" & Str(nVar5)	

nError = IFiscal.IF_WRITE(strBuff)
 
SetScannerCropArea = nError

Exit Function

PrinterError:

 If MsgBox("SetScannerCropArea: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetScannerCropArea = -1

End Function

'*******************************************************************************
' GetScannerCropArea()
'
' Syntax:
'		GetScannerCropArea()
' Proposito: 
'		Obtiene los valores de configuración de las coordenadas para recortar un área cuando se realiza el scan de imágenes por la estación slip.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetScannerCropArea() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetScannerCropArea"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetScannerCropArea = nError

Exit Function

PrinterError:

 If MsgBox("GetScannerCropArea: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetScannerCropArea = -1

End Function

'*******************************************************************************
' ClearScannerCropArea()
'
' Syntax:
'		ClearScannerCropArea(nVar1)
' Proposito: 
'		Borra la configuración de un área de recorte para cuando se realiza el scan de imágenes por la estación slip.
' Argumentos: 
'		nVar1	Número de área de recorte (0 = todas las áreas) (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ClearScannerCropArea(nVar1 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ClearScannerCropArea" & "|" & Str(nVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
ClearScannerCropArea = nError

Exit Function

PrinterError:

 If MsgBox("ClearScannerCropArea: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ClearScannerCropArea = -1

End Function

'*******************************************************************************
' ScannerPreScan()
'
' Syntax:
'		ScannerPreScan()
' Proposito: 
'		Efectúa un pre-scan de imagen por la estación slip.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ScannerPreScan() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ScannerPreScan"	

nError = IFiscal.IF_WRITE(strBuff)
 
ScannerPreScan = nError

Exit Function

PrinterError:

 If MsgBox("ScannerPreScan: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ScannerPreScan = -1

End Function

'*******************************************************************************
' ScannerStartScan()
'
' Syntax:
'		ScannerStartScan(byVar1, nVar2)
' Proposito: 
'		Comienza el proceso de scan por la estación slip.
' Argumentos: 
'		byVar1	Formato {NBF}
'		nVar2	Valor del brillo del scan
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ScannerStartScan(byVar1 As String, nVar2 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ScannerStartScan" & "|" & byVar1 & "|" & Str(nVar2)	

nError = IFiscal.IF_WRITE(strBuff)
 
ScannerStartScan = nError

Exit Function

PrinterError:

 If MsgBox("ScannerStartScan: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ScannerStartScan = -1

End Function

'*******************************************************************************
' ScannerGetNextData()
'
' Syntax:
'		ScannerGetNextData()
' Proposito: 
'		Obtiene el siguiente set de datos de scan.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ScannerGetNextData() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ScannerGetNextData"	

nError = IFiscal.IF_WRITE(strBuff)
 
ScannerGetNextData = nError

Exit Function

PrinterError:

 If MsgBox("ScannerGetNextData: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ScannerGetNextData = -1

End Function

'*******************************************************************************
' ScannerEndScan()
'
' Syntax:
'		ScannerEndScan()
' Proposito: 
'		Finaliza el proceso de descarga de datos de scan.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ScannerEndScan() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ScannerEndScan"	

nError = IFiscal.IF_WRITE(strBuff)
 
ScannerEndScan = nError

Exit Function

PrinterError:

 If MsgBox("ScannerEndScan: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ScannerEndScan = -1

End Function

'*******************************************************************************
' ScannerCancelScan()
'
' Syntax:
'		ScannerCancelScan()
' Proposito: 
'		Cancela el proceso de descarga de scan.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function ScannerCancelScan() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@ScannerCancelScan"	

nError = IFiscal.IF_WRITE(strBuff)
 
ScannerCancelScan = nError

Exit Function

PrinterError:

 If MsgBox("ScannerCancelScan: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

ScannerCancelScan = -1

End Function

'*******************************************************************************
' 7. Comandos de jornada fiscal
'*******************************************************************************
' DailyCloseZ()
'
' Syntax:
'		DailyCloseZ(byVar1)
' Proposito: 
'		Realiza el cierre de la jornada fiscal almacenando los importes facturados en memoria fiscal.
' Argumentos: 
'		byVar1	Imprimir el reporte
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DailyCloseZ(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DailyCloseZ" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
DailyCloseZ = nError

Exit Function

PrinterError:

 If MsgBox("DailyCloseZ: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DailyCloseZ = -1

End Function

'*******************************************************************************
' DailyCloseX()
'
' Syntax:
'		DailyCloseX(byVar1)
' Proposito: 
'		Realiza el cierre de cajero (cambio de turno). Imprimiendo la información parcial desde el último cierre de cajero o desde el inicio de la jornada fiscal.
' Argumentos: 
'		byVar1	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DailyCloseX(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DailyCloseX" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
DailyCloseX = nError

Exit Function

PrinterError:

 If MsgBox("DailyCloseX: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DailyCloseX = -1

End Function

'*******************************************************************************
' PrintReportX()
'
' Syntax:
'		PrintReportX()
' Proposito: 
'		Realiza el informe X (al igual que el de la secuencia del botón).
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PrintReportX() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PrintReportX"	

nError = IFiscal.IF_WRITE(strBuff)
 
PrintReportX = nError

Exit Function

PrinterError:

 If MsgBox("PrintReportX: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PrintReportX = -1

End Function

'*******************************************************************************
' GetCurrentFiscalReport()
'
' Syntax:
'		GetCurrentFiscalReport(byVar1)
' Proposito: 
'		Obtiene información de la jornada fiscal en curso.
' Argumentos: 
'		byVar1	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetCurrentFiscalReport(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetCurrentFiscalReport" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetCurrentFiscalReport = nError

Exit Function

PrinterError:

 If MsgBox("GetCurrentFiscalReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetCurrentFiscalReport = -1

End Function

'*******************************************************************************
' GetCurrentVatReport()
'
' Syntax:
'		GetCurrentVatReport(byVar1)
' Proposito: 
'		Obtiene información de impuestos (ITBIS) de la jornada fiscal en curso.
' Argumentos: 
'		byVar1	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetCurrentVatReport(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetCurrentVatReport" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetCurrentVatReport = nError

Exit Function

PrinterError:

 If MsgBox("GetCurrentVatReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetCurrentVatReport = -1

End Function

'*******************************************************************************
' GetCurrentPaymentReport()
'
' Syntax:
'		GetCurrentPaymentReport(byVar1, byVar2)
' Proposito: 
'		Obtiene información de pagos de la jornada fiscal en curso.
' Argumentos: 
'		byVar1	Imprimir
'		byVar2	Modo
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetCurrentPaymentReport(byVar1 As String, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetCurrentPaymentReport" & "|" & byVar1 & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
GetCurrentPaymentReport = nError

Exit Function

PrinterError:

 If MsgBox("GetCurrentPaymentReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetCurrentPaymentReport = -1

End Function

'*******************************************************************************
' GetWorkingMemory()
'
' Syntax:
'		GetWorkingMemory()
' Proposito: 
'		Informa los acumuladores y contadores en la memoria fiscal.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetWorkingMemory() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetWorkingMemory"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetWorkingMemory = nError

Exit Function

PrinterError:

 If MsgBox("GetWorkingMemory: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetWorkingMemory = -1

End Function

'*******************************************************************************
' 8. Comandos de Auditoria
'*******************************************************************************
' DailyCloseByDate()
'
' Syntax:
'		DailyCloseByDate(strVar1, strVar2, byVar3, byVar4)
' Proposito: 
'		Inicia un informe de cierres Z. Obtiene la información de acuerdo a los parámetros solicitados y prepara la descarga electrónica de datos.
' Argumentos: 
'		strVar1	Fecha inicial (DDMMCCYY) (max 8 bytes)
'		strVar2	Fecha final (DDMMCCYY)(opcional) (max 8 bytes)
'		byVar3	Tipo de informe
'		byVar4	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DailyCloseByDate(strVar1 As String, strVar2 As String, byVar3 As String, _
                           byVar4 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DailyCloseByDate" & "|" & strVar1 & "|" & strVar2 & "|" & byVar3 & "|" & _
            byVar4	

nError = IFiscal.IF_WRITE(strBuff)
 
DailyCloseByDate = nError

Exit Function

PrinterError:

 If MsgBox("DailyCloseByDate: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DailyCloseByDate = -1

End Function

'*******************************************************************************
' DailyCloseByNumber()
'
' Syntax:
'		DailyCloseByNumber(nVar1, nVar2, byVar3, byVar4)
' Proposito: 
'		Inicia un informe de cierres Z. Obtiene la información de acuerdo a los parámetros solicitados y prepara la descarga electrónica de datos.
' Argumentos: 
'		nVar1	Nro de cierre Z inicial (nnnnn)
'		nVar2	Nro de cierre Z final (opcional) (nnnnn)
'		byVar3	Tipo de informe
'		byVar4	Imprime
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DailyCloseByNumber(nVar1 As Integer, nVar2 As Integer, byVar3 As String, _
                             byVar4 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DailyCloseByNumber" & "|" & Str(nVar1) & "|" & Str(nVar2) & "|" & byVar3 & "|" & _
            byVar4	

nError = IFiscal.IF_WRITE(strBuff)
 
DailyCloseByNumber = nError

Exit Function

PrinterError:

 If MsgBox("DailyCloseByNumber: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DailyCloseByNumber = -1

End Function

'*******************************************************************************
' GetNextDailyCloseReportData()
'
' Syntax:
'		GetNextDailyCloseReportData()
' Proposito: 
'		Obtiene el primero o siguiente registro a descargar.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetNextDailyCloseReportData() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetNextDailyCloseReportData"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetNextDailyCloseReportData = nError

Exit Function

PrinterError:

 If MsgBox("GetNextDailyCloseReportData: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetNextDailyCloseReportData = -1

End Function

'*******************************************************************************
' CloseDailyCloseReport()
'
' Syntax:
'		CloseDailyCloseReport()
' Proposito: 
'		Confirma la descarga existosa y da por finalizado el informe.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CloseDailyCloseReport() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CloseDailyCloseReport"	

nError = IFiscal.IF_WRITE(strBuff)
 
CloseDailyCloseReport = nError

Exit Function

PrinterError:

 If MsgBox("CloseDailyCloseReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CloseDailyCloseReport = -1

End Function

'*******************************************************************************
' CancelDailyCloseReport()
'
' Syntax:
'		CancelDailyCloseReport()
' Proposito: 
'		Cancela el informe en proceso de descarga.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CancelDailyCloseReport() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CancelDailyCloseReport"	

nError = IFiscal.IF_WRITE(strBuff)
 
CancelDailyCloseReport = nError

Exit Function

PrinterError:

 If MsgBox("CancelDailyCloseReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CancelDailyCloseReport = -1

End Function

'*******************************************************************************
' GetBriefReportByDate()
'
' Syntax:
'		GetBriefReportByDate(strVar1, strVar2, byVar3)
' Proposito: 
'		Obtiene información acumulada (resumida) de las jornadas fiscales de acuerdo a un rango de fechas.
' Argumentos: 
'		strVar1	Fecha inicial (DDMMCCYY) (max 8 bytes)
'		strVar2	Fecha final (DDMMCCYY) (max 8 bytes)
'		byVar3	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetBriefReportByDate(strVar1 As String, strVar2 As String, byVar3 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetBriefReportByDate" & "|" & strVar1 & "|" & strVar2 & "|" & byVar3	

nError = IFiscal.IF_WRITE(strBuff)
 
GetBriefReportByDate = nError

Exit Function

PrinterError:

 If MsgBox("GetBriefReportByDate: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetBriefReportByDate = -1

End Function

'*******************************************************************************
' GetBriefReportByNumber()
'
' Syntax:
'		GetBriefReportByNumber(nVar1, nVar2, byVar3)
' Proposito: 
'		Obtiene información acumulada (resumida) de las jornadas fiscales de acuerdo a un rango de números de cierre Z.
' Argumentos: 
'		nVar1	Nro del primer cierrez (nnnnn)
'		nVar2	Nro del último cierrez (nnnnn)
'		byVar3	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetBriefReportByNumber(nVar1 As Integer, nVar2 As Integer, byVar3 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetBriefReportByNumber" & "|" & Str(nVar1) & "|" & Str(nVar2) & "|" & _
            byVar3	

nError = IFiscal.IF_WRITE(strBuff)
 
GetBriefReportByNumber = nError

Exit Function

PrinterError:

 If MsgBox("GetBriefReportByNumber: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetBriefReportByNumber = -1

End Function

'*******************************************************************************
' StartTransactionReportByDate()
'
' Syntax:
'		StartTransactionReportByDate(strVar1, strVar2, byVar3, byVar4)
' Proposito: 
'		Inicia un informe de transacciones. Obtiene la información de acuerdo a los parámetros solicitados y prepara la descarga electrónica de datos.
' Argumentos: 
'		strVar1	Fecha inicial (DDMMCCYY) (max 8 bytes)
'		strVar2	Fecha final (DDMMCCYY)(opcional) (max 8 bytes)
'		byVar3	Tipo de informe
'		byVar4	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function StartTransactionReportByDate(strVar1 As String, strVar2 As String, byVar3 As String, _
                                       byVar4 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@StartTransactionReportByDate" & "|" & strVar1 & "|" & strVar2 & "|" & _
            byVar3 & "|" & byVar4	

nError = IFiscal.IF_WRITE(strBuff)
 
StartTransactionReportByDate = nError

Exit Function

PrinterError:

 If MsgBox("StartTransactionReportByDate: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

StartTransactionReportByDate = -1

End Function

'*******************************************************************************
' StartTransactionReportByNumber()
'
' Syntax:
'		StartTransactionReportByNumber(nVar1, nVar2, byVar3, byVar4)
' Proposito: 
'		Inicia un informe de transacciones. Obtiene la información de acuerdo a los parámetros solicitados y prepara la descarga electrónica de datos.
' Argumentos: 
'		nVar1	Nro de cierre Z inicial (nnnnn)
'		nVar2	Nro de cierre Z final (opcional) (nnnnn)
'		byVar3	Tipo de informe
'		byVar4	Imprimir
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function StartTransactionReportByNumber(nVar1 As Integer, nVar2 As Integer, byVar3 As String, _
                                         byVar4 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@StartTransactionReportByNumber" & "|" & Str(nVar1) & "|" & Str(nVar2) & "|" & _
            byVar3 & "|" & byVar4	

nError = IFiscal.IF_WRITE(strBuff)
 
StartTransactionReportByNumber = nError

Exit Function

PrinterError:

 If MsgBox("StartTransactionReportByNumber: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

StartTransactionReportByNumber = -1

End Function

'*******************************************************************************
' GetNextTransactionReportData()
'
' Syntax:
'		GetNextTransactionReportData()
' Proposito: 
'		Obtiene el primero o siguiente registro a descargar.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetNextTransactionReportData() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetNextTransactionReportData"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetNextTransactionReportData = nError

Exit Function

PrinterError:

 If MsgBox("GetNextTransactionReportData: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetNextTransactionReportData = -1

End Function

'*******************************************************************************
' CloseTransactionReport()
'
' Syntax:
'		CloseTransactionReport()
' Proposito: 
'		Confirma la descarga existosa y da por finalizado el informe.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CloseTransactionReport() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CloseTransactionReport"	

nError = IFiscal.IF_WRITE(strBuff)
 
CloseTransactionReport = nError

Exit Function

PrinterError:

 If MsgBox("CloseTransactionReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CloseTransactionReport = -1

End Function

'*******************************************************************************
' CancelTransactionReport()
'
' Syntax:
'		CancelTransactionReport()
' Proposito: 
'		Cancela el informe en proceso de descarga.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CancelTransactionReport() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CancelTransactionReport"	

nError = IFiscal.IF_WRITE(strBuff)
 
CancelTransactionReport = nError

Exit Function

PrinterError:

 If MsgBox("CancelTransactionReport: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CancelTransactionReport = -1

End Function

'*******************************************************************************
' 9. Comandos de boleta fiscal
'*******************************************************************************
' TicketOpen()
'
' Syntax:
'		TicketOpen(byVar1, nVar2, nVar3, strVar4, strVar5, strVar6, strVar7, byVar8, nVar9, _
'		            nVar10, nVar11)
' Proposito: 
'		Realiza la apertura de un documento boleta fiscal.
' Argumentos: 
'		byVar1	Tipo de documento {ABCDEF}
'		nVar2	Número de sucursal (nnnn)
'		nVar3	Número de caja (nnnn)
'		strVar4	NCF (max 19 bytes)
'		strVar5	Razón social del comprador (max 40 bytes)
'		strVar6	RNC del comprador (max 11 bytes)
'		strVar7	NCF de referencia (max 19 bytes)
'		byVar8	Fuente a utilizar (opcional) {ABP}
'		nVar9	Cantidad de copias 0-7 (opcional) (n)
'		nVar10	Nro de logo a imprimir (opcional)
'		nVar11	Densidad de impresion (opcional)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketOpen(byVar1 As String, nVar2 As Integer, nVar3 As Integer, strVar4 As String, _
                     strVar5 As String, strVar6 As String, strVar7 As String, _
                      byVar8 As String, nVar9 As Integer, nVar10 As Integer, _
                       nVar11 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketOpen" & "|" & byVar1 & "|" & Str(nVar2) & "|" & Str(nVar3) & "|" & _
            strVar4 & "|" & strVar5 & "|" & strVar6 & "|" & strVar7 & "|" & _
             byVar8 & "|" & Str(nVar9) & "|" & Str(nVar10) & "|" & Str(nVar11)	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketOpen = nError

Exit Function

PrinterError:

 If MsgBox("TicketOpen: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketOpen = -1

End Function

'*******************************************************************************
' TicketItem()
'
' Syntax:
'		TicketItem(strVar1, dblVar2, dblVar3, dblVar4, byVar5, byVar6, strVar7, strVar8, _
'		            strVar9, strVar10, strVar11, strVar12, strVar13, strVar14, strVar15)
' Proposito: 
'		Realiza la emisión de ítem de venta o la devolución de un ítem en forma total o parcial.
' Argumentos: 
'		strVar1	Descripción del item (max 42 bytes)
'		dblVar2	Cantidad (nnnnn.nnn)
'		dblVar3	Precio unitario (nnnnnnn.nn)
'		dblVar4	Tasa de impuestos (.nn)
'		byVar5	Calificador de la operacion {MmRrDR}
'		byVar6	Promoción
'		strVar7	Descripción extra #1 (Opcional) (max 42 bytes)
'		strVar8	Descripción extra #2 (Opcional) (max 42 bytes)
'		strVar9	Descripción extra #3 (Opcional) (max 42 bytes)
'		strVar10	Descripción extra #4 (Opcional) (max 42 bytes)
'		strVar11	Descripción extra #5 (Opcional) (max 42 bytes)
'		strVar12	Descripción extra #6 (Opcional) (max 42 bytes)
'		strVar13	Descripción extra #7 (Opcional) (max 42 bytes)
'		strVar14	Descripción extra #8 (Opcional) (max 42 bytes)
'		strVar15	Descripción extra #9 (Opcional) (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketItem(strVar1 As String, dblVar2 As Double, dblVar3 As Double, dblVar4 As Double, _
                     byVar5 As String, byVar6 As String, strVar7 As String, _
                      strVar8 As String, strVar9 As String, strVar10 As String, _
                       strVar11 As String, strVar12 As String, _
                        strVar13 As String, strVar14 As String, strVar15 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketItem" & "|" & strVar1 & "|" & Str(dblVar2) & "|" & Str(dblVar3) & "|" & _
            Str(dblVar4) & "|" & byVar5 & "|" & byVar6 & "|" & strVar7 & "|" & _
             strVar8 & "|" & strVar9 & "|" & strVar10 & "|" & strVar11 & "|" & _
              strVar12 & "|" & strVar13 & "|" & strVar14 & "|" & _
               strVar15	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketItem = nError

Exit Function

PrinterError:

 If MsgBox("TicketItem: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketItem = -1

End Function

'*******************************************************************************
' TicketSubtotal()
'
' Syntax:
'		TicketSubtotal(byVar1)
' Proposito: 
'		Retorna el subtotal facturado dentro de la boleta fiscal.
' Argumentos: 
'		byVar1	Imprimir el subtotal
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketSubtotal(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketSubtotal" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketSubtotal = nError

Exit Function

PrinterError:

 If MsgBox("TicketSubtotal: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketSubtotal = -1

End Function

'*******************************************************************************
' TicketReturnRecharge()
'
' Syntax:
'		TicketReturnRecharge(strVar1, dblVar2, byVar3)
' Proposito: 
'		Aplica un descuento o recargo global a los montos facturados en la boleta fiscal.
' Argumentos: 
'		strVar1	Descripción (max 42 bytes)
'		dblVar2	Monto del descuento o recargo (nnnnnnnnn.nn)
'		byVar3	Calificador de la operación
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketReturnRecharge(strVar1 As String, dblVar2 As Double, byVar3 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketReturnRecharge" & "|" & strVar1 & "|" & Str(dblVar2) & "|" & byVar3	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketReturnRecharge = nError

Exit Function

PrinterError:

 If MsgBox("TicketReturnRecharge: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketReturnRecharge = -1

End Function

'*******************************************************************************
' TicketPayment()
'
' Syntax:
'		TicketPayment(nVar1, dblVar2, strVar3, strVar4, strVar5)
' Proposito: 
'		Aplica un pago a la boleta fiscal en proceso de emisión.
' Argumentos: 
'		nVar1	Tipo de pago
'		dblVar2	Monto del pago (nnnnnnnnn.nn)
'		strVar3	Descripción extra #1 (max 42 bytes)
'		strVar4	Descripción extra #2 (max 42 bytes)
'		strVar5	Descripción extra #3 (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketPayment(nVar1 As Integer, dblVar2 As Double, strVar3 As String, strVar4 As String, _
                        strVar5 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketPayment" & "|" & Str(nVar1) & "|" & Str(dblVar2) & "|" & strVar3 & "|" & _
            strVar4 & "|" & strVar5	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketPayment = nError

Exit Function

PrinterError:

 If MsgBox("TicketPayment: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketPayment = -1

End Function

'*******************************************************************************
' TicketClose()
'
' Syntax:
'		TicketClose(nVar1, strVar2, nVar3, strVar4, nVar5, strVar6)
' Proposito: 
'		Realiza el cierre de la boleta fiscal almacenando los datos de la transacción en la memoria de transacciones. 
' Argumentos: 
'		nVar1	Número de línea de cola de reemplazo 1 (opcional) (nnn)
'		strVar2	Descripción de reemplazo 1 (opcional) (max 42 bytes)
'		nVar3	Número de línea de cola de reemplazo 2 (opcional) (nnn)
'		strVar4	Descripción de reemplazo 2 (opcional) (max 42 bytes)
'		nVar5	Número de línea de cola de reemplazo 3 (opcional) (nnn)
'		strVar6	Descripción de reemplazo 3 (opcional) (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketClose(nVar1 As Integer, strVar2 As String, nVar3 As Integer, strVar4 As String, _
                      nVar5 As Integer, strVar6 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketClose" & "|" & Str(nVar1) & "|" & strVar2 & "|" & Str(nVar3) & "|" & _
            strVar4 & "|" & Str(nVar5) & "|" & strVar6	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketClose = nError

Exit Function

PrinterError:

 If MsgBox("TicketClose: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketClose = -1

End Function

'*******************************************************************************
' TicketCancel()
'
' Syntax:
'		TicketCancel()
' Proposito: 
'		Realiza la cancelación del comprobante fiscal.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketCancel() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketCancel"	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketCancel = nError

Exit Function

PrinterError:

 If MsgBox("TicketCancel: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketCancel = -1

End Function

'*******************************************************************************
' SetTicketOptions()
'
' Syntax:
'		SetTicketOptions(byVar1, byVar2)
' Proposito: 
'		Configura las diferentes opciones para la emisión de boletas fiscales.
' Argumentos: 
'		byVar1	Imprimir encabezados y cola
'		byVar2	Imprimir cantidad x precio
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SetTicketOptions(byVar1 As String, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SetTicketOptions" & "|" & byVar1 & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SetTicketOptions = nError

Exit Function

PrinterError:

 If MsgBox("SetTicketOptions: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SetTicketOptions = -1

End Function

'*******************************************************************************
' GetTicketOptions()
'
' Syntax:
'		GetTicketOptions()
' Proposito: 
'		Obtiene los valores de configuración para la emisión de boletas fiscales que se encuentran almacenados en la memoria de trabajo.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetTicketOptions() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetTicketOptions"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetTicketOptions = nError

Exit Function

PrinterError:

 If MsgBox("GetTicketOptions: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetTicketOptions = -1

End Function

'*******************************************************************************
' GetTicketInfo()
'
' Syntax:
'		GetTicketInfo()
' Proposito: 
'		Obtiene información de la boleta fiscal en proceso de emisión.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetTicketInfo() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetTicketInfo"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetTicketInfo = nError

Exit Function

PrinterError:

 If MsgBox("GetTicketInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetTicketInfo = -1

End Function

'*******************************************************************************
' GetTicketVatInfo()
'
' Syntax:
'		GetTicketVatInfo()
' Proposito: 
'		Obtiene información de impuestos (ITBIS) de la boleta fiscal en curso.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetTicketVatInfo() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetTicketVatInfo"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetTicketVatInfo = nError

Exit Function

PrinterError:

 If MsgBox("GetTicketVatInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetTicketVatInfo = -1

End Function

'*******************************************************************************
' GetTicketPaymentInfo()
'
' Syntax:
'		GetTicketPaymentInfo(byVar1)
' Proposito: 
'		Obtiene información de pagos de la boleta fiscal en curso.
' Argumentos: 
'		byVar1	Tipo
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetTicketPaymentInfo(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetTicketPaymentInfo" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
GetTicketPaymentInfo = nError

Exit Function

PrinterError:

 If MsgBox("GetTicketPaymentInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetTicketPaymentInfo = -1

End Function

'*******************************************************************************
' TicketDonation()
'
' Syntax:
'		TicketDonation(strVar1, dblVar2, byVar3)
' Proposito: 
'		Aplica una donación a la boleta fiscal en proceso de emisión.
' Argumentos: 
'		strVar1	Descripción (max 42 bytes)
'		dblVar2	Monto donación (nnnnnnnnn.nn)
'		byVar3	Calificador de la operación
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketDonation(strVar1 As String, dblVar2 As Double, byVar3 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketDonation" & "|" & strVar1 & "|" & Str(dblVar2) & "|" & byVar3	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketDonation = nError

Exit Function

PrinterError:

 If MsgBox("TicketDonation: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketDonation = -1

End Function

'*******************************************************************************
' TicketFiscalText()
'
' Syntax:
'		TicketFiscalText(strVar1)
' Proposito: 
'		Imprime una línea de comentario dentro de un comprobante fiscal.
' Argumentos: 
'		strVar1	Comentario (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketFiscalText(strVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketFiscalText" & "|" & strVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketFiscalText = nError

Exit Function

PrinterError:

 If MsgBox("TicketFiscalText: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketFiscalText = -1

End Function

'*******************************************************************************
' TicketTip()
'
' Syntax:
'		TicketTip(dblVar1)
' Proposito: 
'		Envía una propina al comprobante fiscal en proceso de emisión
' Argumentos: 
'		dblVar1	Monto de la propina (nnnnnnnnn.nn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function TicketTip(dblVar1 As Double) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@TicketTip" & "|" & Str(dblVar1)	

nError = IFiscal.IF_WRITE(strBuff)
 
TicketTip = nError

Exit Function

PrinterError:

 If MsgBox("TicketTip: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

TicketTip = -1

End Function

'*******************************************************************************
' GetLastTicketStatus()
'
' Syntax:
'		GetLastTicketStatus()
' Proposito: 
'		Retorna los valores de respuesta del último comprobante cerrado.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetLastTicketStatus() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetLastTicketStatus"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetLastTicketStatus = nError

Exit Function

PrinterError:

 If MsgBox("GetLastTicketStatus: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetLastTicketStatus = -1

End Function

'*******************************************************************************
' 10. Comandos de documentos no fiscales
'*******************************************************************************
' OpenNonFiscalReceipt()
'
' Syntax:
'		OpenNonFiscalReceipt(byVar1)
' Proposito: 
'		Realiza la apertura de un documento no fiscal.
' Argumentos: 
'		byVar1	Fuente a utilizar (opcional) {ABP}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function OpenNonFiscalReceipt(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@OpenNonFiscalReceipt" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
OpenNonFiscalReceipt = nError

Exit Function

PrinterError:

 If MsgBox("OpenNonFiscalReceipt: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

OpenNonFiscalReceipt = -1

End Function

'*******************************************************************************
' PrintNonFiscalText()
'
' Syntax:
'		PrintNonFiscalText(strVar1)
' Proposito: 
'		Imprime una línea de texto no fiscal dentro de un documento no fiscal.
' Argumentos: 
'		strVar1	Texto no fiscal (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PrintNonFiscalText(strVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PrintNonFiscalText" & "|" & strVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
PrintNonFiscalText = nError

Exit Function

PrinterError:

 If MsgBox("PrintNonFiscalText: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PrintNonFiscalText = -1

End Function

'*******************************************************************************
' CloseNonFiscalReceipt()
'
' Syntax:
'		CloseNonFiscalReceipt(byVar1)
' Proposito: 
'		Realiza el cierre del documento no fiscal en proceso de emisión.
' Argumentos: 
'		byVar1	Cortar papel {CN}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function CloseNonFiscalReceipt(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@CloseNonFiscalReceipt" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
CloseNonFiscalReceipt = nError

Exit Function

PrinterError:

 If MsgBox("CloseNonFiscalReceipt: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

CloseNonFiscalReceipt = -1

End Function

'*******************************************************************************
' GetNonFiscalReceiptInfo()
'
' Syntax:
'		GetNonFiscalReceiptInfo()
' Proposito: 
'		Obtiene información del documento no fiscal en proceso de emisión.
' Argumentos: 
'		Ninguno
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function GetNonFiscalReceiptInfo() As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@GetNonFiscalReceiptInfo"	

nError = IFiscal.IF_WRITE(strBuff)
 
GetNonFiscalReceiptInfo = nError

Exit Function

PrinterError:

 If MsgBox("GetNonFiscalReceiptInfo: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

GetNonFiscalReceiptInfo = -1

End Function

'*******************************************************************************
' PrintNonFiscalSingleItem()
'
' Syntax:
'		PrintNonFiscalSingleItem(strVar1, strVar2, strVar3, strVar4, strVar5, strVar6, strVar7, _
'		                          strVar8, strVar9, strVar10, strVar11, strVar12, _
'		                           strVar13, strVar14, strVar15, strVar16, _
'		                            strVar17, strVar18, strVar19, strVar20, strVar21, _
'		                             strVar22, strVar23, strVar24, strVar25, strVar26, _
'		                              strVar27, strVar28, strVar29, strVar30, _
'		                               byVar31, byVar32)
' Proposito: 
'		Realiza un Documento No Fiscal de 30 líneas.
' Argumentos: 
'		strVar1	Texto No fiscal línea 1 (opcional) (max 42 bytes)
'		strVar2	Texto No fiscal línea 2 (opcional) (max 42 bytes)
'		strVar3	Texto No fiscal línea 3 (opcional) (max 42 bytes)
'		strVar4	Texto No fiscal línea 4 (opcional) (max 42 bytes)
'		strVar5	Texto No fiscal línea 5 (opcional) (max 42 bytes)
'		strVar6	Texto No fiscal línea 6 (opcional) (max 42 bytes)
'		strVar7	Texto No fiscal línea 7 (max 42 bytes)
'		strVar8	Texto No fiscal línea 8 (max 42 bytes)
'		strVar9	Texto No fiscal línea 9 (max 42 bytes)
'		strVar10	Texto No fiscal línea 10 (max 42 bytes)
'		strVar11	Texto No fiscal línea 11 (max 42 bytes)
'		strVar12	Texto No fiscal línea 12 (max 42 bytes)
'		strVar13	Texto No fiscal línea 13 (max 42 bytes)
'		strVar14	Texto No fiscal línea 14 (max 42 bytes)
'		strVar15	Texto No fiscal línea 15 (max 42 bytes)
'		strVar16	Texto No fiscal línea 16 (max 42 bytes)
'		strVar17	Texto No fiscal línea 17 (max 42 bytes)
'		strVar18	Texto No fiscal línea 18 (max 42 bytes)
'		strVar19	Texto No fiscal línea 19 (max 42 bytes)
'		strVar20	Texto No fiscal línea 20 (max 42 bytes)
'		strVar21	Texto No fiscal línea 21 (max 42 bytes)
'		strVar22	Texto No fiscal línea 22 (max 42 bytes)
'		strVar23	Texto No fiscal línea 23 (max 42 bytes)
'		strVar24	Texto No fiscal línea 24 (max 42 bytes)
'		strVar25	Texto No fiscal línea 25 (max 42 bytes)
'		strVar26	Texto No fiscal línea 26 (max 42 bytes)
'		strVar27	Texto No fiscal línea 27 (max 42 bytes)
'		strVar28	Texto No fiscal línea 28 (max 42 bytes)
'		strVar29	Texto No fiscal línea 29 (max 42 bytes)
'		strVar30	Texto No fiscal línea 30 (max 42 bytes)
'		byVar31	Cortar papel {CN}
'		byVar32	Fuente a utilizar (opcional) {ABP}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function PrintNonFiscalSingleItem(strVar1 As String, strVar2 As String, strVar3 As String, _
                                   strVar4 As String, strVar5 As String, _
                                    strVar6 As String, strVar7 As String, _
                                     strVar8 As String, strVar9 As String, _
                                      strVar10 As String, strVar11 As String, _
                                       strVar12 As String, strVar13 As String, _
                                        strVar14 As String, strVar15 As String, _
                                         strVar16 As String, strVar17 As String, _
                                          strVar18 As String, strVar19 As String, _
                                           strVar20 As String, _
                                            strVar21 As String, strVar22 As String, _
                                             strVar23 As String, strVar24 As String, _
                                              strVar25 As String, _
                                               strVar26 As String, strVar27 As String, _
                                                strVar28 As String, _
                                                 strVar29 As String, strVar30 As String, _
                                                  byVar31 As String, _
                                                   byVar32 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@PrintNonFiscalSingleItem" & "|" & strVar1 & "|" & strVar2 & "|" & strVar3 & "|" & _
            strVar4 & "|" & strVar5 & "|" & strVar6 & "|" & strVar7 & "|" & _
             strVar8 & "|" & strVar9 & "|" & strVar10 & "|" & strVar11 & "|" & _
              strVar12 & "|" & strVar13 & "|" & strVar14 & "|" & _
               strVar15 & "|" & strVar16 & "|" & strVar17 & "|" & strVar18 & "|" & _
                strVar19 & "|" & strVar20 & "|" & strVar21 & "|" & strVar22 & "|" & _
                 strVar23 & "|" & strVar24 & "|" & strVar25 & "|" & _
                  strVar26 & "|" & strVar27 & "|" & strVar28 & "|" & strVar29 & "|" & _
                   strVar30 & "|" & byVar31 & "|" & byVar32	

nError = IFiscal.IF_WRITE(strBuff)
 
PrintNonFiscalSingleItem = nError

Exit Function

PrinterError:

 If MsgBox("PrintNonFiscalSingleItem: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

PrintNonFiscalSingleItem = -1

End Function

'*******************************************************************************
' 11. Comandos de manejo de display
'*******************************************************************************
' DisplayWriteText()
'
' Syntax:
'		DisplayWriteText(strVar1)
' Proposito: 
'		Muestra una línea de texto en un display EPSON conectado a la impresora fiscal.
' Argumentos: 
'		strVar1	Texto a imprimir (max 42 bytes)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DisplayWriteText(strVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DisplayWriteText" & "|" & strVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
DisplayWriteText = nError

Exit Function

PrinterError:

 If MsgBox("DisplayWriteText: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DisplayWriteText = -1

End Function

'*******************************************************************************
' DisplayClear()
'
' Syntax:
'		DisplayClear(byVar1)
' Proposito: 
'		Borra una línea de texto en un display EPSON conectado a la impresora fiscal.
' Argumentos: 
'		byVar1	Borrar todo {LT}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DisplayClear(byVar1 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DisplayClear" & "|" & byVar1	

nError = IFiscal.IF_WRITE(strBuff)
 
DisplayClear = nError

Exit Function

PrinterError:

 If MsgBox("DisplayClear: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DisplayClear = -1

End Function

'*******************************************************************************
' DisplaySetCursor()
'
' Syntax:
'		DisplaySetCursor(byVar1, nVar2, nVar3)
' Proposito: 
'		Posiciona y configura las propiedades del cursor en un display EPSON conectado a la impresora fiscal.
' Argumentos: 
'		byVar1	Calificador de la operación
'		nVar2	Nro de columna (opcional) (nn)
'		nVar3	Nro de fila (opcional) (nn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DisplaySetCursor(byVar1 As String, nVar2 As Integer, nVar3 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DisplaySetCursor" & "|" & byVar1 & "|" & Str(nVar2) & "|" & Str(nVar3)	

nError = IFiscal.IF_WRITE(strBuff)
 
DisplaySetCursor = nError

Exit Function

PrinterError:

 If MsgBox("DisplaySetCursor: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DisplaySetCursor = -1

End Function

'*******************************************************************************
' DisplayConfigure()
'
' Syntax:
'		DisplayConfigure(byVar1, nVar2)
' Proposito: 
'		Configura las preferencias de visualización de un display EPSON conectado a la impresora fiscal.
' Argumentos: 
'		byVar1	Parametro a modificar
'		nVar2	Valor del parámetro
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DisplayConfigure(byVar1 As String, nVar2 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DisplayConfigure" & "|" & byVar1 & "|" & Str(nVar2)	

nError = IFiscal.IF_WRITE(strBuff)
 
DisplayConfigure = nError

Exit Function

PrinterError:

 If MsgBox("DisplayConfigure: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DisplayConfigure = -1

End Function

'*******************************************************************************
' DisplayTest()
'
' Syntax:
'		DisplayTest(byVar1, byVar2)
' Proposito: 
'		Ejecuta un test de diagnóstico en un display EPSON conectado a la impresora fiscal.
' Argumentos: 
'		byVar1	Inicializar el Display {IN}
'		byVar2	Realizar Autoverificacion {AN}
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function DisplayTest(byVar1 As String, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@DisplayTest" & "|" & byVar1 & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
DisplayTest = nError

Exit Function

PrinterError:

 If MsgBox("DisplayTest: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

DisplayTest = -1

End Function

'*******************************************************************************
' 12. Comandos de impresión en slip
'*******************************************************************************
' SlipStartPrint()
'
' Syntax:
'		SlipStartPrint(byVar1, nVar2, nVar3, nVar4, nVar5, nVar6, nVar7)
' Proposito: 
'		Inicia la impresión por la terminal slip, validación o para imprimir un cheque. Este paso es requerido para poder imprimir líneas en las estaciones mencionadas.
' Argumentos: 
'		byVar1	Estación
'		nVar2	Valor de la coordenada X del origen del papel (opcional) (nnn)
'		nVar3	Valor de la coordenada Y del origen del papel (opcional) (nnn)
'		nVar4	Ancho del papel a partir del origen X (opcional) (nnn)
'		nVar5	Largo del papel a partir del origen Y (opcional) (nnn)
'		nVar6	Número de logo a imprimir (opcional) (nnn)
'		nVar7	Densidad de impresión (opcional) (n)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SlipStartPrint(byVar1 As String, nVar2 As Integer, nVar3 As Integer, nVar4 As Integer, _
                         nVar5 As Integer, nVar6 As Integer, nVar7 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SlipStartPrint" & "|" & byVar1 & "|" & Str(nVar2) & "|" & Str(nVar3) & "|" & _
            Str(nVar4) & "|" & Str(nVar5) & "|" & Str(nVar6) & "|" & _
             Str(nVar7)	

nError = IFiscal.IF_WRITE(strBuff)
 
SlipStartPrint = nError

Exit Function

PrinterError:

 If MsgBox("SlipStartPrint: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SlipStartPrint = -1

End Function

'*******************************************************************************
' SlipPrintText()
'
' Syntax:
'		SlipPrintText(strVar1, byVar2, nVar3)
' Proposito: 
'		Imprime una línea de texto en la estación de slip, validación o cheque tanto para el frente como para el reverso
' Argumentos: 
'		strVar1	Texto
'		byVar2	Tipo de avance
'		nVar3	Tamaño de avance de línea (opcional) (nnn)
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SlipPrintText(strVar1 As String, byVar2 As String, nVar3 As Integer) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SlipPrintText" & "|" & strVar1 & "|" & byVar2 & "|" & Str(nVar3)	

nError = IFiscal.IF_WRITE(strBuff)
 
SlipPrintText = nError

Exit Function

PrinterError:

 If MsgBox("SlipPrintText: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SlipPrintText = -1

End Function

'*******************************************************************************
' SlipEndPrint()
'
' Syntax:
'		SlipEndPrint(byVar1, byVar2)
' Proposito: 
'		Finaliza la impresión por la terminal slip o validación.
' Argumentos: 
'		byVar1	Expulsar papel
'		byVar2	Modo
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SlipEndPrint(byVar1 As String, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SlipEndPrint" & "|" & byVar1 & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SlipEndPrint = nError

Exit Function

PrinterError:

 If MsgBox("SlipEndPrint: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SlipEndPrint = -1

End Function

'*******************************************************************************
' SlipCancelPrint()
'
' Syntax:
'		SlipCancelPrint(byVar1, byVar2)
' Proposito: 
'		Cancela la impresión por la terminal slip o validación. Expulsa la hoja que se encuentra cargada en la estación.
' Argumentos: 
'		byVar1	Expulsar papel
'		byVar2	Modo
' Devuelve:
'		0 si no hay error y != 0 si hay un error
'*******************************************************************************
Function SlipCancelPrint(byVar1 As String, byVar2 As String) As Long

Dim nError As Long
Dim strBuff As String

On Error GoTo PrinterError

Retry:

strBuff = "@SlipCancelPrint" & "|" & byVar1 & "|" & byVar2	

nError = IFiscal.IF_WRITE(strBuff)
 
SlipCancelPrint = nError

Exit Function

PrinterError:

 If MsgBox("SlipCancelPrint: " & Err.Description, vbRetryCancel, "Error") = vbRetry Then
        Resume Retry
 End If

SlipCancelPrint = -1

End Function

 
