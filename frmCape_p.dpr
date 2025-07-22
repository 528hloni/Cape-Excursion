program frmCape_p;

uses
  Forms,
  frmCape_u in 'frmCape_u.pas' {frmCape},
  dmCape_u in 'dmCape_u.pas' {dmCape: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCape, frmCape);
  Application.CreateForm(TdmCape, dmCape);
  Application.Run;
end.
