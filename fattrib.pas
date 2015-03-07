program getattrib;

uses Dos;

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

var
  F: file;
  attribut: Word;
  filename: string;
begin
  writeln('Entrez le nom complet du fichier : ');
  readln(filename);
  if (FileExists(filename)) then
  begin
    assign(F, filename);
    reset(F);

    GetFAttr(F, attribut);

    if attribut and ReadOnly <> 0 then
      Writeln('Fichier en lecture seule');
    if attribut and Hidden <> 0 then
      Writeln('Fichier cache');
    if attribut and SysFile <> 0 then
      Writeln('Fichier systeme');
    if attribut and VolumeID <> 0 then
      Writeln('Unité de volume');
    if attribut and Directory <> 0 then
      Writeln('Repertoire');
    if attribut and Archive <> 0 then
      Writeln('Archive');

    close(F);
  end
  else
    writeln('Fichier Inexistant sur le disque!');

  readln;
end.

