program graphinterac;
uses crt, graph;

var
  driver, mode: integer;
  letter: char;

begin
  driver := Detect;
  InitGraph(driver, mode, 'c:\tp\bgi');
  if (GraphResult <> grOk) then
  begin
    writeln('Erreur au cours de l''initialisation du mode graphique');
    halt(1);
  end;

  SetFillStyle(1, red);
  Bar(50, 80, 200, 100);
  Bar(250, 80, 400, 100);
  Bar(450, 80, 600, 100);
  OutTextXY(75, 70, 'Le bouton A');
  OutTextXY(275, 70, 'Le bouton B');
  OutTextXY(475, 70, 'Le bouton C');

  repeat
    letter := readkey;
    case letter of
      'a', 'A':
        begin
          sound(250);
          delay(50);
          nosound;
          SetFillStyle(1, blue);
          Bar(50, 80, 200, 100);
          delay(2000);
          SetFillStyle(1, red);
          Bar(50, 80, 200, 100);
        end;
      'b', 'B':
        begin
          sound(350);
          delay(50);
          nosound;
          SetFillStyle(1, blue);
          Bar(250, 80, 400, 100);
          delay(2000);
          SetFillStyle(1, red);
          Bar(250, 80, 400, 100);
        end;
      'c', 'C':
        begin
          sound(450);
          delay(50);
          nosound;
          SetFillStyle(1, blue);
          Bar(450, 80, 600, 100);
          delay(2000);
          SetFillStyle(1, red);
          Bar(450, 80, 600, 100);
        end;
    else
      begin
        sound(150);
        delay(50);
        nosound;
      end;
    end;
  until letter = #27;

  CloseGraph;
end.

