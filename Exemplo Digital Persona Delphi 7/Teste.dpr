program Teste;

uses
  Forms,
  DataModule in 'DataModule.pas' {DM: TDataModule},
  uCapturar in 'uCapturar.pas' {frmCapturar},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uVerificar in 'uVerificar.pas' {FrmVerificar},
  uVerificar2 in 'uVerificar2.pas' {FrmVerificar2},
  DPFPCtlXLib_TLB in 'Core\DPFPCtlXLib_TLB.pas',
  DPFPDevXLib_TLB in 'Core\DPFPDevXLib_TLB.pas',
  DPFPEngXLib_TLB in 'Core\DPFPEngXLib_TLB.pas',
  DPFPGlobal in 'Core\DPFPGlobal.pas',
  DPFPShrXLib_TLB in 'Core\DPFPShrXLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
