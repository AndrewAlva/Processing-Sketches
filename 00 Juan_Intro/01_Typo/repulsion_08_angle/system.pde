

class TypoSystem {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  TypoSystem(String text, int txtSize, int separation) {
    fill(255);
    translate(width/2, height/2 + (txtSize/2));
    grp = RG.getText(text, "Druk.ttf", txtSize, CENTER);
    grp.draw();
    // Recorremos toda la pantalla a lo alto y ancho
    for (int x = 0; x < width; x+=separation) {
      for (int y = 0; y < height; y+=separation) {
        // Conseguimos el color correspondiente a la posición 'x' y 'y' 
        float rgb = get(x, y);
        // Si el color es blanco, creamos una nueva partícula con la posición y la añadimos a la lista 
        if(rgb == -1.0) {
          particles.add(new Particle(new PVector(x,y)));
        }
        // El otro valor que conseguiremos será -16777216, este es el color opuesto al blanco, osea negro.
        // Simplemente lo ignoramos. Este valor es igual al total de colores rgb de 24 bits 16777216. Si, 16.7 millones de colores.
        println(rgb);
      }
    }
  }

  void run() {
    background(#0D0D0D);
    for(int i=0; i< particles.size(); i++) {
      Particle p = particles.get(i);
      p.draw();
    }
  }
}
