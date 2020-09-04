// Simple setup for drawing on mouse-press

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

// Graphic that will store canvas sketch
PGraphics user_canvas;

// ********************************************************************************************************************


void settings() {
  //size(stageW, stageH);
  fullScreen();
}


void setup(){
  mouseX = width / 2;
  mouseY = height / 2;
  
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_004.jpg");
  
  user_canvas = createGraphics(width, height);
}


void draw(){
  // TAKE COLOR FOR DRAWINGS
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

void drawing() {
  ellipse(mouseX, mouseY, 30, 60);
}

void bufferDrawing() {
  user_canvas.ellipse(mouseX, mouseY, 30, 60);
}

void brush() {
  strokeWeight(2);
  //stroke(curLight1R, curLight1G, curLight1B);
  //noFill();
  fill(255);
  drawing();
}

void sketchIt() {
  user_canvas.beginDraw();
    //user_canvas.image(lightColor1, 0, 0,  width, 25);
    
    user_canvas.strokeWeight(2);
    //user_canvas.stroke(curLight1R, curLight1G, curLight1B);

    //user_canvas.noFill();
    // user_canvas.fill(curLight1R, curLight1G, curLight1B);
    user_canvas.fill(255);
    
    bufferDrawing();

  user_canvas.endDraw();
  
  
  cFrame++; // Update from count to move in color position
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
