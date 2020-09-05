void keyPressed() {
  // Clear canvas image (printed image) pressing [space]
  if (key == ' ') {
    background(clrBG);
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
  
  
  // Restart Y control value
  else if (key == '0') {
    cursorY = height;
  }
  
  
  // Change between lines and circles
  else if (keyCode == UP) {
    lineFlag = false;
  } else if (keyCode == DOWN) {
    lineFlag = true;
  }
}
