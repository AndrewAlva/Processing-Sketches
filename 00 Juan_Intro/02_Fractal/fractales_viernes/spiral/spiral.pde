/* ESPIRAL LOGARTÍMICA
* Por Juan Fuentes Cabrera.
* Curva definida por un objeto que se mueve con velocidad lineal constante y velocidad angular.
* Ver: http://mathworld.wolfram.com/LogarithmicSpiral.html
*/

float a, b, angle;
float centerX, centerY;

void setup() {
  size(800,800);
  // Asignación de variables
  a = 2;
  b = 0.25;
  angle = 0.1;
  centerX = width/2;
  centerY = height/2;
  noLoop();
}

void draw() {
  background(200);
  // El ángulo de rotación para el primer vértice
  angle = 0;
  noFill();
  stroke(0);
  beginShape();
  getVertice();
  endShape();
}

void getVertice() {
  float radio = a * exp(b * angle);
  float x = sin(angle) * radio + centerX;
  float y = cos(angle) * radio + centerY;
  // Dibujamos el vértice
  vertex(x, y);
  angle += 0.5;
  // Recursividad
  if(x < width && y < height) {
    getVertice();
  }
}
