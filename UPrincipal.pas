unit UPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Actions,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan,
  Vcl.ToolWin,
  Vcl.ActnCtrls,
  Vcl.ActnMenus,
  UfTarefa1,
  ufTarefa2,
  UfTarefa3;

type
  TfPrincipal = class(TForm)
    actMenuPrincipal: TActionMainMenuBar;
    actMenu: TActionManager;
    actTarefa1: TAction;
    actTarefa2: TAction;
    actTarefa3: TAction;
    procedure actTarefa1Execute(Sender: TObject);
    procedure actTarefa3Execute(Sender: TObject);
    procedure actTarefa2Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.actTarefa1Execute(Sender: TObject);
begin
  if fTarefa1 = nil then
    fTarefa1:=TfTarefa1.Create(Self);
  fTarefa1.Show;
end;

procedure TfPrincipal.actTarefa2Execute(Sender: TObject);
begin
  if fTarefa2 = nil then
    fTarefa2:=TfTarefa2.Create(Self);
  fTarefa2.Show;
end;

procedure TfPrincipal.actTarefa3Execute(Sender: TObject);
begin
  if fTarefa3 = nil then
    fTarefa3:=TfTarefa3.Create(Self);
  fTarefa3.Show;
end;

end.
