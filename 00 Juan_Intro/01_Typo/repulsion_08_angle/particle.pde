class Particle {
  PVector pos, pos0;
  float dx, dy;
  float angle, dist, displacement;
  float radio, weight;
  int limit = 300, pow = 5;
  float speed = 0.1;
  color fillColor;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = 30;
    if (random(1,10) > 5) {
      fillColor = #59220E;
    } else {
      fillColor = #D9B07E;
    }
  }
  
  void draw() {
    update();
    stroke(fillColor);
    strokeWeight(weight);
    noFill();
    //line(pos0.x, pos0.y, pos.x, pos.y);
    //line(pos0.x, pos0.y, pos.x+radio, pos.y+radio);
    //line(pos0.x, pos0.y, pos.x, pos.y+radio);
    //line(pos0.x, pos0.y, pos.x+radio, pos.y);
    fill(fillColor, 50);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rect(0, 0, radio, radio);
    popMatrix();
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
    
    radio = displacement * 8 + 5;
    weight = displacement * 0.8 + 0.1;
  }
}
