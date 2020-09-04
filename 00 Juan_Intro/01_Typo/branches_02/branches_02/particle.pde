class Particle {
  PVector pos, pos0;
  float vel;
  int life = 255;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    vel = random(-0.5,0.5);
  }
  
  void update() {
    vel += random(-0.5, 0.5);
    pos.x += cos(vel);
    pos.y += sin(vel);
    life -= 3;
  }
  
  void draw() {
    stroke(#B4D2D9, life);
    pos0 = pos.copy();
    update();
    line(pos0.x, pos0.y, pos.x, pos.y);
  }
  
  boolean isDead() {
    return life < 0;
  }
}
