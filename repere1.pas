program repere;
uses graph;

var
  driver, mode: integer;
  i, j: integer;
begin
  driver := Detect;
  InitGraph(driver, mode, 'c:\tp\bgi');
  if (GraphResult <> grOk) then
  begin
    writeln('Erreur au cours de l''initialisation du mode graphique');
    halt(1);
  end;

  Line(0, 220, 630, 220);
  Line(315, 0, 315, 460);

  i := 0;
  j := 0;

  while (i <= 460) do
  begin
    Line(313, i, 317, i);
    i := i + 20;
  end;
  while (j <= 630) do
  begin
    Line(j, 218, j, 222);
    j := j + 30
  end;

  Line(315, 100, 120, 220);
  Line(315, 100, 510, 220);
  Line(315, 340, 120, 220);
  Line(315, 340, 510, 220);

  readln;
  CloseGraph;

end.

