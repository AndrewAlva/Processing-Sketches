import processing.pdf.*;

boolean flagColor = true;
float yPosition = 0;
float ySpeed = 2;

void setup(){
  // size(380, 670);
  fullScreen();
  beginRecord(PDF, "g.pdf");
  background(#202020);
  
 
  mouseX = width;
  mouseY = 0;
}

void draw(){
  if(mousePressed){
    endRecord();
    clear();
    beginRecord(PDF, "g-####.pdf");
    background(#202020);
  }
  
  
  strokeWeight(random(4));
  
  if (flagColor) {
    //stroke(random(55),255, random(255),100); // green
    //stroke( random(55, 255), random(55), random(100, 255),100); // purple
    stroke(random(55),random(255),255,100); // blue
  } else {
    stroke(255, random(255),25,100); // red
    
  }
  
  noFill();
  bezier(0, mouseY,  mouseX/2, mouseY,      mouseY, mouseX,  mouseX, mouseY);
  
  yPosition += ySpeed;
  if (yPosition > height) {
    yPosition = height;
    ySpeed *= -1;
  } else if (yPosition < 0) {
     yPosition = 0;
     ySpeed *= -1;
  }
}


void keyPressed() {
  if (key == 's') {
    endRecord();
    beginRecord(PDF, "g-####.pdf");
    
  } else if (key == 32) {
    if (flagColor) {
      flagColor = false;
    } else {
      flagColor = true;
    }
  }
  
  
}
