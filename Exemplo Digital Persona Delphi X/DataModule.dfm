object DM: TDM
  OldCreateOrder = False
  Height = 248
  Width = 372
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Transaction = FDTransaction1
    Left = 48
    Top = 24
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 160
    Top = 24
  end
  object FDselect: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evUnidirectional]
    FetchOptions.Unidirectional = True
    SQL.Strings = (
      'select * from digital where FUN_CODIGO = :FUN_CODIGO')
    Left = 48
    Top = 112
    ParamData = <
      item
        Name = 'FUN_CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 280
    Top = 112
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 24
  end
  object FDInsert: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'INSERT INTO DIGITAL ('
      '    DIG_DEDO,'
      '    DIG_TEMPLATE,'
      '    FUN_CODIGO)VALUES ('
      '    :DIG_DEDO,'
      '    :DIG_TEMPLATE,'
      '    :FUN_CODIGO);')
    Left = 120
    Top = 112
    ParamData = <
      item
        Name = 'DIG_DEDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DIG_TEMPLATE'
        DataType = ftBlob
        ParamType = ptInput
      end
      item
        Name = 'FUN_CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDdelete: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from DIGITAL where FUN_CODIGO = :FUN_CODIGO AND'
      'DIG_DEDO = :DIG_DEDO')
    Left = 184
    Top = 112
    ParamData = <
      item
        Name = 'FUN_CODIGO'
        ParamType = ptInput
      end
      item
        Name = 'DIG_DEDO'
        ParamType = ptInput
      end>
  end
  object FDTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    AutoCommitUpdates = False
    Left = 120
    Top = 192
  end
  object FDSelectAll: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evUnidirectional]
    FetchOptions.Unidirectional = True
    SQL.Strings = (
      'select * from digital ')
    Left = 48
    Top = 192
  end
  object FDScript1: TFDScript
    SQLScripts = <>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    Left = 216
    Top = 192
  end
end
