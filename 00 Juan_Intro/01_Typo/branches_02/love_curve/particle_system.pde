import geomerative.*;
class ParticleSystem {
  ArrayList<Particle> particles;
  RShape grp;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    grp = RG.getText("X", "Druk.ttf", fontSize, CENTER);
    grp.draw();
    for(int i=0; i<grp.getPoints().length; i+=25) {
      addParticle(i);
    }
  }
  
  void addParticle(int index) {
    float x = grp.getPoints()[index].x;
    float y = grp.getPoints()[index].y;
    particles.add(new Particle(new PVector(x,y)));
  }

  void run() {
    translate(centerX, centerY);
    stroke(0, 20);
    fill(0, 0);
    beginShape();
    for (int i = 0; i < particles.size(); i++) {
      Particle p1 = particles.get(i);
      p1.update();
      for (int j = i; j < particles.size(); j++) {
        Particle p2 = particles.get(j);
        vertex(p2.pos.x, p2.pos.y);
      }
    }
    endShape();
  }
}
