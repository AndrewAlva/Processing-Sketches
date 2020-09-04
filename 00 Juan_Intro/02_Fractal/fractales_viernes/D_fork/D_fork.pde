float angle = PI/6;

void setup() {
  fullScreen();
  background(0);
  stroke(255);
  noLoop();
}

void draw() {
  translate(width/2, height);
  branch(300);
}

void branch(float len) {
  strokeWeight(len/20);
  line(0, 0, 0, -len);
  translate(0, -len);
  // Si seguimos la regla del conjunto de Cantor, el tamaño de las nuevas iteraciones es igual a 2/3 = 0.66
  len *= 0.66;
  // La función se llamará recursivamente mientras la longitud de la rama sea mayor a 3
  // Esta validación podría cambiarse por un número máximo de iteraciones
  if (len > 3) {
    drawBranch(angle, len);
    drawBranch(-angle, len);
  }
}

void drawBranch(float angle, float len) {
  // Guardar estado de transformación de la rama. (Rotación, traslación)
  pushMatrix();
  rotate(angle);
  branch(len);
  popMatrix();
}
