unit DelphiZXingQRCode;

{
  Delphi port of the ZXing QR Code library.
  This unit is standalone and works in Delphi 7 and higher.
}

interface

uses
  SysUtils, Classes, Graphics;

type
  TQRCodeEncoding = (qrAuto, qrNumeric, qrAlphaNumeric, qrByte, qrKanji);

  TDelphiZXingQRCode = class
  private
    FData: string;
    FEncoding: TQRCodeEncoding;
    FQuietZone: Integer;
    FRows: Integer;
    FColumns: Integer;
    FBitmap: TBitmap;
    procedure Update;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Draw(Canvas: TCanvas; Rect: TRect);
    property Data: string read FData write FData;
    property Encoding: TQRCodeEncoding read FEncoding write FEncoding;
    property QuietZone: Integer read FQuietZone write FQuietZone;
    property Rows: Integer read FRows;
    property Columns: Integer read FColumns;
  end;

implementation

uses
  ZXing.QrCode.Internal.Encoder,
  ZXing.Common.BitMatrix,
  ZXing.QrCode.Internal.ErrorCorrectionLevel;

constructor TDelphiZXingQRCode.Create;
begin
  inherited Create;
  FData := '';
  FEncoding := qrAuto;
  FQuietZone := 4;
end;

destructor TDelphiZXingQRCode.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TDelphiZXingQRCode.Update;
var
  Encoder: TEncoder;
  Matrix: TBitMatrix;
  Scale: Integer;
  x, y: Integer;
begin
  if Assigned(FBitmap) then
    FreeAndNil(FBitmap);

  Encoder := TEncoder.Create;
  try
    Matrix := Encoder.Encode(FData, TErrorCorrectionLevel.H);
    try
      FRows := Matrix.Height;
      FColumns := Matrix.Width;
      Scale := 4; // Puedes cambiar el tamaño aquí

      FBitmap := TBitmap.Create;
      FBitmap.Width := (Matrix.Width + 2 * FQuietZone) * Scale;
      FBitmap.Height := (Matrix.Height + 2 * FQuietZone) * Scale;
      FBitmap.PixelFormat := pf24bit;

      FBitmap.Canvas.Brush.Color := clWhite;
      FBitmap.Canvas.FillRect(Rect(0, 0, FBitmap.Width, FBitmap.Height));
      FBitmap.Canvas.Brush.Color := clBlack;

      for y := 0 to Matrix.Height - 1 do
        for x := 0 to Matrix.Width - 1 do
          if Matrix[x, y] then
            FBitmap.Canvas.FillRect(
              Rect(
                (x + FQuietZone) * Scale,
                (y + FQuietZone) * Scale,
                (x + FQuietZone + 1) * Scale,
                (y + FQuietZone + 1) * Scale
              )
            );
    finally
      Matrix.Free;
    end;
  finally
    Encoder.Free;
  end;
end;

procedure TDelphiZXingQRCode.Draw(Canvas: TCanvas; Rect: TRect);
begin
  if FBitmap = nil then
    Update;
  Canvas.StretchDraw(Rect, FBitmap);
end;

end.
