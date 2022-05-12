program MyGetRight;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untThreadMonitor in 'untThreadMonitor.pas',
  untDM in 'untDM.pas' {DM: TDataModule},
  untDados in 'untDados.pas',
  untHistoricoDownloads in 'untHistoricoDownloads.pas' {frmHistoricoDownloads};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmHistoricoDownloads, frmHistoricoDownloads);
  Application.Run;
end.
