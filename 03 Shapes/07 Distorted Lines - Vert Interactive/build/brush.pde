void brush() {
  //image(lightColor1, 0, 0,  width, 25);
  
  strokeWeight(strokesWidth);
  stroke(curLight1R, curLight1G, curLight1B);
  //fill(curLight1R, curLight1G, curLight1B);
  noFill();
  
  for(int i = 0; i <= horizontalSteps; i++) {
    pushMatrix();
      translate( (width / horizontalSteps * i), height);
      drawing();
    popMatrix();
  }
}

void bufferBrush() {
  user_canvas.beginDraw();
    //user_canvas.image(lightColor1, 0, 0,  width, 25);
    
    user_canvas.strokeWeight(strokesWidth);
    user_canvas.stroke(curLight1R, curLight1G, curLight1B);
    //user_canvas.fill(curLight1R, curLight1G, curLight1B);
    user_canvas.noFill();
    
    for(int i = 0; i <= horizontalSteps; i++) {
      user_canvas.pushMatrix();
        user_canvas.translate( (width / horizontalSteps * i), height);
        bufferDrawing();
      user_canvas.popMatrix();
    }

  user_canvas.endDraw();
  
  
  //cFrame++; // Update from count to move in color position
}
