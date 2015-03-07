program switch1;
var
  valeur: integer;
begin
  writeln('1. Effectuer une multiplication');
  writeln('2. Effectuer une addition');
  writeln('3. Effectuer une soustraction');
  writeln('4. Effectuer une division');
  readln(valeur);

  case valeur of
    1: writeln('Vous avez choisit la multiplication');
    2: writeln('Vous avez choisit la addition');
    3: writeln('Vous avez choisit la soustraction');
    4: writeln('Vous avez choisit la division');
  else
    writeln('Choix incorrecte');
  end;

  readln;
end.

