Particle p;

void setup(){
  //fullScreen();
  size(375,667);
  background(#202020);
  p = new Particle(new PVector(random(width),random(height/2)), new PVector(random(10),random(10)), new PVector(random(10)+20,random(10)+20), random(2));
}

void draw(){
  //background(#202020);
  p.draw();
}
