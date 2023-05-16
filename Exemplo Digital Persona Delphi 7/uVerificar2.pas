unit uVerificar2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls,DPFPCtlXLib_TLB, DPFPDevXLib_TLB, DPFPEngXLib_TLB, DPFPShrXLib_TLB,
  StdCtrls, ActiveX,  ImgList;

type
  TFrmVerificar2 = class(TForm)
    Label1: TLabel;
    ImageList1: TImageList;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure OnComplete(ASender: TObject; const ReaderSerNum: WideString;const pSample: IDispatch);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVerificar2 : TFrmVerificar2;
  capture       : TDPFPCapture;
  verifier      : DPFPVerification;
  result : DPFPVerificationResult;
implementation

{$R *.dfm}

uses DataModule, DPFPGlobal, AxCtrls;

procedure TFrmVerificar2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  capture.Destroy;
  Action := caFree;
end;

procedure TFrmVerificar2.FormShow(Sender: TObject);
begin
   //transfere os dados para um table
  DM.FDSelectAll.Open();
//  DM.FDTable.Close;
//  DM.FDTable.Data:= DM.FDSelectAll.Data;
//  DM.FDSelectAll.Close();
  //cria um verificador
  verifier:= CoDPFPVerification.Create;
  //cria um capturador de digitais
  capture := TDPFPCapture.Create(nil);
  //a prioridade high pede privilegio de adm contudo faz funcionar em segundo plano
  capture.Priority := CapturePriorityHigh;
  //vincula o evento do capture
  capture.OnComplete := OnComplete;
  //inicia a captura
  capture.StartCapture();

 // ImageList1.GetBitmap(0,Image1.Picture.Bitmap);

end;

procedure TFrmVerificar2.OnComplete(ASender: TObject; const ReaderSerNum: WideString; const pSample: IDispatch);
var
  i:Integer;
  rawDataSize: integer;
  vetByte : PByteArray;
  buffer : array of byte;
  strTemplate:string;
  dataVariant:Variant;
  templat:      DPFPTemplate;
  tTemplat : TDPFPTemplate;
  FeatureSet: TDPFPFeatureExtraction;
  conversion:TDPFPSampleConversion;
  l_interface:IDispatch;
begin
  try
    Screen.Cursor := crHourGlass;
    Label1.Caption :='Processando ...';
    //ImageList1.GetBitmap(0,Image1.Picture.Bitmap);
    Label1.Refresh;
    //cria uma informação para a verificação
    FeatureSet := TDPFPFeatureExtraction.Create(nil);
    FeatureSet.CreateFeatureSet(pSample, DataPurposeVerification);
    //pegar a imagem
    conversion := TDPFPSampleConversion.Create(nil);
    l_interface := conversion.ConvertToPicture(pSample);
    SetOlePicture(Image2.Picture,IPictureDisp(l_interface));
    try
      DM.FDSelectAll.First;

      //pega todas as biometrias para verificar
      while not DM.FDSelectAll.Eof do
      begin
        //pega no banco
        strTemplate := DM.FDSelectAll.FieldByName('DIG_TEMPLATE').AsString;
        //transforma de volta de string para TBytes
//       buffer := TEncoding.Default.GetBytes(strTemplate); henrique
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
        result:= DPFPEngXLib_TLB.DPFPVerificationResult (verifier.Verify(FeatureSet.FeatureSet,templat));
        if result.Verified=true then
        begin
          //status de sucesso
          Label1.Caption := 'Func '+DM.FDSelectAll.FieldByName('FUN_CODIGO').AsString+' ID Digital '+DM.FDSelectAll.FieldByName('ID').AsString;
          //ImageList1.GetBitmap(2,Image1.Picture.Bitmap);
          exit;
        end;

        DM.FDSelectAll.Next;
      end;
      Label1.Caption :='Não Encontrado';
      //ImageList1.GetBitmap(1,Image1.Picture.Bitmap);
      Label1.Refresh;
    except
      on E: Exception do
        ShowMessage(e.Message);
    end;
  finally
    tTemplat.FreeInstance;
    conversion.FreeInstance;
    FeatureSet.FreeInstance;
    Screen.Cursor := crDefault;
  end;
end;

end.
