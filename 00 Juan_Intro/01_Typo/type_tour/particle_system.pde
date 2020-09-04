import geomerative.*;
class ParticleSystem {
  // Definición de arreglo de partículas
  ArrayList<Particle> particles;
  RShape grp;
  PVector center;
  float r, g, b;
  float deface = random(10);
  
  ParticleSystem(String txt, int fontSize, int x, int y) {
    center = new PVector(x, y);
    particles = new ArrayList<Particle>();
    grp = RG.getText(txt, "Saol.ttf", fontSize, CENTER);
    grp.draw();
    r = 0;
    g = 0;
    b = 0;
    for(int i=0; i<grp.getPoints().length; i+=5) {
      addParticle(i);
    }
  }
  
  void addParticle(int index) {
    float x = grp.getPoints()[index].x;
    float y = grp.getPoints()[index].y;
    particles.add(new Particle(new PVector(x,y)));
  }

  void update() {
    r = abs(sin(time)*170);
    g = abs(cos(time/deface)*170);
    b = abs(sin(time/(deface/2))*170);
  }
  
  void run() {
    update();
    pushMatrix();
    translate(center.x, center.y);
    strokeWeight(2);
    stroke(r, g, b);
    fill(r, g, b, 100);
    beginShape();
    Particle start = particles.get(particles.size()-1);
    curveVertex(start.pos.x, start.pos.y);
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
      curveVertex(p.pos.x, p.pos.y);
    }
    Particle pre = particles.get(0);
    curveVertex(pre.pos.x, pre.pos.y);
    Particle last = particles.get(1);
    curveVertex(last.pos.x, last.pos.y);
    endShape(CLOSE);
    popMatrix();
  }
}
