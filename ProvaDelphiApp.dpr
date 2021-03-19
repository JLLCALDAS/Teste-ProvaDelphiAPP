program ProvaDelphiApp;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {fPrincipal},
  UfTarefa1 in 'UfTarefa1.pas' {fTarefa1},
  uspQuery in 'Package\uspQuery.pas',
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
