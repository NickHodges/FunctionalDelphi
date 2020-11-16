program BasicConcepts;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uBasicDemos in 'uBasicDemos.pas',
  uWidgetProcessor in 'uWidgetProcessor.pas',
  uPrimes in 'uPrimes.pas',
  uJoelDemos in 'uJoelDemos.pas',
  uImmutableTypes in 'uImmutableTypes.pas';

const
    Num = 10;

begin
  try

//    PrintSquares1(Num);
//    WriteLn;
//    PrintSquares2(Num);
//    WriteLn;
//    PrintSquares3(Num);
//    WriteLn;
    PrintSquares5(Num, PrintSquares4());

//    JoelExample1;
//    JoelExample2;
//    JoelExample3;
//    JoelExample4;

//    ForLoopExample;
//    MapExampleInteger;
//    MapExampleString;

//    ProcessSomeWidgetsAndRecordToConsole;
//    ProcessSomeWidgetsAndRecordToFile;


//    for i := 3 to 33 do
//    begin
//      if IsPrime1(i) then
//      begin
//        WriteLn(i, ' is prime!');
//      end else
//      begin
//        WriteLn(i, ' is NOT prime!');
//      end;
//    end;


  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
