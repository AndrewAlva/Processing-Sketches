import geomerative.*;
class ParticleSystem {
  // Definición de arreglo de partículas
  ArrayList<Particle> particles;
  RShape grp;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    grp = RG.getText("XY", "Druk.ttf", fontSize, CENTER);
    grp.draw();
    for(int i=0; i<grp.getPoints().length; i+=10) {
      float x = grp.getPoints()[i].x;
      float y = grp.getPoints()[i].y;
      particles.add(new Particle(new PVector(x,y)));
    }
  }

  void run() {
    translate(width/2,height/2+200);
    fill(#FFFFFF);
    stroke(255);
    for (int i = 0; i < particles.size(); i++) {
      Particle p1 = particles.get(i);
      for (int j = i; j < particles.size(); j++) {
        Particle p2 = particles.get(j);
        p1.connection(p2);
      }
      p1.draw();
    }
  }
}
