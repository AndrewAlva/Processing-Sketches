// Triángulo de Sierpinski
int index = 0;
  
void setup() {
  size(500, 500);
  //fullScreen();
  
  background(11);
  
  fill(255,5);
  //noFill();
  
  //strokeWeight(0.5);
  //stroke(255);
  noStroke();
  
  frameRate(1);
}

void draw() {
  update();
  beginShape(TRIANGLES);
  sierpinski(width/2, 0, width, height, 0, height, index);
  endShape();
}

void sierpinski(float x1, float y1, float x2, float y2, float x3, float y3, int level) {
  if (level > 0) {
    
    //triangle(x1, y1, x2, y2, x3, y3);
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    //vertex(x1,y1);
    //vertex(random(width), random(height));
    
    
    float h1 = (x1+x2)/2.0;
    float w1 = (y1+y2)/2.0;
    float h2 = (x2+x3)/2.0;
    float w2 = (y2+y3)/2.0;
    float h3 = (x3+x1)/2.0;
    float w3 = (y3+y1)/2.0;
    
    float[] coordsArray = {h1, w1, h2, w2, h3, w3};
    
    sierpinski(coordsArray[floor(random(5))], coordsArray[floor(random(5))], coordsArray[floor(random(5))], coordsArray[floor(random(5))], coordsArray[floor(random(5))], coordsArray[floor(random(5))], level-1);
    sierpinski(coordsArray[5], coordsArray[4], coordsArray[3], coordsArray[2], coordsArray[1], coordsArray[0], level-1);
    sierpinski(coordsArray[3], coordsArray[4], coordsArray[5], coordsArray[0], coordsArray[1], coordsArray[2], level-1);
  }
}


void update() {
  index++;
  if(index==9) {
    index = 0;
    background(11);
  }
}
