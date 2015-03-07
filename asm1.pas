uses Dos;

procedure date(var annee: word; var mois, jour: byte);
var
  registres: registers;
begin
  registres.AH := $2A;
  MsDos(registres);
  annee := registres.CX;
  mois := registres.DH;
  jour := registres.DL;
end;

var
  annee: word;
  mois, jour: byte;

begin
  date(annee, mois, jour);
  writeln('Nous sommes le ', jour, '/', mois, '/', annee);
  readln;
end.

