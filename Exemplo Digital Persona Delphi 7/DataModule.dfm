object DM: TDM
  OldCreateOrder = False
  Left = 515
  Top = 252
  Height = 367
  Width = 526
  object IBDatabase1: TIBDatabase
    DatabaseName = 'localhost:'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = FDTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    Left = 32
    Top = 32
  end
  object FDdelete: TIBQuery
    Database = IBDatabase1
    Transaction = FDTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from DIGITAL where FUN_CODIGO = :FUN_CODIGO AND'
      'DIG_DEDO = :DIG_DEDO')
    Left = 168
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FUN_CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIG_DEDO'
        ParamType = ptUnknown
      end>
  end
  object FDTransaction1: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 128
    Top = 40
  end
  object FDselect: TIBQuery
    Database = IBDatabase1
    Transaction = FDTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from digital where FUN_CODIGO = :FUN_CODIGO')
    Left = 32
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FUN_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object FDinsert: TIBQuery
    Database = IBDatabase1
    Transaction = FDTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'INSERT INTO DIGITAL ('
      '    DIG_DEDO,'
      '    DIG_TEMPLATE,'
      '    FUN_CODIGO)VALUES ('
      '    :DIG_DEDO,'
      '    :DIG_TEMPLATE,'
      '    :FUN_CODIGO);')
    Left = 96
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DIG_DEDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DIG_TEMPLATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FUN_CODIGO'
        ParamType = ptUnknown
      end>
  end
  object FDSelectAll: TIBQuery
    Database = IBDatabase1
    Transaction = FDTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from digital '
      '')
    Left = 32
    Top = 184
  end
end
