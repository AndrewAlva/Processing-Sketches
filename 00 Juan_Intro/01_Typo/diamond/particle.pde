class Particle {
  PVector pos, pos0;
  float radio, weight;
  float deface = random(10);
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = pos.copy();
    radio = 2;
  }
  
  void update() {
    pos.x = sin(time+deface) * deface + pos0.x;
    pos.y = cos(time+deface) * deface + pos0.y;
  }
}
