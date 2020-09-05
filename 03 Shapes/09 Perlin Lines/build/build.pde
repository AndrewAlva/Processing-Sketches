// Sketch vars
  // For waves
float noiseScale = 0.008;
float spikeScale = 500;
int spikeSpace = 100;
int spikeStroke = 15;
float accel = 2;
boolean lineFlag = true;

  // For mouse smooth
float cursorX, cursorY;
float cofX = 0.05;
float cofY = 0.1;

// ****** LEAP SETUP **************************************************************************************************************

import de.voidplus.leapmotion.*;
LeapMotion leap;
float RindexX, RindexY;

// ********************************************************************************************************************

// Canvas setup
int    stageW   = 1080;
int    stageH   = 720;
color  clrBG    = #090909;
String pathDATA = "../../_data/";
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

// Graphic buffer that will store canvas sketch
PGraphics user_canvas;

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
  
  leap = new LeapMotion(this);
}


void draw(){
  // Step 1: Paint background
  //background(clrBG, 0.1);
  noStroke();
  fill(0, 20);
  rect(0,0, width,height);
  
  // Step 2: Print what user has drawn in the buffer
  image(user_canvas, 0, 0);
  
  // Step 3: Show a preview of the brush
  if (brushFlag) {
    brush();
  }
  
  
  getLeapValues();
  updateCursor();
  
  cFrame += accel; // Update from count to move in color position
  cFrameAccel += accel * 5;
}
