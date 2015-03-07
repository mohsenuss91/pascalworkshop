program annuaire2;
uses crt, strTest;
type
  Personne = record
    nom: string[30];
    telephone: string[10];
    nCarte: word;
  end;

var
  Annuaire: array[1..100] of Personne;
  i: integer;
begin
  clrscr;

  i := 1;
  while (i <= 10) do
  begin
    case i of
      1: writeln('Entrez les paramètres de la première personne');
      2: writeln('Entrez les paramètres de la seconde personne');
      3..10: writeln('Entrez les paramètres de la ', i, 'ième personne');
    end;
    repeat
      Write('Nom : ');
      readln(Annuaire[i].nom);
    until isString(Annuaire[i].nom);

    repeat
      write('Numero de telephone : ');
      readln(Annuaire[i].telephone);
    until isNumber(Annuaire[i].telephone);

    write('Numero de carte banquaire : ');
    readln(Annuaire[i].nCarte);
    i := i + 1;
    writeln;
  end;
  writeln('Opération de lecture terminee!!!');

  readln;
end.

