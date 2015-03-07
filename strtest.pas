unit strTest;

interface

function isAlpha(c: char): boolean;
function isDigit(c: char): boolean;
function isString(s: string): boolean;
function isNumber(s: string): boolean;

implementation

function isAlpha(c: char): boolean;
begin
  if (((ord(c) >= 97) and (ord(c) <= 122)) or ((ord(c) >= 65) and (ord(c) <=
    90))) then
    isAlpha := true
  else
    isAlpha := false;
end;

function isDigit(c: char): boolean;
begin
  if ((ord(c) >= 48) and (ord(c) <= 57)) then
    isDigit := true
  else
    isDigit := false;

end;

function isString(s: string): boolean;
var
  i: integer;
begin
  i := 1;
  while ((i <= length(s)) and isAlpha(s[i])) do
    i := i + 1;

  if (i > length(s)) then
    isString := true
  else
    isString := false;
end;

function isNumber(s: string): boolean;
var
  i: integer;
begin
  i := 1;
  while ((i <= length(s)) and isDigit(s[i])) do
    i := i + 1;

  if (i > length(s)) then
    isNumber := true
  else
    isNumber := false;
end;

begin
  (*Pas d'initialisation*)
end.

