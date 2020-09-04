PImage img;
Ball c;
ArrayList<Ball> balls;
int totalBalls;

void setup() {
  size(800,600);
  //c = new Ball();
  img = loadImage("ball.png");
  
  totalBalls = 5;
  balls = new ArrayList<Ball>();
  for(int i = 0; i < totalBalls; i++){
    balls.add(new Ball(random(50) + 50));
  };
}

void draw() {
  background(255);
  //c.draw();
  for(int i = 0; i < balls.size(); i++){
    Ball b = balls.get(i);
    b.draw();
  };
}
