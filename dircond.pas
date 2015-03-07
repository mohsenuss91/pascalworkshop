program directives;
begin
{$IFDEF dos}
  writeln('La variable turbo est définit');
{$ELSE}
  writeln('La variable Turbo n''est pas definit!');
{$ENDIF}
  readln;
end.

