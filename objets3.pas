uses Objects;

type
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

type
  TEtudiant = object(TPersonne)
  private
    moyenne: real;
  public
    constructor Init;
    procedure setMoyenne(_moyenne: real); virtual;
    function getMoyenne: real; virtual;
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

constructor TEtudiant.Init;
begin
  if not inherited Init then
    Fail;
end;

procedure TEtudiant.setMoyenne(_moyenne: real);
begin
  moyenne := _moyenne;
end;

function TEtudiant.getMoyenne: real;
begin
  getMoyenne := moyenne;
end;

destructor TEtudiant.Done;
begin
  inherited Done;
end;

var
  etudiants: array[1..10] of TEtudiant;
  i, nombreEtudiants: integer;
  nom, prenom: string;
  age: integer;
  moyenne: real;

begin
  write('Combien d''étudiants dans votre annuaire (Maximum : 10) : ');
  readln(nombreEtudiants);
  if nombreEtudiants > 10 then
    nombreEtudiants := 10;
  for i := 1 to nombreEtudiants do
  begin
    etudiants[i].Init;
    write('Votre nom : ');
    readln(nom);
    etudiants[i].setNom(nom);
    write('Votre prénom : ');
    readln(prenom);
    etudiants[i].setPrenom(prenom);
    write('Votre age : ');
    readln(age);
    etudiants[i].setAge(age);
    write('Votre moyenne : ');
    readln(moyenne);
    etudiants[i].setMoyenne(moyenne);
  end;

  for i := 1 to nombreEtudiants do
    writeln('Nom : ', etudiants[i].getNom, '  Prénom : ', etudiants[i].getPrenom,
      '  Age : ', etudiants[i].getAge,
      '  Moyenne : ', etudiants[i].getMoyenne: 2: 2);

  for i := 1 to nombreEtudiants do
    etudiants[i].Done;

  readln;
end.

