class Ball {
  PVector gravity = new PVector(0,0.3);

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;

  Ball(float ballSize) {
    position = new PVector(random(width), 0);
    velocity = new PVector(random(20),random(10));
    acceleration = new PVector(0,0);
    mass = random(2);
    size = ballSize;
  }
    
  void draw() {
    image(img, position.x,position.y,size, size);
    update();
    checkEdges();
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.mult(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    applyForce(gravity);
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void checkEdges() {
    if (position.x > width - size) {
      position.x = width - size;
      velocity.x *= -0.6;
    }
    if (position.x < 0) {
      velocity.x *= -0.6;
      position.x = 0;
    }
    if (position.y > height - size) {
      velocity.y *= -0.6;
      position.y = height - size;
    }
    
    if (position.y < 0) {
      velocity.y *= -0.6;
      position.y = 0;
    }
  }

}
