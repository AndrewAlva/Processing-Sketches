ParticleSystem ps;

void setup() {
  size(1200, 640);
  ps = new ParticleSystem(300);
}
 
void draw() {
  background(0);
  noStroke();
  ps.run();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  int particlesCount;
  
  ParticleSystem(int count) {
    particlesCount = count;
    particles = new ArrayList<Particle>();
    for (int i = 0; i < particlesCount; i++) {
      particles.add(new Particle(new PVector(random(width),random(height))));
    }
  }

  void run() {
    for (int i = 0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      p.draw();
    }
  }
}


class Particle {
  PVector pos;
  float maxRadius, radius;
  float vel, alpha;
 
  Particle(PVector v) {
    alpha = 1;
    pos = v.copy();
    vel = random(0.5) - 0.25;
    maxRadius = random(2) + 1;
    radius = maxRadius;
  }
 
  void draw() {
    fill(255, alpha);
    ellipse(pos.x, pos.y, radius, radius);
    update();
  }
  
  void update() {
    alpha = abs(sin(pos.x/10))*255;
    radius = abs(cos(pos.x/50))*maxRadius;
    pos.x += vel;
    pos.y += vel;
    if (pos.x <0) {
      pos.x = width;
    }
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.y <0) {
      pos.y = height;
    }
    if (pos.y > height) {
      pos.y = 0;
    }
  }
}
