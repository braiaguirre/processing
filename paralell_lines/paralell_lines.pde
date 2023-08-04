float posX;
float ang = 0.1;

void setup() {
  size(700, 850);
  frameRate(20);
  stroke(255);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotate(ang);
  for (int i = 0; i < 30; i++) {
    strokeWeight(random(0, 13));
    stroke(random(0, 255), random(100, 255));
    posX = random(width*0.1, width);
    line(posX, -height, posX, height);
    line(-posX, -height, -posX, height);
  }
  ang += 0.01;
  //filter(BLUR, 1);
}
