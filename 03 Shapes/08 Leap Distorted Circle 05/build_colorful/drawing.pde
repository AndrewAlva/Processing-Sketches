void drawing() {
  beginShape();
    vertex(0, -lineHeight);
    bezierVertex(-xDistance, -(lineHeight/4)*3,    xDistance, -(lineHeight/4)*3,    0, -(lineHeight/2));
    
    bezierVertex(-xDistance, -(lineHeight/4),    xDistance, -(lineHeight/4),    0, 0);
    
    bezierVertex(-xDistance, lineHeight/4,    xDistance, lineHeight/4,    0, lineHeight/2);
    bezierVertex(-xDistance, (lineHeight/4)*3,    xDistance, (lineHeight/4)*3,    0, lineHeight);
  endShape();
}
