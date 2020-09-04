// Definición de variables
String message;
float centerX, centerY;
float diameter, ang;

void setup() {
  size(800, 800);
  textAlign(CENTER);
  // Asignación de variables
  textSize(30);
  diameter = 200;
  message = "HELLO WORLD ";
  centerX = width/2;
  centerY = height/2;
  ang = 0;
  smooth(8);
}

void draw() {
  background(0);
  stroke(#ff0000);

  translate(centerX, centerY);
  rotate(ang);
  fill(255);

  circularText();

  ang += 0.0075;
}
