import processing.pdf.*;

boolean flagColor = true;

void setup(){
  // size(380, 670);
  fullScreen();
  mouseX = width;
  mouseY = 0;
  
  beginRecord(PDF, "sub.pdf");
  background(#000000);
}

void draw(){
  //clear();
  //background(#000000);
  
  
  
  if(mousePressed){
    endRecord();
    clear();
    beginRecord(PDF, "sub-####.pdf");
    background(#000000);
  }
  
  
  noFill();
  //strokeWeight(random(4));
  
  if (flagColor) {
    stroke(196, 13, 60); // SUB red
    
  } else {
    stroke(random(55),random(255),255,100); // blue
  }
  
  /*
  bezier(width - mouseX, height,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, 0);
  */
  
  /*
  bezier(0, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  width, mouseY);
  */
  
  bezier(width - mouseX, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, mouseY);
  
  
  
  
}


void keyPressed() {
  if (key == 's') {
    
    endRecord();
    beginRecord(PDF, "sub-####.pdf");
    
  } else if (key == 32) {
    if (flagColor) {
      flagColor = false;
    } else {
      flagColor = true;
    }
  }
  
  
}
