// Simple setup for drawing on mouse-press
int    stageW   = 1080;
int    stageH   = 720;
color  clrBG    = #090909;
String pathDATA = "../data/";
boolean brushFlag = true;
int    cFrame   = 0; // Custom frame count
int    cFrameAccel   = 0; // Custom frame count

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

// Sketch vars
  // For waves
float noiseScale = 0.008;
float spikeScale = 500;
int spikeSpace = 5;
int spikeStroke = 6;

  // For mouse smooth
float cursorX, cursorY;
float cof = 0.1;

// ********************************************************************************************************************

void settings() {
  //size(stageW, stageH);
  fullScreen();
}


void setup(){
  cursorX = width / 2;
  cursorY = height / 2; 
  
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_003.jpg");
  
  user_canvas = createGraphics(width, height);
}


void draw(){
  updateCursor();
  
  // Step 1: Paint background
  background(clrBG, 0.1);
  
  // Step 2: Print what user has drawn in the buffer
  image(user_canvas, 0, 0);
  
  // Step 3: Show a preview of the brush
  if (brushFlag) {
    brush();
  }
  
  
  // If user is pressing mouse, save their draws in the buffer so it will appear in next frame
  if(mousePressed) {
    bufferBrush();
  }
  
  cFrame += spikeSpace * 2; // Update from count to move in color position
  cFrameAccel += spikeSpace * 5;
}
