unit uspQuery;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    FCondicoes: TStringList;
    FColunas: TStringList;
    FTabelas: TStringList;
    FSql: TStringList;
    procedure SetColunas(const Value: TStringList);
    procedure SetCondicoes(const Value: TStringList);
    procedure SetTabelas(const Value: TStringList);
    procedure SetSql(const Value: TStringList);
    function GeraSql: TStringList;
  protected
    { Protected declarations }
  public
    property spCondicoes: TStringList read FCondicoes write SetCondicoes;
    property spColunas: TStringList read FColunas write SetColunas;
    property spTabelas: TStringList read FTabelas write SetTabelas;
    property Sql: TStringList read FSql write SetSql;
  published
    { Published declarations }
  end;

implementation

procedure TspQuery.SetColunas(const Value: TStringList);
begin
  FColunas := Value;
end;

procedure TspQuery.SetCondicoes(const Value: TStringList);
begin
  FCondicoes := Value;
end;

procedure TspQuery.SetSql(const Value: TStringList);
begin
  FSql:=GeraSql;
end;

function TspQuery.GeraSql: TStringList;
const
  SqlResult = 'select '+
              ' %s '+
              'from '+
              ' %s '+
              'where '+
              ' %s ';
begin
  try
    Result:=TStringList.Create;
    Result.Text:=Format(SqlResult,[FColunas.Text,FTabelas.Text,FCondicoes.Text]);
  finally

  end;
end;

procedure TspQuery.SetTabelas(const Value: TStringList);
begin
  FTabelas := Value;
end;

end.
