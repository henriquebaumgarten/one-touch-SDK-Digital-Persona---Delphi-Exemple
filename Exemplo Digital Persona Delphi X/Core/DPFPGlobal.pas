unit DPFPGlobal;

interface

uses
  System.Classes, Vcl.Graphics;

var
  fpData: array [0 .. 2512] of Byte;

procedure VariantToStream(const v: olevariant; Stream: TMemoryStream);
procedure StreamToVariant(Stream: TMemoryStream; var v: olevariant);
procedure BMPToVariant(aBmp: TBitmap; var aVariant: olevariant);
procedure VariantToBMP(aValue: olevariant; var aBmp: TBitmap);

implementation

uses
  System.Variants, Vcl.ExtCtrls, Winapi.ActiveX;

procedure VariantToStream(const v: olevariant; Stream: TMemoryStream);
var
  p: pointer;
begin
  Stream.Position := 0;
  Stream.Size := VarArrayHighBound(v, 1) - VarArrayLowBound(v, 1) + 1;
  p := VarArrayLock(v);
  Stream.Write(p^, Stream.Size);
  VarArrayUnlock(v);
  Stream.Position := 0;
end;

procedure StreamToVariant(Stream: TMemoryStream; var v: olevariant);
var
  p: pointer;
begin
  v := VarArrayCreate([0, Stream.Size - 1], varByte);
  p := VarArrayLock(v);
  Stream.Position := 0;
  Stream.Read(p^, Stream.Size);
  VarArrayUnlock(v);
end;

procedure BMPToVariant(aBmp: TBitmap; var aVariant: olevariant);
var
  Stream: TMemoryStream;
  Image1: TImage;
begin
  try
    Image1 := TImage.Create(nil);
    Stream := TMemoryStream.Create;

    Image1.Picture.Bitmap.SaveToStream(Stream);

    StreamToVariant(Stream, aVariant);
  finally
    Stream.Free;
  end;
end;

procedure VariantToBMP(aValue: OleVariant; var aBmp: TBitmap);
var
  Stream: TMemoryStream;
begin
  try
    Stream := TMemoryStream.Create;

    VariantToStream(aValue, Stream);
    Stream.SaveToFile('c:\temp\ttt.bmp');

    aBmp := TBitmap.Create;

    aBmp.LoadfromStream(Stream);
  finally
    VariantClear(aValue);
    Stream.Free;
  end;
end;

end.
