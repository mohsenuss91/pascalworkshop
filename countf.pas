uses Dos, Crt;

var
  FileCount: Integer;
  extension: string[5];
  s: string;

procedure FindFile(DirName: string);
var
  DirInfo: SearchRec;
begin

  FindFirst(DirName + extension, Archive, DirInfo);
  while DosError = 0 do
  begin
    Writeln(DirInfo.Name);
    FileCount := Filecount + 1;
    FindNext(DirInfo);
  end;
  Writeln;

end;

procedure FindDir(PathName: string);
var
  DirInfo: SearchRec;
begin

  FindFirst(PathName + '*', Directory, DirInfo);

  while DosError = 0 do
  begin
    if ((DirInfo.Name <> '..') and (DirInfo.Name <> '.')) then
    begin
      Writeln('Repertoire de : ', PathName + DirInfo.Name + '\');
      FindFile(PathName + DirInfo.Name + '\');
      if Keypressed then
        Readln;
      FindDir(PathName + DirInfo.Name + '\');
    end;
    FindNext(DirInfo);
  end;

end;

begin

  ClrScr;

  FileCount := 0;
  s := ParamStr(1);
  extension := ParamStr(2);
  FindFile(s);
  FindDir(s);

  Writeln(FileCount, ' fichiers trouvés!');
  Readln;

end.

