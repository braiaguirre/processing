import themidibus.*;

MidiBus myBus;
Particle[] particles;
int alpha = 4;  // brightness/transparency
int cant = 1000;  // amount of particles/lines
int fRate = 100;  // framerate
int mult = 1;  // multiplicador

void setup() {
  fullScreen();
  background(0);
  noStroke();
  setParticles();
  noCursor();
  MidiBus.list();
  myBus = new MidiBus(this, 0, 3);   // APC 40
}

void draw() {
  frameRate(fRate);  //sets framerate
  fill(0, alpha);
  rect(0, 0, width, height);

  loadPixels();
  for (Particle p : particles) {
    p.move();
  }
  updatePixels();
}

void setParticles() {
  particles = new Particle[cant];
  for (int i = 0; i < particles.length; i++) { 
    float x = width/2;  // tira un x random
    float y = height/2;  // tira un y random
    float increase = random(0, 36000);
    float red = map(y, 0, height, 255, 150);
    float green = map(y, 0, height, 255, 0);
    float blue = map(y, 0, height, 255, 0);
    int c = color(red, green, blue);
    
    particles[i]= new Particle(x, y, increase, c);  // crea cant partículas/pixeles
  }
}

void mousePressed() {
  setParticles();
}

class Particle {
  float posX, posY, incr, theta;
  color  c;

  Particle(float xIn, float yIn, float inIncr, color cIn) {
    posX = xIn;  // ingresa el x random
    posY = yIn;  // ingresa el y random
    incr = inIncr;  
    c = cIn; // ingresa el color
  }

  public void move() {
    update();
    wrap();
    display();
  }

  void update() {
    incr +=  0.01;
    theta = noise(posX * 0.006, posY * 0.004, incr) * PI;
    
    posX += mult * cos(theta);
    posY += mult * sin(theta);
  }

  void wrap() {
    //if (posX < 0) posX = width;
    if (posX < 0) posX = width/2;
    if (posX > width ) posX =  width/2;
    if (posY < 0 ) posY = height/2;
    if (posY > height) posY =  0;
  }
  
  void display() {
    if (posX > 0 && posX < width && posY > 0  && posY < height) {
      pixels[int(posX) + int(posY) * width] =  c;  // a cada pixel 
    }
  }
}

void controllerChange(int channel, int number, int value) {
  
  // knob 1 sets amount of particles
  if (number == 16); {
    cant = int(map(value, 0, 127, 1000, 15000));
  }
  // knob 2 sets brightness/transparency
  if (number == 17) {
    alpha = int(map(value, 0, 127, 32, 4));
  }
  // knob 3 sets framerate
  if (number == 18) {
     fRate = int(map(value, 0, 127, 30, 100));
  }
  // knob 3 sets framerate
  if (number == 19) {
     mult = int(map(value, 0, 127, 1, 10));
  }
  
  println(number);
}
