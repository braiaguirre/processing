int i = 0;

void setup() {
  background(0);
  stroke(255);
  fullScreen();
  frameRate(100);
  noStroke();
}

void draw() {
  background(map(mouseX, 0, width, 50, 200), 30, 250);
  translate(width/2, height/2);
  rotate(radians(i));
  fill(255, 200);
  ellipse(-75, -100, 150, 150);
  fill(255, 150);
  ellipse(-95, -80, 150, 150);
  fill(255, 90);
  ellipse(-115, -60, 150, 150);
  fill(255, 50);
  ellipse(-130, -40, 150, 150);
  fill(255, 20);
  ellipse(-140, -20, 150, 150);
  i++;
  if (i > 360) i = 0;
}
