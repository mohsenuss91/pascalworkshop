program switch1;
uses crt;
var
  valeur: integer;
begin
  clrscr;
  repeat
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
      writeln('Choix incorrect');
    end;
    writeln;
  until valeur < 5;

  readln;
end.

