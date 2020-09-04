class Particle {
  PVector pos, pos0;
  float dx, dy;
  float angle, dist, displacement;
  float radio, weight;
  float limit = 300;
  float speed = 0.1;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = 2;
  }
  
  void update() {
    dx = cursor.x - pos.x;
    dy = cursor.y - pos.y;
    angle = atan2(dx, dy);
    dist = dist( pos.x, pos.y, cursor.x, cursor.y);
    displacement = limit / dist;
    pos.x -= sin(angle) * displacement * pow;
    pos.y -= cos(angle) * displacement * pow;
    pos.x += (pos0.x - pos.x) * speed;
    pos.y += (pos0.y - pos.y) * speed;
  }
}
