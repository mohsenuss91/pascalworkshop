program multi1;
var
  i: integer;
  nombre: integer;
begin
  write('Entrez un nombre: ');
  readln(nombre);
  for i := 1 to 12 do
    writeln(nombre * i);
  readln;
end.

