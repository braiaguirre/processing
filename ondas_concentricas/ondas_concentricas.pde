
Circle[] circles = new Circle[30];
int backCol = 5;

void setup() {
  size(1000, 1000);
  ellipseMode(CENTER);
  frameRate(100);
  noCursor();
  fill(0, 0);
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(i*50, i*50);
  }
}

void draw() {
  background(5);
  strokeWeight(3);  
  
  //ellipse(width/2, height/2, 100, 100);
  for (int i = 0; i < circles.length; i++) {
    circles[i].update();
    circles[i].move();
    
  }
}

class Circle {
  float circleVelX, circleVelY;
  
  Circle(float inVelX, float inVelY) {
    circleVelX = inVelX;
    circleVelY = inVelY;
  }
  
  void move() {
    if (circleVelY > height) {
      circleVelX = 0;
      circleVelY = 0;
    }
    strokeWeight(map(circleVelX, 0, width, 30, 0.5));
    stroke(map(circleVelX, 0, width, 200, 0), map(circleVelX, 0, width, 255, random(150,200)),  200,  map(circleVelX, 0, width, 255, 0));
    ellipse(width/2, height/2, circleVelX, circleVelY);
  }
  
  void update() {
    circleVelX += map(circleVelX, 0, width, 0.5, 25);
    circleVelY += map(circleVelY, 0, width, 0.5, 25);
  }
}


void mousePressed() {
  saveFrame("####.png"); 
}
