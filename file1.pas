program file1;
uses crt;

procedure up(var s: string);
var
  i: Integer;
begin
  for i := 1 to Length(s) do
    s[i] := UpCase(s[i]);
end;

var
  F: Text;
  s: string;
  sortie: boolean;
begin
  clrscr;

  assign(F, 'c:\tp\exercice.txt');
  rewrite(F);
  sortie := false;

  repeat
    writeln('Entrez une chaine a ecrire dans le fichier');
    readln(s);
    up(s);
    if (s = 'FIN') then
      sortie := true
    else
      writeln(F, s);
  until sortie = true;

  close(F);
  readln;
end.

