program annuaire3;
uses crt;
{$I FileI.pas}
type
  Personne = record
    nom: string[30];
    telephone: string[10];
    nCarte: word;
  end;
  FPersonne = file of Personne;

procedure DisplayMenu;
begin
  writeln('1. Ajouter une personne');
  writeln('2. Afficher le contenu du fichier');
  writeln('3. Quitter le programme');
end;

function FileExists(FileName: string): Boolean;
var
  F: file;
begin
{$I-}
  Assign(F, FileName);
  FileMode := 0;
  Reset(F);
  Close(F);
{$I+}
  FileExists := (IOResult = 0) and (FileName <> '');
end;

procedure AjoutePersonne(var F: FPersonne; P: Personne);
begin
  reset(F);
  seek(F, FileSize(F));

  write(F, P);

  close(F);
end;

procedure DisplayFile(var F: FPersonne);
var
  P: Personne;
begin
  reset(F);
  while not eof(F) do
  begin
    read(F, P);
    writeln('Nom : ', P.nom);
    writeln('Telephone : ', P.telephone);
    writeln('Numero de carte banquaire : ', P.nCarte);
    writeln;
  end;
  close(F);
end;

var
  F: FPersonne;
  P: Personne;
  choix: integer;
begin
  clrscr;
  choix := 0;
  assign(F, 'c:\tp\annuaire.dat');
  rewrite(F);

  repeat
    writeln;
    DisplayMenu;
    repeat
{$I-}
      write('Entrez un choix : ');
      readln(choix);
{$I+}
    until IOResult = 0;
    writeln;
    case choix of
      1:
        begin
          repeat
            Write('Entrez le nom : ');
            readln(P.nom);
          until isString(P.nom);
          repeat
            Write('Entrez le numero de telephone : ');
            readln(P.telephone);
          until isNumber(P.telephone);
          repeat
{$I-}
            Write('Entrez le numero de carte banquaire : ');
            readln(P.nCarte);
{$I+}
          until IOResult = 0;
          AjoutePersonne(F, P);
        end;
      2:
        begin
          writeln('Contenu du fichier...');
          DisplayFile(F);
        end;
      3: ;
    else
      writeln('Entrée incorrecte!');
    end;
  until choix = 3;

end.

