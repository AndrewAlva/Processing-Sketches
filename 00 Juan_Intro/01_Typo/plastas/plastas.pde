ParticleSystem a, b, c;
float time;
int centerX, centerY;

void setup() {
  size(900, 900);
  RG.init(this);
  
  centerX = width/2;
  centerY = height/2;
  
  a = new ParticleSystem("a", 500, 150, 250);
  b = new ParticleSystem("g", 500, centerX, 400);
  c = new ParticleSystem("w", 500, centerX, int( random(centerY, height) ) );
  background(0);
}

void draw() {
  background(0);
  a.run();
  b.run();
  c.run();
  time+=0.1;
}
