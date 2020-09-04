import geomerative.*;
RShape grp;

TypoSystem ampersand;
PVector cursor = new PVector(0,0);

void setup() {
  fullScreen();
  background(0);
  RG.init(this);
  // Iniciamos una nueva instancia de nuestro sistema.
  // Argumentos son texto y separación
  ampersand = new TypoSystem("K", 500, 20);
}

void draw() {
  // Actualizamos la posición del mouse para efectuar el cálculo de repulsión
  cursor.x = mouseX;
  cursor.y = mouseY;
  // Corremos el sistema en cada frame
  ampersand.run();
}

void mousePressed() {
  // Al click guarda el frame en curso
  saveFrame("repulsion-######.png");
}
