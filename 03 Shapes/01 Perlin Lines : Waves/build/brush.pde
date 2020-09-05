void brush() {
  //image(lightColor1, 0, 0,  width, 25);
  
  strokeWeight(spikeStroke);
  noFill();
  drawing();
}

void bufferBrush() {
  user_canvas.beginDraw();
    //user_canvas.image(lightColor1, 0, 0,  width, 25);
    
    user_canvas.strokeWeight(spikeStroke);
    user_canvas.noFill();
    bufferDrawing();

  user_canvas.endDraw();
  
  
  //cFrame++; // Update from count to move in color position
}
