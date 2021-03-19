unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TContador1 = class(TThread)
  private
    FAux1: String;
    FSleep1: integer;
    FContador1: TLabel;
  public
    constructor Create(AContador1: TLabel; Sleep1: integer); reintroduce;
    procedure Execute; override;
    procedure Sincronizar;
  end;

  TContador2 = class(TThread)
  private
    FAux2: String;
    FSleep2: integer;
    FContador2: TLabel;
  public
    constructor Create(AContador2: TLabel; Sleep2: integer); reintroduce;
    procedure Execute; override;
    procedure Sincronizar;
  end;

  TfTarefa2 = class(TForm)
    pnlContador1: TPanel;
    pnlButton: TPanel;
    pnlContador2: TPanel;
    prbContador1: TProgressBar;
    prbContador2: TProgressBar;
    btnExecutar: TButton;
    lblcontador2: TLabel;
    lblcontador1: TLabel;
    lblTempoInteracao2: TLabel;
    edtTempoInteracao2: TEdit;
    lblTempoInteracao1: TLabel;
    edtTempoInteracao1: TEdit;
    btnFinalizarInt2: TButton;
    btnFinalizarInt1: TButton;
    procedure btnExecutarClick(Sender: TObject);
    procedure btnFinalizarInt2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFinalizarInt1Click(Sender: TObject);
  private
    Contador1: TContador1;
    Contador2: TContador2;
    procedure FinalizarThread1(Sender: TObject);
    procedure FinalizarThread2(Sender: TObject);
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
begin
  if (Self.Contador1=nil) or (Self.Contador1.Finished) then
  begin
    Self.Contador1:=TContador1.Create(lblcontador1,StrToInt(edtTempoInteracao1.Text));
    Self.Contador1.OnTerminate:=FinalizarThread1;
    Self.Contador1.Start;
    btnFinalizarInt1.Enabled:=True;
  end;

  if (Self.Contador2=nil) or (Self.Contador2.Finished) then
  begin
    Self.Contador2:=TContador2.Create(lblcontador2,StrToInt(edtTempoInteracao2.Text));
    Self.Contador2.OnTerminate:=FinalizarThread2;
    Self.Contador2.Start;
    btnFinalizarInt2.Enabled:=True;
  end;
end;

procedure TfTarefa2.btnFinalizarInt1Click(Sender: TObject);
begin
  Self.Contador1.Terminate;
end;

procedure TfTarefa2.btnFinalizarInt2Click(Sender: TObject);
begin
  Self.Contador2.Terminate;
end;

procedure TfTarefa2.FinalizarThread1(Sender: TObject);
begin
  Self.Contador1.Synchronize(procedure begin Application.MessageBox('Rotina Finalizada com Sucesso!!','Informação',MB_OK+MB_ICONINFORMATION) end);
  Self.prbContador1.Position:=0;
end;

procedure TfTarefa2.FinalizarThread2(Sender: TObject);
begin
  Self.Contador2.Synchronize(procedure begin Application.MessageBox('Rotina Finalizada com Sucesso!!','Informação',MB_OK+MB_ICONINFORMATION) end);
  Self.prbContador2.Position:=0;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  fTarefa2:=nil;
end;

{ TContador1 }

constructor TContador1.Create(AContador1: TLabel; Sleep1: integer);
begin
  inherited Create(True);
  Self.FreeOnTerminate := True;

  FAux1:='';
  FSleep1:=Sleep1;
  FContador1:=AContador1;
end;

procedure TContador1.Execute;
var
  vContador1: integer;
begin
  inherited;
  fTarefa2.prbContador1.Max:=100;
  for vContador1:=1 to fTarefa2.prbContador1.Max do
  begin
    if Self.Terminated then
      Break;
    fTarefa2.prbContador1.Position:=vContador1;
    Self.FAux1:=Format('%s/%s',[IntToStr(vContador1),IntToStr(fTarefa2.prbContador1.Max)]);
    Self.Synchronize(Self.Sincronizar);
    Self.Sleep(FSleep1);
  end;
end;

procedure TContador1.Sincronizar;
begin
 FContador1.Caption:=Self.FAux1;
end;

{ TContador2 }

constructor TContador2.Create(AContador2: TLabel; Sleep2: integer);
begin
  inherited Create(True);
  Self.FreeOnTerminate := True;

  FAux2:='';
  FSleep2:=Sleep2;
  FContador2:=AContador2;
end;

procedure TContador2.Execute;
var
  vContador2: integer;
begin
  inherited;
  fTarefa2.prbContador2.Max:=100;
  for vContador2:=1 to fTarefa2.prbContador2.Max do
  begin
    if Self.Terminated then
      Break;
    fTarefa2.prbContador2.Position:=vContador2;
    Self.FAux2:=Format('%s/%s',[IntToStr(vContador2),IntToStr(fTarefa2.prbContador2.Max)]);
    Self.Synchronize(Self.Sincronizar);
    Self.Sleep(FSleep2);
  end;
end;

procedure TContador2.Sincronizar;
begin
 FContador2.Caption:=Self.FAux2;
end;

end.
