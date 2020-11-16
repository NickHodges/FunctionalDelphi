unit uImmutableTypes;

interface

type
  TMutablePerson = class
  private
    FName: string;
    FEmail: string;
    procedure SetEmail(const Value: string);
    procedure SetName(const Value: string);
  public
    constructor Create(const aName: string; const aEmail: string);
    property Name: string read FName write SetName;
    property Email: string read FEmail write SetEmail;
  end;

  TImmutablePerson = class
  strict private
    FName: string;
    FEmail: string;
  public
    constructor Create(const aName: string; const aEmail: string);
    property Name: string read FName;
    property Email: string read FEmail;
  end;

  TPerson = class
  private
    FName: string;
    FEmail: string;
  public
    constructor Create(const aName: string; const aEmail: string);
    function ChangeName(const aName: string): TPerson;
    function ChangeEmail(const aEmail: string): TPerson;
    property Name: string read FName;
    property Email: string read FEmail;
  end;

implementation

uses
       System.SysUtils
     ;


{ TMutablePerson }

constructor TMutablePerson.Create(const aName: string; const aEmail: string);
begin
  inherited Create;
  if not aEmail.Contains('@') then
  begin
    raise Exception.Create('The email address must contain a "@" symbol');
  end;
  FName := aName;
  FEmail := aEmail;
end;

procedure TMutablePerson.SetEmail(const Value: string);
begin
  if not Value.Contains('@') then
  begin
    raise Exception.Create('The email address must contain a "@" symbol');
  end;
  FEmail := Value;
end;

procedure TMutablePerson.SetName(const Value: string);
begin
  FName := Value;
end;

{ TImmutablePerson }

constructor TImmutablePerson.Create(const aName, aEmail: string);
begin
  inherited Create;
  if not aEmail.Contains('@') then
  begin
    raise Exception.Create('The email address must contain a "@" symbol');
  end;
  FEmail := aEmail;
  FName := aName;
end;

{ TPerson }

constructor TPerson.Create(const aName, aEmail: string);
begin
  inherited Create;
    if not aEmail.Contains('@') then
  begin
    raise Exception.Create('The email address must contain a "@" symbol');
  end;
  FEmail := aEmail;
  FName := aName;
end;

function TPerson.ChangeEmail(const aEmail: string): TPerson;
begin
  Result := TPerson.Create(FName, aEmail);
end;

function TPerson.ChangeName(const aName: string): TPerson;
begin
  Result := TPerson.Create(aName, FEmail);
end;

end.
