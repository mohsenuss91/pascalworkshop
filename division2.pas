program division2;
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

  repeat
    dividende := dividende - diviseur;
    quotient := quotient + 1;
  until dividende < diviseur;
  writeln('Le quotient est : ', quotient);
  writeln('Le reste est : ', dividende);

  readln;
end

