object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Exemplo Delphi e Digital Persona One Touch SDK'
  ClientHeight = 169
  ClientWidth = 416
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
  object btCapture: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 42
    Caption = 'Cadastro de Biometria'
    TabOrder = 0
    OnClick = btCaptureClick
  end
  object btn1: TBitBtn
    Left = 8
    Top = 56
    Width = 137
    Height = 39
    Caption = 'Verificar '
    TabOrder = 1
    OnClick = btn1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 160
    Top = 29
    Width = 57
    Height = 21
    EditLabel.Width = 85
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo da Pessoa'
    TabOrder = 2
    Text = '1'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 103
    Width = 313
    Height = 58
    Caption = 'Verificar (Roda em Background, Executar como Administrador)'
    TabOrder = 3
    OnClick = BitBtn1Click
  end
end
