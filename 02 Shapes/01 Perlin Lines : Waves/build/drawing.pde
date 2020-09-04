void drawing() {
  for (int x=0; x < width; x= x + spikeSpace) {
    float noiseVal = noise((cFrame + x) * noiseScale, cursorY * noiseScale);
    //stroke(noiseVal*255);
    
    // TAKE COLOR FOR DRAWINGS
    lightPos1 = (cFrameAccel + x) % lightColor1.width;

    curLight1 = lightColor1.get(lightPos1, 1);
    curLight1R = red(curLight1);
    curLight1G = green(curLight1);
    curLight1B = blue(curLight1);

    stroke(curLight1R, curLight1G, curLight1B);
    line(x, cursorY + (noiseVal * spikeScale) - spikeScale/2, x, height );
  }
}

void bufferDrawing() {
  for (int x=0; x < width; x= x + spikeSpace) {
    float noiseVal = noise((cFrame + x) * noiseScale, cursorY * noiseScale);
    //user_canvas.stroke(noiseVal*255);
    
    // TAKE COLOR FOR DRAWINGS
    lightPos1 = (cFrameAccel + x) % lightColor1.width;

    curLight1 = lightColor1.get(lightPos1, 1);
    curLight1R = red(curLight1);
    curLight1G = green(curLight1);
    curLight1B = blue(curLight1);

    user_canvas.stroke(curLight1R, curLight1G, curLight1B);
    user_canvas.line(x, cursorY + (noiseVal * spikeScale) - spikeScale/2, x, height );
  }
}
