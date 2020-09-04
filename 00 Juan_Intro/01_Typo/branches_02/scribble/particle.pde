class Particle {
  PVector pos, pos0;
  float radio;
  float vel;
  int life = 255;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = 2;
    vel = random(-0.2,0.2);
  }
  
  void update() {
    vel += random(-0.5, 0.5);
    pos.x += cos(time + vel);
    pos.y += sin(time - vel);
    life -= 1;
  }
  
  void draw() {
    fill(#B4D2D9, life);
    ellipse(pos.x, pos.y, radio, radio);
    update();
  }
  
  boolean isDead() {
    return life < 0;
  }
}
