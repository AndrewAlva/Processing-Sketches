void updateCursor() {
  // Influenced by mouse
  /*
  cursorX += (mouseX - cursorX) * cofX;
  cursorY += (mouseY - cursorY) * cofY;
  xDistance = ( (mouseX - cursorX) / 1.5 );
  lineHeight = (halfHeight - cursorY/2) * 2;
  */
  
  // Influenced by hand
  cursorX += (RindexX - cursorX) * cofX;
  cursorY += (RindexY - cursorY) * cofY;
}
