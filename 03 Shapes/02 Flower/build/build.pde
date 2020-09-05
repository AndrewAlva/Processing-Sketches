// Sketch vars
float x0, y0, radius;
float PI2 = PI * 2;
int shape_steps = 10;
PVector[] vectors = new PVector[shape_steps];


  // For mouse smooth
float cursorX, cursorY;
float cof = 0.2;

// ********************************************************************************************************************

int    stageW     = 1080;
int    stageH     = 720;
float  halfWidth, halfHeight;
color  clrBG      = #090909;
String pathDATA = "../../_data/";
boolean brushFlag = true;
int    cFrame     = 0; // Custom frame count

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
  halfWidth = width / 2;
  halfHeight = height / 2;
  
  cursorX = halfWidth;
  cursorY = halfHeight; 
  
  x0 = halfWidth;
  y0 = halfHeight;
  radius = halfWidth;
  
  float angleUnit = PI2 / shape_steps;
  
  for(int i = 0; i < shape_steps; i++) {
    // Get lines end position
      // Get angle
      float angle = angleUnit * i;
      
      // Apply formula
      float x1 = x0 + (radius * cos(angle) );
      float y1 = y0 + (radius * sin(angle) );
      
      vectors[i] = new PVector(x1, y1);
  }
  
  background(clrBG);
  smooth();

  lightColor1 = loadImage(pathDATA + "color_001.png");
  
  user_canvas = createGraphics(width, height);
}


void draw(){
  updateCursor();
  
  // TAKE COLORS FROM IMAGE
  lightPos1 = (cFrame*5)%lightColor1.width;

  curLight1 = lightColor1.get(lightPos1,1);
  curLight1R = red(curLight1);
  curLight1G = green(curLight1);
  curLight1B = blue(curLight1);
  
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
  
  cFrame ++; // Update from count to move in color position
}
