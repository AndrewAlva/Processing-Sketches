void drawing() {
  for(int i = 0; i < shape_steps; i++) {
    int endIndex = i + 1;
    if (endIndex >= shape_steps){ endIndex = 0;}
    
    //line(x0, y0, vectors[i].x, vectors[i].y);
    
    beginShape();
      curveVertex(cursorX, cursorY);
      curveVertex(halfWidth, halfHeight);
      
      curveVertex(vectors[endIndex].x, vectors[endIndex].y);
      curveVertex(cursorX, cursorY);
    endShape();
  }
  
}

void bufferDrawing() {
  for(int i = 0; i < shape_steps; i++) {
    int endIndex = i + 1;
    if (endIndex >= shape_steps){ endIndex = 0;}
    
    //user_canvas.line(x0, y0, vectors[i].x, vectors[i].y);
    
    user_canvas.beginShape();
      user_canvas.curveVertex(cursorX, cursorY);
      user_canvas.curveVertex(halfWidth, halfHeight);
      
      user_canvas.curveVertex(vectors[endIndex].x, vectors[endIndex].y);
      user_canvas.curveVertex(cursorX, cursorY);
    user_canvas.endShape();
  }
}
