import geomerative.*;
class ParticleSystem {
  // Definición de arreglo de partículas
  ArrayList<Particle> particles;
  RShape grp;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    grp = RG.getText("Q", "Saol.ttf", 500, CENTER);
    grp.draw();
    for(int i=0; i<grp.getPoints().length; i+=5) {
      addParticle(i);
    }
    //addParticle(0);
  }
  
  void addParticle(int index) {
    float x = grp.getPoints()[index].x;
    float y = grp.getPoints()[index].y;
    particles.add(new Particle(new PVector(x,y)));
  }

  void run() {
    translate(width/2,height/2+200);
    color rgb = lerpColor(#ff6600, #ffffff, abs(sin(time) - 0.5));
    stroke(rgb, 50);
    strokeWeight(2);
    fill(0,5);
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
  }
}
