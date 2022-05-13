unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untThreadMonitor, Vcl.StdCtrls,
  Vcl.ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Vcl.Buttons, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    edtUrl: TEdit;
    lblUrl: TLabel;
    btnIniciarDownload: TBitBtn;
    btnPararDownload: TBitBtn;
    btnExibirHistoricoDownloads: TBitBtn;
    btnExibirMensagem: TBitBtn;
    pnlInformacoesGerais: TPanel;
    pnlBotoes: TPanel;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    grbInformacoesGerais: TGroupBox;
    lblNomeArquivo1: TLabel;
    lblTamanhoArquivo1: TLabel;
    lblTempoDecorrido1: TLabel;
    lblProgressoDownload1: TLabel;
    lblNomeArquivo2: TLabel;
    lblTamanhoArquivo2: TLabel;
    lblTempoDecorrido2: TLabel;
    lblProgressoDownload2: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    SaveDialog1: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure btnIniciarDownloadClick(Sender: TObject);
    procedure btnPararDownloadClick(Sender: TObject);
    procedure btnExibirHistoricoDownloadsClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtUrlChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnExibirMensagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Ftempo: TDateTime;
    FPorcentagem: Real;

    function ValidaCampoUrl: boolean;
    function NomeArquivoLink(Url: string): string;
    function RetornaKiloBytes(ValorAtual: real): string;
    function RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
    procedure IdHTTP1OnWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure IdHTTP1OnWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure IdHTTP1OnWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure PreencheInformacoesGerais;
    procedure VerificarAndamentoDownload;
    function SalvarArquivoEmDisco: string;

  public
    { Public declarations }
    threadMonitor: TfThreadMonitor;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untDM, untHistoricoDownloads;

function TfrmPrincipal.NomeArquivoLink(Url: string): string;
var
  pos: ShortInt;
begin
  pos := LastDelimiter('/', Url);
  Result := Copy(url, pos + 1, MaxInt);
end;

function TfrmPrincipal.RetornaKiloBytes(ValorAtual: real): string;
var
  resultado : real;
begin
  resultado := ((ValorAtual / 1024) / 1024);
  Result := FormatFloat('0.000 KBs', resultado);
end;

function TfrmPrincipal.RetornaPorcentagem(ValorMaximo, ValorAtual: real): string;
var
  resultado: Real;
begin
  resultado := ((ValorAtual * 100) / ValorMaximo);
  FPorcentagem := resultado;
  Result := FormatFloat('0%', resultado);
end;

function TfrmPrincipal.SalvarArquivoEmDisco: string;
var
  sPath: string;
  sExtensao: string;
begin
  sExtensao := ExtractFileExt(edtUrl.Text);
  SaveDialog1.Filter := 'Arquivos' + sExtensao + '|*' + sExtensao;
  SaveDialog1.FileName := NomeArquivoLink(edtUrl.Text);
  if SaveDialog1.Execute then
    begin
      sPath := ExtractFileExt(SaveDialog1.FileName);
      if sPath = EmptyStr then
        sPath := SaveDialog1.FileName + sExtensao
      else
        sPath := SaveDialog1.FileName;
    end;
  Result := sPath;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  lblTempoDecorrido2.Caption := FormatDateTime('HH:MM:SS', Time - Ftempo);
end;

procedure TfrmPrincipal.PreencheInformacoesGerais;
var
  sTamanhoEmKB: string;
begin
  lblNomeArquivo2.Caption := NomeArquivoLink(edtUrl.Text);
  Application.ProcessMessages;
  DM.IdHTTP1.OnWork := IdHTTP1OnWork;
  DM.IdHTTP1.OnWorkBegin := IdHTTP1OnWorkBegin;
  DM.IdHTTP1.OnWorkEnd := IdHTTP1OnWorkEnd;
  DM.IdHTTP1.Head(edtUrl.Text);
  sTamanhoEmKB := RetornaKiloBytes(DM.IdHTTP1.Response.ContentLength);
  lblTamanhoArquivo2.Caption := sTamanhoEmKB;
end;

