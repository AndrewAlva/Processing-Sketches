class Particle {
  PVector pos, pos0;
  float dx, dy;
  float angle, dist, displacement;
  float radio;
  int limit = 300, pow = 1;
  float speed = 0.1;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = 15;
  }
  
  void draw() {
    update();
    stroke(255);
    noFill();
    line(pos0.x, pos0.y, pos.x, pos.y);
    stroke(255);
    fill(0);
    ellipse(pos.x,pos.y,radio, radio);
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
