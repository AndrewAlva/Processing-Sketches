/* Recursividad
*/
float centerX, centerY, radius, squareSize, counter, angle, rotation, index;

void setup() {
  size(900, 900);
  //fullScreen();
  background(15);
  centerX = width/2;
  centerY = height/2;
  radius = centerX;
  angle = PI/12;
  rotation = counter * angle;
  index = 0;
  // Si todos los círculos tendrán el mismo relleno y stroke los definimos en setup por cuestiones de performance
  noFill();
  //fill(255,30);
  strokeWeight(.5);
  stroke(255);
  rectMode(CENTER);
  //noLoop();
}

void draw() {
  fill(0, 5);
  translate(centerX, centerY);
  rotate(angle);
  drawCircleSquare(0, 0, width);
}

// Función recursiva
void drawCircleSquare(float x, float y, float radius) {
  drawCircle(x,y,radius);
  getSquareSize(radius);
  rotation = cos(counter) * TWO_PI*2;
  drawSquare(x, y, squareSize, rotation);
  
  
  
  if(radius > 2) {
    drawCircleSquare(x, y, squareSize);
  }
}


void drawCircle(float x, float y, float radius) {
  pushMatrix();
  ellipse(x, y, radius, radius);
  popMatrix();
}

void getSquareSize(float radius) {
  squareSize = sqrt(sq(radius) / 2);
}

void drawSquare(float x, float y, float size, float angle) {
  index ++;
  pushMatrix();
  translate(x, y);
  rotate(size/1000 * angle);
  rect(0, 0, size, size);
  popMatrix();
  counter += 0.0004;
}
