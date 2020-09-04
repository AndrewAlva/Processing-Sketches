class Particle {
  PVector pos;
  float radio;
  float life = random(100, 150);
  PVector acceleration = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
  PVector speed = new PVector(0, 0);
  float r, g, b;
  Particle(PVector v) {
    pos = v.copy();
    radio = separation;
  }

  void draw() {
    update();    
    noStroke();
    fill(255-life, life);
    ellipse(pos.x, pos.y, radio, radio);
  }

  void update() {
    //r = abs(sin(speed.x))*255;
    //g = abs(cos(pos.y))*255;
    //b = abs(cos(speed.y))*255;
    acceleration = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    speed.sub(acceleration);
    pos.add(speed);
    radio = life/64;
    life-= 0.25;
  }

  boolean isDead() {
    return (life < 0);
  }
}
