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

// Images to use as textures of a polygon
//PImage tex1, tex2, tex3, tex4, tex5, tex6, tex7, tex8, tex9, tex10;
PImage tex1;

// ********************************************************************************************************************


void settings() {
  size(stageW, stageH, P3D);
  //fullScreen(P3D);
  mouseX = stageW / 2;
  mouseY = stageH / 2;
}


void setup(){
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_004.jpg");

  tex1 = loadImage(pathDATA + "ring.png");
}


void draw(){
  //background(clrBG);

  image(lightColor1, 0, 0,  stageW, 25);
  
  noStroke();
  fill(#FFFFFF);
  
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

  pointLight(curLight1R, curLight1G, curLight1B,   stageW/2, 0, 500);
  
  hint(DISABLE_DEPTH_TEST);
  
  // Actual drawing
  pushMatrix();
    //translate((stageW/2), (stageH/2), 0); // Center on screen
    translate(mouseX, mouseY, 0); // Follow mouse
    scale(50);
    drawing();
  popMatrix();
}

void drawing() {
  textureMode(NORMAL);

  beginShape(QUADS);
    // BACK CUBE FACE
    texture(tex1);
    vertex( -(0.5), -(0.5), -(0.5),    0, 0); // XYZ  UV
    vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex( -(0.5),  (0.5), -(0.5),    0, 1);
  endShape(CLOSE);
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
