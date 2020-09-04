class Particle {
  PVector pos;
  float radio = random(2, 6);
  float life = random(255);
  PVector acceleration = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
  PVector speed = new PVector(0, 0);
  float r, g, b;

  Particle(PVector v) {
    r = random(255);
    g = random(255);
    b = random(255);
    pos = v.copy();
  }

  void draw() {
    update();
    fill(255);
    stroke(r, g, b, life);
    strokeWeight(weight);
    ellipse(pos.x, pos.y, radio, radio);
  }

  void update() {
    acceleration = new PVector(random(-0.05,0.05), random(-0.05, 0.05));
    speed.sub(acceleration);
    pos.add(speed);
    radio = random(2, 6);
    life-= 2;
    if (isDead()) {
      particles.remove(this);
    }
  }

  boolean isDead() {
    return (life < 0);
  }
}
