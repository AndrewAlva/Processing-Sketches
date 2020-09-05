void updateCursor() {
  cursorX += (mouseX - cursorX) * cof;
  cursorY += (mouseY - cursorY) * cof;
}
