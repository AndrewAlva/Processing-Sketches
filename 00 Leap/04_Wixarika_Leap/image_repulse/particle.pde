class Particle {
  PVector pos, pos0;
  color rgb;
  int radio;
  
  float angle, distance, displacement;
  float speed = 0.1;
  int limit = 50;
  float dx, dy;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = separation;
    rgb = img.get(int(pos.x), int(pos.y));
  }
  
  void draw() {
    update();
    fill(rgb);
    ellipse(pos.x,pos.y,radio, radio);
  }
  
  void update(){
    dx = mouseX - pos.x;
    dy = mouseY - pos.y;
    angle = atan2(dx, dy);
    distance = dist( pos.x, pos.y, mouseX, mouseY);
    displacement = limit / distance;
    pos.x += cos( angle ) * displacement;
    pos.y += sin( angle ) * displacement;
    
    pos.x += (pos0.x - pos.x) * speed;
    pos.y += (pos0.y - pos.y) * speed;
  }
}
