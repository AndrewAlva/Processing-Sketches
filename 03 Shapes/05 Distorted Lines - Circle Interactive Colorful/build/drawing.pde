void drawing() {
  beginShape();
    vertex(0, -lineHeight);
    bezierVertex(-xDistance, -(lineHeight/4)*3,    xDistance, -(lineHeight/4)*3,    0, -(lineHeight/2));
    
    bezierVertex(-xDistance, -(lineHeight/4),    xDistance, -(lineHeight/4),    0, 0);
    
    bezierVertex(-xDistance, lineHeight/4,    xDistance, lineHeight/4,    0, lineHeight/2);
    bezierVertex(-xDistance, (lineHeight/4)*3,    xDistance, (lineHeight/4)*3,    0, lineHeight);
  endShape();
}

void bufferDrawing() {
  user_canvas.beginShape();
    user_canvas.vertex(0, -lineHeight);
    user_canvas.bezierVertex(-xDistance, -(lineHeight/4)*3,    xDistance, -(lineHeight/4)*3,    0, -(lineHeight/2));
    
    user_canvas.bezierVertex(-xDistance, -(lineHeight/4),    xDistance, -(lineHeight/4),    0, 0);
    
    user_canvas.bezierVertex(-xDistance, lineHeight/4,    xDistance, lineHeight/4,    0, lineHeight/2);
    user_canvas.bezierVertex(-xDistance, (lineHeight/4)*3,    xDistance, (lineHeight/4)*3,    0, lineHeight);
  user_canvas.endShape();
}
