ParticleSystem ps;
PVector cursor = new PVector(0,0);
float time;
float pow = 5;
void setup() {
  fullScreen();
  RG.init(this);
  
  ps = new ParticleSystem();
}

void draw() {
  cursor = new PVector(mouseX-width/2,mouseY-(height/2)-150);
  fill(#F2B5A7);
  rect(0,0,width,height);
  ps.run();
  time+=0.025;
}

void mousePressed() {
  saveFrame("love-######.png");
}
