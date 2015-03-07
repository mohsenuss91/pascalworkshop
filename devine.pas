program devine;
uses crt;

const
  NbrTentativeMax: integer = 10;

var
  nombre,
    valeur,
    ValMax,
    tentative: integer;
  car: char;
begin
  clrscr;

  randomize;
  tentative := 0;
  valeur := -1;
  car := 'o';

  repeat
    writeln('Entrez la borne maximale du nombre aléatoire');
    readln(ValMax);
  until ValMax > 2;

  writeln;

  repeat
    nombre := random(ValMax);
    while ((valeur <> nombre) and (tentative <= NbrTentativeMax)) do
    begin
      write('Entrez une valeur : ');
      readln(valeur);
      if (valeur > nombre) then
        writeln('Plus petit')
      else if (valeur < nombre) then
        writeln('Plus grand!');
      tentative := tentative + 1;
    end;
    if (valeur = nombre) then
      writeln('Vous avez gagné :)')
    else
      writeln('Vous avez perdu :(');
    writeln('Jouer encore ? n pour non, une autre touche pour oui');
    readln(car);
  until upcase(car) = 'N' (*(car = 'n') or (car='N');*)

end.

