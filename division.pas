program division;
uses crt;
var
  dividende, diviseur, quotient: integer;
begin
  clrscr;
  quotient := 0;

  writeln('Entrez le dividende');
  readln(dividende);
  writeln('Entrez le diviseur');
  readln(diviseur);
  while (dividende > diviseur) do
  begin
    dividende := dividende - diviseur;
    quotient := quotient + 1;
  end;
  writeln('Le quotient est : ', quotient);
  writeln('Le reste est : ', dividende);

  readln;
end.

