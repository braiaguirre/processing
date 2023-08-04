Curva[] curvas = new Curva[100];
float x1, y1, x2, y2, x3, y3, x4, y4, 
  x5, y5, x6, y6, x7, y7, x8, y8, 
  x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, stroke;
color col;

void setup() {
  size(1400, 1540);
  noFill();  
  frameRate(100);
  blendMode(SCREEN);
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(15);

  for (int i = 0; i < curvas.length; i++) {
    x1 = width/2;  // punto 1
    y1 = 0;  // punto 1

    x2 = (width - (width/6)) + random(-40, 40);
    y2 = random((height/8) - 50, (height/8) + 50);
    x3 = (0 + (width/6)) + random(-40, 40);
    y3 = random((height/8) - 50, (height/8) + 50);

    x4 = width/2 + random(-20, 20);  // punto 2
    y4 = height/4 + random(-10, 10);  // punto 2

    x5 = random(width, (width - (width/8)) + random(-50, 50));
    y5 = random( ( (height/2) - (height/8) ) - 50, ( (height/2) - (height/8) + 50));
    x6 = random(0, (width/8)  + random(-50, 50));
    y6 = random( ( (height/2) - (height/8) ) - 50, ( (height/2) - (height/8) + 50));

    x7 = width/2 + random(-10, 10);  // punto 3
    y7 = height/2 + random(-10, 10);  // punto 3

    x8 = random(width, (width - (width/8)) + random(-50, 50));
    y8 = random( ( (height/2) + (height/8) ) - 50, ( (height/2) + (height/8) + 50));
    x9 = random(0, (width/8) + random(-50, 50));
    y9 = random( ( (height/2) + (height/8) ) - 50, ( (height/2) + (height/8) + 50));

    x10 = width/2 + random(-20, 20);  // punto 4
    y10 = (height - (height/4)) + random(-10, 10);  // punto 4

    x11 = (width - (width/6)) + random(-40, 40);
    y11 = random( (height - (height/8) - 50), (height - (height/8) - 50) + 50);
    x12 = (0 + (width/6)) + random(-40, 40);
    y12 = random( (height - (height/8) - 50), (height - (height/8) - 50) + 50);

    x13 = width/2;  // punto 5
    y13 = height;  // punto 5

    col = color(random(170, 190), random(40, 50), random(80, 100), map(x1, 0, width, 0, 100));  
    stroke = random(0, 2.5);

    curvas[i] = new Curva(x1, y1, x2, y2, x3, y3, x4, y4, 
      x5, y5, x6, y6, x7, y7, x8, y8, 
      x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, col, stroke);
  }

  for (int i = 0; i < curvas.length; i++) {
    curvas[i].dibuja();
  }

  noLoop();
}

class Curva {
  float curvaX1, curvaY1, curvaX2, curvaY2, curvaX3, curvaY3, curvaX4, curvaY4, 
    curvaX5, curvaY5, curvaX6, curvaY6, curvaX7, curvaY7, curvaX8, curvaY8, 
    curvaX9, curvaY9, curvaX10, curvaY10, curvaX11, curvaY11, curvaX12, curvaY12, curvaX13, curvaY13, 
    curvaStroke, curvaVel;
  color curvaCol;

  Curva (float inCurvaX1, float inCurvaY1, 
    float inCurvaX2, float inCurvaY2, 
    float inCurvaX3, float inCurvaY3, 
    float inCurvaX4, float inCurvaY4, 
    float inCurvaX5, float inCurvaY5, 
    float inCurvaX6, float inCurvaY6, 
    float inCurvaX7, float inCurvaY7, 
    float inCurvaX8, float inCurvaY8, 
    float inCurvaX9, float inCurvaY9, 
    float inCurvaX10, float inCurvaY10, 
    float inCurvaX11, float inCurvaY11, 
    float inCurvaX12, float inCurvaY12, 
    float inCurvaX13, float inCurvaY13, 
    color inCurvaCol, float inCurvaStroke) {

    curvaX1 = inCurvaX1;  // punto 1
    curvaY1 = inCurvaY1;  // punto 1
    curvaX2 = inCurvaX2;  
    curvaY2 = inCurvaY2;  
    curvaX3 = inCurvaX3;  
    curvaY3 = inCurvaY3;  
    curvaX4 = inCurvaX4;  // punto 2
    curvaY4 = inCurvaY4;  // punto 2
    curvaX5 = inCurvaX5;  
    curvaY5 = inCurvaY5;  
    curvaX6 = inCurvaX6;  
    curvaY6 = inCurvaY6;  // punto 3
    curvaX7 = inCurvaX7;  // punto 3
    curvaY7 = inCurvaY7;  
    curvaX8 = inCurvaX8;  
    curvaY8 = inCurvaY8;
    curvaX9 = inCurvaX9;  
    curvaY9 = inCurvaY9;
    curvaX10 = inCurvaX10;  // punto 4  
    curvaY10 = inCurvaY10;  // punto 4
    curvaX11 = inCurvaX11;  
    curvaY11 = inCurvaY11;
    curvaX12 = inCurvaX12;  
    curvaY12 = inCurvaY12;
    curvaX13 = inCurvaX13;  // punto 5
    curvaY13 = inCurvaY13;  // punto 5

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
    bezierVertex(curvaX8, curvaY8, curvaX9, curvaY9, curvaX10, curvaY10);
    bezierVertex(curvaX11, curvaY11, curvaX12, curvaY12, curvaX13, curvaY13);
    endShape();
  }
}

void mousePressed() {
  loop();

  if (mouseButton == RIGHT) saveFrame("####.png");
}
