unit UfTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.ToolWin, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    pnlDadosSql: TPanel;
    pnlResultSql: TPanel;
    lblColunas: TLabel;
    memColunas: TMemo;
    lblTabelas: TLabel;
    memTabelas: TMemo;
    lblCondicoes: TLabel;
    memCondicoes: TMemo;
    Label1: TLabel;
    memResultSQL: TMemo;
    tbOpcoes: TToolBar;
    imglOpcoes: TImageList;
    actOpcoes: TActionList;
    actGerarSQL: TAction;
    actLimparSQL: TAction;
    btnGerarSQL: TToolButton;
    btnLimpar: TToolButton;
    btnSair: TToolButton;
    actSair: TAction;
    spQuery1: TspQuery;
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actLimparSQLExecute(Sender: TObject);
    procedure actGerarSQLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.actGerarSQLExecute(Sender: TObject);
var
  ResultSql: TStringList;
begin
  try
    ResultSql:=TStringList.Create;
    spQuery1.spColunas:=TStringList(memColunas.Lines);
    spQuery1.spTabelas:=TStringList(memTabelas.Lines);
    spQuery1.spCondicoes:=TStringList(memCondicoes.Lines);
    spQuery1.Sql:=TStringList(memResultSQL.Lines);
    ResultSql:=spQuery1.Sql;
    memResultSQL.Lines.Text:=ResultSql.Text;
  finally
    FreeAndNil(ResultSql);
  end;
end;

procedure TfTarefa1.actLimparSQLExecute(Sender: TObject);
begin
  memColunas.Clear;
  memTabelas.Clear;
  memCondicoes.Clear;
  memResultSQL.Clear;
end;

procedure TfTarefa1.actSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  fTarefa1:=nil;
end;

end.
