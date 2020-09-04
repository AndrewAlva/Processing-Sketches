String letters = "Hello";
color fillColor = color(255);

void setup() {
  size(800, 800);
  stroke(255);
  textSize(64);
  textAlign(CENTER);
}

void draw() {
  background(0);
  fill(fillColor);
  text(letters, 0, 20, width, height);
}

void keyPressed() {
  // Al presionar una tecla, volvemos el color de relleno rojo
  fillColor = #ff0000;
  // Evaluamos si es la tecla de retroceso, quitamos un caracter, con la función substring()
  if (key == BACKSPACE) {
    if (letters.length() > 0) {
      letters = letters.substring(0, letters.length()-1);
    }
  // Si es una tecla diferente a CTRL+ALT+UP+DOWN
  } else if (key != CODED) {
    letters = letters + key;
  }
  println(key);
}

void keyReleased() {
  // Cuando se suelta la tecla, el color de relleno se vuelve blanco
  fillColor = #ffffff;
}
