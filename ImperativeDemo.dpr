program ImperativeDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uImperativeNumberClassifier in 'uImperativeNumberClassifier.pas';

var
  i: integer;

begin
  try
    for i := 1 to 30 do
    begin
      case ImperativeNumberClassification(i) of
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
