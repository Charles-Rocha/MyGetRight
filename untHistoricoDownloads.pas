unit untHistoricoDownloads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Comp.Client;

type
  TfrmHistoricoDownloads = class(TForm)
    Panel1: TPanel;
    pnlBotoes: TPanel;
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    lblTotalRegistros1: TLabel;
    lblTotalRegistros2: TLabel;
    procedure ListarHistorico;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoDownloads: TfrmHistoricoDownloads;

implementation

{$R *.dfm}

uses untDM, untDados;

procedure TfrmHistoricoDownloads.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistoricoDownloads.FormShow(Sender: TObject);
begin
  ListarHistorico
end;

procedure TfrmHistoricoDownloads.ListarHistorico;
var
  Dados: TDados;
  qryHistorico: TFDQuery;
begin
  Dados := TDados.Create;
  qryHistorico := TFDQuery.Create(nil);

  try
    try
      qryHistorico := Dados.ListarHistoricoDownloads;
      RichEdit1.Lines.Clear;
      //DM.qryHistoricoDownloads.Close;
      //DM.qryHistoricoDownloads.Open();

      if not qryHistorico.IsEmpty then
        begin
          while not qryHistorico.Eof do
            begin
              with RichEdit1 do
                begin
                  SelStart := Perform(EM_LINEINDEX, 0, 0);

                  //move caret to end
                  SelStart := GetTextLen;

                  //Url
                  SelAttributes.Style := [fsBold];
                  SelAttributes.Color := clBlack;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := 'Código: ';
                  SelAttributes.Style := [];
                  SelAttributes.Color := clBlue;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := qryHistorico.FieldByName('CODIGO').AsString;

                  //Nova linha
                  SelText := #13#10;

                  //Url
                  SelAttributes.Style := [fsBold];
                  SelAttributes.Color := clBlack;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := 'Url: ';
                  SelAttributes.Style := [];
                  SelAttributes.Color := clBlue;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := qryHistorico.FieldByName('URL').AsString;

                  //Nova linha
                  SelText := #13#10;

                  //Data Início
                  SelAttributes.Style := [fsBold];
                  SelAttributes.Color := clBlack;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := 'Data Início: ';
                  SelAttributes.Style := [];
                  SelAttributes.Color := clGreen;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := qryHistorico.FieldByName('DATAINICIO').AsString;

                  //Nova linha
                  SelText := #13#10;

                  //Data Fim
                  SelAttributes.Style := [fsBold];
                  SelAttributes.Color := clBlack;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := 'Data Fim: ';
                  SelAttributes.Style := [];
                  SelAttributes.Color := clRed;
                  SelAttributes.Name := 'Arial';
                  SelAttributes.Size := 10;
                  SelText := qryHistorico.FieldByName('DATAFIM').AsString;

                  //Nova linha
                  SelText := #13#10;
                  //Nova linha
                  SelText := #13#10;
                end;

              qryHistorico.Next;
            end;
          lblTotalRegistros2.Caption := IntToStr(qryHistorico.RecordCount);
          RichEdit1.SelStart := 0;
        end
      else
        begin
          Application.MessageBox('Não existe histórico para ser exibido','Aviso',mb_Ok+mb_IconExclamation);
        end;
    except
      on E: Exception do
        begin
          Application.MessageBox(PChar('Erro encontrado ao tentar ler dados da tabela: ' + #13#13 + E.Message),'Aviso',mb_Ok+mb_IconExclamation);
        end;
    end;
  finally
    Dados.Free;
    qryHistorico.Free;
  end;
end;

end.
