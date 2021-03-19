unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, DBClient, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfTarefa3 = class(TForm)
    grbProjeto: TGroupBox;
    grdProjetos: TDBGrid;
    pnlOpcoes: TPanel;
    btnObtertotal: TButton;
    btnObterTotalDivisoes: TButton;
    lblTotal: TLabel;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    lblTotalDivisoes: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnObtertotalClick(Sender: TObject);
    procedure btnObterTotalDivisoesClick(Sender: TObject);
  private
    dtsProjeto: TDataSource;
    cdsProjetos: TClientDataSet;
    procedure CriarDsetProjeto;
    procedure AdicionarColunasGrid;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

const
  valor_projeto: array[1..10] of Double = (10.00,12.50,15.00,17.50,20.00,22.50,25.00,27.50,30.00,32.50);
  dsc_projeto = 'Projeto ';
  camposGrid: array[1..3] of string = ('IdProjeto','NomeProjeto','Valor');

procedure TfTarefa3.AdicionarColunasGrid;
var
  i: integer;
begin
  for i:=Low(camposGrid) to High(camposGrid) do
  begin
    with grdProjetos do
    begin
      Columns.Add;
      Columns[i-1].FieldName:=cdsProjetos.Fields[i-1].FieldName;
      Columns[i-1].Title.Caption:=camposGrid[i];
    end;
  end;
end;

procedure TfTarefa3.btnObtertotalClick(Sender: TObject);
var
  vlrTotal: double;
begin
  try
    dtsProjeto.DataSet.First;
    dtsProjeto.DataSet.DisableControls;
    vlrTotal:=0.00;
    while not dtsProjeto.DataSet.Eof do
    begin
      vlrTotal:=vlrTotal+dtsProjeto.DataSet.FieldByName('valor').AsFloat;
      dtsProjeto.DataSet.Next;
    end;
    edtTotal.Text:=FormatFloat(',0.00',vlrTotal);
  finally
    dtsProjeto.DataSet.EnableControls;
  end;
end;

procedure TfTarefa3.btnObterTotalDivisoesClick(Sender: TObject);
var
  i: integer;
  vlrResult, vlrAnt, vlrPos: double;
begin
  try
    dtsProjeto.DataSet.DisableControls;
    vlrResult:=0.0;
    dtsProjeto.DataSet.First;
    vlrAnt:=dtsProjeto.DataSet.FieldByName('valor').AsFloat;
    dtsProjeto.DataSet.Next;
    vlrPos:=dtsProjeto.DataSet.FieldByName('valor').AsFloat;
    while not dtsProjeto.DataSet.Eof do
    begin
      vlrResult:=vlrResult+vlrPos/vlrAnt;
      vlrAnt:=vlrPos;
      dtsProjeto.DataSet.Next;
      vlrPos:=dtsProjeto.DataSet.FieldByName('valor').AsFloat;
    end;
    edtTotalDivisoes.Text:=FormatFloat(',0.00',vlrResult);
  finally
    dtsProjeto.DataSet.EnableControls;
  end;
end;

procedure TfTarefa3.CriarDsetProjeto;
var
  i:integer;
begin
  cdsProjetos:=TClientDataSet.Create(Self);
  with cdsProjetos do
  begin
    FieldDefs.Add('idProjeto',ftInteger);
    FieldDefs.Add('nome_projeto',ftString,25);
    FieldDefs.Add('valor',ftCurrency);
  end;
  cdsProjetos.CreateDataSet;

  for i:=Low(valor_projeto) to High(valor_projeto) do
  begin
    cdsProjetos.Append;
    cdsProjetos.FieldByName('idProjeto').AsInteger:=i;
    cdsProjetos.FieldByName('nome_projeto').AsString:=dsc_projeto+IntToStr(i);
    cdsProjetos.FieldByName('valor').AsFloat:=valor_projeto[i];
    cdsProjetos.Post;
  end;

  cdsProjetos.MergeChangeLog;
  dtsProjeto.DataSet:=cdsProjetos;
  grdProjetos.DataSource:=dtsProjeto;
  AdicionarColunasGrid;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dtsProjeto.DataSet.Close;
  FreeAndNil(cdsProjetos);
  FreeAndNil(dtsProjeto);
  Action:=caFree;
  fTarefa3:=nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  dtsProjeto:=TDataSource.Create(Self);
  CriarDsetProjeto;
  edtTotal.Text:='0,00';
  edtTotalDivisoes.Text:='0,00';
end;

end.
