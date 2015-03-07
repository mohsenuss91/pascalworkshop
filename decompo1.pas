program decomposition;
uses crt;
var
  nombre: integer;
  tableau: array[1..10] of integer;
  diviseur: integer;
  i, j: integer;
  Nbrelement: integer;
begin
  clrscr;
  NbrElement := 0;
  diviseur := 2;

  write('Entrez le nombre dont vous voulez la decomposition : ');
  readln(nombre);

  while (nombre <> 1) do
  begin
    if ((nombre mod diviseur) = 0) then
    begin
      tableau[NbrElement + 1] := diviseur;
      nombre := nombre div diviseur;
      NbrElement := NbrElement + 1;
    end
    else
      diviseur := diviseur + 1;
  end;

  i := 1;
  while (i < NbrElement) do
  begin
    write(tableau[i], '*');
    i := i + 1;
  end;
  writeln(tableau[i]);

  readln;
end.

