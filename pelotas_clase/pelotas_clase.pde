float red, green, blue, transp;
int x1, y1, i1, x2, y2, i2, x3, y3, i3, cont;

void setup() {
  fullScreen();
  background(0, 255, 44);  
  noStroke();
  x2 = -100;
}

void draw() {

  if (cont < 5) {
    background(0);
    red = random(50, 50);
    green = random(130, 150);
    blue = random(50, 150);
    transp = random(150, 200);

    fill(red, green, blue);
    ellipse(x1, y1, 90, 90);

    x1 += 10;
    y1 += 10;

    if (x1 > width - 45) {
      i1 += 100;
      x1 = i1;
      y1 = 0;
      cont ++;
    }

    if (y1 > height - 45) {
      i1 += 100;
      x1 = i1;
      y1 = 0;
      cont ++;
    }

    if (i1 > width - 45) {
      i1 = 0;
      x1 = i1;
      y1 = 0;
    }
  }
  
  if (cont > 4 && cont < 10) {
    background(0);
    red = random(50, 50);
    green = random(130, 150);
    blue = random(50, 150);
    transp = random(150, 200);

    fill(red, green, blue);
    ellipse(x1, y1, 90, 90);
    ellipse(x2, y2, 90, 90);

    x1 += 10;
    y1 += 10;
    x2 += 10;
    y2 += 10;

    if (x1 > width - 45) {
      i1 += 100;
      x1 = i1;
      y1 = 0;
      i2 += 100;
      x2 = i2;
      y2 = 0;
      cont += 1;
    }

    if (y1 > height - 45) {
      i1 += 100;
      x1 = i1;
      y1 = 0;
      i2 += 100;
      x2 = i2;
      y2 = 0;
      cont += 1;
    }

    if (i1 > width - 45) {
      i1 = 0;
      x1 = i1;
      y1 = 0;
    }

  }
}
