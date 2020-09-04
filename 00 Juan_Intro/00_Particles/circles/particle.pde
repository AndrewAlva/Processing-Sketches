class Circle {
  PVector velocity;
  PVector acceleration;
  PVector position;
  float radius;
  int limit = 5;
  float fillColor;
  
  Circle(PVector v) {
    position = v.copy();
    // Asignamos valor random al radio.
    // Añadimos + 1 al final para obtener como resultado mínimo una 1 de radio.
    radius = random(8) + 2;
    // Iniciamos un valor inicial de velocidad en x y y
    velocity = new PVector(0,0);
    fillColor = random(255);
  }
 
  void draw() {
    update();
    fill(fillColor);
    ellipse(position.x, position.y, radius, radius);
  }
  
  void update() {  
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse, position);
    // Asignamos la magnitud a la aceleración.
    // La magnitud es la cantidad total de la aceleración, mientras que la dirección es la orientanción con la que se está moviendo el objeto. Si este está desacelerando, la aceleración será negativa.
    acceleration.setMag(0.1);
    // Actualizamos la velocidad añadiendo la aceleración
    velocity.add(acceleration);
    velocity.limit(limit);
    // Actualizamos la posición añadiendo velocidad
    position.add(velocity);
    checkEdges();
  }
  
  void checkEdges(){
    if(position.x > width){
      position.x = width;
      velocity.x *= -1;
    }
    if(position.x < 0){
      position.x = 0;
      velocity.x *= -1;
    }
    if(position.y > height){
      position.y = height;
      velocity.y *= -1;
    }
    if(position.y < 0){
      position.y = 0;
      velocity.y *= -1;
    }
  }
}
