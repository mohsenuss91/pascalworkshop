program multi3;
uses crt;
var
  i, j: integer;
begin
  clrscr;
  for j := 1 to 12 do
  begin
    for i := 2 to 9 do
      write(j * i: 8);
    writeln;
  end;

  readln;
end.

