var
  fichier: text;
  nom, prenom: string;
  age: integer;

begin
  write('Votre nom : ');
  readln(nom);
  write('Votre pr�nom : ');
  readln(prenom);
  write('Votre age : ');
  readln(age);

  assign(fichier, 'c:\resume.txt');
  rewrite(fichier);

  writeln(fichier, 'Nom : ', nom);
  writeln(fichier, 'Prenom : ', prenom);
  writeln(fichier, 'Age : ', age);

  close(fichier);
end.

