ArrayList<Particle> particles;
int particlesCount;
int maxDistance;

void setup() {
  //size(1920, 1024);
  size(800,600);
  particlesCount = 150;
  maxDistance = 130;  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < particlesCount; i++) {
    particles.add(new Particle(new PVector(random(width),random(height))));
  }
}
 
void draw() {
  background(0);
  noStroke();
  for (int i = 0; i<particles.size(); i++) {
    Particle p1 = particles.get(i);
    for (int j = 0; j<particles.size(); j++) {
      Particle p2 = particles.get(j);
      p1.connection(p2);
    }
    p1.draw();
  }
}

class Particle {
  PVector pos;
  float maxRadius, radius;
  float vel, alpha;
 
  Particle(PVector v) {
    alpha = 1;
    pos = v.copy();
    vel = random(0.5) - 0.25;
    maxRadius = random(30) + 1;
    radius = maxRadius;
  }
 
  void draw() {
    stroke(255, alpha);
    fill(0,255);
    ellipse(pos.x, pos.y, radius, radius);
    update();
  }
  
  void connection(Particle p2) {
    float d = dist(pos.x, pos.y, p2.pos.x, p2.pos.y);
    if(d < maxDistance){
      float weight = (1 - (d/maxDistance))*3;
      strokeWeight(weight);
      stroke(255, alpha);
      noFill();
      line(pos.x, pos.y, p2.pos.x, p2.pos.y);
    }
  }
  
  void update() {
    alpha = abs(sin(pos.x/10))*255;
    radius = abs(cos(pos.x/50))*maxRadius;
    pos.x += vel;
    pos.y += vel;
    if (pos.x <0) {
      pos.x = width;
    }
    if (pos.x > width) {
      pos.x = 0;
    }
    if (pos.y <0) {
      pos.y = height;
    }
    if (pos.y > height) {
      pos.y = 0;
    }
  }
}
