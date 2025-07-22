unit dmCape_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmCape = class(TDataModule)
    conCape: TADOConnection;
    qryCape: TADOQuery;
    dsrCape: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCape: TdmCape;

implementation

{$R *.dfm}

end.
