unit uVerificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, DPFPCtlXLib_TLB,
  Vcl.OleServer, DPFPEngXLib_TLB, DPFPShrXLib_TLB, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmVerificar = class(TForm)

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
  buffer : TBytes;
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
      DM.FDTable.First;
      //eventos e estado para verificação da biometria
      status:= DPFPCtlXLib_TLB.DPFPEventHandlerStatus(pStatus);
      status.Status:=DPFPCtlXLib_TLB.EventHandlerStatusFailure;
      //pega todas as biometrias para verificar
      while not DM.FDTable.Eof do
      begin
        //pega no banco
        strTemplate := DM.FDTable.FieldByName('DIG_TEMPLATE').AsString;
        //transforma de volta de string para TBytes
        buffer := TEncoding.Default.GetBytes(strTemplate);
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
          Label1.Caption := 'Func '+DM.FDTable.FieldByName('FUN_CODIGO').AsString+' ID Digital '+DM.FDTable.FieldByName('ID').AsString;
          status.Status:=  DPFPCtlXLib_TLB.EventHandlerStatusSuccess ;
          exit;
        end;

        DM.FDTable.Next;
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
  DM.FDTable.Close;
  DM.FDTable.Data:= DM.FDSelectAll.Data;
  DM.FDSelectAll.Close();
  //cria um verificador
  verifier:= CoDPFPVerification.Create;
end;

procedure TFrmVerificar.Timer1Timer(Sender: TObject);
begin
  if not Application.Active then
    Application.BringToFront;
end;

end.
