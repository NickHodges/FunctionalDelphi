program FunctionalDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uFunctionalNumberClassifier in 'uFunctionalNumberClassifier.pas',
  uNumberClassificationTypes in 'uNumberClassificationTypes.pas';

var
  i: integer;

begin
  try
    for i := 1 to 30 do
    begin
      case FunctionalNumberClassifier(i) of
        Perfect: WriteLn(i, ' is Perfect');
        Abundant: WriteLn(i, ' is Abundant');
        Deficient: WriteLn(i, ' is Deficient');
      end;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
