/* Recursividad
*/
float centerX, centerY, radius;

void setup() {
  size(900, 900);
  centerX = width/2;
  centerY = height/2;
  radius = centerX;
  // Si todos los círculos tendrán el mismo relleno y stroke los definimos en setup por cuestiones de performance
  fill(200);
  stroke(0);
  noLoop();
}

void draw() {
  background(200);
  drawCircle(centerX, centerY, radius);
}

// Función recursiva
void drawCircle(float x, float y, float radius) {
  ellipse(x, y, radius, radius);
  // Si el radio es mayor a 'n', seguimos dibujando círculos 
  if(radius > 10) {
    radius = radius / 3;
    // Calculamos un nuevo radio y mandamos a llamar a la función drawCircle
    drawCircle(x, y, radius);
  }
}
