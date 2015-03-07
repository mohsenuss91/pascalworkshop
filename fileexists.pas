program file2;
uses crt;

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

begin

end.

