boolean flagColor = true;

// Setup for drawing on mouse-press
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

void setup(){
  //size(stageW, stageH);
  fullScreen();
  
  mouseX = width / 2;
  mouseY = height / 2;
  
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_005.jpg");
  
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
    user_canvas.beginDraw();
      //user_canvas.image(lightColor1, 0, 0,  width, 25);
      
      user_canvas.strokeWeight(2);
      user_canvas.noFill();
  
      sketchIt(); 
      
    user_canvas.endDraw();
  }
}

void drawing() {
  //bezier(width/2 - mouseX, sin(cFrame)*20,  width/2, height - mouseY/2,      width/2 + mouseY/2, height/2,   width, cos(cFrame)*50);
  
  // S open shape
  /*
  bezier(width - mouseX, height,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, 0);
  */
  
  
  // S closed shape
  /*
  bezier(0, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  width, mouseY);
  */
  
  // S–H Shape
  
  bezier(width - mouseX, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, mouseY);
  
}

void bufferDrawing() {
  //user_canvas.bezier(width/2 - mouseX, sin(cFrame)*20,  width/2, height - mouseY/2,      width/2 + mouseY/2, height/2,   width, cos(cFrame)*50);
  
  // S open shape
  /*
  user_canvas.bezier(width - mouseX, height,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  user_canvas.bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, 0);
  */
  
  
  // S closed shape
  /*
  user_canvas.bezier(0, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  user_canvas.bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  width, mouseY);
  */
  
  // S–H Shape
  
  user_canvas.bezier(width - mouseX, height - mouseY,  width/2, height,      width * 0.8, height/2,  width/2, height/2);
  user_canvas.bezier(width/2, height/2,  width * .2, height/2,      width/2, 0,  mouseX, mouseY);
  
}


void brush() {
  noFill();
  
  if (flagColor) {
    stroke(196, 13, 60); // SUB red
  } else {
    stroke(random(55),random(255),255,100); // blue
  }
  
  drawing();
}


void sketchIt() {
  user_canvas.beginDraw();
    user_canvas.noFill();
  
    if (flagColor) {
      user_canvas.stroke(196, 13, 60); // SUB red
    } else {
      user_canvas.stroke(random(55),random(255),255,100); // blue
    }
    
    bufferDrawing();

  user_canvas.endDraw();
  
  cFrame++; // Update from count to move in color position
}


void keyPressed() {
  if (keyCode == UP) {
    if (flagColor) {
      flagColor = false;
    } else {
      flagColor = true;
    }
  }
  
  // Clear buffer
  else if (key == ' ') {
    user_canvas.beginDraw();
      user_canvas.background(clrBG);
    user_canvas.endDraw();
  }
  
  // Save current image
  else if (key == 's') {
    saveFrame("01_test-####.tif");
  }
  
  
}
