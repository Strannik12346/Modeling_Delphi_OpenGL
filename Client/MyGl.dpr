program MyGl;

uses
  Forms,
  Unit2 in 'Unit2.pas' {MainForm},
  mgl in 'mgl.pas' {DemForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDemForm, DemForm);
  Application.Run;
end.
