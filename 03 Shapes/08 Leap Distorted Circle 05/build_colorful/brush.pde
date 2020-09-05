void brush() {
  //image(lightColor1, 0, 0,  width, 25);
  
  strokeWeight(strokesWidth);
  
  //fill(curLight1R, curLight1G, curLight1B);
  noFill();
  
  for(int i = 0; i < circleSteps; i++) {
    // TAKE COLORS FROM IMAGE
    lightPos1 = (cFrame*i)%lightColor1.width;
  
    curLight1 = lightColor1.get(lightPos1,1);
    curLight1R = red(curLight1);
    curLight1G = green(curLight1);
    curLight1B = blue(curLight1);
    
    stroke(curLight1R, curLight1G, curLight1B);

    pushMatrix();
      translate(halfWidth, halfHeight);
      //rotate(radians(cFrame % 360) );
      rotate(radians( (360/circleSteps + cFrame * distortionRatio) * i) );
      drawing();
    popMatrix();
  }
}
