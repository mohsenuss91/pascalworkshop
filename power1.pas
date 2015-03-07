program powerxy;
uses crt;

function power(x: integer; y: integer): longint;
var
  i: integer;
  p: longint;
begin
  p := 1;
  for i := 1 to y do
    p := p * x;

  power := p;
end;

begin
end.

