import geomerative.*;
RShape grp;

void setup() {
  size(800, 800);

  fill(#ff0000, 0);
  stroke(255);
  strokeWeight(2);
  RG.init(this);
  smooth();
  background(0);  
}

void draw() {
  background(0);
  
  translate(width/2, height/2);
  
  grp = RG.getText("Geomerative", "Saol.ttf", 100, CENTER);
  grp.draw();
}
