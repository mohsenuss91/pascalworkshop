uses graph;

var
  GP, GM: integer;
  image: pointer;
  taille: word;

begin
  GP := detect;
  initGraph(GP, GM, 'd:\borland\tp7\bgi');
  if graphResult <> grOK then
    halt(0);

  rectangle(10, 10, 100, 100);
  rectangle(100, 100, 400, 200);

  taille := imageSize(0, 0, 100, 100);
  getmem(image, taille);
  getImage(0, 0, 100, 100, image^);

  readln;
  cleardevice;

  putImage(0, 0, image^, normalPut);
  freemem(image, taille);
  readln;
  closeGraph;
end.

