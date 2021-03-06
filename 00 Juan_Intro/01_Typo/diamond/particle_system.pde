import geomerative.*;
class ParticleSystem {
  // Definición de arreglo de partículas
  ArrayList<Particle> particles;
  RShape grp;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    grp = RG.getText("A", "Druk.ttf", 350, CENTER);
    grp.draw();
    for(int i=0; i<grp.getPoints().length; i+=10) {
      addParticle(i);
    }
  }
  
  void addParticle(int index) {
    float x = grp.getPoints()[index].x;
    float y = grp.getPoints()[index].y;
    particles.add(new Particle(new PVector(x,y)));
  }

  void run() {
    translate(width/2,height/2+150);
    stroke(255);
    fill(255, 50);
    beginShape(QUAD_STRIP);
    for (int i = 0; i < particles.size(); i++) {
      Particle p1 = particles.get(i);
      p1.update();
      for (int j = i; j < particles.size(); j++) {
        Particle p2 = particles.get(j);
        float distance = dist(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
        if(distance < 100) {
          vertex(p2.pos.x, p2.pos.y);
        }
      }
    }
    endShape();
  }
}
