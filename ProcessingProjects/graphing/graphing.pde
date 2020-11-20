void setup(){
  size(600,600);
  translate(width/2,height/2);
}

void draw() {
  float prevX = 0, prevY = 0;
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      if (x==y*y/100) {
        strokeWeight(1);
        line(prevX, prevY, x, y);
        prevX = x;
        prevY = y;
      }
    }
  }
}