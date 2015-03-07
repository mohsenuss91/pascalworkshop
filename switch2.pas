program switch2;
var
  valeur: integer;
begin
  writeln('1. Effectuer une multiplication');
  writeln('2. Effectuer une addition');
  writeln('3. Effectuer une soustraction');
  writeln('4. Effectuer une division');
  readln(valeur);
  if (valeur = 1) then
    writeln('Vous avez choisit la multiplication')
  else if (valeur = 2) then
    writeln('Vous avez choisit la addition')
  else if (valeur = 3) then
    writeln('Vous avez choisit la soustraction')
  else if (valeur = 4) then
    writeln('Vous avez choisit la division')
  else
    writeln(ÊChoix incorrect∆);
  readln;
end

