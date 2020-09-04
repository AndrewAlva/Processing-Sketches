
void circularText() {
  float _angle = TWO_PI / message.length();
  for (int i = 0; i < message.length(); i ++ ) {
    char currentChar = message.charAt(i);
    float angulo = _angle * i;
    float x = cos(angulo) * diameter;
    float y = sin(angulo) * diameter;
    pushMatrix();
    translate(x, y);
    text(currentChar, 0, 0);
    popMatrix();
  }
}
