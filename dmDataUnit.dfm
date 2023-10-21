object DM: TDM
  OldCreateOrder = False
  OnCreate = ge
  OnDestroy = DataModuleDestroy
  Height = 270
  Width = 520
  object sqlc: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Exclusive'
      'Database=C:\Projects\Progressor\lbase\korvin.db'
      'CacheSize=100000')
    LoginPrompt = False
    Left = 104
    Top = 24
  end
  object sqlcshare: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'LockingMode=Exclusive'
      'SharedCache=False')
    ResourceOptions.AssignedValues = [rvAutoConnect]
    ResourceOptions.AutoConnect = False
    LoginPrompt = False
    Left = 104
    Top = 88
  end
end
