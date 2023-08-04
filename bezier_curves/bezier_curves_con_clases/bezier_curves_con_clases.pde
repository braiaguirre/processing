Curva[] curvas = new Curva[50];
float x1, y1, x2, y2, x3, y3, x4, y4, stroke, vel;
color col;

void setup() {
  size(1200, 900);
  noFill();  
  frameRate(100);
  blendMode(SCREEN);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i = 0; i < curvas.length; i++) {
    x1 = random(0+width/10, width-width/10);
    y1 = 0;
    x2 = random(width, width - (width/8));
    y2 = random((height/2) - 100, (height/2) + 100);
    x3 = random(0, width/8);
    y3 = random((height/2) - 100, (height/2) + 100);
    x4 = width/2;
    y4 = height;
    col = color(random(175, 190), random(40, 50), random(95, 100), map(x1, 0, width, 0, 80));  
    stroke = random(0, 3);
    vel = random(0, 20);

    curvas[i] = new Curva(x1, y1, x2, y2, x3, y3, x4, y4, col, stroke, vel);
  }
}

void draw() {
  background(50);



  for (int i = 0; i < curvas.length; i++) {
    curvas[i].dibuja();
    curvas[i].update();
  }
}

class Curva {
  float curvaX1, curvaY1, curvaX2, curvaY2, curvaX3, curvaY3, curvaX4, curvaY4, curvaStroke, curvaVel;
  color curvaCol;

  Curva (float inCurvaX1, float inCurvaY1, float inCurvaX2, float inCurvaY2, float inCurvaX3, float inCurvaY3, float inCurvaX4, float inCurvaY4, color inCurvaCol, float inCurvaStroke, float inCurvaVel) {
    curvaX1 = inCurvaX1;  // punto de inicio
    curvaY1 = inCurvaY1;  // punto de inicio
    curvaX2 = inCurvaX2;  // punto de control 1
    curvaY2 = inCurvaY2;  // punto de control 1
    curvaX3 = inCurvaX3;  // punto de control 2
    curvaY3 = inCurvaY3;  // punto de control 2
    curvaX4 = inCurvaX4;  // punto de finalización
    curvaY4 = inCurvaY4;  // punto de finalización
    curvaCol = inCurvaCol;  // transparencia
    curvaStroke = inCurvaStroke;  // stroke weight
    curvaVel = inCurvaVel;  // velocidad de movimiento
  }

  void dibuja() {
    strokeWeight(curvaStroke);
    stroke(curvaCol);
    beginShape();
    vertex(curvaX1, curvaY1);
    bezierVertex(curvaX2, curvaY2, curvaX3, curvaY3, curvaX4, curvaY4);
    endShape();
  }

  void update() {
    curvaX2 += curvaVel;
    curvaX3 -= curvaVel;
    
    if (curvaX3 < 0 || curvaX2 > width) {
      curvaVel *= -1;
    }
  }
}

void mousePressed() {
  loop();
}
