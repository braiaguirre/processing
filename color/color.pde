void setup() {
background(255);
size(500,500);
noStroke(); 
}

void draw() {
// Bright red
fill(150,0,0,50);
ellipse(mouseX,mouseY,100,100);

// Dark red
fill(127,0,0,10);
ellipse(mouseX+100,mouseY,100,100);

// Pink (pale red)
fill(255,200,200, 75);
ellipse(mouseX+200,mouseY,100,100);
}
