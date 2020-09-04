ParticleSystem ps;
PVector cursor = new PVector(0,0);
float time;
float pow = 5;
float centerX, centerY;
int fontSize = 350;
float fontCenter = fontSize/2;

void setup() {
  fullScreen();
  RG.init(this);
  
  centerX = width/2;
  centerY = height/2;
  println(centerY);
  println(height/2);
  
  ps = new ParticleSystem();
}

void draw() {
  cursor = new PVector(mouseX-centerX,mouseY-centerY);
  fill(#F2B5A7);
  rect(0,0,width,height);
  ps.run();
  time+=0.025;
}

void mousePressed() {
  saveFrame("love-######.png");
}
