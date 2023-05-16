unit DataModule;

interface

uses
   SysUtils,  Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, IBTable;

type
  TDM = class(TDataModule)
    IBDatabase1: TIBDatabase;
    FDdelete: TIBQuery;
    FDTransaction1: TIBTransaction;
    FDselect: TIBQuery;
    FDinsert: TIBQuery;
    FDSelectAll: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
