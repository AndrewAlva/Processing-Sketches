ArrayList<Particle> particles;
PVector cursor;
int separation = 60;

void setup() {
  size(600, 600);
  particles = new ArrayList<Particle>();
  for (int x = 0; x <= width; x+=separation) {
    for (int y = 0; y <= height; y+=separation) {
      particles.add(new Particle(new PVector(x,y)));
    }
  }
}
 
void draw() {
  background(0);
  noStroke();
  //cursor = new PVector(mouseX, mouseY);
  for (int i = 0; i<particles.size(); i++) {
    Particle p1 = particles.get(i);
    p1.draw();
  }
}
