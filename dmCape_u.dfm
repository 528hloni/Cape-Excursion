object dmCape: TdmCape
  OldCreateOrder = False
  Left = 192
  Top = 125
  Height = 281
  Width = 313
  object conCape: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=ExcursionCape.mdb;M' +
      'ode=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 40
    Top = 56
  end
  object qryCape: TADOQuery
    Connection = conCape
    Parameters = <>
    Left = 96
    Top = 56
  end
  object dsrCape: TDataSource
    DataSet = qryCape
    Left = 152
    Top = 56
  end
end
