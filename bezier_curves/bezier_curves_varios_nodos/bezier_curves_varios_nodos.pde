Curva[] curvas = new Curva[100];
float x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, stroke;
color col;

void setup() {
  size(1200, 900);
  noFill();  
  frameRate(100);
  blendMode(SCREEN);
  colorMode(HSB, 360, 100, 100, 100);
  
}

void draw() {
  background(15);
  
  for (int i = 0; i < curvas.length; i++) {
    //x1 = random(0+width/5, width-width/5);
    x1 = width/2;
    y1 = 0;
    x2 = random(width, width - (width/8));
    y2 = random((height/4) - 100, (height/4) + 100);
    x3 = random(0, width/8);
    y3 = random((height/4) - 100, (height/4) + 100);
    x4 = width/2 + random(-20,20);
    y4 = height/2 + random(-10,10);
    x5 = random(width, width - (width/8));
    y5 = random((height-(height/4)) - 100, (height-(height/4)) + 100);;
    x6 = random(0, width/8);;
    y6 = random((height-(height/4)) - 100, (height-(height/4)) + 100);
    x7 = width/2;
    y7 = height;
    
    col = color(random(170, 190), random(40, 50), random(80, 100), map(x1, 0, width, 0, 100));  
    stroke = random(0, 3);

    curvas[i] = new Curva(x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, col, stroke);
  }

  for (int i = 0; i < curvas.length; i++) {
    curvas[i].dibuja();
  }
  
  noLoop();
}

class Curva {
  float curvaX1, curvaY1, curvaX2, curvaY2, curvaX3, curvaY3, curvaX4, curvaY4, curvaX5, curvaY5, curvaX6, curvaY6, curvaX7, curvaY7, curvaStroke, curvaVel;
  color curvaCol;

  Curva (float inCurvaX1, float inCurvaY1, 
         float inCurvaX2, float inCurvaY2,
         float inCurvaX3, float inCurvaY3,
         float inCurvaX4, float inCurvaY4,
         float inCurvaX5, float inCurvaY5,
         float inCurvaX6, float inCurvaY6,
         float inCurvaX7, float inCurvaY7,
         color inCurvaCol, float inCurvaStroke) {
           
    curvaX1 = inCurvaX1;  // punto de inicio
    curvaY1 = inCurvaY1;  // punto de inicio
    curvaX2 = inCurvaX2;  // punto de control 1
    curvaY2 = inCurvaY2;  // punto de control 1
    curvaX3 = inCurvaX3;  // punto de control 2
    curvaY3 = inCurvaY3;  // punto de control 2
    curvaX4 = inCurvaX4;  // segundo punto
    curvaY4 = inCurvaY4;  // segundo punto
    curvaX5 = inCurvaX5;  // punto de control 3
    curvaY5 = inCurvaY5;  // punto de control 3
    curvaX6 = inCurvaX6;  // punto de control 4
    curvaY6 = inCurvaY6;  // punto de control 4
    curvaX7 = inCurvaX7;  // punto de finalización
    curvaY7 = inCurvaY7;  // punto de finalización
    curvaCol = inCurvaCol;  // transparencia
    curvaStroke = inCurvaStroke;  // stroke weight
  }

  void dibuja() {
    strokeWeight(curvaStroke);
    stroke(curvaCol);
    beginShape();
    vertex(curvaX1, curvaY1);
    bezierVertex(curvaX2, curvaY2, curvaX3, curvaY3, curvaX4, curvaY4);
    bezierVertex(curvaX5, curvaY5, curvaX6, curvaY6, curvaX7, curvaY7);
    endShape();
  }

}

void mousePressed() {
  loop();
  
  if (mouseButton == RIGHT) saveFrame("####.png");
}
