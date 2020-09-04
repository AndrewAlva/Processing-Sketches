class Particle {
  PVector pos, pos0;
  color rgb;
  float radio;
  
  float angle, distance, displacement;
  float speed = 0.2;
  int limit = 1000;
  float dx, dy;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = separation * 1.4;
    rgb = img.get(int(pos.x), int(pos.y));
  }
  
  void draw() {
    update();
    fill(rgb);
    ellipse(pos.x,pos.y,radio, radio);
  }
  
  void update(){
    rgb = img.get(int(pos.x), int(pos.y));
    if (!mousePressed){
      limit = 0;
      speed = 0.15;
      radio = separation * 1.4;
    } else {
      limit += 50;
      speed = 0.02;
      radio -= 0.03;
    }
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
