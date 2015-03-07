type
  PPersonne = ^TPersonne;
  TPersonne = record
    nom, prenom: string;
    age: integer;
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
    new(personnes[i]);
    write('Votre nom : ');
    readln(nom);
    personnes[i]^.nom := nom;
    write('Votre prénom : ');
    readln(prenom);
    personnes[i]^.prenom := prenom;
    write('Votre age : ');
    readln(age);
    personnes[i]^.age := age;
  end;

  for i := 1 to nombrePersonnes do
    writeln('Nom : ', personnes[i]^.nom, '  Prénom : ', personnes[i]^.prenom,
      '  Age : ', personnes[i]^.age);

  for i := 1 to nombrePersonnes do
    dispose(personnes[i]);

  readln;
end.

