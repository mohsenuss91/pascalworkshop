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

function initMouse: word; assembler;
asm
MOV AX, 0h;
INT 33h;
CMP AX, 0FFFFh;
JNE @@driverAbsent;
MOV AX, BX;
JMP @@fin;
@@driverAbsent : MOV AX, 0;
@@fin :
end;

procedure showCursor; assembler;
asm
MOV AX, 1h;
INT 33h;
end;

procedure hideCursor; assembler;
asm
MOV AX, 2h;
INT 33h;
end;

begin
  modeGraphique;
  initMouse;
  showCursor;
  readln;
  hideCursor;
  modeTexte;
end.

