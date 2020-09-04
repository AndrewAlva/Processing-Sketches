ParticleSystem ps;
float time;
int fontSize;
float centerX, centerY;

void setup() {
  fontSize = 500;
  fullScreen();
  RG.init(this);
  noStroke();
  ps = new ParticleSystem("W", fontSize, 5);
  background(#023859);
  centerX = width/2;
  centerY = height/2 + (fontSize/2);
}

void draw() {
  ps.run();
  time+=0.1;
}
