procedure modeGraphique; assembler;
asm
MOV AX, 13h;
INT 10h;
end;

procedure modeTexte; assembler;
asm
MOV AX, 3h;
INT 10h;
end;

begin
  modeGraphique;
  write('En mode Graphique !');
  readln;
  modeTexte;
  write('En mode Texte !');
  readln;
end.

