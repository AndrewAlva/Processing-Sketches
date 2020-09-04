import geomerative.*;
class ParticleSystem {
  // Definición de arreglo de partículas
  ArrayList<Particle> particles;
  RShape grp;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
    grp = RG.getText("3", "Druk.ttf", 500, CENTER);
    grp.draw();
    for(int i=0; i<grp.getPoints().length; i+=15) {
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
    stroke(abs(sin(time)*255), abs(cos(time/2)*255), abs(sin(time*3)*255), 50);
    strokeWeight(2);
    fill(0,5);
    beginShape();
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
      curveVertex(p.pos.x, p.pos.y);
    }
    endShape(CLOSE);
  }
}
