int margin = 30;  // margin size
int maxH = 360;  // max hue
int minH = 0;  // min hue
int maxS = 100; // max saturation
int minS = 8;  // min saturation
int maxB = 100; // max brightness
int minB = 80;  // min brightness
int minSep = 1;  // min separation between lines (y-axis)
int maxSep = 20;  // max separation between lines (y-axis)
int amnt = 4;  // amount of colors

float posX = margin;
float posY = margin;
color[] col = new color[amnt];
int band = 0;

void setup() {
  size(1000, 1100);
  noFill();
  colorMode(HSB, 360, 100, 100, 100);
  loadPixels();
  for (int i = 0; i < col.length; i++) {
    col[i] = color(random(minH, maxH), random(minS, maxS), random(minB, maxB));
  }
}

void draw() {
  background(10);

  for (int i = 0; i < pixels.length; i++) {
    if (posX > width - margin) {
        posX = margin;
        posY += random(minSep, maxSep);
    }
    
    if (posX < width - margin && posY < height - margin) {
      strokeWeight(random(0.5, 5));
      stroke(col[int(random(0, col.length))], random(0, 200));
      point(posX, posY);  
      
      posX += random(0.5, 10);  
    }
  }
  noLoop();
}

void mousePressed() {
  
  if (mouseButton == LEFT) {
    for (int i = 0; i < col.length; i++) {
      col[i] = color(random(minH, maxH), random(minS, maxS), random(minB, maxB));
    }
    posX = margin;
    posY = margin;
    band = 0;
    loop();
  }
  
  if (mouseButton == RIGHT) saveFrame("####.png");
}
