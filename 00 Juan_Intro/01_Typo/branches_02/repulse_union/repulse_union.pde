ParticleSystem ps;
PVector cursor = new PVector(0,0);
float time;
float pow = 2;
int fontSize = 500;

void setup() {
  fullScreen();
  RG.init(this);
  
  ps = new ParticleSystem();
}

void draw() {
  cursor = new PVector(mouseX-width/2,mouseY-(height/2)-(fontSize/2));
  fill(#49C2F2);
  rect(0,0,width,height);
  ps.run();
  time+=0.01;
}
