program file2;
uses crt;

var
  F: Text;
  tableau: array[1..10] of string;
  NbrEnregistrement: integer;
  i: integer;
begin
  clrscr;

  assign(F, 'c:\tp\strFile.txt');
  reset(F);
  NbrEnregistrement := 0;

  while ((not eof(F)) and (NbrEnregistrement < 10)) do
  begin
    readln(F, tableau[NbrEnregistrement + 1]);
    NbrEnregistrement := NbrEnregistrement + 1;
  end;

  for i := 1 to NbrEnregistrement do
    writeln(tableau[i]);

  close(F);
  readln;
end.

