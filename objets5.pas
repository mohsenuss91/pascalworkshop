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

type
  PCellule = ^Cellule;
  Cellule = record
    personne: PPersonne;
    suivant: PCellule;
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

procedure ajouter(var liste: PCellule; nom, prenom: string; age: integer);
var
  p: PCellule;
begin
  new(p);
  new(p^.personne, Init);
  p^.personne^.setNom(nom);
  p^.personne^.setPrenom(prenom);
  p^.personne^.setAge(age);
  p^.suivant := liste;
  liste := p;
end;

procedure afficher(liste: PCellule);
var
  p: PCellule;
begin
  p := liste;
  while p <> nil do
  begin
    writeln('Nom : ', p^.personne^.getNom, '  Prénom : ', p^.personne^.getPrenom,
      '  Age : ', p^.personne^.getAge);
    p := p^.suivant;
  end;
end;

procedure vider(liste: PCellule);
var
  p, r: PCellule;
begin
  p := liste;
  while (p <> nil) do
  begin
    r := p^.suivant;
    dispose(p^.personne, Done);
    dispose(p);
    p := r;
  end;
end;

var
  i, nombrePersonnes: integer;
  nom, prenom: string;
  age: integer;
  liste: PCellule;

begin
  write('Combien de personnes dans votre annuaire (Maximum : 10) : ');
  readln(nombrePersonnes);
  while (nombrePersonnes > 0) do
  begin
    write('Votre nom : ');
    readln(nom);
    write('Votre prénom : ');
    readln(prenom);
    write('Votre age : ');
    readln(age);
    ajouter(liste, nom, prenom, age);
    dec(nombrePersonnes);
  end;

  afficher(liste);

  vider(liste);

  readln;
end.

