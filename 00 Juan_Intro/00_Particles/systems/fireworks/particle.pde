class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float life, radius;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.1);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    position = l.copy();
    life = 255.0;
    radius = random(5)+1;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    life -= 1.0;
  }

  void display() {
    fill(255, life);
    ellipse(position.x, position.y, radius, radius);
  }

  boolean isDead() {
    if (life < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
