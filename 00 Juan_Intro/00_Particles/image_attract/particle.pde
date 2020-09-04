class Particle {
  PVector pos, pos0;
  color rgb;
  int radio;
  
  PVector velocity;
  PVector acceleration;
  PVector position;
  float radius;
  int limit = 5;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radio = 5;
    rgb = img.get(int(pos.x), int(pos.y));
    
    velocity = new PVector(0,0);
  }
  
  void draw() {
    update();
   fill(rgb);
   ellipse(pos.x,pos.y,radio, radio);
  }
  
  void update(){
    
  }
}
