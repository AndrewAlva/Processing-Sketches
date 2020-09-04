/* Recursividad
*/
color[] colors = { #2651A6, #4BC3F2, #F2CB05, #F2AE2E, #F29727};

void setup() {
  fullScreen();
  noStroke();
  noLoop();
}

void draw() {
  background(200);
  drawRect(width/2, height/2, width, height);
}

// Función recursiva
void drawRect(float x, float y, float w, float h) {
  color fillColor = colors[int(random(colors.length))];
  pushMatrix();
  translate(-w/2, -h/2);
  fill(fillColor);
  rect(x, y, w, h);
  popMatrix();
  // Si el tamaño es mayor a 'n', seguimos dibujando cuadrados 
  if(h > 10 && w > 10) {
    drawRect(x, y, w/2, h/1.1);
  }
}
