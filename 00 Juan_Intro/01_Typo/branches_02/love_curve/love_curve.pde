ParticleSystem ps;
float time;
float centerX, centerY, halfSize;
int fontSize = 500;

void setup() {
  //fullScreen();
  size(1200,667);
  RG.init(this);
  
  ps = new ParticleSystem();
  centerX = width/2;
  halfSize = fontSize/2;
  centerY = height/2+halfSize;
}

void draw() {
  background(200);
  ps.run();
  time+=0.05;
}

void mousePressed() {
  saveFrame("love-######.png");
}
