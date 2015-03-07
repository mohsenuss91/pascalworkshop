program testExtended;
uses crt;

function mult(x, y: comp): comp;
begin
  mult := x * y;
end;

var
  x, y: comp;
begin
  writeln('Entrez la valeur de x');
  readln(x);
  writeln('Entrez la valeur de y');
  readln(y);
  writeln(x * y);
  writeln('Leur produit est : ', mult(x, y));
  readkey;
end.

