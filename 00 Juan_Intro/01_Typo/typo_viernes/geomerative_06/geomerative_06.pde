import geomerative.*;

String message = "SBEVA";
RShape grp;
float _angle = (TWO_PI / message.length());
float diameter = 150;
float time = 0;
float angle = 0;
float escala = 0;
float centerX, centerY;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  noFill();
  
  RG.init(this);
  smooth();
  
  centerX = width / 2;
  centerY = height / 2;
}

void draw() {
  fill(0, 35);
  rect(0,0,width,height);
  
  float weight = abs(sin(time)) * 2;
  strokeWeight(weight);
  
  translate(centerX, centerY);
  rotate(time);
  scale(escala);
  
  circularText();

  angle = sin(time);
  escala = abs(cos(time));
  time += 0.01;
}
