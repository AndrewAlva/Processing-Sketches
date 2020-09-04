/* ESPIRAL LOGARTÍMICA
* Por Juan Fuentes Cabrera.
* Curva definida por un objeto que se mueve con velocidad lineal constante y velocidad angular.
* Ver: http://mathworld.wolfram.com/LogarithmicSpiral.html
*/

float a, b, angle, radio;
float time;
float centerX, centerY;

void setup() {
  //fullScreen();
  size(500,500);
  
  //background(20,20);
  // Asignación de variables
  a = 2;
  b = 0.25;
  angle = 0.1;
  centerX = width/2;
  centerY = height/2;
  //
  noFill();
  strokeWeight(1);
  stroke(#ff6600);
}

void draw() {
  fill(0,20);
  //background(#010D26);
  rect(0,0,width,height);
  angle = 0;
  beginShape(TRIANGLES);
  getVertice();
  endShape();
}

void getVertice() {
  update();
  float x = cos(angle) * radio + centerX;
  float y = sin(angle) * radio + centerY;
  vertex(x, y);
  if(x < width && y < height) {
    getVertice(); // Recursividad
  }
}

void update() {
  b = abs(cos(time)*0.03);
  radio = a * exp(b * angle);
  angle += 2;
  time += 0.00002;
}
