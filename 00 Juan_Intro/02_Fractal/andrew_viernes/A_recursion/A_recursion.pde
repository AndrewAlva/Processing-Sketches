/* Recursividad
*/
float centerX, centerY, radius, cor;
int counter;

void setup() {
  size(900, 900);
  counter = 1;
  cor = 45;
  centerX = width/2;
  centerY = height/2;
  radius = width;
  // Si todos los círculos tendrán el mismo relleno y stroke los definimos en setup por cuestiones de performance
  fill(200);
  stroke(0);
  noLoop();
}

void draw() {
  background(200);
  drawRect(0, 0, radius);
}

// Función recursiva
void drawRect(float x, float y, float radius) {
  pushMatrix();
  //translate(-radius/2, -radius/2);
  //rotate(PI / 3);
  rect(x, y, radius, radius);
  popMatrix();
  
  counter += 1;
  
  // Si el radio es mayor a 'n', seguimos dibujando círculos 
  if(radius > 10) {
    radius = radius / 1.5;
    // Calculamos un nuevo radio y mandamos a llamar a la función drawCircle
    drawRect(x, y, radius);
  }
}
