unit untHistoricoDownloads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Buttons, Vcl.ExtCtrls;

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

uses untDM;

procedure TfrmHistoricoDownloads.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistoricoDownloads.FormShow(Sender: TObject);
begin
  ListarHistorico
end;

procedure TfrmHistoricoDownloads.ListarHistorico;
begin
  try
    RichEdit1.Lines.Clear;
    DM.qryHistoricoDownloads.Close;
    DM.qryHistoricoDownloads.Open();

    if not DM.qryHistoricoDownloads.IsEmpty then
      begin
        while not DM.qryHistoricoDownloads.Eof do
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
                SelText := DM.qryHistoricoDownloadsCODIGO.AsString;

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
                SelText := DM.qryHistoricoDownloadsURL.AsString;

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
                SelText := DM.qryHistoricoDownloadsDATAINICIO.AsString;

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
                SelText := DM.qryHistoricoDownloadsDATAFIM.AsString;

                //Nova linha
                SelText := #13#10;
                //Nova linha
                SelText := #13#10;
              end;

            DM.qryHistoricoDownloads.Next;
          end;
        lblTotalRegistros2.Caption := IntToStr(DM.qryHistoricoDownloads.RecordCount);
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
end;

end.
