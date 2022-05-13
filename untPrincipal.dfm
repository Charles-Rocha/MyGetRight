object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'MyGetRight'
  ClientHeight = 300
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 86
    Align = alTop
    TabOrder = 0
    object lblUrl: TLabel
      Left = 8
      Top = 8
      Width = 25
      Height = 13
      Caption = 'URL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUrl: TEdit
      Left = 8
      Top = 24
      Width = 655
      Height = 21
      TabOrder = 0
      OnChange = edtUrlChange
    end
    object btnIniciarDownload: TBitBtn
      Left = 8
      Top = 52
      Width = 114
      Height = 25
      Caption = '&Iniciar download'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFF4ECFFE9D8FFE1C9FFDBBEFFDBBEFFE1C9FFE9D8FFF4ECFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6FFEAD9F2D6C0D6C5B7B7AFA89F
        9D9C9C9A98B3AAA3D0BFB1EFD3BCFFEAD9FFFAF6FFFFFFFFFFFFFFFFFFFFFAF6
        FFE6D3E4D2C5BEB8B1DCD1C8F1E8E1FBF6F2FAF3EEEDE0D6D2C3B8ADA49DDAC8
        BAFFE6D3FFFAF6FFFFFFFFFFFFFFEAD9E8D7C9C6BEB7F4EEE8FFFEFEFBF4EFF7
        EBE1F6EAE0FAF3EDFEFCFAEEE4DBACA196DBC9BBFFEAD9FFFFFFFFF4ECF7DAC4
        D2CCC8F7F1EDFFFFFFF6E8DDF6E8DDF9F1EBF5E6DBF5E5DAF4E5D8FFFEFEEFE4
        DCB1A9A2F0D4BEFFF4ECFFE9D8EBD9CCECE5E1FFFEFEF7EBE1F6EAE0F6E9DFBD
        8051F9F1EBF5E7DCF5E6DBF5E5DAFEFCFAD6C9BFD4C3B5FFE9D8FFE1C9DFD7D0
        F8F3EFFBF6F2F7ECE3F7ECE3F7EBE1C58655BE8051F9F1EBF6E8DDF5E7DCFAF3
        EEEFE4DBBBB3ACFFE1C9FFDBBED7D5D3FEFDFBF9F1EBF8EEE5F7EDE4F7ECE3C0
        8352C68655BE8051F9F1EBF6E8DDF7EBE1FAF5F1AAA9A7FFDBBEFFDBBED8D6D4
        FEFDFBFAF2ECF9EFE8F8EEE5F7EDE4C08352C08352C88755EDD3BEF6E9DFF7EC
        E3FDFBF9AFADABFFDBBEFFE1C9E2DAD4FAF6F3FCF8F4F9EFE8F9EFE8F8EFE6C1
        8352C18352E8C8ADF7ECE3F7EBE1FBF5F1F6EFEAC5BDB6FFE1C9FFE9D8EEDDD0
        F1ECE8FFFFFFF9F1EBF9F0E9F9EFE8C38453E9C9B0F8EEE5F7ECE3F7ECE3FFFF
        FFE7DFD8DFCEC0FFE9D8FFF4ECF9DDC7E2DDD9FBF8F7FFFFFFF9F1EBF9F0E9E9
        CAB1F9EFE8F8EFE6F8EEE5FFFFFFF9F6F3CFC9C4F5D9C3FFF4ECFFFFFFFFEAD9
        F2E1D3E0DAD6FBF8F7FFFFFFFCF9F6FAF3EEFAF3EDFCF8F4FFFFFFF9F6F3D3CC
        C7ECDBCDFFEAD9FFFFFFFFFFFFFFFAF6FFE6D3F2E1D3E2DDD9F1ECE8FAF6F3FE
        FDFBFEFDFBF9F5F2EEE9E5DAD4CFEEDCCEFFE6D3FFFAF6FFFFFFFFFFFFFFFFFF
        FFFAF6FFEAD9F9DDC7EFDED0E3DBD5DAD8D6D9D7D5E1D8D1ECDBCDF8DCC6FFEA
        D9FFFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4ECFFE9D8FFE1C9FF
        DBBEFFDBBEFFE1C9FFE9D8FFF4ECFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 1
      OnClick = btnIniciarDownloadClick
    end
    object btnPararDownload: TBitBtn
      Left = 128
      Top = 52
      Width = 114
      Height = 25
      Caption = '&Parar download'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFF4ECFFE9D8FFE1C9FFDBBEFFDBBEFFE1C9FFE9D8FFF4ECFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6FFEAD9F2D6C0D6C5B7B7AFA89F
        9D9C9C9A98B3AAA3D0BFB1EFD3BCFFEAD9FFFAF6FFFFFFFFFFFFFFFFFFFFFAF6
        FFE6D3E4D2C5BEB8B1DCD1C8F1E8E1FBF6F2FAF3EEEDE0D6D2C3B8ADA49DDAC8
        BAFFE6D3FFFAF6FFFFFFFFFFFFFFEAD9E8D7C9C6BEB7F4EEE8FFFEFEFBF4EFF7
        EBE1F6EAE0FAF3EDFEFCFAEEE4DBACA196DBC9BBFFEAD9FFFFFFFFF4ECF7DAC4
        D2CCC8F7F1EDFFFFFFF6E8DDF6E8DDF5E7DCF5E6DBF5E5DAF4E5D8FFFEFEEFE4
        DCB1A9A2F0D4BEFFF4ECFFE9D8EBD9CCECE5E1FFFEFEF7EBE1F6EAE0F6E9DFF6
        E8DDF6E8DDF5E7DCF5E6DBF5E5DAFEFCFAD6C9BFD4C3B5FFE9D8FFE1C9DFD7D0
        F8F3EFFBF6F2F7ECE3F7ECE3D2925FD2915ED2915ED2905CF6E8DDF5E7DCFAF3
        EEEFE4DBBBB3ACFFE1C9FFDBBED7D5D3FEFDFBF9F1EBF8EEE5F7EDE4B47B4EB4
        7B4EB37A4DD2915EF6E8DDF6E8DDF7EBE1FAF5F1AAA9A7FFDBBEFFDBBED8D6D4
        FEFDFBFAF2ECF9EFE8F8EEE5B47B4EB47B4EB47B4ED2925FF6EAE0F6E9DFF7EC
        E3FDFBF9AFADABFFDBBEFFE1C9E2DAD4FAF6F3FCF8F4F9EFE8F9EFE8B67C4EB6
        7C4EB47B4ED2925FF7ECE3F7EBE1FBF5F1F6EFEAC5BDB6FFE1C9FFE9D8EEDDD0
        F1ECE8FFFFFFF9F1EBF9F0E9F9EFE8F9EFE8F8EFE6F8EEE5F7ECE3F7ECE3FFFF
        FFE7DFD8DFCEC0FFE9D8FFF4ECF9DDC7E2DDD9FBF8F7FFFFFFF9F1EBF9F0E9F9
        EFE8F9EFE8F8EFE6F8EEE5FFFFFFF9F6F3CFC9C4F5D9C3FFF4ECFFFFFFFFEAD9
        F2E1D3E0DAD6FBF8F7FFFFFFFCF9F6FAF3EEFAF3EDFCF8F4FFFFFFF9F6F3D3CC
        C7ECDBCDFFEAD9FFFFFFFFFFFFFFFAF6FFE6D3F2E1D3E2DDD9F1ECE8FAF6F3FE
        FDFBFEFDFBF9F5F2EEE9E5DAD4CFEEDCCEFFE6D3FFFAF6FFFFFFFFFFFFFFFFFF
        FFFAF6FFEAD9F9DDC7EFDED0E3DBD5DAD8D6D9D7D5E1D8D1ECDBCDF8DCC6FFEA
        D9FFFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4ECFFE9D8FFE1C9FF
        DBBEFFDBBEFFE1C9FFE9D8FFF4ECFFFFFFFFFFFFFFFFFFFFFFFF}
      TabOrder = 2
      OnClick = btnPararDownloadClick
    end
    object btnExibirHistoricoDownloads: TBitBtn
      Left = 379
      Top = 52
      Width = 184
      Height = 25
      Caption = 'Exibir &hist'#243'rico de downloads'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000A4A4A2C0AFAF
        ADFFAEAEABFFADADABFFADADABFFADADABFFAEAEABFFAEAEACFFAFAFADFFAFAF
        ADFFB0B0AEFFB6B3AFFFAFA69DB131699EFF396D9EFF213F5A5DB0B0ADFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF23629EFF25B0FFFF44C8FFFF3A83CCFFAEAEABFFFFFF
        FFFFFDFDFDFFFCFCFDFFFDFDFDFFFEFEFEFFFFFFFFFFD3D3D4FF6E6F71FF5858
        5CFF5A5A5DFF636060FF7D7068FF3AC6FFFF57DBFFFF3981C9FFADADABFFFFFF
        FFFFFAF8F8FFF9F8F8FFFAF9F9FFFFFDFEFFD1D1D2FF676463FFE3C38CFFFFEB
        A4FFFFF3AFFFE7D3A1FF76706BFFA09085FF3280CFFF00000000ADADABFFFFFF
        FFFFF6F6F6FFF6F6F6FFF8F8F8FFFEFFFFFF777879FFE3BE84FFFFE6A5FFFFE7
        A6FFFFEFB3FFFFF9BBFFE9D6A2FF807875FF0000000000000000ADADABFFFFFF
        FFFFF4F4F3FFF4F4F3FFF6F6F5FFFDFEFEFF696A6DFFFFE09DFFFFEFCAFFFFE7
        B3FFFFE9ABFFFFEFB2FFFFF4AFFF787677FF0000000000000000ADADABFFFFFF
        FFFFF2F1F0FFF2F1F0FFF4F3F2FFFBFAFBFF6F6F72FFFFDD97FFFFF7E4FFFFED
        C8FFFFE7B2FFFFE6A5FFFFECA5FF7C7B7EFF0000000000000000ADADABFFFFFF
        FFFFEFEFEEFFEFEFEEFFF0F1F0FFF6F7F7FF848587FFE7BB7CFFFFF5DBFFFFF7
        E4FFFFEECAFFFFE5A4FFEBCC95FF838284F90000000000000000ADADABFFFFFF
        FFFFECEBEAFFEDECEBFFEEECEBFFF1F0F0FFCFCFD0FF83807DFFE8BC7DFFFFDC
        97FFFFDF9CFFEAC58BFF8C8887FF8A8888430000000000000000ADADABFFFFFF
        FFFFE9E9E8FFEAEAE9FFEAEAE9FFEBECEBFFEFEFEFFFD8D7D8FF949496FF8585
        88FF848487FF979698FFA9AAAAFF000000000000000000000000ADAEABFFFFFF
        FFFFE7E5E4FFE8E7E6FFE8E7E6FFE8E7E6FFE8E7E6FFFFFFFFFFD3D3D3FFAFB0
        AFFFAEAFADFFFFFFFFFFB3B3B1FF000000000000000000000000AEAEABFFFFFF
        FFFFE3E3E2FFE4E4E3FFE4E5E4FFE4E4E3FFE3E3E2FFFFFFFFFFA8A8A6FFEDED
        ECFFFFFFFFFFEAEAEAFFB1B1AFAC000000000000000000000000AEAEACFFFFFF
        FFFFE0DFDEFFE1DFDEFFE1E0DFFFE1DFDEFFE0DFDEFFFFFFFFFFA5A5A3FFFFFF
        FFFFE8E8E8FFAFAFACA700000000000000000000000000000000AFAFADFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
        E9FFAEAEACA60000000000000000000000000000000000000000B3B3B1EFB0B0
        ADFFAEAEACFFAEAEABFFAEAEABFFAEAEABFFADAEABFFAEAEABFFAFAFADFFB0B0
        AEEA000000000000000000000000000000000000000000000000}
      TabOrder = 4
      OnClick = btnExibirHistoricoDownloadsClick
    end
    object btnExibirMensagem: TBitBtn
      Left = 248
      Top = 52
      Width = 125
      Height = 25
      Caption = '&Exibir mensagem'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00008A99A9FFB5B9BFFF00000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000DAE4
        ECFF5DA4D7FF1E528EFFC0C7CFFF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00005084AFFF59A6DBFF2E5587FFE1E1E2FF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000DAE2EAFF5392C3FF4995CEFF7B92AEFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000D7E1EAFF5FA6D7FF367CB9FFCBD3DCFF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000D9E3ECFF6AB3E2FF6891B6FF00000000F2F2EEFFE1DF
        D6FFECEBE2FF0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000ECF0F1FFA9ABA8FF9B968FFFB5B08FFFC3BE
        90FFB3AFA1FFB4AEA9FFEAE8DEFF000000000000000000000000000000000000
        0000000000000000000000000000EEEEECFF7F7870FFD6D286FFFEFDB4FFFFFE
        AAFFFEFC8FFFD9D580FFA49E96FFEDEADFFF0000000000000000000000000000
        00000000000000000000000000009C9891FFA2977CFFFDF6A9FFFEF79EFFFEF7
        94FFFEF789FFFDF77BFFBDB45EFFABA39DFF0000000000000000000000000000
        0000000000000000000000000000756E67FFC9BA80FFFDEE98FFFDEE8DFFFCED
        83FFFDEE78FFFDEE6DFFF1E151FF8A8069FFE8E5DCFF00000000000000000000
        00000000000000000000000000006D675FFFCEBA82FFFBE289FFFBE27FFFFBE2
        75FFFBE16BFFFBE15FFFFBE569FF9A8C5CFFDAD5C8FF00000000000000000000
        00000000000000000000000000006F6861FFB9A98EFFFCDA8CFFF9D476FFF9D3
        69FFFAD567FFFCDE81FFFCE698FFA39266FFDAD5C9FF00000000000000000000
        000000000000000000000000000098938CFF988F86FFECCE9EFFFBDAA1FFFBDB
        A0FFFBDEA5FFFBE1A7FFFBE1A3FF94866EFFE6E2DAFF00000000000000000000
        0000000000000000000000000000EAE7E4FF918983FFB4A79AFFF3D4AEFFFBDC
        B4FFFBDFB7FFFCE3BEFFC0A67CFFB0A8A1FF0000000000000000000000000000
        000000000000000000000000000000000000DEDAD5FFB5AEA5FFB4AAA0FFCCBC
        A7FFD9C7B2FFC9B59CFFB6ADA5FFF2EFEAFF0000000000000000000000000000
        00000000000000000000000000000000000000000000F0EEEAFFC7C1BAFFB7B1
        AAFFB9B3ADFFD7D1CCFFF9F7F5FF000000000000000000000000}
      TabOrder = 3
      OnClick = btnExibirMensagemClick
    end
    object btnLimpar: TBitBtn
      Left = 569
      Top = 52
      Width = 94
      Height = 25
      Caption = '&Limpar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEEF9FFC2E5FEFFFFFEFFFFFFFFFFFFFFFFFFD7E6FAFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88B5EF0787F420A2FF1A
        9DFDEBF7FEFFFFFFCEE1F90B6BE37BAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF93D2FC108AF51A75E531A8FD2FA7FE1B9EFDF5FCFFB5D1F60869E25396
        EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF93CEFE24C6FE35B0FF33AAFF32A8FE32
        A8FE2FA6FE1AA4FFFFFFFDB3D0F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BE7FE
        25C7FD32ABFE42DFFE32ACFE31A5FE32A7FE30B3FF2C6EC67C81B9FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB5F0FE28D6FD41DCFE42DFFE41DCFE42E0FE33ACFE2F
        B2FF3778C9333A917B87BFFFFFFFFFFFFF9BC2F381B2F0FFFFFF44DBFD3FDAFE
        3FDAFE41DAFE41DBFE41DBFE41F0FF3879CB3C41963A4CA2FFFFFFFFFFFFFFFF
        FF106DE30056DFFFFFFF44DBFD3CDAFE3EDAFD3AD9FE41DAFE3FECFF4694D34E
        50AB3E50A4223985BCC3D9FFFFFFFFFFFFFCFDFEF3F8FDFFFFFFBCF2FE1AD3FD
        FFFFFF55DEFD32E5FF4593D34849A83B4DAC3C4EA32C428B10297A838FBAFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBCF2FEFFFFFFFFFFFF73B6E23338A05262B6EC
        EEF635489E3B4DA32E438C18317F52649FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF1F72438963D4FA32E438C2038
        832F458BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF43AFFD149BFDCBE9FEFFFFFFFF
        FFFFFFFFFFC7CCE42237953E50A42E438C203783172F7FE6E9F1FFFFFFFFFFFF
        EBF6FF0796FD1FA0FE6BC0FDFFFFFFFFFFFFFFFFFFFFFFFF98A1CD293D98384A
        A17180B1293F883C5193FFFFFFFFFFFFFFFFFF83CAFE48B1FDEDF7FEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF6977B6293D98949DCE334890273E87FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4657
        A61F34931B3092A5AFCEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDD1E7E7E9F3FFFFFF}
      TabOrder = 5
      OnClick = btnLimparClick
    end
  end
  object pnlInformacoesGerais: TPanel
    Left = 0
    Top = 86
    Width = 672
    Height = 176
    Align = alClient
    TabOrder = 1
    object grbInformacoesGerais: TGroupBox
      Left = 8
      Top = 6
      Width = 655
      Height = 137
      Caption = 'Informa'#231#245'es gerais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblNomeArquivo1: TLabel
        Left = 10
        Top = 26
        Width = 85
        Height = 13
        Caption = 'Nome do arquivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTamanhoArquivo1: TLabel
        Left = 10
        Top = 52
        Width = 102
        Height = 13
        Caption = 'Tamanho do arquivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblTempoDecorrido1: TLabel
        Left = 10
        Top = 78
        Width = 84
        Height = 13
        Caption = 'Tempo decorrido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblProgressoDownload1: TLabel
        Left = 10
        Top = 104
        Width = 116
        Height = 13
        Caption = 'Progresso do download:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeArquivo2: TLabel
        Left = 135
        Top = 26
        Width = 96
        Height = 13
        Caption = 'lblNomeArquivo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTamanhoArquivo2: TLabel
        Left = 135
        Top = 52
        Width = 30
        Height = 13
        Caption = '0 KBs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTempoDecorrido2: TLabel
        Left = 135
        Top = 78
        Width = 48
        Height = 13
        Caption = '00:00:00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblProgressoDownload2: TLabel
        Left = 135
        Top = 104
        Width = 20
        Height = 13
        Caption = '0%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 150
      Width = 655
      Height = 17
      TabOrder = 1
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 262
    Width = 672
    Height = 38
    Align = alBottom
    TabOrder = 2
    object btnFechar: TBitBtn
      Left = 588
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECEFAF9F9FEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF8F8FEC6C5F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D1D0FB4F4CF24140EDF9F9FEFFFFFFFFFFFFFFFFFFFFFFFFF8F8FE2725E4312F
        EAC6C5F8FFFFFFFFFFFFFFFFFFD3D3FC5856F56361FA5855F64341EDF9F9FEFF
        FFFFFFFFFFF9F8FE2E2DE6413FF14C4AF6312FEAC6C5F8FFFFFFFFFFFFE3E3FD
        5B58F66562FA7170FF5956F64442EEF9F9FEF9F9FE3734E94745F26362FF4A48
        F42F2DE9DAD9FAFFFFFFFFFFFFFFFFFFE3E3FD5B59F66663FA7471FF5A58F645
        43EE403EEC504DF46867FF504EF53634EBDBDBFBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE3E3FD5C5AF66764FA7472FF7370FF706EFF6E6CFF5755F73F3DEEDCDC
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E3FD5D5BF77976FF59
        56FF5754FF7270FF4846F0DEDEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFAFAFF5E5BF67D79FF5E5BFF5B58FF7674FF4744EFF9F9FEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFF6865F9706DFB807EFF7E
        7BFF7C79FF7977FF5E5CF74946EFF9F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FBFAFF706DFC7774FD8682FF7673FC6462F8605DF76D6AFA7B79FF605DF74A47
        EFF9F9FEFFFFFFFFFFFFFFFFFFFBFBFF7572FE7D7AFE8A87FF7C79FD6C69FBE5
        E4FEE4E4FE615EF86E6CFA7D7AFF615FF74B48F0FBFBFFFFFFFFFFFFFFEEEEFF
        7A77FF817EFF817EFE7471FDE6E6FEFFFFFFFFFFFFE4E4FE625FF86F6DFB7E7C
        FF625FF8B0AFF8FEFEFFFFFFFFFFFFFFEEEEFF7A77FF7976FEE7E7FFFFFFFFFF
        FFFFFFFFFFFFFFFFE4E4FE6461F86A68F98E8CF7E3E2FDFFFFFFFFFFFFFFFFFF
        FFFFFFEEEEFFE8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4FEB8B8
        FCD7D6FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFFFFFFFFFFFFFFFFFFF}
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 626
    Top = 105
  end
  object SaveDialog1: TSaveDialog
    Left = 571
    Top = 105
  end
end
