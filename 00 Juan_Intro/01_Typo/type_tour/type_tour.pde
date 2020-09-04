ParticleSystem a, b, c;
float time;
int centerX, centerY;

void setup() {
  size(900, 900);
  RG.init(this);
  
  centerX = width/2;
  centerY = height/2;
  
  a = new ParticleSystem("a", 350, centerX, centerY);
  background(0);
}

void draw() {
  background(0);
  a.run();
  time+=0.1;
}
