unit POSHuella;

{ Wrapper COM para el lector ZKTeco ZK9500 (Dasha.LectorHuella) }

interface

uses
  ComObj, ActiveX, SysUtils, Dialogs, Controls, DB;

function CrearLectorHuella: Variant;
function ProbarConexionHuella: string;
function CapturarHuellaSupervisor: string;
function VerificarHuellaContraPlantilla(const HuellaGuardada: string): Boolean;
function UsaHuellaSupervisor: Boolean;
function IdentificarSupervisorPorHuella(out UsuCodigo: Integer; out ClaveSupervisor: string;
  out MensajeError: string; const ModoAutomatico: Boolean = False): Boolean;

implementation

uses POS01;

function UsaHuellaSupervisor: Boolean;
var
  Campo: TField;
begin
  Result := False;
  if not dm.QParametros.Active then
    Exit;
  Campo := dm.QParametros.FindField('par_usa_huella_supervisor');
  if Campo = nil then
    Exit;
  if Campo.IsNull then
    Exit;
  if Campo.DataType = ftBoolean then
    Result := Campo.AsBoolean
  else
    Result := Campo.AsInteger <> 0;
end;

function CrearLectorHuella: Variant;
begin
  try
    Result := CreateOleObject('Dasha.LectorHuella');
  except
    on E: Exception do
    begin
      if (Pos('cadena clase', LowerCase(E.Message)) > 0) or
         (Pos('class string', LowerCase(E.Message)) > 0) or
         (Pos('invalid class', LowerCase(E.Message)) > 0) then
        raise Exception.Create(
          'El lector de huella no esta registrado en Windows.' + #13#10#13#10 +
          'Ejecute como Administrador:' + #13#10 +
          '  RegistrarLectorHuella.bat' + #13#10#13#10 +
          'LectorHuellaCOM.dll debe estar en la misma carpeta que ese .bat.')
      else
        raise;
    end;
  end;
end;

function CompararHuellasBase64Lector(const Lector: Variant;
  const HuellaBase64_1, HuellaBase64_2: string): Boolean;
begin
  Result := False;

  try
    Result := Lector.CompararHuellasBase64(HuellaBase64_1, HuellaBase64_2);
    Exit;
  except
    on E: Exception do
      if Pos('not supported', LowerCase(E.Message)) = 0 then
        raise;
  end;

  try
    Result := Lector.CompararHuellas(HuellaBase64_1, HuellaBase64_2);
    Exit;
  except
    on E: Exception do
      if Pos('not supported', LowerCase(E.Message)) = 0 then
        raise;
  end;

  raise Exception.Create(
    'Lector COM desactualizado. Recompile LectorHuellaCOM.dll, copiela junto al POS ' +
    'y ejecute RegistrarLectorHuella.bat como Administrador.');
end;

function ProbarConexionHuella: string;
var
  Lector: Variant;
begin
  try
    Lector := CrearLectorHuella;
    Result := Lector.ProbarConexion;
  except
    on E: Exception do
      Result := 'ERROR: ' + E.Message;
  end;
end;

function CapturarHuellaSupervisor: string;
var
  Lector: Variant;
  Respuesta: string;
begin
  Result := '';
  try
    Lector := CrearLectorHuella;

    if MessageDlg(
      'Coloque el dedo del supervisor en el lector ZK9500.' + #13#10 +
      'Presione OK cuando este listo para capturar.',
      mtInformation, [mbOK, mbCancel], 0) <> mrOK then
      Exit;

    Respuesta := Lector.CapturarHuella;

    if Copy(Respuesta, 1, 6) = 'ERROR:' then
    begin
      MessageDlg(Respuesta, mtError, [mbOK], 0);
      Exit;
    end;

    if Trim(Respuesta) = '' then
    begin
      MessageDlg('No se recibio plantilla de huella.', mtError, [mbOK], 0);
      Exit;
    end;

    Result := Respuesta;
    MessageDlg('Huella capturada correctamente.', mtInformation, [mbOK], 0);
  except
    on E: Exception do
      MessageDlg('Error al capturar huella: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function VerificarHuellaContraPlantilla(const HuellaGuardada: string): Boolean;
var
  Lector: Variant;
begin
  Result := False;
  if Trim(HuellaGuardada) = '' then
    Exit;

  try
    Lector := CrearLectorHuella;
    MessageDlg(
      'Coloque el dedo en el lector para verificar.',
      mtInformation, [mbOK], 0);
    Result := Lector.VerificarHuella(HuellaGuardada);
    if not Result then
      MessageDlg(
        'La huella no coincide. Codigo error: ' + IntToStr(Lector.UltimoError),
        mtError, [mbOK], 0);
  except
    on E: Exception do
      MessageDlg('Error al verificar huella: ' + E.Message, mtError, [mbOK], 0);
  end;
end;

function IdentificarSupervisorPorHuella(out UsuCodigo: Integer; out ClaveSupervisor: string;
  out MensajeError: string; const ModoAutomatico: Boolean = False): Boolean;
var
  Lector: Variant;
  HuellaCapturada, HuellaGuardada: string;
begin
  Result := False;
  UsuCodigo := 0;
  ClaveSupervisor := '';
  MensajeError := '';

  try
    if (not ModoAutomatico) and
      (MessageDlg(
        'Coloque el dedo del supervisor en el lector ZK9500.',
        mtInformation, [mbOK, mbCancel], 0) <> mrOK) then
      Exit;

    Lector := CrearLectorHuella;
    HuellaCapturada := Lector.CapturarHuella;

    if Copy(HuellaCapturada, 1, 6) = 'ERROR:' then
    begin
      MensajeError := HuellaCapturada;
      Exit;
    end;

    dm.Query1.Close;
    dm.Query1.SQL.Clear;
    dm.Query1.SQL.Add('select s.usu_codigo, s.clave, s.huella');
    dm.Query1.SQL.Add('from clave_supervisor_caja s');
    dm.Query1.SQL.Add('inner join usuarios u on u.usu_codigo = s.usu_codigo');
    dm.Query1.SQL.Add('where u.usu_status = ''ACT''');
    dm.Query1.SQL.Add('and s.huella is not null and s.huella <> ''''');
    dm.Query1.Open;

    if dm.Query1.IsEmpty then
    begin
      MensajeError := 'No hay supervisores con huella registrada.';
      Exit;
    end;

    while not dm.Query1.Eof do
    begin
      HuellaGuardada := dm.Query1.FieldByName('huella').AsString;
      if CompararHuellasBase64Lector(Lector, HuellaCapturada, HuellaGuardada) then
      begin
        UsuCodigo := dm.Query1.FieldByName('usu_codigo').AsInteger;
        ClaveSupervisor := dm.Query1.FieldByName('clave').AsString;
        Result := True;
        Exit;
      end;
      dm.Query1.Next;
    end;

    MensajeError := 'Huella no reconocida.';
  except
    on E: Exception do
      MensajeError := 'Error al identificar huella: ' + E.Message;
  end;
end;

end.
