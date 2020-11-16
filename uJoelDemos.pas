unit uJoelDemos;

interface

uses
      System.SysUtils
    ;

//http://www.joelonsoftware.com/items/2006/08/01.html

procedure JoelExample1;
procedure JoelExample2;
procedure JoelExample3;
procedure JoelExample4;

procedure ForLoopExample;
procedure MapExampleInteger;
procedure MapExampleString;

type
  TMap = class
    class procedure Map<T>(a: TArray<T>; aProc: TFunc<T, T>);
  end;


implementation

procedure JoelExample1;
begin
  WriteLn('I''d like some Spaghetti!');
  WriteLn('I''d like some Chocolate Moose!');
end;

procedure SwedishChef(aFood: string);
begin
  WriteLn('Heardy feardy! I''d like some ', aFood, '!');
end;

procedure JoelExample2;
begin
  SwedishChef('Spaghetti');
  SwedishChef('Chocolate Moose');
end;

procedure PutInPot(aThing: string);
begin
  WriteLn('Put the ', aThing, ' in the pot.');
end;

procedure BoomBoom(aThing: string);
begin
  WriteLn('Boom! ', aThing);
end;

procedure JoelExample3;
begin
  WriteLn('get the lobster');
  PutInPot('lobster');
  PutInPot('water');

  WriteLn('get the chicken');
  BoomBoom('chicken');
  BoomBoom('coconut');
end;


procedure Cook(aThing1, aThing2: string; aProc: TProc<string>);
begin
  Writeln('get the ', aThing1);
  aProc(aThing1);
  aProc(aThing2);
end;

procedure JoelExample4;
begin
  Cook('lobster', 'water', procedure(aString: string)
                           begin
                             WriteLn('Put the ', aString, ' in the pot.');
                           end);
  Cook('chicken', 'coconut', procedure(aString: string)
                           begin
                             WriteLn('Boom! ', aString);
                           end);
end;


procedure ForLoopExample;
var
  a: array of integer;
  i: integer;
begin
  a := [1, 2, 3];
  for i := 0 to Length(a) - 1 do
  begin
    a[i] := a[i] * 2;
  end;

  for i := 0 to Length(a) - 1  do
  begin
    Write(a[i], ', ');
  end;
end;

class procedure TMap.Map<T>(a: TArray<T>; aProc: TFunc<T, T>);
var
  i: Integer;
begin
  for i := 0 to Length(a) - 1 do
  begin
    a[i] := aProc(a[i]);
  end;
end;

procedure MapExampleInteger;
var
  a: TArray<Integer>;
  i: Integer;
begin
  a := [1, 2, 3];
  TMap.Map<Integer>(a, function(i: integer): integer
         begin
           Result := i * 2;
         end);

  for i := 0 to Length(a) - 1 do
  begin
    WriteLn(a[i]);
  end;

end;

procedure MapExampleString;
var
  a: TArray<string>;
  i: Integer;
begin
  a := ['h', 'b', 'l'];
  TMap.Map<string>(a, function(s: string): string
         begin
           Result := s + 'a ';
         end);

  for i := 0 to Length(a) - 1 do
  begin
    WriteLn(a[i]);
  end;

end;



end.
