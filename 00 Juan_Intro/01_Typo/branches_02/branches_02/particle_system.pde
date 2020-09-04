import geomerative.*;
class ParticleSystem {
  // Definición de arreglo de partículas
  ArrayList<Particle> particles;
  RShape grp;
  
  ParticleSystem(String txt, int fontSize, int separation) {
    particles = new ArrayList<Particle>();
    grp = RG.getText(txt, "Druk.ttf", fontSize, CENTER);
    grp.draw();
    for(int i=0; i<grp.getPoints().length; i+=separation) {
      addParticle(i);
    }
  }
  
  void addParticle(int index) {
    float x = grp.getPoints()[index].x;
    float y = grp.getPoints()[index].y;
    particles.add(new Particle(new PVector(x,y)));
  }

  void run() {
    translate(width/2, height/2);
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.draw();
      if(p.isDead()) {
        particles.remove(p);
      }
    }
  }
}
