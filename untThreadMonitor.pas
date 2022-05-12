unit untThreadMonitor;

interface

uses
  System.Classes, System.SysUtils, Vcl.ComCtrls, Vcl.Forms, Vcl.Controls,
  Vcl.ExtCtrls, System.IniFiles, IdHTTP, IdSSLOpenSSL;

type
  TfThreadMonitor = class(TThread)
  private
    { Private declarations }
    FUrl: string;
    FNomeArquivoLink: string;
    FDataInicio: TDateTime;
    FDataFim: TDateTime;

  protected
    procedure Execute; override;
    procedure Download;

  public
    property Url: string read FUrl write FUrl;
    property NomeArquivoLink: string read FNomeArquivoLink write FNomeArquivoLink;
    property DataInicio: TDateTime read FDataInicio write FDataInicio;
    property DataFim: TDateTime read FDataFim write FDataFim;
  end;

implementation

uses
  untDM, untDados, untPrincipal;

procedure TfThreadMonitor.Download;
var
  MS: TMemoryStream;
  Dados: TDados;
begin
  MS := TMemoryStream.Create;
  Dados := TDados.Create;

  try
    Dados.Url := FUrl;
    Dados.DataInicio := FDataInicio;
    DM.IdHTTP1.Get(url, MS);
    MS.SaveToFile(FNomeArquivoLink);

    Dados.DataFim := FDataFim;
    Dados.InserirLogDownload;
  finally
    MS.Free;
    Dados.Free;
  end;
end;

{procedure TfThreadMonitor.Download;
var
  Http: TIdHTTP;
  MS: TMemoryStream;
  LHandler: TIdSSLIOHandlerSocketOpenSSL;
  url: string;
begin
  url := frmPrincipal.edtUrl.text;
  Http := TIdHTTP.Create(nil);
  Http.HandleRedirects := True;
  try
    MS := TMemoryStream.Create;
    LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    LHandler.SSLOptions.SSLVersions := [sslvTLSv1_2];
    try
      Http.IOHandler := LHandler;
      //Http.OnWork := HttpWork;
      //Http.OnRedirect:= HttpRedirect;
//    Http.RedirectMaximum:=9;
      Http.Get(url, MS);
      MS.SaveToFile('C:\Projetos\Delphi XE7\MyGetRight\abc.exe');
    finally
      MS.Free;
      LHandler.Free;
    end;
  finally
    Http.Free;
  end;
end;}

procedure TfThreadMonitor.Execute;
begin
  Download;
end;

end.
