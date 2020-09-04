import geomerative.*;

ArrayList<Particle> particles;
PImage img;
int separation = 20;

RShape grp;

void setup() {
  //size(1200, 800);
  fullScreen();
  RG.init(this);
  smooth();
  
  particles = new ArrayList<Particle>();
  background(0);
  setChar();
}

void setChar() {
  background(0);
  textSize(600);
  fill(255);
  //text("TYPO", 200, 800);
  translate(width/2, height/1.5);
  grp = RG.getText("TYPO", "Druk.ttf", 350, CENTER);
  grp.draw();
  for (int x = 0; x < width; x+=separation) {
    for (int y = 0; y < height; y+=separation) {
      float rgb = get(x, y);
      if(rgb >= -1.0) {
        particles.add(new Particle(new PVector(x,y)));
      }
    }
  }
  background(0);
}

void draw() {
  //fill(0,5);
  //rect(0,0,width, height);
  for(int i=0; i< particles.size(); i++) {
    Particle p = particles.get(i);
    if (p.isDead()) {
      particles.remove(i);
    }
    p.draw();
  }
  //saveFrame("worms-######.png");
}
