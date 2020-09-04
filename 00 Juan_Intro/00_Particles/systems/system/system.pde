ParticleSystem ps;

void setup() {
  size(640, 600);
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw() {
  background(0);
  ps.run();
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  int totalParticles = 50;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
    for (int i = 0; i < totalParticles; i++) {
      particles.add(new Particle(origin));
    }
  }

  void run() {
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
