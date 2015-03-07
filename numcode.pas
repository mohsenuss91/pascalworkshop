uses crt;

type
  string8 = string[8];

function byte2bin(value: byte): string8;
var
  s: string8;
  i: integer;
begin
  s[0] := #8;
  for i := 0 to 7 do
  begin
    s[8 - i] := Char(((value shr i) and 1) + Ord('0'));
  end;
  byte2bin := s;
end;

function power2(i: integer): integer;
var
  j: integer;
  pro: integer;
begin
  pro := 1;
  for j := 1 to i do
  begin
    pro := pro * 2;
  end;
  power2 := pro;
end;

function int2bin(value: integer): string;
var
  i: integer;
  j: integer;
begin
  i := 0; (*nombre de bits de codage*)
  while (value div power2(i)) <> 0 do
    i := i + 1;
  int2bin[0] := Chr(i);
  for j := 0 to i - 1 do
  begin
    int2bin[i - j] := Char(((value shr j) and 1) + Ord('0'));
  end;

end;

var
  i: integer;
  value: integer;
begin
  clrscr;
  writeln(int2bin(256));
  readln;
end.

