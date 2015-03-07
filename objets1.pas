uses Objects;

type
  TPersonne = object(TObject)
    nom, prenom: string;
    age: Integer;
    constructor Init(_nom, _prenom: string; _age: Integer);
  end;

constructor TPersonne.Init(_nom, _prenom: string; _age: Integer);
begin
  if not inherited Init then
    Fail;
  nom := _nom;
  prenom := _prenom;
  age := _age;
end;

var
  personnes: array[1..10] of TPersonne;
  i, nombrePersonnes: Integer;
  nom, prenom: string;
  age: Integer;

begin
  Write('Combien de personnes dans votre annuaire (Maximum : 10) : ');
  ReadLn(nombrePersonnes);
  if nombrePersonnes > 10 then
    nombrePersonnes := 10;
  for i := 1 to nombrePersonnes do
  begin
    Write('Votre nom : ');
    ReadLn(nom);
    Write('Votre prénom : ');
    ReadLn(prenom);
    Write('Votre age : ');
    ReadLn(age);
    personnes[i].Init(nom, prenom, age);
  end;

  for i := 1 to nombrePersonnes do
    WriteLn('Nom : ', personnes[i].nom, '  Prénom : ', personnes[i].prenom,
      '  Age : ', personnes[i].age);
  ReadLn;

  for i := 1 to nombrePersonnes do
    personnes[i].Done;

end.