// Simple setup for drawing on mousepressed
int    stageW   = 1080;
int    stageH   = 720;
color  clrBG    = #ffffff;
String pathDATA = "../../data/";
int    cFrame   = 150; // Custom frame count
boolean brushFlag = true;

float cubeSize = 1200;
float cubeScale;
float scaleSpeed = 0.01;
int   cubeRepetitions = 5;
float repetitionsSpacing = 0;

// ********************************************************************************************************************

// Image to use for coloring light for the scene
PImage lightColor1;
int   lightPos1;

color curLight1;
float curLight1R, curLight1G, curLight1B;

// ********************************************************************************************************************

// Images to use as textures of a polygon
PImage tex1, tex2, tex3, tex4, tex5, tex6, tex7, tex8, tex9;

// ********************************************************************************************************************

// Graphic that will store canvas sketch
PGraphics user_canvas;

// ********************************************************************************************************************


void settings() {
  //size(stageW, stageH, P3D);
  fullScreen(P3D);
}


void setup(){
  mouseX = stageW / 2;
  mouseY = stageH / 2;
  
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_001.png");
  tex1 = loadImage(pathDATA + "tex1.png");
  tex2 = loadImage(pathDATA + "tex2.png");
  tex3 = loadImage(pathDATA + "tex3.png");
  tex4 = loadImage(pathDATA + "tex4.png");
  tex5 = loadImage(pathDATA + "tex5.png");
  tex6 = loadImage(pathDATA + "tex6.png");
  tex7 = loadImage(pathDATA + "tex7.png");
  tex8 = loadImage(pathDATA + "tex8.png");
  tex9 = loadImage(pathDATA + "tex9.png");
  
  user_canvas = createGraphics(width, height, P3D);
}


void draw(){
  // TAKE COLOR FOR DRAWINGS // TOP LIGHT
  lightPos1 = (cFrame*5)%lightColor1.width;

  curLight1 = lightColor1.get(lightPos1,1);
  curLight1R = red(curLight1);
  curLight1G = green(curLight1);
  curLight1B = blue(curLight1);
  
  cubeScale = abs(cos(cFrame * scaleSpeed) * cubeSize);
  //cubeScale = cubeSize;
  
  // Step 1: Paint background
  background(clrBG);
  
  // Step 2: Print what user has drawn in the buffer
  image(user_canvas, 0, 0);
  
  // Step 3: Show a preview of the brush
  if (brushFlag) {
    brush();
  }
  
  // If user is pressing mouse, save their draws in the buffer so it will appear in next frame
  if(mousePressed) {
    sketchIt();
  }
  
  cFrame++;
}

