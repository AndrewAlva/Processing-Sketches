void drawing() {
  beginShape();
    vertex(0, -height);
    bezierVertex(halfWidth, 0,    -halfWidth, 0,    0, height);
  endShape();
}

void bufferDrawing() {
  user_canvas.beginShape();
    user_canvas.vertex(0, -height);
    user_canvas.bezierVertex(halfWidth, 0,    -halfWidth, 0,    0, height);
  user_canvas.endShape();
}
