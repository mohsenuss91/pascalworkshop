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

procedure getStatus(var x, y, buttonStatus: word);
var
  _x, _y, _buttonStatus: word;
begin
  asm
MOV AX, 3h;
INT 33h;
MOV _x, CX;
MOV _y, DX;
MOV _buttonStatus, BX;
  end;
  x := _x;
  y := _y;
  buttonStatus := _buttonStatus;
end;

var
  x, y, buttonStatus: word;

begin
  modeGraphique;
  initMouse;
  showCursor;
  readln;
  getStatus(x, y, buttonStatus);
  hideCursor;
  modeTexte;
  write(x, ' ', y, ' ', buttonStatus);
  readln;
end.

