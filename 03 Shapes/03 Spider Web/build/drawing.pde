void drawing() {
  for(int i = 0; i < shape_steps; i++) {
    beginShape();
      //line(x0, y0, vectors[i].x, vectors[i].y);
      vertex(vectors[i].x, vectors[i].y); // first point
      bezierVertex(x0, y0, cursorX, cursorY, cursorX, cursorY);
    endShape();
  }
  
}

void bufferDrawing() {
  for(int i = 0; i < shape_steps; i++) {
    user_canvas.beginShape();
      //user_canvas.line(x0, y0, vectors[i].x, vectors[i].y);
      user_canvas.vertex(vectors[i].x, vectors[i].y); // first point
      user_canvas.bezierVertex(x0, y0, cursorX, cursorY, cursorX, cursorY);
    user_canvas.endShape();
  }
}
