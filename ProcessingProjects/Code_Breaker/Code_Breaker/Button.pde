class Button{
  
  int xPos; int yPos; 
  int x; int y;
  
  int red; int green; int blue;
  int Pred; int Pgreen; int Pblue;
  
  boolean mouseDown = false;
  
  Button(int TxPos,int TyPos, int Tx, int Ty){
    xPos = TxPos;
    yPos = TyPos;
    x = Tx;
    y = Ty;
    Pred = 51;
    Pgreen = 51;
    Pblue = 51;
  }
  
  Button(int TxPos,int TyPos, int Tx, int Ty, color c){
    xPos = TxPos;
    yPos = TyPos;
    x = Tx;
    y = Ty;
    Pred = int(red(c));
    Pgreen = int(green(c));
    Pblue = int(blue(c));
  }
  
  void show(){
    noStroke();
    if (this.mouseOver()){
      if (Pred+50 < 255){
        red = Pred + 50;
      }else {
        red = Pred - 50;
      }
      if (Pgreen+50 < 255){
        green = Pgreen + 50;
      }else {
        green = Pgreen - 50;
      }
      if (Pblue+50 < 255){
        blue = Pblue + 50;
      }else {
        blue = Pblue - 50;
      }
    }
    else {
      red = Pred;
      green = Pgreen;
      blue = Pblue;
    }
    
    fill (red, green, blue);
    rect(xPos, yPos, x, y);
    
  }
  
  private void down(){
    if (mousePressed && !mouseDown
    && mouseX > xPos && mouseX < x + xPos
    && mouseY > yPos && mouseY < y + yPos){
      mouseDown = true;
    }
  }
  
  boolean pressed(){
    down();   
    if (!mousePressed && mouseDown
    && mouseX > xPos && mouseX < x + xPos
    && mouseY > yPos && mouseY < y + yPos){
      mouseDown = false;
      return true;
    }else{      
      return false;      
    }
  }
  
   boolean mouseOver(){
    if(mouseX > xPos && mouseX < x + xPos 
    && mouseY > yPos && mouseY < y + yPos){
      return true;
    }else{
      return false;
    }
  }
}