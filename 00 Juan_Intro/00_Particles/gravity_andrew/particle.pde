class Particle {
  PVector gravity;
  PVector acceleration;
  
  PVector position;
  PVector velocity;
  PVector size;
  float mass;
  
  Particle(PVector _pos, PVector _vel, PVector _size, float _mass){
    gravity = new PVector(0,.3);
    acceleration = new PVector(0,0);
    position = _pos;
    velocity = _vel;
    size = _size;
    mass = _mass;
  }
  
  void draw(){
    fill(255);
    ellipse(position.x, position.y, size.x, size.y);
    update();
    checkEdges();
  }
  
  void applyForce(PVector force){
    PVector f = PVector.mult(force, mass);
    acceleration.add(f);
  }
  
  void update(){
    applyForce(gravity);
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void checkEdges(){
    if(position.x > width){
      position.x = width;
      velocity.x *= -0.8;
    }

    if(position.x < 0){
      position.x = 0;
      velocity.x *= -0.8;
    }
    
    if(position.y > height){
      position.y = height;
      velocity.y *= -0.8;
    }

    if(position.y < 0){
      position.y = 0;
      velocity.y *= -0.8;
    }
  }
}
