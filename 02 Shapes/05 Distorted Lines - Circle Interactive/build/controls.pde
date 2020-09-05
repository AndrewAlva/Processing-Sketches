void keyPressed() {
  // Clear buffer image (printed image) pressing [space]
  if (key == ' ') {
    user_canvas.beginDraw();
      user_canvas.background(clrBG);
    user_canvas.endDraw();
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
  
  // Clear normal screen
  if (key == 'z') {
    background(clrBG);
  }
  
  // Vary rotation chaos
  if (keyCode == UP) {
    distortionRatio += 0.01;
  } else if (keyCode == DOWN) {
    distortionRatio -= 0.01;
  }
  
  
  if (key == '1') {
    circleSteps ++;
  } else if (key == '2') {
    circleSteps --;
  }
  
  
  
  // Restart
  if (key == 'r') {
    //background(clrBG);
    distortionRatio = 0;
    cFrame = floor(random(width));
  }
}
