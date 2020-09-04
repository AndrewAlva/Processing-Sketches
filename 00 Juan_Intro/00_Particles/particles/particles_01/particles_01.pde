Particle p;
 
void setup() {
  size(640,640);
  background(0);
  p = new Particle(new PVector(320,320));
}
 
void draw() {
  //background(0);
  //noStroke();
  p.draw();
  p.bounce();
}

class Particle {
  float radius;
  float vel;
  PVector pos;
 
  Particle(PVector v) {
    pos = v.copy();
    vel = 10;
    radius = random(50);
  }
 
  void draw() {
    fill(255);
    ellipse(pos.x, pos.y, radius, radius);
    pos.x -= vel;
  }
  
  // Andrew code
  void bounce() {
    if(pos.x > width || pos.x < 0){
      vel = vel * -1;
    }
  }
}



// Andrew code

class Ball {
  color c;
  float vel;
  PVector pos;
}
