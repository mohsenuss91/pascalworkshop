procedure date(var annee: word; var mois, jour: byte);
var
  _annee: word;
  _mois, _jour: byte;
begin
  asm
MOV AH, 2Ah;
INT 21h;
MOV _annee, CX;
MOV _mois, DH;
MOV _jour, DL;
  end;
  annee := _annee;
  mois := _mois;
  jour := _jour;
end;

var
  annee: word;
  mois, jour: byte;

begin
  date(annee, mois, jour);
  writeln('Nous sommes le ', jour, '/', mois, '/', annee);
  readln;
end.

