object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Prova Delphi App - Tarefa 2'
  ClientHeight = 219
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pnlContador1: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 527
    DesignSize = (
      434
      81)
    object lblcontador1: TLabel
      Left = 253
      Top = 32
      Width = 16
      Height = 13
      Alignment = taCenter
      Caption = '0/0'
    end
    object lblTempoInteracao1: TLabel
      Left = 8
      Top = 6
      Width = 97
      Height = 13
      Caption = 'Tempo de Intera'#231#227'o'
    end
    object prbContador1: TProgressBar
      Left = -88
      Top = 49
      Width = 507
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
    end
    object edtTempoInteracao1: TEdit
      Left = 8
      Top = 25
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '0'
    end
    object btnFinalizarInt1: TButton
      Left = 344
      Top = 21
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Finalizar'
      Enabled = False
      TabOrder = 2
      OnClick = btnFinalizarInt1Click
      ExplicitLeft = 440
    end
  end
  object pnlButton: TPanel
    Left = 0
    Top = 162
    Width = 434
    Height = 57
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 84
    ExplicitWidth = 527
    object btnExecutar: TButton
      Left = 344
      Top = 23
      Width = 75
      Height = 25
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btnExecutarClick
    end
  end
  object pnlContador2: TPanel
    Left = 0
    Top = 81
    Width = 434
    Height = 81
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 527
    ExplicitHeight = 80
    DesignSize = (
      434
      81)
    object lblcontador2: TLabel
      Left = 253
      Top = 30
      Width = 16
      Height = 13
      Alignment = taCenter
      Caption = '0/0'
    end
    object lblTempoInteracao2: TLabel
      Left = 8
      Top = 6
      Width = 97
      Height = 13
      Caption = 'Tempo de Intera'#231#227'o'
    end
    object prbContador2: TProgressBar
      Left = -88
      Top = 49
      Width = 507
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 8
    end
    object edtTempoInteracao2: TEdit
      Left = 8
      Top = 25
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '0'
    end
    object btnFinalizarInt2: TButton
      Left = 344
      Top = 21
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Finalizar'
      Enabled = False
      TabOrder = 2
      OnClick = btnFinalizarInt2Click
      ExplicitLeft = 440
    end
  end
end
