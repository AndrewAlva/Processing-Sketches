// Conjunto de Cantor
// Por Juan Fuentes
// Cantor set en diferentes lenguajes https://rosettacode.org/wiki/Cantor_set

// Variable para separación de un nivel a otro
float separation;

void setup() {
  size(900, 300);
  // Se asigna el valor a separación del alto sobre 6.
  // ¿Podría extenderse al infinito y no sólo a 6 niveles?
  // SI realizas distintas pruebas verás que después del 6 paso el dibujo ya no es perceptible, porque comienza a dibujar fracciones de pixel
  separation = height/6;
  background(0);
  noLoop();
}

void draw() {
  noStroke();
  fill(255);
  cantor(10, 10, width-20);
}

void cantor(float x, float y, float len) {
  // Mientras más abajo dibujamos líneas, más delgadas son
  float h = (height - y) / 30;
  rect(x,y,len,h);
  // Validación de salida. Si la longitud es mayor a 3 su divisibilidad en la menor parte dará como resultado 1
  if (len > 3) {
    y += separation;
    cantor(x,y,len/3);
    cantor(x+len*2/3,y,len/3);
  }
}