procedure TfrmPrincipal.btnIniciarDownloadClick(Sender: TObject);
begin
  if ValidaCampoUrl then
    begin
      try
        FPorcentagem := 0;
        btnIniciarDownload.Enabled := false;
        threadMonitor := TfThreadMonitor.Create(true);
        threadMonitor.Url := edtUrl.Text;
        threadMonitor.NomeArquivoLink := SalvarArquivoEmDisco;

        threadMonitor.DataInicio := Now();
        frmPrincipal.ClientHeight := 300;
        Application.ProcessMessages;
        PreencheInformacoesGerais;
        threadMonitor.Start;
        if not (Timer1.Enabled) then
          begin
            Ftempo := Time;
            Timer1.Enabled := true;
          end;
      except
        on E: Exception do
          begin
            Application.MessageBox(PChar('Erro encontrado ao tentar fazer o download' + #13#13 + E.Message),'Aviso',mb_Ok+mb_IconExclamation);
            btnIniciarDownload.Enabled := true;
          end;
      end;
    end;
end;

procedure TfrmPrincipal.btnPararDownloadClick(Sender: TObject);
begin
  if FPorcentagem > 0 then
    begin
      DM.IdHTTP1.Disconnect;
      btnIniciarDownload.Enabled := true;
    end
  else
    begin
      Application.MessageBox(PChar('Não existe download em andamento'),'Aviso',mb_Ok+mb_IconExclamation);
      edtUrl.SetFocus;
    end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  VerificarAndamentoDownload;
end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  edtUrl.Clear;
  btnIniciarDownload.Enabled := true;
end;

procedure TfrmPrincipal.btnExibirHistoricoDownloadsClick(Sender: TObject);
begin
  frmHistoricoDownloads.ShowModal;
end;

procedure TfrmPrincipal.btnExibirMensagemClick(Sender: TObject);
begin
  Application.MessageBox(PChar('Porcentagem atual é: ' + lblProgressoDownload2.Caption),'Aviso',mb_Ok+mb_IconExclamation);
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  //DM.FDConnection1.Connected := true;
  //DM.FDTable1.Active := true;
end;

procedure TfrmPrincipal.edtUrlChange(Sender: TObject);
begin
  frmPrincipal.ClientHeight := 124;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  VerificarAndamentoDownload;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  //
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  sCaminhoExe: string;
begin
  sCaminhoExe := ExtractFilePath(Application.ExeName);
  DM.FDConnection1.Params.Database := '..\..\bd\MyGetRight.db';
  frmPrincipal.ClientHeight := 124;
end;

procedure TfrmPrincipal.IdHTTP1OnWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  ProgressBar1.Position := AWorkCount;
  //lblTamanhoArquivo2.Caption    := 'Baixando ... ' + RetornaKiloBytes(AWorkCount);
  lblProgressoDownload2.Caption := RetornaPorcentagem(ProgressBar1.Max, AWorkCount);
end;

procedure TfrmPrincipal.IdHTTP1OnWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  ProgressBar1.Position := 0;
  ProgressBar1.Max := AWorkCountMax;
end;

procedure TfrmPrincipal.IdHTTP1OnWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar1.Position := frmPrincipal.ProgressBar1.Max;
  //frmPrincipal.Label1.caption := 'Download Concluído!';
  threadMonitor.DataFim := Now();
  btnIniciarDownload.Enabled := true;
  Timer1.Enabled := false;
  FPorcentagem := 0;
end;

function TfrmPrincipal.ValidaCampoUrl: boolean;
var
  sExtensao, sArquivo, sNomeArquivo, sPrefixoUrl: string;
  pos: ShortInt;
begin
  Result := false;
  if edtUrl.Text = EmptyStr then
    begin
      Application.MessageBox('Campo Url é obrigatório','Aviso',mb_Ok+mb_IconExclamation);
      edtUrl.SetFocus;
    end
  else
    begin
      pos := LastDelimiter('/', edtUrl.Text);
      sArquivo := Copy(edtUrl.Text, pos + 1, MaxInt);
      sExtensao := ExtractFileExt(sArquivo);
      sNomeArquivo := ChangeFileExt(ExtractFileName(sArquivo), EmptyStr);
      if (sExtensao = EmptyStr) or (sNomeArquivo = EmptyStr) then
        begin
          Application.MessageBox('Url inválida. Sem nome ou extensão do arquivo','Aviso',mb_Ok+mb_IconExclamation);
          edtUrl.SetFocus;
        end
      else
        begin
          sPrefixoUrl := copy(edtUrl.Text, 0, 4);
          if sPrefixoUrl <> 'http' then
            begin
              Application.MessageBox('Url inválida. Não tem o prefixo http','Aviso',mb_Ok+mb_IconExclamation);
              edtUrl.SetFocus;
            end
          else
            begin
              Result := true;
            end;
        end;
    end;
end;

procedure TfrmPrincipal.VerificarAndamentoDownload;
begin
  if FPorcentagem > 0 then
    begin
      case Application.MessageBox('Existe um download em andamento, fechar assim mesmo?','Confirmação',MB_yesno+MB_iconInformation) of
        id_yes:
          begin
            DM.IdHTTP1.Disconnect;
            Application.Terminate;
          end;
        id_no:
          begin
            abort;
          end;
      end;
    end
  else
    begin
      Application.Terminate;
    end;
end;

end.
