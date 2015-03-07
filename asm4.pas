function initSouris: word; assembler;
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

begin
  writeln('Nombre de boutons : ', initSouris);
  readln;
end.

