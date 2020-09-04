class Particle {
  PVector pos, pos0;
  float deface = random(3);
  Particle(PVector v) {
    pos = v.copy();
    pos.x += random(-deface, deface);
    pos.y += random(-deface, deface);
    pos0 = v.copy();
  }
  
  void update() {
    pos.x = sin(time+deface) * deface + pos0.x;
    pos.y = cos(time+deface) * deface + pos0.y;
  }
}
