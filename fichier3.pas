uses dos;

function rechercher(nom, repertoire: string): string;
var
  dirInfo: SearchRec;
  repertoireComplet: string;
  resultat: string;
begin
  resultat := '';
  if repertoire[length(repertoire)] <> '\' then
    repertoireComplet := repertoire + '\'
  else
    repertoireComplet := repertoire;
  findFirst(repertoireComplet + nom, AnyFile, dirInfo);
  if dosError = 0 then
  begin
    if boolean(dirInfo.Attr and $01) then
      resultat := 'Read-Only';
    if boolean(dirInfo.Attr and $02) then
      resultat := resultat + ' Hidden';
    if boolean(dirInfo.Attr and $04) then
      resultat := resultat + ' SysFile';
    if boolean(dirInfo.Attr and $08) then
      resultat := resultat + ' VolumeID';
    if boolean(dirInfo.Attr and $10) then
      resultat := resultat + ' Directory';
    if boolean(dirInfo.Attr and $20) then
      resultat := resultat + ' Archive';
  end;
  rechercher := resultat;
end;

begin
  write(rechercher('*.* ', 'c:\'));
  readln;
end.

