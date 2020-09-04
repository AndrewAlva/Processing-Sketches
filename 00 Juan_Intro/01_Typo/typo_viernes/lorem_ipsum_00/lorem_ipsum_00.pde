// PFont => Processing Font => Tipo de variable
PFont arial;
// Definición de variables de texto
String title = "Boring Ipsum";
String str = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo";

void setup() {
  size(800, 600);
  // Asignación de fuente y tamaño a la variable arial 
  arial = createFont("Arial", 40);
  textFont(arial);
  smooth(); // Suavizado: 2, 4, 6, 8
  // noSmooth(); // Sin suavizado
  // Listar las fuentes del sistema
  printArray(PFont.list());
}

void draw() {
  background(0);
  
  fill(#ff0000);
  textSize(100);
  text(title, 0, 100);
  
  fill(255);
  textSize(40);
  text(str, 10, 180, width, height);
}
