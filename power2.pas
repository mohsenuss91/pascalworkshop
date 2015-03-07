program powerxy;
uses crt;

function power(x: integer; y: integer): longint;
var
  i: integer;
  p: longint;
begin
  p := 1;
  for i := 1 to y do
    p := p * x;

  power := p;
end;

var
  nombre: integer;
  i: integer;
  r: integer;
  valeur: longint;
begin
  clrscr;
  i := 0;
  valeur := 0;

  write('Entrez le nombre codé en binaire : ');
  readln(nombre);

  while (nombre <> 0) do
  begin
    r := nombre mod 10;
    if (r = 1) then
      valeur := valeur + power(2, i);
    i := i + 1;
    nombre := nombre div 10;
  end;

  writeln('Le nombre vaut ', valeur, ' en decimal');

  readln;
end.

