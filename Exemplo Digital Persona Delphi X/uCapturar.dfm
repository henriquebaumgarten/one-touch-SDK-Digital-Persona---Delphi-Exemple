object frmCapturar: TfrmCapturar
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Digital'
  ClientHeight = 340
  ClientWidth = 496
  Color = clBtnFace
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
  object DPFPEnrollmentControl1: TDPFPEnrollmentControl
    Left = 0
    Top = 0
    Width = 495
    Height = 314
    TabOrder = 1
    OnDelete = DPFPEnrollmentControl1Delete
    OnEnroll = DPFPEnrollmentControl1Enroll
    ControlData = {
      00080000293300007420000003000A00000003000000000008004E0000007B00
      300030003000300030003000300030002D0030003000300030002D0030003000
      300030002D0030003000300030002D0030003000300030003000300030003000
      30003000300030007D000000}
  end
  object btClose: TButton
    Left = 413
    Top = 304
    Width = 75
    Height = 33
    Caption = 'Sair'
    TabOrder = 0
    OnClick = btCloseClick
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 352
    Top = 312
  end
end
