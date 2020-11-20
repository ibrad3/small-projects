class Button {

  int xPos; 
  int yPos; 
  int x; 
  int y;
  float textSize = 24;

  int red; 
  int green; 
  int blue;
  int Pred; 
  int Pgreen; 
  int Pblue;

  String label="";

  boolean mouseDown = false;

  Button(int TxPos, int TyPos, int Tx, int Ty, color c) {
    xPos = TxPos;
    yPos = TyPos;
    x = Tx;
    y = Ty;
    Pred = int(red(c));
    Pgreen = int(green(c));
    Pblue = int(blue(c));
  }

  Button(int TxPos, int TyPos, int Ts, color c) {
    xPos = TxPos;
    yPos = TyPos;
    x = Ts;
    y = Ts;
    Pred = int(red(c));
    Pgreen = int(green(c));
    Pblue = int(blue(c));
  }

  Button(int TxPos, int TyPos, int Ts, color c, String s) {
    xPos = TxPos;
    yPos = TyPos;
    x = Ts;
    y = Ts;
    Pred = int(red(c));
    Pgreen = int(green(c));
    Pblue = int(blue(c));
    label = s;
  }

  Button(int TxPos, int TyPos, int Tx, int Ty, color c, String s) {
    xPos = TxPos;
    yPos = TyPos;
    x = Tx;
    y = Ty;
    Pred = int(red(c));
    Pgreen = int(green(c));
    Pblue = int(blue(c));
    label = s;
  }

  void show() {
    noStroke();
    if (this.mouseOver()) {
      red = Pred + 50;
      green = Pgreen + 50;
      blue = Pblue + 50;
    } else {
      red = Pred;
      green = Pgreen;
      blue = Pblue;
    }

    fill (red, green, blue);
    rect(xPos, yPos, x, y, 20);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(label, xPos+x/2, yPos+y/2);
  }
  
  float sizeOfText(float s){
    return textSize = s;
  }

  void pressed() {
    if (mousePressed && !mouseDown
      && mouseX > xPos && mouseX < x + xPos
      && mouseY > yPos && mouseY < y + yPos) {
      mouseDown = true;
    }
  }

  boolean released() {
    pressed();   
    if (!mousePressed && mouseDown
      && mouseX > xPos && mouseX < x + xPos
      && mouseY > yPos && mouseY < y + yPos) {
      mouseDown = false;
      return true;
    } else {      
      return false;
    }
  }

  boolean mouseOver() {
    if (mouseX > xPos && mouseX < x + xPos 
      && mouseY > yPos && mouseY < y + yPos) {
      return true;
    } else {
      return false;
    }
  }
}
