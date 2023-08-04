float x, y;
float tx = random(1, 4);
float ty = random(1, 4);
float ang = random(0, 360);
float posx[] = new float[5000];
float posy[] = new float[5000];
int cont = 0;

void setup() {
  size(650, 650);
  background(0);
  x = 0;
  y = 0;
}

void draw() {
  translate(width/tx, height/ty);
  ang += random(0.1, 1);
  rotate(radians(ang));
  
  stroke(255);
  strokeWeight(2);
  point(x, y);
  
  
  posx[cont] = x;
  posy[cont] = y;
  
  x += cos(width);
  y += cos(height);
  
  print("sigue");
  if (cont > posx.length - 1) {
    dibujar_ramas();
  }
}

void dibujar_ramas() {
  
  for (i
  
  noLoop();
}
