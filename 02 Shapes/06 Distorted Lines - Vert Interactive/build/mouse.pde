void updateCursor() {
  xDistance = ( (mouseX - cursorX) / 1.5 );
  
  cursorX += (mouseX - cursorX) * cofX;
  cursorY += (mouseY - cursorY) * cofY;
  
  lineHeight = (halfHeight - cursorY/2) * 2;
}
