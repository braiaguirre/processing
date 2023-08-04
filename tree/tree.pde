float theta, a;   

void setup() {
  size(900, 700);
  background(20);
}

void draw() {
  background(20);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  //float a = (mouseX / (float) width) * 90f;
  // Start the tree from the bottom of the screen
  translate(width/2, height);
  // Draw a line 120 pixels
  strokeWeight(2);
  line(0, 0, 0, -300);
  strokeWeight(1);
  
  // 1
  translate(0, -300); 
  a = 10;
  for (int i = 0; i < 7; i++) {
    a += i; 
    theta = radians(a); 
    stroke(255, 200); 
    branch(160);
  }
  // 2
  a = 15; 
  theta = radians(a); 
  stroke(255, 150); 
  translate(0, 50); 
  branch(160); 
  // 3
  a = 10; 
  theta = radians(a); 
  stroke(255, 80); 
  translate(0, 50); 
  branch(160); 
  // 4
  a = 5; 
  theta = radians(a); 
  stroke(255, 25); 
  translate(0, 50); 
  branch(160);
  
  noLoop();
}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66; 

    // All recursive functions must have an exit condition!!!!
    // Here, ours is when the length of the branch is 2 pixels or less
    if (h > 2) {
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
      rotate(theta); // Rotate by theta
      line(0, 0, 0, -h); // Draw the branch
      translate(0, -h); // Move to the end of the branch
      branch(h); // Ok, now call myself to draw two new branches!!
      popMatrix(); // Whenever we get back here, we "pop" in order to restore the previous matrix state

      // Repeat the same thing, only branch off to the "left" this time!
      pushMatrix(); 
      rotate(-theta); 
      line(0, 0, 0, -h); 
      translate(0, -h); 
      branch(h); 
      popMatrix();
  }
}
