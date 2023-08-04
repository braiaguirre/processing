float grassY0, grassY1;
float grassX0, grassX1;
float despl;
int cont = 0;

void setup() {
  size(1400, 950);
  frameRate(100);
  noFill();
  blendMode(SCREEN);
  smooth(8);
}

void draw () {
  
  background(10);
  
  for (int i = 0; i < 4000; i++) {
    grassX0 = random(0, width);
    grassX1 = grassX0 + random(-10, 10);
    grassY0 = height;
    grassY1 = height - (height * random(0.0001, map(grassX0, 0, width, random(0.06, 0.1), random(0.06, 0.1))));
    despl = random(-30, 30);
    
    stroke(random(130, 150), random(200, 250), 36, random(30, 100));
    bezier(grassX0, // PRIMER PUNTO
      grassY0, // PRIMER PUNTO
      grassX0 + despl, 
      grassY0 - 10, 
      grassX0 + (despl/2), 
      grassY1 + 10, 
      grassX1, // SEGUNDO PUNTO
      grassY1);  // SEGUNDO PUNTO
    println(grassY1);
  }

  noLoop();
}


void mousePressed() {
  loop();  
}
