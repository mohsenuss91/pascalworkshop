type
  PCellule = ^Cellule;
  Cellule = record
    valeur: integer;
    precedent, suivant: PCellule;
  end;

procedure ajouter(var liste: PCellule; valeur: integer);
var
  p: PCellule;
begin
  new(p);
  p^.valeur := valeur;
  p^.suivant := liste;
  p^.suivant^.precedent := p;
  liste := p;
end;

procedure afficher(liste: PCellule);
var
  p: PCellule;
begin
  p := liste;
  while p <> nil do
  begin
    writeln(p^.valeur);
    p := p^.suivant;
  end;
end;

procedure vider(liste: PCellule);
var
  p, r: PCellule;
begin
  p := liste;
  while (p <> nil) do
  begin
    r := p^.suivant;
    dispose(p);
    p := r;
  end;
end;

var
  liste: PCellule;
  nombre: integer;

begin
  writeln('Entrez les nombres à ajouter (0 pour quitter) : ');
  readln(nombre);
  while nombre <> 0 do
  begin
    ajouter(liste, nombre);
    readln(nombre);
  end;
  writeln('Valeurs de la liste : ');
  afficher(liste);
  readln;
  vider(liste);
end.

