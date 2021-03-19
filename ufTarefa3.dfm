object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Prova Delphi App - Tarefa 3'
  ClientHeight = 353
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grbProjeto: TGroupBox
    Left = 0
    Top = 0
    Width = 527
    Height = 353
    Align = alClient
    Caption = ' Valores por Projeto '
    TabOrder = 0
    object grdProjetos: TDBGrid
      Left = 2
      Top = 15
      Width = 523
      Height = 225
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object pnlOpcoes: TPanel
      Left = 2
      Top = 240
      Width = 523
      Height = 111
      Align = alBottom
      TabOrder = 1
      object lblTotal: TLabel
        Left = 368
        Top = 13
        Width = 40
        Height = 13
        Caption = 'Total R$'
      end
      object lblTotalDivisoes: TLabel
        Left = 368
        Top = 61
        Width = 82
        Height = 13
        Caption = 'Total Divis'#245'es R$'
      end
      object btnObtertotal: TButton
        Left = 279
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Obter Total'
        TabOrder = 0
        OnClick = btnObtertotalClick
      end
      object btnObterTotalDivisoes: TButton
        Left = 241
        Top = 80
        Width = 113
        Height = 25
        Caption = 'Obter Total Divis'#245'es'
        TabOrder = 1
        OnClick = btnObterTotalDivisoesClick
      end
      object edtTotal: TEdit
        Left = 368
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtTotalDivisoes: TEdit
        Left = 368
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 3
      end
    end
  end
end
