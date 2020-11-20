int background = 255;
void setup() {
  fullScreen();
  frameRate(1000);
  background(background);
}
float prevX, prevY;
float thick = 1;
float colour = 0;
void draw() {
  if (mousePressed && (prevX != mouseX || prevY != mouseY)) {
    if (mouseButton == LEFT){
      stroke(colour);
      strokeWeight(thick);
    } if(mouseButton == RIGHT){
      stroke(background);
      strokeWeight(thick*4);
    }
    line(prevX, prevY, mouseX, mouseY);
    noStroke();
  }
  if (keyPressed && key == 8) {
    background(background);
  }
  if (keyPressed && (key >= 48 && key <= 57)){
    colour = map(key,48,57,0,255);
  }
  prevX = mouseX;
  prevY = mouseY;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (thick + e*-1 >= 0){
    thick += e*-1;
  }
}