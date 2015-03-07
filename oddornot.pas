program oddornot;
var
  valeur: integer;
begin
  writeln('Entrez la valeur de l''entier');
  readln(valeur);
  if (odd(valeur)) then
    writeln('Entier impair');
  if (not (odd(valeur))) then
    writeln('Entier pair');
  readln;
end.

