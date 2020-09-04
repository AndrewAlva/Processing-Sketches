class Particle {
  PVector pos, pos0;
  color rgb;
  int radio;
  
  float angle, distance, displacement;
  float speed = 0.1;
  //float limit = 50000;
  float limit = 0;
  float limit0 = 0;
  float limitSpeed = 200;
  float dx, dy;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    
    radio = separation;
    rgb = img.get(int(pos.x), int(pos.y));
    
    pos.x += width/2.5;
    pos.y += height/2.5;
    pos0.x += width/2.5;
    pos0.y += height/2.5;
  }
  
  void draw() {
    update();
    fill(rgb);
    ellipse(pos.x,pos.y,radio, radio);
  }
  
  void update(){
    limit += (limit0 - displacementForce ) * limitSpeed;
    if (limit <= 0) limit = 0;
    //dx = mouseX - pos.x;
    //dy = mouseY - pos.y;
    dx = userLeftFingerX - pos.x;
    dy = userLeftFingerY - pos.y;
    angle = atan2(dx, dy);
    distance = dist( pos.x, pos.y, userLeftFingerX, userLeftFingerY);
    displacement = limit / distance;
    pos.x += cos( angle ) * displacement;
    pos.y += sin( angle ) * displacement;
    
    pos.x += (pos0.x - pos.x) * speed;
    pos.y += (pos0.y - pos.y) * speed;
  }
}
