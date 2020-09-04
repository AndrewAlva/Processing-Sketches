// Simple setup for drawing on mousepressed

int    stageW   = 1080;
int    stageH   = 720;
color  clrBG    = #090909;
String pathDATA = "../data/";
int    cFrame   = 0; // Custom frame count

// ********************************************************************************************************************

// Image to use for coloring light for the scene
PImage lightColor1;
int   lightPos1;

color curLight1;
float curLight1R, curLight1G, curLight1B;

// ********************************************************************************************************************

// Images to use as textures of a polygon
//PImage tex1, tex2, tex3, tex4, tex5, tex6, tex7, tex8, tex9, tex10;
PImage tex1;

// ********************************************************************************************************************

// Graphic that will store canvas sketch
PGraphics user_canvas;

// ********************************************************************************************************************


void settings() {
  size(stageW, stageH, P3D);
  //fullScreen(P3D);
}


void setup(){
  mouseX = stageW / 2;
  mouseY = stageH / 2;
  
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_004.jpg");
  tex1 = loadImage(pathDATA + "tex1.png");
  
  user_canvas = createGraphics(width, height, P3D);
}


void draw(){
  // TAKE COLOR FOR DRAWINGS // TOP LIGHT
  lightPos1 = (cFrame*5)%lightColor1.width;

  curLight1 = lightColor1.get(lightPos1,1);
  curLight1R = red(curLight1);
  curLight1G = green(curLight1);
  curLight1B = blue(curLight1);
  
  // Step 1: Paint background
  background(clrBG);
  
  // Step 2: Print what user has drawn in the buffer
  image(user_canvas, 0, 0);
  
  // Step 3: Show a preview of the brush
  brush();
  
  // If user is pressing mouse, save their draws in the buffer so it will appear in next frame
  if(mousePressed) {
    sketchIt();
  }
}


void brush() {
  image(lightColor1, 0, 0,  width, 25);
  
  pointLight(curLight1R, curLight1G, curLight1B,   stageW/2, stageH/2, 10000);
  hint(DISABLE_DEPTH_TEST);
  
  noStroke();
  fill(#FFFFFF);
  
  pushMatrix();
    //translate((stageW/2), (stageH/2), 0); // Center on screen
    translate(mouseX, mouseY, 0); // Follow mouse
    scale(100);
    drawing();
  popMatrix();
}


void sketchIt() {
  // Actual drawing  
  user_canvas.beginDraw();
    user_canvas.image(lightColor1, 0, 0,  width, 25);
    
    user_canvas.pointLight(curLight1R, curLight1G, curLight1B,   stageW/2, stageH/2, 10000);
    user_canvas.hint(DISABLE_DEPTH_TEST);
    
    user_canvas.noStroke();
    user_canvas.fill(#ffffff);
    
    user_canvas.pushMatrix();
      //user_canvas.translate((stageW/2), (stageH/2), 0); // Center on screen
      user_canvas.translate(mouseX, mouseY, 0); // Follow mouse
      user_canvas.scale(100);
      bufferDrawing();
    user_canvas.popMatrix();
  user_canvas.endDraw();
  
  cFrame++;
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

void bufferDrawing() {
  user_canvas.textureMode(NORMAL);

  user_canvas.beginShape(QUADS);
    // BACK CUBE FACE
    user_canvas.texture(tex1);
    user_canvas.vertex( -(0.5), -(0.5), -(0.5),    0, 0); // XYZ  UV
    user_canvas.vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    user_canvas.vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    user_canvas.vertex( -(0.5),  (0.5), -(0.5),    0, 1);
  user_canvas.endShape(CLOSE);
}


void keyPressed() {
  // Clear bg pressing [space]
  if (key == ' ') {
    user_canvas.beginDraw();
      user_canvas.background(clrBG);
    user_canvas.endDraw();
  }
  
  // Save current image
  else if (key == 's') {
    saveFrame("01_test-####.tif");
  }
}
