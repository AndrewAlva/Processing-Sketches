void circularText() {
  fill(0);
  for (int i = 0; i < message.length(); i ++ ) {
    String currentChar = str(message.charAt(i));
    float angulo = _angle * i;
    setChar(currentChar, angulo);
  }
}

void setChar(String caracter, float angulo) {
  float x = cos(angulo) * diameter;
  float y = sin(angulo) * diameter;
  float escala = abs(sin(time));
  pushMatrix();
  rotate(-time*4+angulo);
  scale(time+angulo);
  translate(x, y);
  grp = RG.getText(caracter, "Druk.ttf", 100, CENTER);
  grp.draw();
  popMatrix();
}
