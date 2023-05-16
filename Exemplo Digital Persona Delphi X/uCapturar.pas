unit uCapturar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, AXCtrls, ActiveX, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.OleServer,
  DPFPCtlXLib_TLB, DPFPshrxlib_tlb;

type
  TfrmCapturar = class(TForm)

    btClose: TButton;

    Timer1: TTimer;
    DPFPEnrollmentControl1: TDPFPEnrollmentControl;
    procedure DPFPEnrollmentControl1Enroll(ASender: TObject; lFingerMask: Integer; const pTemplate, pStatus: IDispatch);
    procedure btCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPFPEnrollmentControl1Delete(ASender: TObject;
      lFingerMask: Integer; const pStatus: IDispatch);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
  public
    PESSOA:Integer;
  end;

var
  frmCapturar: TfrmCapturar;

implementation

{$R *.dfm}

uses DPFPGlobal, DataModule;

procedure TfrmCapturar.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCapturar.DPFPEnrollmentControl1Delete(ASender: TObject;
  lFingerMask: Integer; const pStatus: IDispatch);
begin
  {Recebe qual o indice do dedo que foi excluido
  e assim excluimos no banco a digital }
  DM.FDTransaction1.StartTransaction;
  DM.FDdelete.CLOSE;
  DM.FDdelete.Params[0].AsInteger := PESSOA;
  DM.FDdelete.Params[1].AsInteger := lFingerMask;
  DM.FDdelete.ExecSQL;
  DM.FDdelete.Close;
  DM.FDTransaction1.Commit;
end;

procedure TfrmCapturar.DPFPEnrollmentControl1Enroll(ASender: TObject;
  lFingerMask: Integer; const pTemplate, pStatus: IDispatch);
var
  Templat: DPFPTemplate;
  VariantAux: Variant;
  str,str2:AnsiString;
  i: Integer;
  aryLow : integer;
  aryHigh : integer;
  vtByteBuf : PByteArray;
  buffer : TBytes;
begin
  try
    //converte a biometria
    Templat := DPFPTemplate(pTemplate);
    //serializa os dados
    VariantAux := Templat.Serialize;
    //pega o tamanho do dado
    aryLow := VarArrayLowBound(VariantAux,1);
    aryHigh := varArrayHighBound(VariantAux,1);
    aryHigh := aryHigh - aryLow;
    //aponta os dados do variante para o bytearray
    vtByteBuf := VarArrayLock(VariantAux);
    //transfere os dados 1 a 1 para ym array or byte
    for i := 0 to Pred(aryHigh) do
      fpData[i] := vtByteBuf[i];
    //libera o variante
    VarArrayUnlock(VariantAux);
    //envia os dados para um tbytes
    SetLength(buffer, Length(fpData));
    if Length(fpData) <> 0 then
      Move(fpData[0], buffer[0], Length(fpData));
    //converte de tbytes para string para saqlvarmos no banco
    str := TEncoding.Default.GetString(buffer);
    //salva no banco
    DM.FDInsert.CLOSE;
    DM.FDTransaction1.StartTransaction;
    DM.FDInsert.Params[0].AsInteger := lFingerMask;
{$IFDEF VER310}
    DM.FDInsert.Params[1].AsAnsiString := str;
{$ELSE}
    DM.FDInsert.Params[1].AsString := str;
{$ENDIF}
    DM.FDInsert.Params[2].AsInteger := PESSOA;
    DM.FDInsert.ExecSQL;
    DM.FDInsert.Close;
    DM.FDTransaction1.Commit;

  except
    on E: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TfrmCapturar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //destroi o objeto
  DPFPEnrollmentControl1.Destroy;
  Action := caFree;
end;

procedure TfrmCapturar.FormShow(Sender: TObject);
var
  intaux:Integer;
begin
  intaux := 0;
  //pega as digitais da pessoa
  DM.FDselect.Close;
  DM.FDselect.Params[0].AsInteger := PESSOA;
  DM.FDselect.Open();
  //acende os dedos que foram cadastrados no controle do cadastro de digital
  while not DM.FDselect.eof do
  begin
    case DM.FDselect.FieldByName('dig_dedo').AsInteger of
      10:intaux:=intaux+1;
      9 :intaux:=intaux+2;

      8 :intaux:=intaux+4;
      7 :intaux:=intaux+8;
      6 :intaux:=intaux+16;
      5 :intaux:=intaux+512;
      4 :intaux:=intaux+256;
      3 :intaux:=intaux+128;
      2 :intaux:=intaux+64;
      1 :intaux:=intaux+32;
    end;
    DM.FDselect.Next;
  end;
  //seta o valor para acender os dedos
  DPFPEnrollmentControl1.EnrolledFingersMask := intaux;
  DM.FDselect.Close;
end;

procedure TfrmCapturar.Timer1Timer(Sender: TObject);
begin
  if not Application.Active then
    Application.BringToFront;
end;

end.
