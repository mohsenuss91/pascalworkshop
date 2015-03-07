program tabpremiers;
uses crt;
var
  tableau: array[1..10] of integer;
  nombre: integer;
  i, j: integer;
  Npremier: integer;
begin
  clrscr;

  Npremier := 0;
  nombre := 1;
  j := 1;

  while (Npremier < 10) do
  begin
    i := 2;
    while (((nombre mod i) <> 0) and (i <= (trunc(nombre div 2) + 1))) do
    begin
      i := i + 1;
    end;
    if ((nombre mod i) <> 0) then
    begin
      tableau[j] := nombre;
      Npremier := Npremier + 1;
      j := j + 1;
    end;
    nombre := nombre + 1;
  end;
  for i := 1 to 10 do
    writeln('Element ', i, ' vaut ', tableau[i]);

  readln;
end.

