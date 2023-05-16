program DigitalPersonaDelphiExemplo;

uses
  Vcl.Forms,
  uCapturar in 'uCapturar.pas' {frmCapturar},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uVerificar in 'uVerificar.pas' {FrmVerificar},
  DataModule in 'DataModule.pas' {DM: TDataModule},
  DPFPCtlXLib_TLB in 'Core\DPFPCtlXLib_TLB.pas',
  DPFPDevXLib_TLB in 'Core\DPFPDevXLib_TLB.pas',
  DPFPEngXLib_TLB in 'Core\DPFPEngXLib_TLB.pas',
  DPFPGlobal in 'Core\DPFPGlobal.pas',
  DPFPShrXLib_TLB in 'Core\DPFPShrXLib_TLB.pas',
  uVerificar2 in 'uVerificar2.pas' {FrmVerificar2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
