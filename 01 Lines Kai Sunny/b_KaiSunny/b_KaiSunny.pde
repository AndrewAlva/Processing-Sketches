import processing.pdf.*;

boolean flagColor = true;

void setup(){
  size(400, 200);
  // fullScreen();
  beginRecord(PDF, "c.pdf");
  background(#202020);
  
 
  mouseX = width;
  mouseY = 0;
}

void draw(){
  if(mousePressed){
    endRecord();
    clear();
    beginRecord(PDF, "d-####.pdf");
    background(#202020);
  }
  
  
  
  noFill();
  
  
  for(int i = 0; i < height; i+= random(4)) {
    if (flagColor) {
      stroke(random(55),random(255),255,100);
    } else {
      stroke(255, random(255),25,100);
    }
    
    strokeWeight(i);
    bezier(0, i, 0, i,   width,i, width, i);
  }
}


void keyPressed() {
  if (key == 's') {
    endRecord();
    
  } else if (key == 32) {
    if (flagColor) {
      flagColor = false;
    } else {
      flagColor = true;
    }
  }
  
  
}
