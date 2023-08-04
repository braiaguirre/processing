var waveSys;
var W = 500, 
  H = 500;
var x =0, 
  y = 0;
var rnd;

function setup() {
  createCanvas(windowWidth, windowHeight);
  smooth(8);
  frameRate(100);
  strokeWeight(0.1);
  stroke(255);
  noFill();
  //initialize class with universal x noise scale and noise speed
  waveSys = new NoisyWaves(0.02, 0.008);
}

function draw() {
  rnd = random(3,5);
  background(rnd);
  stroke(255, 255, random(240,255), random(130,255));
  waveSys.run();
  push();
  strokeWeight(1);
  //fill(random(0,3));
  //ellipse(windowWidth/2, windowHeight/2, 495, 495);
  
  for (var i = 0; i < 495; i++) {
        stroke(rnd, 255-(255 * i/1500));
        ellipse(windowWidth/2, windowHeight/2, i, i);
        print("123");
    }
  pop();
  
}

function windowResized() {
  createCanvas(windowWidth, windowHeight);
  waveSys.adjust();  
}


function NoisyWaves(xscale, yspeed) {
  this.waves = [];
  this.N = 150;
  for (var i = 0; i < this.N; i++) {
    let y_attn = map(i, 0, this.N, -H*0.12, H*0.3);
    this.waves.push(new NoisySine(xscale, yspeed, y_attn, i*0.005));
  }
}

NoisyWaves.prototype.run = function() {
  for (var i = 0; i < this.N; i++) {
    this.waves[i].display();
  }
}

NoisyWaves.prototype.adjust = function() {
  for (var i = 0; i < this.N; i++) {
    this.waves[i].y_attn = map(i, 0, this.N, -H*0.12, H*0.3);
  }
}

/*
  Noisy Sinewave Class
 x_scale & y_speed: around 0.01 is good
 y_attn : y attenuation: around 1/10 to 1/3 of the window height is good
 */

function NoisySine(x_scale_, y_speed_, y_attn_, offset_) {
  this.N = 356;
  this.x_scale = x_scale_;
  this.y_speed = y_speed_;
  this.y_attn = y_attn_;
  this.offset = offset_;
}

//completely to scale with current display (no explicitly stated values)
NoisySine.prototype.display = function() {
  var r = 250;
  push();
  translate(windowWidth/2, windowHeight/2);
  beginShape();
  for (var i = 0; i < this.N; i++) {
    let x = norm(i, 0, this.N)*W/0.675;
    let y_off = lerp(-this.y_attn, this.y_attn, noise(x*this.x_scale, frameCount*this.y_speed + this.offset));
    // let y = (-H/2)+y_off;
    let theta = radians(x) + PI/2.5;
    x = r * sin(theta);
    y = r * cos(theta)+y_off/1.5;
    curveVertex(x, y);
  }
  endShape();
  pop();
}
