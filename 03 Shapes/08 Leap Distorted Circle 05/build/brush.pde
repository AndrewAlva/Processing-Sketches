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
