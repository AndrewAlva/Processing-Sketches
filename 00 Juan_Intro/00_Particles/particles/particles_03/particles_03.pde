ArrayList<Particle> particles;
int particlesCount;

PFont f;
String sinVal;
  
void setup() {
  size(375, 667);
  particlesCount = 4000;
  particles = new ArrayList<Particle>();
  for (int i = 0; i < particlesCount; i++) {
    particles.add(new Particle(new PVector(random(width),random(height))));
  }
  
  f = createFont("Founders Grotesk - Regular.otf", 24);
  textFont(f);
}
 
void draw() {
  background(0);
  noStroke();
  for (int i = 0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
  
  //fill(255);
  //textAlign(LEFT);
  //text(sinVal, 0, 24);
  
  //saveFrame("01_output/lava_####.png");
  //println(frameRate);
}

class Particle {
  PVector pos;
  float maxRadius, radius;
  float vel, alpha;
  float r,g,b;
 
  Particle(PVector v) {
    alpha = random(255);
    pos = v.copy();
    vel = random(0.25, 3);
    maxRadius = random(2,20);
    radius = maxRadius;
    r = 255;
    g = random(128) + 100;
    b = 0;
  }
 
  void draw() {
    fill(r,g,b, alpha);
    ellipse(pos.x, pos.y, radius, radius);
    update();
  }
  
  void update() {
    //alpha = abs(sin(pos.x/10))*255;
    alpha = 255;
    //radius = abs(cos(pos.x/50))*maxRadius;
    radius = maxRadius;
    pos.x -= vel;
    if (pos.x < 0 - radius) {
      pos.x = width + radius;
    }
    if (pos.y < 0 - radius) {
      pos.y = height + radius;
    }
    if (pos.y > height + radius) {
      pos.y = 0 - radius;
    }

    pos.y += (cos(pos.x/70));

    sinVal = "pos.y cos val: " + pos.y;
  }
}
