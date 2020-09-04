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
