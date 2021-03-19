object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Prova Delphi App - Principal'
  ClientHeight = 674
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object actMenuPrincipal: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 827
    Height = 25
    UseSystemFont = False
    ActionManager = actMenu
    Caption = 'actMenuPrincipal'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 0
  end
  object actMenu: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = actTarefa1
            Caption = '&Tarefa 1'
          end
          item
            Action = actTarefa2
            Caption = 'T&arefa 2'
          end
          item
            Action = actTarefa3
            Caption = 'Ta&refa 3'
          end>
        ActionBar = actMenuPrincipal
      end>
    Left = 680
    Top = 56
    StyleName = 'Platform Default'
    object actTarefa1: TAction
      Caption = 'Tarefa 1'
      OnExecute = actTarefa1Execute
    end
    object actTarefa2: TAction
      Caption = 'Tarefa 2'
      OnExecute = actTarefa2Execute
    end
    object actTarefa3: TAction
      Caption = 'Tarefa 3'
      OnExecute = actTarefa3Execute
    end
  end
end