// Preview of what will be painted
void brush() {
  //image(lightColor1, 0, 0,  width, 25);
  
  pointLight(curLight1R, curLight1G, curLight1B,   stageW/2, stageH/2, 1000);
  hint(DISABLE_DEPTH_TEST);
  
  noStroke();
  fill(#FFFFFF);
  
  for (int i = 0; i < cubeRepetitions; ++i) {
    pushMatrix();
      //translate((stageW/2), (stageH/2), 0); // Center on screen
      translate(mouseX, mouseY, 0); // Follow mouse
      scale(cubeScale);
      rotateX(radians(cFrame + (i * abs(repetitionsSpacing) ) ) );
      rotateY(radians(cFrame + (i * abs(repetitionsSpacing) ) ) );
      rotateZ(radians(cFrame + (i * abs(repetitionsSpacing) ) ) );
      drawing();
    popMatrix();
  }
}


// Actual drawing
void sketchIt() {
  user_canvas.beginDraw();
    //user_canvas.image(lightColor1, 0, 0,  width, 25);
    
    user_canvas.pointLight(curLight1R, curLight1G, curLight1B,   stageW/2, stageH/2, 1000);
    user_canvas.hint(DISABLE_DEPTH_TEST);
    
    user_canvas.noStroke();
    user_canvas.fill(#ffffff);
    
    for (int i = 0; i < cubeRepetitions; ++i) {
      user_canvas.pushMatrix();
        //user_canvas.translate((stageW/2), (stageH/2), 0); // Center on screen
        user_canvas.translate(mouseX, mouseY, 0); // Follow mouse
        user_canvas.scale(cubeScale);
        user_canvas.rotateX(radians(cFrame + (i * abs(repetitionsSpacing) ) ) );
        user_canvas.rotateY(radians(cFrame + (i * abs(repetitionsSpacing) ) ) );
        user_canvas.rotateZ(radians(cFrame + (i * abs(repetitionsSpacing) ) ) );
        bufferDrawing();
      user_canvas.popMatrix();
    }
  user_canvas.endDraw();
  
  
}

void drawing() {
  textureMode(NORMAL);

  beginShape(QUADS);
    // BACK CUBE FACE
    texture(tex9);
    vertex( -(0.5), -(0.5), -(0.5),    0, 0); // XYZ  UV
    vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex( -(0.5),  (0.5), -(0.5),    0, 1);
  endShape(CLOSE);
  
  beginShape(QUADS);
    // FRONT
    texture(tex9);
    vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    vertex(  (0.5), -(0.5),  (0.5),    1, 0);
    vertex(  (0.5),  (0.5),  (0.5),    1, 1);
    vertex( -(0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);
  
  beginShape(QUADS);
    // TOP
    texture(tex9);
    vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    vertex( -(0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5), -(0.5), -(0.5),    1, 1);
    vertex(  (0.5), -(0.5),  (0.5),    0, 1);
  endShape(CLOSE);
  
  beginShape(QUADS);
    // BOTTOM
    texture(tex9);
    vertex( -(0.5),  (0.5),  (0.5),    0, 0);
    vertex( -(0.5),  (0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex(  (0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);

  beginShape(QUADS);
    // LEFT
    texture(tex9);
    vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    vertex( -(0.5), -(0.5), -(0.5),    1, 0);
    vertex( -(0.5),  (0.5), -(0.5),    1, 1);
    vertex( -(0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);

  beginShape(QUADS);
    // RIGHT
    texture(tex9);
    vertex(  (0.5), -(0.5),  (0.5),    0, 0);
    vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex(  (0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);
}

void bufferDrawing() {
  user_canvas.textureMode(NORMAL);

  user_canvas.beginShape(QUADS);
    // BACK CUBE FACE
    user_canvas.texture(tex9);
    user_canvas.vertex( -(0.5), -(0.5), -(0.5),    0, 0); // XYZ  UV
    user_canvas.vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    user_canvas.vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    user_canvas.vertex( -(0.5),  (0.5), -(0.5),    0, 1);
  user_canvas.endShape(CLOSE);

  user_canvas.beginShape(QUADS);
    // FRONT
    user_canvas.texture(tex9);
    user_canvas.vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    user_canvas.vertex(  (0.5), -(0.5),  (0.5),    1, 0);
    user_canvas.vertex(  (0.5),  (0.5),  (0.5),    1, 1);
    user_canvas.vertex( -(0.5),  (0.5),  (0.5),    0, 1);
  user_canvas.endShape(CLOSE);

  user_canvas.beginShape(QUADS);
    // TOP
    user_canvas.texture(tex9);
    user_canvas.vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    user_canvas.vertex( -(0.5), -(0.5), -(0.5),    1, 0);
    user_canvas.vertex(  (0.5), -(0.5), -(0.5),    1, 1);
    user_canvas.vertex(  (0.5), -(0.5),  (0.5),    0, 1);
  user_canvas.endShape(CLOSE);

  user_canvas.beginShape(QUADS);
    // BOTTOM
    user_canvas.texture(tex9);
    user_canvas.vertex( -(0.5),  (0.5),  (0.5),    0, 0);
    user_canvas.vertex( -(0.5),  (0.5), -(0.5),    1, 0);
    user_canvas.vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    user_canvas.vertex(  (0.5),  (0.5),  (0.5),    0, 1);
  user_canvas.endShape(CLOSE);

  user_canvas.beginShape(QUADS);
    // LEFT
    user_canvas.texture(tex9);
    user_canvas.vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    user_canvas.vertex( -(0.5), -(0.5), -(0.5),    1, 0);
    user_canvas.vertex( -(0.5),  (0.5), -(0.5),    1, 1);
    user_canvas.vertex( -(0.5),  (0.5),  (0.5),    0, 1);
  user_canvas.endShape(CLOSE);

  user_canvas.beginShape(QUADS);
    // RIGHT
    user_canvas.texture(tex9);
    user_canvas.vertex(  (0.5), -(0.5),  (0.5),    0, 0);
    user_canvas.vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    user_canvas.vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    user_canvas.vertex(  (0.5),  (0.5),  (0.5),    0, 1);
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
  
  // Show/hide brush
  else if (key == 'x') {
    if (brushFlag) {
      brushFlag = false;
    } else {
      brushFlag = true;
    }
  }
  
  // Vary repetitions spacing
  else if (keyCode == UP) {
    repetitionsSpacing++;
  } else if (keyCode == DOWN) {
    repetitionsSpacing--;
  }
  
}
