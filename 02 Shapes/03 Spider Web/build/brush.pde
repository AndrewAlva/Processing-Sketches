void brush() {
  //image(lightColor1, 0, 0,  width, 25);
  
  strokeWeight(1);
  stroke(curLight1R, curLight1G, curLight1B);
  //fill(curLight1R, curLight1G, curLight1B);
  noFill();
  drawing();
}

void bufferBrush() {
  user_canvas.beginDraw();
    //user_canvas.image(lightColor1, 0, 0,  width, 25);
    
    user_canvas.strokeWeight(1);
    user_canvas.stroke(curLight1R, curLight1G, curLight1B);
    //user_canvas.fill(curLight1R, curLight1G, curLight1B);
    user_canvas.noFill();
    bufferDrawing();

  user_canvas.endDraw();
  
  
  //cFrame++; // Update from count to move in color position
}
