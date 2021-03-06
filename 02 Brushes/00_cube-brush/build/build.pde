// PRECAUCIÓN en este, cada vez que hagas click se guardará una imagen.
// Los ejercicios que siguen tienen un método más controlado para exportar imágenes.

int    stageW   = 1080;
int    stageH   = 720;
color  clrBG    = #ffffff;
String pathDATA = "../../data/";

float cubeSize = 1000;
float cubeScale;

// ********************************************************************************************************************

PImage lightColor1, lightColor2;

// ********************************************************************************************************************

PImage tex1, tex2, tex3, tex4, tex5, tex6;

// ********************************************************************************************************************

void settings() {
  size(stageW, stageH, P3D);
}

void setup(){
  background(clrBG);

  lightColor1 = loadImage(pathDATA + "color_001.png");
  lightColor2 = loadImage(pathDATA + "color_002.png");

  tex1 = loadImage(pathDATA + "tex1.png");
  tex2 = loadImage(pathDATA + "tex2.png");
  tex3 = loadImage(pathDATA + "tex3.png");
  tex4 = loadImage(pathDATA + "tex4.png");
  tex5 = loadImage(pathDATA + "tex5.png");
  tex6 = loadImage(pathDATA + "tex6.png");
}
 
void draw(){
  //background(clrBG);
  //fill(255, 255,255, 0.5);
  //rect(0,0, width, height);
  
  cubeScale = cos(frameCount*.005) * cubeSize;

  //image(lightColor1, 0, 0,  stageW, 25);
  //image(lightColor2, 0, 26, stageW, 25);

  strokeWeight(0);
  noStroke();
  fill(#FFFFFF);

  // TOP LIGHT

  int   lightPos1 = (frameCount*5)%lightColor1.width;

  color curLight1 = lightColor1.get(lightPos1,1);
  float curLight1R = red(curLight1);
  float curLight1G = green(curLight1);
  float curLight1B = blue(curLight1);

  pointLight(curLight1R, curLight1G, curLight1B,   stageW/2, 0, 500);

  // BOTTOM LIGHT

  int   lightPos2 = (frameCount*10)%lightColor2.width;

  color curLight2 = lightColor2.get(lightPos2,1);
  float curLight2R = red(curLight2);
  float curLight2G = green(curLight2);
  float curLight2B = blue(curLight2);

  pointLight(curLight2R, curLight2G, curLight2B,   stageW/2, stageH, 400);  // RGB XYZ

  hint(DISABLE_DEPTH_TEST);

  for (int i = 0; i < 1; ++i) {
    pushMatrix();
      //translate((stageW/2), (stageH/2), 0);
      translate(mouseX, mouseY, 0);
      scale(cubeScale);
      rotateX(radians(frameCount+(i*3)));
      rotateY(radians(frameCount+(i*3)));
      rotateZ(radians(frameCount+(i*3)));
      buildCube();
    popMatrix();
  }
  
  
  if(mousePressed){
    saveFrame("01_test-####.tif");
  }
}

// ********************************************************************************************************************

void buildCube() {
  textureMode(NORMAL);
  
  
  beginShape(QUADS);
    // BACK
    texture(tex3);
    vertex( -(0.5), -(0.5), -(0.5),    0, 0); // XYZ  UV
    vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex( -(0.5),  (0.5), -(0.5),    0, 1);
  endShape(CLOSE);
  

  beginShape(QUADS);
    // FRONT
    texture(tex3);
    vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    vertex(  (0.5), -(0.5),  (0.5),    1, 0);
    vertex(  (0.5),  (0.5),  (0.5),    1, 1);
    vertex( -(0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);

  
  beginShape(QUADS);
    // TOP
    texture(tex3);
    vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    vertex( -(0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5), -(0.5), -(0.5),    1, 1);
    vertex(  (0.5), -(0.5),  (0.5),    0, 1);
  endShape(CLOSE);

  
  beginShape(QUADS);
    // BOTTOM
    texture(tex3);
    vertex( -(0.5),  (0.5),  (0.5),    0, 0);
    vertex( -(0.5),  (0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex(  (0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);
   
  

  beginShape(QUADS);
    // LEFT
    texture(tex2);
    vertex( -(0.5), -(0.5),  (0.5),    0, 0);
    vertex( -(0.5), -(0.5), -(0.5),    1, 0);
    vertex( -(0.5),  (0.5), -(0.5),    1, 1);
    vertex( -(0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);
  
 

  beginShape(QUADS);
    // RIGHT
    texture(tex2);
    vertex(  (0.5), -(0.5),  (0.5),    0, 0);
    vertex(  (0.5), -(0.5), -(0.5),    1, 0);
    vertex(  (0.5),  (0.5), -(0.5),    1, 1);
    vertex(  (0.5),  (0.5),  (0.5),    0, 1);
  endShape(CLOSE);
  
}


void keyPressed() {
  if (key == 'x') {
    background(clrBG); 
  }
}

// ********************************************************************************************************************
