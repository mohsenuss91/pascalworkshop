type
  Personne = record
    nom, prenom: string;
    age: integer;
  end;

var
  personnes: array[1..10] of Personne;
  fichier: file of Personne;
  i, nombrePersonnes: integer;

begin
  write('Combien de personnes dans votre annuaire (Maximum : 10) : ');
  readln(nombrePersonnes);
  if nombrePersonnes > 10 then
    nombrePersonnes := 10;
  for i := 1 to nombrePersonnes do
  begin
    write('Votre nom : ');
    readln(personnes[i].nom);
    write('Votre prénom : ');
    readln(personnes[i].prenom);
    write('Votre age : ');
    readln(personnes[i].age);
  end;

  assign(fichier, 'c:\annuaire.dat');
  rewrite(fichier);

  for i := 1 to nombrePersonnes do
    write(fichier, personnes[i]);

  close(fichier);

end.

