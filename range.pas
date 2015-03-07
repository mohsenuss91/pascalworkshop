program rangecheck;
uses crt;

var
  tab: array[1..10] of integer;
  i: integer;
begin
  for i := 1 to 12 do
  begin
    writeln('Entrez la donne ', i);
    readln(tab[i]);
  end;

end.

