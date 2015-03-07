program aleatrie;
uses crt;
var
  tableau: array[1..10] of integer;
  i, j: integer;
  aux: integer;
begin
  clrscr;
  randomize;

  for i := 1 to 10 do
    tableau[i] := random(37) + 13;

  for i := 1 to 10 do
    write(tableau[i]: 7);

  for i := 2 to 10 do
  begin
    for j := 10 downto i do
    begin
      if (tableau[j - 1] > tableau[j]) then
      begin
        aux := tableau[j - 1];
        tableau[j - 1] := tableau[j];
        tableau[j] := aux;
      end;
    end;
  end;

  writeln;

  for i := 1 to 10 do
    write(tableau[i]: 7);

  readln;
end.

