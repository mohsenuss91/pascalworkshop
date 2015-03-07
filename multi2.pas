program multi2;
uses crt;
var
  i, j: integer;
begin
  clrscr; (*Pour nettoyer lÆÚcran. On a alors besoin dÆutiliser lÆunitÚ crt*)
  for j := 2 to 9 do
  begin
    for i := 1 to 12 do
      writeln(j * i);
    writeln
  end;
  readln;
end

