void keyPressed() {
  // Clear buffer image (printed image) pressing [space]
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
}
