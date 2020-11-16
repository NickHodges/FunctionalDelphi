unit uFunctionalNumberClassifier;

interface

uses
      Spring.Collections
    , uNumberClassificationTypes
    ;

type

  TFunctionalNumberClassifier = class
  public
    class function IsFactor(aNumber: integer; aPotentialFactor: integer): Boolean; static;
    class function Factors(aNumber: integer): IEnumerable<integer>; static;
    class function IsAbundant(aNumber: integer): boolean; static;
    class function IsDeficient(aNumber: integer): boolean; static;
    class function IsPerfect(aNumber: integer): boolean; static;
  end;

function FunctionalNumberClassifier(aNumber: integer): TNumberClassification;

implementation

function FunctionalNumberClassifier(aNumber: integer): TNumberClassification;
begin
  if TFunctionalNumberClassifier.IsPerfect(aNumber) then
  begin
    Result := Perfect
  end else
  begin
    if TFunctionalNumberClassifier.IsAbundant(aNumber) then
    begin
      Result := Abundant
    end else
    begin
      Result := Deficient;
    end;
  end;
end;

{ TFunctionalNumberClassifier }

class function TFunctionalNumberClassifier.Factors(aNumber: integer): IEnumerable<integer>;
begin
  Result := TEnumerable.Range(1, aNumber).Where(function(const aInteger: integer): Boolean
                                                    begin
                                                      Result := IsFactor(aNumber, aInteger);
                                                    end);
end;

class function TFunctionalNumberClassifier.IsFactor(aNumber, aPotentialFactor: integer): Boolean;
begin
  Result := aNumber mod aPotentialFactor = 0;
end;

class function TFunctionalNumberClassifier.IsPerfect(aNumber: integer): boolean;
begin
  Result := Factors(aNumber).Sum - aNumber = aNumber;
end;

class function TFunctionalNumberClassifier.IsAbundant(aNumber: integer): boolean;
begin
  Result := Factors(aNumber).Sum - aNumber > aNumber;
end;

class function TFunctionalNumberClassifier.IsDeficient(aNumber: integer): boolean;
begin
  Result := Factors(aNumber).Sum - aNumber < aNumber;
end;

end.
