ParticleSystem ps;

void setup() {
  fullScreen();
  RG.init(this);
  noStroke();
  ps = new ParticleSystem("W", 500, 5);
  background(#023859);
}

void draw() {
  ps.run();
}
