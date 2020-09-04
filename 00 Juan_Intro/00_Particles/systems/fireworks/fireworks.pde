ArrayList<ParticleSystem> fireworks;

void setup() {
  size(640, 600);
  fireworks = new ArrayList<ParticleSystem>();
}

void draw() {
  background(0);
  for (int i=0; i< fireworks.size(); i++) {
    ParticleSystem f = fireworks.get(i);
    f.run();
  }
}

void mousePressed() {
  fireworks.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
