import processing.pdf.*;

boolean flagColor = true;

void setup(){
  // size(380, 670);
  fullScreen();
  mouseX = width;
  mouseY = 0;
  
  beginRecord(PDF, "a.pdf");
  background(#000000);
}

void draw(){
  //clear();
  //background(#000000);
  
  
  
  if(mousePressed){
    endRecord();
    clear();
    beginRecord(PDF, "a-####.pdf");
    background(#000000);
  }
  
  
  noFill();
  //strokeWeight(random(4));
  
  if (flagColor) {
    stroke(196, 13, 60); // SUB red
    
  } else {
    stroke(random(55),random(255),255,100); // blue
  }
  
  bezier(width/2 - mouseX, sin(frameCount)*2000,  width/2, height - mouseY/2,      width/2 + mouseY/2, height/2,   width, cos(frameCount)*500);
  
  // S open shape
  /*
  bezier(width - mouseX, height,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, 0);
  */
  
  
  // S closed shape
  /*
  bezier(0, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  width, mouseY);
  */
  
  // S–H Shape
  /*
  bezier(width - mouseX, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, mouseY);
  */
  
}


void keyPressed() {
  if (key == 's') {
    
    endRecord();
    beginRecord(PDF, "a-####.pdf");
    
  } else if (key == 32) {
    if (flagColor) {
      flagColor = false;
    } else {
      flagColor = true;
    }
  }
  
  
}
