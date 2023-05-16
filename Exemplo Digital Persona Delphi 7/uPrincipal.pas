unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    btCapture: TButton;
    btn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    BitBtn1: TBitBtn;
    procedure btCaptureClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCapturar, uVerificar, uVerificar2, DataModule;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  if Application.FindComponent('FrmVerificar2') = nil then
    FrmVerificar2 := TFrmVerificar2.Create(self);
  FrmVerificar2.ShowModal;
end;

procedure TfrmPrincipal.btCaptureClick(Sender: TObject);
begin
  if Application.FindComponent('frmCapturar') = nil then
    frmCapturar := TfrmCapturar.Create(self);
  frmCapturar.PESSOA := StrToIntdef(LabeledEdit1.Text,1);
  frmCapturar.ShowModal;
end;

procedure TfrmPrincipal.btn1Click(Sender: TObject);
begin
  if Application.FindComponent('FrmVerificar') = nil then
    FrmVerificar := TFrmVerificar.Create(self);
  FrmVerificar.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  DM.FDConnection1.Connected := false;
  Action := caFree;
  Application.Terminate;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  DM.IBDatabase1.DatabaseName := 'localhost:'+ExtractFilePath(Application.ExeName)+'dados\digital.fdb';
  try
    DM.IBDatabase1.Connected := True;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
      Application.Terminate;
    end;
  end;
end;

end.
