String message = "HELLO WORLD ";
float _angle = TWO_PI / message.length();
PFont arial;
float diameter = 100;
float ang = 0;

void setup() {
  size(800, 800);
  arial = createFont("Comic Sans MS", 40);
  textFont(arial);
  textAlign(CENTER);
  smooth(8);
  //noSmooth();
  String[] fontList = PFont.list();
  printArray(fontList);
}

void draw() {
  fill(0, 60);
  stroke(#ff0000);
  rect(0,0,width,height);

  translate(width/2, height/2);
  rotate(ang);
  fill(255);

  circleText();

  ang += 0.005;
}

void circleText() {
  for (int i = 0; i < message.length(); i ++ ) {
    char currentChar = message.charAt(i);
    float angulo = _angle * i;
    float x = cos(angulo) * diameter;
    float y = sin(angulo) * diameter;
    pushMatrix();
    translate(x, y);
    rotate(-ang);
    text(currentChar, 0, 0);
    popMatrix();
  }
}
