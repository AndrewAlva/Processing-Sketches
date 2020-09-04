ParticleSystem ps;
float time;

void setup() {
  size(1000, 900);
  RG.init(this);
  
  ps = new ParticleSystem();
}

void draw() {
  fill(0);
  rect(0,0,width,height);
  ps.run();
  time+=0.1;
}

void mousePressed() {
  saveFrame("love-######.png");
}
