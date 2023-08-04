int num = 15;
int i = 0;
float[] x = new float[num];
float[] y = new float[num];
float rndR1, rndG1, rndB1, rndT1, size1;
float rndR2, rndG2, rndB2, rndT2, size2;
float rndR3, rndG3, rndB3, rndT3, size3;
float xx = 0;
float yy = 0;
float A = 100;
float n = 0;
boolean ok = false;
int tiempoInicio = millis();
int duracion = 1500;

void setup() {
  noStroke();
  fill(255, 102);
  frameRate(30); 
  noCursor();
  background(0);
  fullScreen();
  PFont f = createFont("Calibri", 100, true);
  textFont(f);
  textAlign(CENTER,CENTER);
}

void draw() {
  if (ok == false) {
    fill(250);
    text("MOVÉ EL CURSOR",width/2,height/2);
    if (millis() - tiempoInicio > duracion) {
        ok = true;
    }
  }
  else {
    background(0);
    rndR1 = random(50, 50);
    rndG1 = random(130, 150);
    rndB1 = random(50, 150);
    rndT1 = random(30, 140);
    rndR2 = random(0, 100);
    rndG2 = random(150, 200);
    rndB2 = random(200, 255);
    rndT2 = random(60, 180);
    rndR3 = random(100, 100);
    rndG3 = random(100, 120);
    rndB3 = random(200, 230);
    rndT3 = random(20, 100);
    size1 = random(3,12);
    size2 = random(3,12);
    size3 = random(3,12);
    xx = mouseX;
    yy = mouseY;
    
    for (int i = num-1; i > 0; i--) {
      x[i] = x[i-1];
      y[i] = y[i-1];
    }
    
    x[0] = xx + A*sin(radians(n*(random(2,4))));
    y[0] = yy + A*sin(radians(n*(random(2,4))));
    n += 1;
  
    for (int i = 0; i < num; i++) {
      fill(rndR1,rndG1,rndB1,rndT1);
      ellipse(x[i], y[i], i*size1, i*size1);
      
      fill(rndR2,rndG2,rndB2,rndT2);
      ellipse(x[i]+50, y[i], i*size2, i*size2);
      
      fill(rndR3,rndG3,rndB3,rndT3);
      ellipse(x[i]+25, y[i]+75, i*size3, i*size3);
    }
  }
}
