// CONFIG --------------------------------------------------
int cant = 80;  // amount of dots (and therefore, lines)
float h, s, b, aPunto, aLinea;

// VARIABLES -----------------------------------------------
float rndX, rndY;
color col;
Linea lineas;
Punto[] puntos = new Punto[cant];

float[] posX1 = new float[puntos.length];
float[] posY1 = new float[puntos.length];
float[] posX2 = new float[puntos.length];
float[] posY2 = new float[puntos.length];

// SETUP + DRAW ---------------------------------------------
void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  size(1000, 1100);
  blendMode(SCREEN);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  background(0);

  // CONFIG (CHANGE THESE VALUES TO VARIATE COLORS -----------
  h = random(0, 360);    // hue
  s = random(100, 100);  // saturation
  b = random(100, 100);  // brightness
  aPunto = random(0, 100);  // alpha
  aLinea = random(10, 15);  //alpha

  for (int i = 0; i < puntos.length; i++) {
    posX1[i] = random((-width/2)+150, (width/2)-150);
    posY1[i] = random((-height/2)+100, (height/2)-100);
    posX2[i] = -(posX1[i]);
    posY2[i] = posY1[i];    

    col = color(h, s, b, aPunto);

    puntos[i] = new Punto(posX1[i], posY1[i], posX2[i], posY2[i], col);
    puntos[i].dibuja();
  }

  lineas = new Linea(posX1, posY1, posX2, posY2);
  lineas.dibuja();
  noLoop();
}

// PUNTOS ------------------------------------------------
class Punto {
  float puntoPosX1, puntoPosY1, puntoPosX2, puntoPosY2;
  color puntoCol;

  Punto(float inPuntoPosX1, float inPuntoPosY1, float inPuntoPosX2, float inPuntoPosY2, color inPuntoCol) {
    puntoPosX1 = inPuntoPosX1;
    puntoPosY1 = inPuntoPosY1;
    puntoPosX2 = inPuntoPosX2;
    puntoPosY2 = inPuntoPosY2;
    puntoCol = inPuntoCol;
  }

  void dibuja() {
    fill(puntoCol);

    ellipse(puntoPosX1, puntoPosY1, 3, 3);
    ellipse(puntoPosX2, puntoPosY2, 3, 3);
  }
}

// LINEAS -------------------------------------------------
class Linea {
  float[] lineaPosX1 = new float[puntos.length];
  float[] lineaPosY1 = new float[puntos.length];
  float[] lineaPosX2 = new float[puntos.length];
  float[] lineaPosY2 = new float[puntos.length];

  Linea (float[] inLineaPosX1, float[] inLineaPosY1, float[] inLineaPosX2, float[] inLineaPosY2) {
    for (int i = 0; i < puntos.length; i++) {    
      lineaPosX1[i] = inLineaPosX1[i];
      lineaPosY1[i] = inLineaPosY1[i];
      lineaPosX2[i] = inLineaPosX2[i];
      lineaPosY2[i] = inLineaPosY2[i];
    }
  }

  void dibuja() {
    stroke(h - 15, s, b, aLinea);
    strokeWeight(random(0.1, 0.3));
    for (int i = 0; i < puntos.length; i++) {
      for (int j = 0; j < puntos.length; j++) {
        line(lineaPosX1[i], lineaPosY1[i], lineaPosX2[j], lineaPosY2[j]);
      }
    }
    noStroke();
  }
}

// GENERATES ANOTHER ONE, OR SAVES WITH RIGHT MOUSE BUTTON
void mousePressed() {
  loop();

  if (mouseButton == RIGHT) saveFrame("####.png");
}
