type
  PNoeud = ^Noeud;
  Noeud = record
    valeur: integer;
    suivantGauche, suivantDroite: PNoeud;
  end;

procedure ajouter(var liste: PNoeud; valeur: integer);
var
  p: PNoeud;
begin
  if liste <> nil then
  begin
    if valeur < liste^.valeur then
      ajouter(liste^.suivantgauche, valeur);
    if valeur > liste^.valeur then
      ajouter(liste^.suivantDroite, valeur);
  end
  else
  begin
    new(liste);
    liste^.valeur := valeur;
    liste^.suivantGauche := nil;
    liste^.suivantDroite := nil;
  end;
end;

procedure afficher(liste: PNoeud);
begin
  if liste <> nil then
  begin
    writeln(liste^.valeur);
    if liste^.suivantGauche <> nil then
    begin
      write('suivant gauche : ');
      afficher(liste^.suivantGauche);
    end;
    if liste^.suivantDroite <> nil then
    begin
      write('suivant droite : ');
      afficher(liste^.suivantDroite);
    end;
  end;
end;

procedure vider(liste: PNoeud);
begin
  if liste <> nil then
  begin
    if liste^.suivantGauche <> nil then
      vider(liste^.suivantGauche);
    if liste^.suivantDroite <> nil then
      vider(liste^.suivantDroite);
    dispose(liste);
  end;
end;

var
  liste: PNoeud;
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

