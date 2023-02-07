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

  Button(int TxPos, int TyPos, int Tx, int Ty, int c) {
    xPos = TxPos;
    yPos = TyPos;
    x = Tx;
    y = Ty;
    Pred = PApplet.parseInt(red(c));
    Pgreen = PApplet.parseInt(green(c));
    Pblue = PApplet.parseInt(blue(c));
  }

  Button(int TxPos, int TyPos, int Ts, int c) {
    xPos = TxPos;
    yPos = TyPos;
    x = Ts;
    y = Ts;
    Pred = PApplet.parseInt(red(c));
    Pgreen = PApplet.parseInt(green(c));
    Pblue = PApplet.parseInt(blue(c));
  }

  Button(int TxPos, int TyPos, int Ts, int c, String s) {
    xPos = TxPos;
    yPos = TyPos;
    x = Ts;
    y = Ts;
    Pred = PApplet.parseInt(red(c));
    Pgreen = PApplet.parseInt(green(c));
    Pblue = PApplet.parseInt(blue(c));
    label = s;
  }

  Button(int TxPos, int TyPos, int Tx, int Ty, int c, String s) {
    xPos = TxPos;
    yPos = TyPos;
    x = Tx;
    y = Ty;
    Pred = PApplet.parseInt(red(c));
    Pgreen = PApplet.parseInt(green(c));
    Pblue = PApplet.parseInt(blue(c));
    label = s;
  }

  public void show() {
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
  
  public float sizeOfText(float s){
    return textSize = s;
  }

  public void pressed() {
    if (mousePressed && !mouseDown
      && mouseX > xPos && mouseX < x + xPos
      && mouseY > yPos && mouseY < y + yPos) {
      mouseDown = true;
    }
  }

  public boolean released() {
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

  public boolean mouseOver() {
    if (mouseX > xPos && mouseX < x + xPos 
      && mouseY > yPos && mouseY < y + yPos) {
      return true;
    } else {
      return false;
    }
  }
}
