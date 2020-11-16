unit uImperativeNumberClassifier;

interface

uses
      Spring.Collections
    , uNumberClassificationTypes
    ;

type

  TNumberClassification = (Perfect, Abundant, Deficient);

  TImperativeClassifier = class
  private
    FFactors: ISet<Integer>;
    FNumber: integer;
    function IsFactor(aFactor: integer): Boolean;
    procedure CalculateFactors;
    procedure AddFactor(aFactor: integer);
    function SumOfFactors: integer;

  public
    constructor Create(aNumber: integer);
    function IsAbundant: boolean;
    function IsDeficient: boolean;
    function IsPerfect: boolean;
  end;

function ImperativeNumberClassification(aNumber: integer): TNumberClassification;

implementation

uses
      System.SysUtils
    ;

function ImperativeNumberClassification(aNumber: integer): TNumberClassification;
var
  NumberClassifier: TImperativeClassifier;
begin
  NumberClassifier := TImperativeClassifier.Create(aNumber);
  try
    if NumberClassifier.IsPerfect then
    begin
      Result := TNumberClassification.Perfect;
    end else
    begin
      if NumberClassifier.IsAbundant then
      begin
        Result := TNumberClassification.Abundant
      end else
      begin
        Result := TNumberClassification.Deficient;
      end;
    end;
  finally
    NumberClassifier.Free;
  end;
end;


{ TImperativeClassifier }

constructor TImperativeClassifier.Create(aNumber: integer);
begin
  if aNumber < 1 then
  begin
    raise Exception.Create('Cannot classify zero or negative numbers.');
  end;
  FNumber := aNumber;
  FFactors := TCollections.CreateSet<integer>;
  FFactors.Add(1);
  FFactors.Add(aNumber);
end;

function TImperativeClassifier.IsFactor(aFactor: integer): Boolean;
begin
  Result := FNumber mod aFactor = 0;
end;

procedure TImperativeClassifier.CalculateFactors;
var
  i: integer;
begin
  for i := 1 to Round(sqrt(FNumber)) + 1 do
  begin
    if (IsFactor(i)) then
    begin
        addFactor(i);
    end;
  end;
end;

procedure TImperativeClassifier.AddFactor(aFactor: integer);
begin
  FFactors.add(aFactor);
  FFactors.add(FNumber div aFactor);
end;

function TImperativeClassifier.SumOfFactors: integer;
var
  Sum: integer;
  i: integer;
begin
  CalculateFactors;
  Sum := 0;
  for i := 0 to FFactors.Count - 1 do
  begin
    Sum := Sum + FFactors.ElementAt(i);
  end;
  Result := Sum;
end;

function TImperativeClassifier.IsPerfect: boolean;
begin
  Result := SumOfFactors - FNumber = FNumber;
end;

function TImperativeClassifier.IsAbundant: boolean;
begin
  Result := SumOfFactors - FNumber > FNumber;
end;

function TImperativeClassifier.IsDeficient: boolean;
begin
  Result := SumOfFactors - FNumber < FNumber;
end;

end.
