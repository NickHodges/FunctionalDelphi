unit uPrimes;

interface

function IsPrime1(const i: integer): Boolean;
function IsPrime2(const i: integer): Boolean;


implementation

uses
      Spring.Collections
    ;

function IsPrime1(const i: Integer): Boolean;
var
  Temp: Integer;
begin
  Assert(i > 0);
  if i = 1 then
  begin
    Result := False;
    Exit;
  end;
  for Temp := 2 to (i div 2) do
  begin
    if i mod Temp = 0 then
    begin
      Result := False;
      Exit;
    end;
  end;
  Result := True;
end;

function IsPrime2(const i: integer): Boolean;
begin
  Assert(i > 0);
  if i = 1 then
  begin
    Result := False;
    Exit;
  end;
  Result :=  TEnumerable.Range(2, i div 2)
                        .Where(function(const aInt: Integer): Boolean
                                               begin
                                                 Result := i mod aInt = 0;
                                               end).Count = 0;
end;


end.
