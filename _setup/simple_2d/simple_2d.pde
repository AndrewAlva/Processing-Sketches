// Simple setup for drawing on mousepressed

int    stageW   = 1080;
int    stageH   = 720;
color  clrBG    = #090909;
String pathDATA = "../data/";
int    cFrame   = 0; // Custom frame count

// ********************************************************************************************************************

// Image to use for coloring light for the scene
PImage lightColor1;

// ********************************************************************************************************************


void settings() {
  size(stageW, stageH);
  //fullScreen();
  mouseX = stageW / 2;
  mouseY = stageH / 2;
}


void setup(){
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_004.jpg");
}


void draw(){
  //background(clrBG);

  image(lightColor1, 0, 0,  stageW, 25);
  
  strokeWeight(2);
  stroke(#ffffff);
  noFill();
  
  if(mousePressed) {
    sketchIt(); 
    cFrame++;
  }
}

void sketchIt() {
  // TOP LIGHT
  int   lightPos1 = (cFrame*5)%lightColor1.width;

  color curLight1 = lightColor1.get(lightPos1,1);
  float curLight1R = red(curLight1);
  float curLight1G = green(curLight1);
  float curLight1B = blue(curLight1);
  
  //fill(curLight1R, curLight1G, curLight1B);
  stroke(curLight1R, curLight1G, curLight1B);
  
  drawing();
}

void drawing() {
  ellipse(mouseX, mouseY, 30, 30);
}


void keyPressed() {
  // Clear bg pressing [space]
  if (key == ' ') {
    background(clrBG); 
  }
  
  // Save current image
  else if (key == 's') {
    saveFrame("01_test-####.tif");
  }
}
