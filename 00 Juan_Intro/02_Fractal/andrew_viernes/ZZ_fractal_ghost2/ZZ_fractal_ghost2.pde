//float angle = 8800;
float angle = 2333;
int maxiterations = 25;
float time = 0;

void setup() {
  size(400,680);
  colorMode(HSB);
}

void draw() {
  //background(255);
  fill(255,sin(time * 50));
  float ca = sin(angle/3.3);
  float cb = cos(angle*2.1);

  float w = abs(sin(angle))*0.2+2;
  float h = (w * height) / width;

  float xmin = -w/2;
  float ymin = -h/2;

  loadPixels();

  float xmax = xmin + w;
  float ymax = ymin + h;

  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  float y = ymin;
  
  for (int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < width; i++) {
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        // Acá debería estirarse al infinito, poner un límite Máximo de operaciones. 
        if (aa + bb > 3.0) {
          break;
        }
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
        n++;
      }
      float hu = sqrt(float(n) / angle);
      pixels[i+j*width] = color(hu);
      // ¿Gradientes? La extensión del pixel al infinito, puede usarse para asignar un color
      if (n == maxiterations) {
        pixels[i+j*width] = color(127,255,55,5);
      } else {
        pixels[i+j*width] = color(127, n*16 % 255, 255,sin(random(10,30)));
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  angle += 0.01;
  time += 0.001;
}
