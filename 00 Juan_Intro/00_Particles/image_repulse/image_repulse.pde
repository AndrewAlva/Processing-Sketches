ArrayList<Particle> particles;
int particlesCount;
PImage img;
int separation = 5;
float radius;

void setup() {
  size(600, 420);
  //fullScreen();
  img = loadImage("girasol.jpg");
  imageMode(CENTER);
  
  background(#202020);
  particles = new ArrayList<Particle>();
  for (int x = 0; x < width; x+=separation) {
    for (int y = 0; y < height; y+=separation) {
      particles.add(new Particle(new PVector(x,y)));
    }
  }
}

void draw() {
  background(#202020);
  noStroke();
  for(int i=0; i< particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
}
