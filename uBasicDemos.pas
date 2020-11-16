unit uBasicDemos;

interface

type
  TPrintSquaresProc = reference to procedure(const aInteger: integer);

procedure PrintSquares1(const aInteger: integer);
procedure PrintSquares2(const aInteger: integer);
procedure PrintSquares3(const aInteger: integer);
function PrintSquares4: TPrintSquaresProc;
procedure PrintSquares5(const aInteger: integer; aProc: TPrintSquaresProc);


implementation

uses
      Spring.Collections
    ;

procedure PrintSquares1(const aInteger: integer);
var
  i: Integer;
begin
  for i := 1 to aInteger do
  begin
    WriteLn(i, ' - ', i * i);
  end;
end;


procedure PrintSquares2(const aInteger: integer);
begin
  if aInteger > 0 then
  begin
    PrintSquares2(aInteger - 1);
    WriteLn(aInteger, ' - ', ainteger * aInteger);
  end;
end;

procedure PrintSquares3(const aInteger: integer);
begin
  TEnumerable.Range(1, aInteger).ForEach(procedure(const aInt: integer)
                                         begin
                                           WriteLn(aInt, ' - ', aInt * aInt)
                                         end);
end;

function PrintSquares4: TPrintSquaresProc;
begin
  Result := procedure(const aInteger: integer)
            begin
              PrintSquares3(aInteger);
            end;
end;

procedure PrintSquares5(const aInteger: integer; aProc: TPrintSquaresProc);
begin
  aProc(aInteger);
end;


end.
