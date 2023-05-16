unit uVerificar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, OleCtrls, DPFPCtlXLib_TLB,
  OleServer, DPFPEngXLib_TLB, DPFPShrXLib_TLB, StdCtrls, ExtCtrls;

type
  TFrmVerificar = class(TForm)
    //DPFPVerificationControl1: TDPFPVerificationControl;
    Label1: TLabel;
    Timer1: TTimer;
    DPFPVerificationControl1: TDPFPVerificationControl;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DPFPVerificationControl1Complete(ASender: TObject; const pFeatureSet, pStatus: IDispatch);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVerificar: TFrmVerificar;
  verifier : DPFPVerification;
  result : DPFPVerificationResult;
  status : DPFPEventHandlerStatus;

implementation

{$R *.dfm}

uses DataModule, DPFPGlobal;

procedure TFrmVerificar.DPFPVerificationControl1Complete(ASender: TObject; const pFeatureSet, pStatus: IDispatch);
var
  i:Integer;
  rawDataSize: integer;
  vetByte : PByteArray;
  buffer : array of byte;
  strTemplate:string;
  dataVariant:Variant;
  templat:      DPFPTemplate;
  tTemplat : TDPFPTemplate;
begin
  try
    Screen.Cursor := crHourGlass;
    Label1.Caption :='Processando ...';
    Label1.Refresh;
    try
      DM.FDSelectAll.First;
      //eventos e estado para verificação da biometria
      status:= DPFPCtlXLib_TLB.DPFPEventHandlerStatus(pStatus);
      status.Status:=DPFPCtlXLib_TLB.EventHandlerStatusFailure;
      //pega todas as biometrias para verificar
      while not DM.FDSelectAll.Eof do
      begin
        //pega no banco
        strTemplate := DM.FDSelectAll.FieldByName('DIG_TEMPLATE').AsString;
        //transforma de volta de string para TBytes
//        buffer := TEncoding.Default.GetBytes(strTemplate);
        SetLength(buffer, Length(strTemplate));
        for I := 0 to Length(strTemplate) - 1 do
          buffer[I] := ord(strTemplate[I + 1]) - 48;

        //aponta o ponteiro de dados para o byte
        if Length(buffer) <> 0 then
          Move(buffer[0], fpData[0], Length(buffer));
        //pega os limites
        rawDataSize := High(fpData) - Low(fpData);
        //cria o variante
        dataVariant := VarArrayCreate([0,rawDataSize],varByte);
        //aloca o variante no pbytearray
        vetByte := VarArrayLock(dataVariant);
        //envia 1 a 1 para o pByteArray
        for i := 0 to rawDataSize - 1 do
          vetByte[i] := fpData[i];
        //libera o variante
        VarArrayUnlock(dataVariant);
        //cria o template
        tTemplat := TDPFPTemplate.Create(nil);
        //desserializa os dados
        tTemplat.DefaultInterface.Deserialize(dataVariant);
        //pega a instancia do template
        templat := tTemplat.DefaultInterface;
        //****************** verifica a digital ***********************
        result:= DPFPEngXLib_TLB.DPFPVerificationResult (verifier.Verify(pFeatureSet,templat));
        if result.Verified=true then
        begin
          //status de sucesso
          Label1.Caption := 'Func '+DM.FDSelectAll.FieldByName('FUN_CODIGO').AsString+' ID Digital '+DM.FDSelectAll.FieldByName('ID').AsString;
          status.Status:=  DPFPCtlXLib_TLB.EventHandlerStatusSuccess ;
          exit;
        end;

        DM.FDSelectAll.Next;
      end;
      Label1.Caption :='Não Encontrado';
      Label1.Refresh;
    except
      on E: Exception do
        ShowMessage(e.Message);
    end;
  finally
    tTemplat.FreeInstance;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVerificar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //destroi o componente
  DPFPVerificationControl1.Destroy;
  Action := caFree;
end;

procedure TFrmVerificar.FormShow(Sender: TObject);
begin
  //transfere os dados para um table
  DM.FDSelectAll.Open();
  //cria um verificador
  verifier:= CoDPFPVerification.Create;
end;

procedure TFrmVerificar.Timer1Timer(Sender: TObject);
begin
  if not Application.Active then
    Application.BringToFront;
end;

end.
