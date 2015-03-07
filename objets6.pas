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
    function Presentation: string; virtual;
    destructor Done; virtual;
  end;

type
  PEtudiant = ^TEtudiant;
  TEtudiant = object(TPersonne)
  private
    moyenne: real;
  public
    constructor Init;
    procedure setMoyenne(_moyenne: real); virtual;
    function getMoyenne: real; virtual;
    function Presentation: string; virtual;
    destructor Done; virtual;
  end;

type
  PSalarie = ^TSalarie;
  TSalarie = object(TPersonne)
  private
    salaire: integer;
  public
    constructor Init;
    procedure setSalaire(_salaire: integer); virtual;
    function getSalaire: integer; virtual;
    function Presentation: string; virtual;
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

function TPersonne.Presentation: string;
var
  sage: string;
begin
  str(age, sage);
  Presentation := 'Nom : ' + nom + '  Prénom : ' + prenom + '  Age : ' + sage;
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

function TEtudiant.Presentation: string;
var
  smoyenne: string;
begin
  str(moyenne: 2: 2, smoyenne);
  Presentation := (inherited Presentation) + '  Moyenne : ' + smoyenne;
end;

destructor TEtudiant.Done;
begin
  inherited Done;
end;

constructor TSalarie.Init;
begin
  if not inherited Init then
    Fail;
end;

procedure TSalarie.setSalaire(_salaire: integer);
begin
  salaire := _salaire;
end;

function TSalarie.getSalaire: integer;
begin
  getSalaire := salaire;
end;

function TSalarie.Presentation: string;
var
  ssalaire: string;
begin
  str(salaire, ssalaire);
  Presentation := (inherited Presentation) + '  Salaire : ' + ssalaire;
end;

destructor TSalarie.Done;
begin
  inherited Done;
end;

procedure ajouter(var liste: PCellule; personne: PPersonne);
var
  p: PCellule;
begin
  new(p);
  p^.personne := personne;
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
    writeln(p^.personne^.Presentation);
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
  nombrePersonnes, typePersonne: integer;
  nom, prenom: string;
  age: integer;
  moyenne: real;
  salaire: integer;
  p: PPersonne;
  liste: PCellule;

begin
  write('Combien de personnes dans votre annuaire (Maximum : 10) : ');
  readln(nombrePersonnes);
  while (nombrePersonnes > 0) do
  begin
    write('Quel type (1 pour Etudiant, 2 pour Salarié, autre pour Personne) : ');
    readln(typePersonne);
    write('Votre nom : ');
    readln(nom);
    write('Votre prénom : ');
    readln(prenom);
    write('Votre age : ');
    readln(age);
    case typePersonne of
      1:
        begin
          write('Votre moyenne : ');
          readln(moyenne);
          p := new(PEtudiant, Init);
          p^.setNom(nom);
          p^.setPrenom(prenom);
          p^.setAge(age);
          PEtudiant(p)^.setMoyenne(moyenne);
          ajouter(liste, p);
        end;
      2:
        begin
          write('Votre salaire : ');
          readln(salaire);
          p := new(PSalarie, Init);
          p^.setNom(nom);
          p^.setPrenom(prenom);
          p^.setAge(age);
          PSalarie(p)^.setSalaire(salaire);
          ajouter(liste, p);
        end;
    else
      begin
        p := new(PPersonne, Init);
        p^.setNom(nom);
        p^.setPrenom(prenom);
        p^.setAge(age);
        ajouter(liste, p);
      end;
    end;
    dec(nombrePersonnes);
  end;

  afficher(liste);

  vider(liste);

  readln;
end.

