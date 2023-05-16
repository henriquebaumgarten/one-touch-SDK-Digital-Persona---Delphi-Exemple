object FrmVerificar: TFrmVerificar
  Left = 768
  Top = 462
  Width = 331
  Height = 107
  BorderIcons = [biSystemMenu]
  Caption = 'Verificar Digital'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 60
    Top = 18
    Width = 117
    Height = 33
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DPFPVerificationControl1: TDPFPVerificationControl
    Left = 6
    Top = 10
    Width = 48
    Height = 47
    TabOrder = 0
    OnComplete = DPFPVerificationControl1Complete
    ControlData = {
      00080000F6040000DC04000008004E0000007B00300030003000300030003000
      300030002D0030003000300030002D0030003000300030002D00300030003000
      30002D003000300030003000300030003000300030003000300030007D000000
      0B000100}
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 248
    Top = 16
  end
end
