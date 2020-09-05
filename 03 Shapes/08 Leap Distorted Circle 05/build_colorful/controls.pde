void keyPressed() {
  // Clear buffer image (printed image) pressing [space]
  if (key == ' ') {
    background(clrBG);
  }
  
  // Save current image
  if (key == 's') {
    saveFrame("01_test-####.tif");
  }
  
  // Show/hide brush
  if (key == 'x') {
    if (brushFlag) {
      brushFlag = false;
    } else {
      brushFlag = true;
    }
  }
  
  // Vary rotation chaos
  if (keyCode == UP) {
    background(clrBG);
    distortionRatio += 0.01;
  } else if (keyCode == DOWN) {
    background(clrBG);
    distortionRatio -= 0.01;
  } else if (keyCode == LEFT){
    lightColor1 = loadImage(pathDATA + "color_003.jpg");
  } else if (keyCode == RIGHT) {
    lightColor1 = loadImage(pathDATA + "color_004.jpg");
  }
  
  
  if (key == '0') {
    circleSteps = 3;
  } else if (key == '1') {
    circleSteps = 5;
  } else if (key == '2') {
    circleSteps = 10;
  } else if (key == '3') {
    circleSteps = 15;
  } else if (key == '4') {
    circleSteps = 20;
  } else if (key == '5') {
    circleSteps = 25;
  } else if (key == '6') {
    circleSteps = 40;
  } else if (key == '7') {
    circleSteps = 60;
  } else if (key == '8') {
    circleSteps = 70;
  } else if (key == '9') {
    circleSteps = 100;
  }
  
  // Restart Y control value
  else if (key == 'z') {
    cursorY = height;
    background(clrBG);
  }
  
  // Restart
  if (key == 'r') {
    //background(clrBG);
    distortionRatio = 0;
    cFrame = floor(random(width));
  }
}
