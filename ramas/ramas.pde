/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/144159*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
class pathfinder {
  //PVector lastLocation;  // última posición
  PVector location;      // posición
  PVector vel;      // velocidad
  float diameter;        // diámetro
  boolean isFinished;    // si terminó

  pathfinder() {
    location = new PVector(width/2, height/2);          // ubicación actual, inicialmente en el medio (o casi)
    //lastLocation = new PVector(location.x, location.y);   // última ubicación, inicialmente la misma que la actual inicial
    vel = new PVector(0, 0);                               // velocidad random de 0 a -10
    diameter = random(10, 20);                            // diámetro random de 10 a 20
    isFinished = false;                                   // terminó
  }

  pathfinder(pathfinder parent) {
    location = parent.location.get();
    //lastLocation = parent.lastLocation.get();
    vel = parent.vel.get();
    diameter = parent.diameter * 0.62;   //baja el diámetro a *0.62
    isFinished = parent.isFinished;
    parent.diameter = diameter;
  }

  void update() {
    //si no se sale de los límites de la pantalla
    if (location.x > 20 & location.x < width - 20 & location.y > 20 & location.y < height - 20) {
      //setea la última ubicación
      //lastLocation.set(location.x, location.y);
      if (diameter > 0.2) {
        //count ++;
        float rnd = 0.5;  // se puede cambiar para "ensanchar" cada rama, o al revés
        PVector bump = new PVector(random(-rnd, rnd)*0.2, random(-rnd, rnd)*0.2);
        vel.normalize();
        vel.mult(0.7);
        vel.add(bump);
        vel.mult(random(5, 10));
        location.add(vel);
        if (random(0, 2) < 0.4) { // control length
          paths = (pathfinder[]) append(paths, new pathfinder(this));
        }
      } else {
        if (!isFinished) {
          isFinished = true;
          //fill(map(location.x, 0, width/2, 0, 200), 230, map(location.y, 0, height/2, 50, 150), random(0, 200));
          fill(map(location.x, 0, width/2, 50, 250), map(location.y, 0, height/2, 0, 250));
          ellipse(location.x, location.y, 12, 12);
        }
      }
    }
  }
}

int num = 5; // cant de ramas, estaba en 5
pathfinder[] paths = new pathfinder[num];  // se crea un vector[num] de la clase pathfinder
//static int count;

void setup() {
  size(1000, 1000);
  background(2);
  noStroke();
  smooth();
  for (int i = 0; i < num; i++) {
    paths[i] = new pathfinder();  // en cada posición del vector paths hay un elemento de clase pathfinder
  }
}

void draw() {  
  for (int i = 0; i < paths.length; i++) {
    paths[i].update();   // se ejecuta update() de pathfinder en cada posición del vector paths
  }
}

// reset
void mousePressed() {
  saveFrame("frame-####.png"); 
  background(2);
  paths = new pathfinder[num];
  for (int i = 0; i < num; i++) paths[i] = new pathfinder();
}
