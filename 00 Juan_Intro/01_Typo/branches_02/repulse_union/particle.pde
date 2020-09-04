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
  
  void draw() {
    update();
    ellipse(pos.x, pos.y, radio, radio);
  }

  void connection(Particle p2) {
    float distance = dist(pos.x, pos.y, p2.pos.x, p2.pos.y);
    if(distance < 120) {
      stroke(#F26D78);
      strokeWeight(weight);
      line(pos.x, pos.y, p2.pos.x, p2.pos.y);
    }
  }
  
  void update() {
    dx = cursor.x - pos.x;
    dy = cursor.y - pos.y;
    angle = atan2(dx, dy);
    dist = dist( pos.x, pos.y, cursor.x, cursor.y);
    displacement = limit / dist;
    pos.x -= sin(angle) * displacement * pow;
    pos.y -= cos(angle) * displacement * pow;
    pos.x -= (pos.x - pos0.x) * speed;
    pos.y -= (pos.y - pos0.y) * speed;
    
    radio = displacement * 8;
    weight = displacement * 0.5 + 0.5;
  }
}
