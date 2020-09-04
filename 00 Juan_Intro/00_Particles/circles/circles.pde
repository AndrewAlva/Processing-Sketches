ArrayList<Circle> circles;
PVector cursor;
int totalCircles = 100;

void setup() {
  size(375, 667);
  background(#202020);
  mouseX = width/2;
  mouseY = height/2;
  circles = new ArrayList<Circle>();
  for(int i= 0; i<totalCircles; i++){
    circles.add(new Circle(new PVector(random(width),random(height))));
  }
}
 
void draw() {
  stroke(0);
  if(!mousePressed){
    background(0);
    noStroke();
  }
  noFill();
  cursor = new PVector(mouseX, mouseY);
  for (int i = 0; i< circles.size(); i++) {
    Circle c = circles.get(i);
    c.draw();
  }
}
