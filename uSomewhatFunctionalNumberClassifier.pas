unit uSomewhatFunctionalNumberClassifier;

interface

uses
      Spring.Collections
    , uNumberClassificationTypes
    ;

type

  TSomewhatFunctionalNumberClassifier = class
  public
    class function IsFactor(aNumber: integer; aPotentialFactor: integer): Boolean; static;
    class function Factors(aNumber: integer): ISet<integer>;
    class function IsAbundant(aNumber: integer): boolean; static;
    class function IsDeficient(aNumber: integer): boolean; static;
    class function IsPerfect(aNumber: integer): boolean; static;
  end;

  function SomewhatFunctionalNumberClassifier(aNumber: integer): TNumberClassification;

implementation

function SomewhatFunctionalNumberClassifier(aNumber: integer): TNumberClassification;
begin
  if TSomewhatFunctionalNumberClassifier.IsPerfect(aNumber) then
  begin
    Result := Perfect
  end else
  begin
    if TSomewhatFunctionalNumberClassifier.IsAbundant(aNumber) then
    begin
      Result := Abundant
    end else
    begin
      Result := Deficient;
    end;
  end;
end;


{ TSomewhatFunctionalNumberClassifier }

class function TSomewhatFunctionalNumberClassifier.Factors(aNumber: integer): ISet<integer>;
var
  LFactors: ISet<integer>;
  i: integer;
begin
  LFactors := TCollections.CreateSet<integer>;
  for i := 1 to Round(Sqrt(aNumber)) do
  begin
    if IsFactor(aNumber, i) then
    begin
      LFactors.Add(i);
      LFactors.Add(aNumber div i);
    end;
  end;
  Result := LFactors;
end;

class function TSomewhatFunctionalNumberClassifier.IsFactor(aNumber, aPotentialFactor: integer): Boolean;
begin
  Result := aNumber mod aPotentialFactor = 0;
end;

class function TSomewhatFunctionalNumberClassifier.IsPerfect(aNumber: integer): boolean;
begin
  Result := Factors(aNumber).Sum - aNumber = aNumber;
end;

class function TSomewhatFunctionalNumberClassifier.IsAbundant(aNumber: integer): boolean;
begin
  Result := Factors(aNumber).Sum - aNumber > aNumber;
end;

class function TSomewhatFunctionalNumberClassifier.IsDeficient(aNumber: integer): boolean;
begin
  Result := Factors(aNumber).Sum - aNumber < aNumber;
end;

end.
