/*
* NOTA IMPORTANTE: Los colores son demasiado brillosos, podrían ser demasiado intensos para algunos :v
*/

float angle = PI/9;
float t = 0;
float size = 200;
float centerY, centerX;

void setup() {
  fullScreen();
  centerX = width/2;
  centerY = height/2;
  stroke(255);
  colorMode(HSB);
}

void draw() {
  update();
  translate(centerX, height);
  branch(size);
}

void update() {
  // Cleaner
  //fill(0, 0, 10, 30);
  fill(0,0,10,abs(sin(t)*40));
  rect(0,0,width,height);
  // 
  angle = abs(sin(t)*PI/2)-0.33;
  size = abs(sin(t)*300);
  t += 0.005;
}

void branch(float len) {
  stroke(0, 0, 200);
  strokeWeight(len/30);
  quad(0, 0, 0, -len, width, height, 0,0);
  translate(0, -len);
  // Si seguimos la regla del conjunto de Cantor, el tamaño de las nuevas iteraciones es igual a 2/3 = 0.66
  len *= 0.66;
  // La función se llamará recursivamente mientras la longitud de la rama sea mayor a 3
  // Esta validación podría cambiarse por un número máximo de iteraciones
  if (len > 40) {
    drawBranch(angle + 250, len);
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
