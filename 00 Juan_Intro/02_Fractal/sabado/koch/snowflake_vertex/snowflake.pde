
void snowFlake(int order){
  int side = int(min(width, height) * 0.5);
  int separation = int(min(width, height) * 0.05);
  int len = int(side * sin(PI/15));
  
  PVector p1 = new PVector(width / 2, separation);
  PVector p2 = new PVector(width / 2 - side / 2, separation + len);
  PVector p3 = new PVector(width / 2 + side / 2, separation + len);

  drawFlake(order, p1, p2);
  drawFlake(order, p2, p3);
  drawFlake(order, p3, p1);
}


void drawFlake(int order, PVector p1, PVector p2) {
  
  if (order == 0) {
    vertex(p1.x, p1.y);
    vertex(p2.x, p2.y);
    vertex(centerX, centerY);
    //ellipse(p1.x, p1.y, p2.x, p2.y);
  } else {
    float dx = p2.x - p1.x;
    float dy = p2.y - p1.y;
    
    float cosConst = cos(PI/6);
    int zx = int(((p1.x + p2.x)/2 + cosConst * (p1.y - p2.y)/3.0));
    int zy = int(((p1.y + p2.y)/2 + cosConst * (p2.x - p1.x)/3.0));
    
    PVector x = new PVector(p1.x + dx / 3, p1.y + dy / 3);
    PVector y = new PVector(p1.x + dx * 2 / 3, p1.y + dy * 2 / 3);
    PVector z = new PVector(zx, zy);

    drawFlake(order - 1, p1, x);
    drawFlake(order - 1, x, z);
    drawFlake(order - 1, z, y);
    drawFlake(order - 1, y, p2);
  }
  
}
