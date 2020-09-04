 //Contenedor de partículas
ArrayList<Particle> particles;
// Color de background
color bgColor = 230;
// Grosor del trazo
float weight = 0.5; 

void setup() {
  //size(1200, 800);
  fullScreen();
  
  particles = new ArrayList<Particle>();
  background(bgColor);
}

void draw() {
  for(int i=0; i< particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
}

void mouseDragged() {
  particles.add(new Particle(new PVector(mouseX,mouseY)));
}

void keyPressed() {
  // Evaluamos la tecla pulsada para generar controles
  switch(str(key).toLowerCase()) {
    // Si el usuario pulsa n, limpiamos la pantalla
    case "n":
      background(bgColor);
    break;
    // S guarda un screen
    case "s":
      saveFrame("Screen-######.png");
    break;
    // + aumenta el grosor del brush
    case "+":
      weight+= 0.5;
    break;
    // - disminuye el grosor del brush
    case "-":
      if (weight > 0.5){
        weight-= 0.5;
      }
    break;
  }
}
