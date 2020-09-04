ArrayList<Particle> particles;
int particlesCount;
PImage img;
int separation = 10;
float radius;

void setup() {
  size(640, 360);
  img = loadImage("girasol.jpg");
  imageMode(CENTER);
  
  background(255);
  particles = new ArrayList<Particle>();
  for (int x = 0; x < width; x+=separation) {
    for (int y = 0; y < height; y+=separation) {
      particles.add(new Particle(new PVector(x,y)));
    }
  }
}

void draw() {
  background(255);
  noStroke();
  for(int i=0; i< particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
}
