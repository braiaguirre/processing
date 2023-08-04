

void setup() {
 size(1000,700);
 background(0);
 PFont f = createFont("Calibri", 400, true);
 textFont(f);
 textAlign(CENTER,CENTER);
}

void draw() {
  frameRate(30);
  if (keyPressed) {
    clear();
    fill(random(0,255),random(0,255),random(0,255),random(50,200));
    text(key,width/2,height/2);
  }
}
