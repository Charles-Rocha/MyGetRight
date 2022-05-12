object DM: TDM
  OldCreateOrder = False
  Height = 338
  Width = 453
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 247
    Top = 87
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 159
    Top = 87
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'CODIGO'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'LOGDOWNLOAD'
    TableName = 'LOGDOWNLOAD'
    Left = 97
    Top = 87
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 27
    Top = 87
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 137
    Top = 14
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 27
    Top = 15
  end
  object qryHistoricoDownloads: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT CODIGO, URL, DATAINICIO, DATAFIM'
      'FROM LOGDOWNLOAD')
    Left = 356
    Top = 87
    object qryHistoricoDownloadsCODIGO: TFMTBCDField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 22
      Size = 0
    end
    object qryHistoricoDownloadsURL: TStringField
      FieldName = 'URL'
      Origin = 'URL'
      Required = True
      Size = 600
    end
    object qryHistoricoDownloadsDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Origin = 'DATAINICIO'
      Required = True
    end
    object qryHistoricoDownloadsDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
      Origin = 'DATAFIM'
    end
  end
end
