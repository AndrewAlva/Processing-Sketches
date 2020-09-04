// Clase de Partícula
class Particle {
  PVector pos, pos0;
  float radius;
  float angle, distance, displacement;
  float speed = 0.1;
  int limit = 500;
  float dx, dy;
  float fillColor;
  
  Particle(PVector v) {
    pos = v.copy();
    pos0 = v.copy();
    radius = 10;
    fillColor = 255;
  }
 
  void draw() {
    update();
    stroke(255);
    fill(fillColor,255,255);
    ellipse(pos.x, pos.y, radius, radius);
    noFill();
    ellipse(pos0.x, pos0.y, radius, radius);
    line(pos0.x, pos0.y, pos.x, pos.y);
  }
  
  void update() {  
    dx = mouseX - pos.x;
    dy = mouseY - pos.y;
    angle = atan2(dx, dy);
    distance = dist( pos.x, pos.y, mouseX, mouseY);
    displacement = limit / distance;
    pos.x += cos( angle ) * displacement;
    pos.y += sin( angle ) * displacement;
    
    pos.x += (pos0.x - pos.x) * speed;
    pos.y += (pos0.y - pos.y) * speed;
    
    //pos.x += ((cos(angle) * (force / distance)) + (pos0.x - pos.x)) * 0.1;
    //pos.y += ((sin(angle) * (force / distance)) + (pos0.y - pos.y)) * 0.1;
    
    setColors();
  }
  
  void setColors() {
    if(displacement > 10){
      fillColor = 255;
    } else if (displacement > 5) {
      fillColor = 128;
    } else {
      fillColor = 20;
    }
  }
}

// Angle between; search for reference
