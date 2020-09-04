void setup(){
  size(380, 670);
  background(#202020);
 
  mouseX = width/2;
  mouseY = height/2;
}

void draw(){
  if(mousePressed){
    clear();
    background(#202020);
  }
  
  
  strokeWeight(.5);
  stroke(random(50),random(255),255,100);
  //line(width/2, height/2, mouseX, mouseY);
  noFill();
  bezier(30,30,  80, mouseX,  mouseY, 75,  mouseX, mouseY);
  //bezier(width/2, height/2,  80, random(mouseX),  random(mouseY), 75,  mouseX, mouseY);
  //bezier(width/2, height/2,  80, mouseX,  mouseY, 75,  random(width), random(height));
}
