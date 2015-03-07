program facto;
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

var
  n: integer;
begin
  clrscr;
  writeln('Entrez la valeur de n');
  readln(n);

  writeln('n! = ', factorielle(n));
  readln;
end.

