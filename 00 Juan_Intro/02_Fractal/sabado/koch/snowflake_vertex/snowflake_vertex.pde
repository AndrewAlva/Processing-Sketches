int index = 0;
float centerX, centerY;

void setup(){
  background(255);
  size(900, 900);
  frameRate(1);
  stroke(0);
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  update();
  fill(100, random(30));
  beginShape(TRIANGLE_FAN);
  snowFlake(index);
  endShape();
}


void update() {
  background(255);
  index++;
  if (index == 6) {
    index = 0;
  }
}
