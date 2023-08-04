int num = 50;
int[] x = new int[num];
int[] y = new int[num];

void setup() {
  background(255);
  size(800,600);
  noStroke();
  noCursor();
}

void draw() {
  
  if (mousePressed == true) {
    frameRate(18);
    
    fill(150,50,0,50);
    ellipse(width-mouseX,mouseY,400,100);
    
    fill(200,100,100,10);
    ellipse(width-mouseX+50,mouseY,100,100);
    
    fill(255,200,200, 75);
    ellipse(width-mouseX+100,mouseY,100,100);
  } else {
     frameRate(24);
    
    fill(0,50,150,50);
    ellipse(width-mouseX,mouseY,100,100);
    
    fill(100,100,200,10);
    ellipse(width-mouseX+50,mouseY,100,100);
    
    fill(200,200,255, 75);
    ellipse(width-mouseX+100,mouseY,100,100);
  }
  
}
