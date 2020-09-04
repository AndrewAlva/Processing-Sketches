Particle p;
 
void setup() {
  size(200, 200);
  p = new Particle(new PVector(random(width),random(height)));
}
 
void draw() {
  background(0);
  noStroke();
  p.draw();
}

class Particle {
  float radius;
  float vel;
  PVector pos;
 
  Particle(PVector v) {
    pos = v.copy();
    vel = random(3);
    radius = random(5) + 2;
  }
 
  void draw() {
    fill(255);
    ellipse(pos.x, pos.y, radius, radius);
    update();
  }
  
  void update() {
    pos.x -= vel;
    pos.y += vel;
    returnToScreen();
  }
  
  void returnToScreen() {
    if (pos.x < 0) {
      pos.x = width;
    }
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.y < 0) {
      pos.y = height;
    }
    if (pos.y > height) {
      pos.y = 0;
    }
  }
}
