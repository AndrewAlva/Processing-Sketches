/*
* NOTA IMPORTANTE: Los colores son demasiado brillosos, podrían ser demasiado intensos para algunos :v
*/

float angle = PI/6;
float t = 0;
float size = 300;
float centerY, centerX;

void setup() {
  fullScreen();
  centerX = width/2;
  centerY = height/2;
  stroke(0);
  strokeWeight(2);
  colorMode(HSB);
}

void draw() {
  update();
  translate(centerX, height);
  beginShape(TRIANGLE_FAN);
  branch(size);
  
}

void update() {
  // Cleaner
  fill(255, 30);
  rect(0,0,width,height);
  // 
  angle = abs(sin(t)*PI/2)-0.33;
  size = abs(sin(t)*500);
  t += 0.005;
}

void branch(float len) {
  vertex(0,0);
  vertex(0,-len * 2);
  //line(0, 0, 0, -len);
  translate(0, -len);
  // Si seguimos la regla del conjunto de Cantor, el tamaño de las nuevas iteraciones es igual a 2/3 = 0.66
  len *= 0.66;
  // La función se llamará recursivamente mientras la longitud de la rama sea mayor a 3
  // Esta validación podría cambiarse por un número máximo de iteraciones
  if (len > 20) {
    drawBranch(angle, len);
    drawBranch(-angle, len);
  } else {
    endShape();
  }
}

void drawBranch(float angle, float len) {
  // Guardar estado de transformación de la rama. (Rotación, traslación)
  pushMatrix();
  rotate(angle);
  branch(len);
  popMatrix();
}
