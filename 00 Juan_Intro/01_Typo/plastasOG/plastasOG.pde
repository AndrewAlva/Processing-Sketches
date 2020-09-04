ParticleSystem a, b, c;
float time;

void setup() {
  size(900, 900);
  RG.init(this);
  
  a = new ParticleSystem("c", 350, 300, 300);
  background(0);
}

void draw() {
  background(0);
  a.run();
  time+=0.1;
}
