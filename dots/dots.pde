int colour;
int randomX1, randomY1;
int[] randomValX = new int[9];
int[] randomValY = new int[10];
int cont = 50;
int band = 0;
int bandB = 0;
int lifespan = 20;

void setup() {
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  smooth(8);

  //llena el vector con las posiciones en X posibles
  for (int i = 0; i < 9; i++) {
    randomValX[i] = cont;
    cont += 100;
  }

  //reset contadora
  cont = 50;

  //llena el vector con las posiciones en Y posibles
  for (int i = 0; i < 10; i++) {
    randomValY[i] = cont;
    cont += 100;
  }
}

void draw() {

  //se dibujan los rectángulos sólo una vez
  if (bandB == 0) {

    for (int i = 0; i < 30; i ++) {
      noStroke();
      fill(random(100, 250), 100, 100, random(50, 80));

      randomX1 = (randomValX[int(random(0, 9))]) - 25;
      randomY1 = (randomValY[int(random(0, 10))]) - 25;
      rect(randomX1, randomY1, 150, 50);
    }

    bandB = 1;
  }

  //se dibujan los puntos sólo una vez
  if (band == 0) {
    //recorrido vertical
    for (int j = 50; j < 999; j += 100) {

      //recorrido horizaontal
      for (int i = 50; i<999; i += 100) {
        colorMode(RGB, 255, 255, 255, 255);
        strokeWeight(random(10, 20));
        colour = int(random(0, 255));
        if (colour >= 0 && colour < 120) {
          colour = 0;
        } else {
          colour = 255;
        }
        stroke(colour);
        point(i, j);
        colorMode(HSB, 360, 100, 100, 100);
      }
    }
    band = 1;
    //saveFrame("####.png");
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    saveFrame("####.png");
  } else {
    background(0, 0, 100);
    draw(); 
    bandB = 0;
    band = 0;
  }
}
