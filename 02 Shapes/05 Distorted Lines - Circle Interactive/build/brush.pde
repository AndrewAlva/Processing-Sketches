void brush() {
  //image(lightColor1, 0, 0,  width, 25);
  
  strokeWeight(strokesWidth);
  stroke(curLight1R, curLight1G, curLight1B);
  //fill(curLight1R, curLight1G, curLight1B);
  noFill();
  
  for(int i = 0; i < circleSteps; i++) {
    pushMatrix();
      translate(halfWidth, halfHeight);
      //rotate(radians(cFrame % 360) );
      rotate(radians( (360/circleSteps + cFrame * distortionRatio) * i) );
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
    
    user_canvas.pushMatrix();
      user_canvas.translate(halfWidth, halfHeight);
      //user_canvas.rotate(radians(cFrame % 360) );
      bufferDrawing();
    user_canvas.popMatrix();

  user_canvas.endDraw();
  
  
  //cFrame++; // Update from count to move in color position
}
