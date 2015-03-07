uses Objects;

type
  PPersonne = ^TPersonne;
  TPersonne = object(TObject)
  private
    nom, prenom: string;
    age: integer;
  public
    constructor Init;
    procedure setNom(_nom: string); virtual;
    procedure setPrenom(_prenom: string); virtual;
    procedure setAge(_age: integer); virtual;
    function getNom: string; virtual;
    function getPrenom: string; virtual;
    function getAge: integer; virtual;
    destructor Done; virtual;
  end;

constructor TPersonne.Init;
begin
  if not inherited Init then
    Fail;
end;

procedure TPersonne.setNom(_nom: string);
begin
  nom := _nom;
end;

procedure TPersonne.setPrenom(_prenom: string);
begin
  prenom := _prenom;
end;

procedure TPersonne.setAge(_age: integer);
begin
  age := _age;
end;

function TPersonne.getNom: string;
begin
  getNom := nom;
end;

function TPersonne.getPrenom: string;
begin
  getPrenom := prenom;
end;

function TPersonne.getAge: integer;
begin
  getAge := age;
end;

destructor TPersonne.Done;
begin
  inherited Done;
end;

var
  personnes: array[1..10] of PPersonne;
  i, nombrePersonnes: integer;
  nom, prenom: string;
  age: integer;

begin
  write('Combien de personnes dans votre annuaire (Maximum : 10) : ');
  readln(nombrePersonnes);
  if nombrePersonnes > 10 then
    nombrePersonnes := 10;
  for i := 1 to nombrePersonnes do
  begin
    new(personnes[i], Init);
    write('Votre nom : ');
    readln(nom);
    personnes[i]^.setNom(nom);
    write('Votre prénom : ');
    readln(prenom);
    personnes[i]^.setPrenom(prenom);
    write('Votre age : ');
    readln(age);
    personnes[i]^.setAge(age);
  end;

  for i := 1 to nombrePersonnes do
    writeln('Nom : ', personnes[i]^.getNom, '  Prénom : ',
      personnes[i]^.getPrenom, '  Age : ', personnes[i]^.getAge);

  for i := 1 to nombrePersonnes do
    dispose(personnes[i], Done);

  readln;
end.

