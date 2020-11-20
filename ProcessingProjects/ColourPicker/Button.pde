class Button {

  int dif = 50;

  PVector pos; 
  PVector size;

  color col;
  color pCol;

  boolean mouseDown = false;
  
  Button(int xPos, int yPos, int w, int h){
    pos = new PVector(xPos, yPos);
    size = new PVector(w, h);
    pCol = color(random(255),random(255),random(255));
  }

  Button(int xPos, int yPos, int w, int h, color c) {
    pos = new PVector(xPos, yPos);
    size = new PVector(w, h);
    pCol = c;
  }

  void show() {
    float red = colChange(red(pCol)), 
      green = colChange(green(pCol)), 
      blue = colChange(blue(pCol));

    noStroke();
    if (this.mouseOver()) {
      col = color(red, green, blue);
    } else {
      col = pCol;
    }

    fill (col);
    rect(pos.x, pos.y, size.x, size.y);
  }

  void pressed() {
    if (mousePressed && !mouseDown
      && mouseOver()) {
      mouseDown = true;
    } 
    if (!(mouseOver())) {
      mouseDown = false;
    }
  }

  boolean released() {
    pressed();   
    if (!mousePressed && mouseDown
      && mouseOver()) {
      mouseDown = false;
      return true;
    } else {      
      return false;
    }
  }

  float colChange (float c) {
    if (c > 255 - dif) {
      return c - dif;
    } else {
      return c + dif;
    }
  }

  boolean mouseOver() {
    if (mouseX > pos.x && mouseX < size.x + pos.x 
      && mouseY > pos.y && mouseY < size.y + pos.y) {
      return true;
    } else {
      return false;
    }
  }
}