/* ESPIRAL LOGARTÍMICA
* Por Juan Fuentes Cabrera.
* Curva definida por un objeto que se mueve con velocidad lineal constante y velocidad angular.
* Ver: http://mathworld.wolfram.com/LogarithmicSpiral.html
*/

float a, b, angle, radio;
float time;
float centerX, centerY;

void setup() {
  size(800,800);
  // Asignación de variables
  a = 2;
  b = 0.25;
  angle = 0.1;
  centerX = width/2;
  centerY = height/2;
}

void draw() {
  background(0);
  angle = 0;
  fill(0);
  stroke(255);
  beginShape();
  getVertice();
  endShape();
}

void getVertice() {
  update();
  float x = sin(angle) * radio + centerX;
  float y = cos(angle) * radio + centerY;
  ellipse(x,y,angle,angle);
  if(x < width && y < height) {
    getVertice(); // Recursividad
  }
}

void update() {
  b = abs(cos(time)*0.3)+0.1;
  radio = a * exp(b * angle);
  angle += abs(cos(time)*0.5)+0.35;
  time += 0.0001;
}
