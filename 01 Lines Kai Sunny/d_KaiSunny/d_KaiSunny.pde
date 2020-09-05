import processing.pdf.*;

boolean flagColor = true;

void setup(){
  // size(380, 670);
  fullScreen();
  mouseX = width;
  mouseY = 0;
  
  beginRecord(PDF, "i.pdf");
  background(#202020);
}

void draw(){
  //clear();
  //background(#202020);
  
  
  
  if(mousePressed){
    endRecord();
    clear();
    beginRecord(PDF, "i-####.pdf");
    background(#202020);
  }
  
  
  noFill();
  //strokeWeight(random(4));
  
  if (flagColor) {
    stroke(255, random(255),25,100); // red
    //stroke( random(55, 255), random(55), random(100, 255),100); // purple
    //stroke(0, 50, 250);
    
  } else {
    //stroke(random(55),255, random(255),100); // green
    stroke(random(55),random(255),255,100); // blue
    //stroke(0, 50, 50);
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
    beginRecord(PDF, "i-####.pdf");
    
  } else if (key == 32) {
    if (flagColor) {
      flagColor = false;
    } else {
      flagColor = true;
    }
  }
  
  
}
