program trianglepascal;
uses crt;

function factorielle(n: integer): longint;
var
  fac: longint;
begin
  fac := 1;
  while (n > 1) do
  begin
    fac := fac * n;
    n := n - 1;
  end;
  factorielle := fac;
end;

function combinaison(p: integer; q: integer): longint;
begin
  combinaison := factorielle(q) div (factorielle(p) * factorielle(q - p));
end;

var
  n: integer;
  p, q: integer;
begin
  clrscr;

  write('Entrez le nombre de ligne du triangle de Pascal a afficher : ');
  readln(n);

  for q := 0 to n do
  begin
    p := 0;
    while (p <= q) do
    begin
      write(combinaison(p, q): 7);
      p := p + 1;
    end;
    writeln;
  end;
  readln;
end.

