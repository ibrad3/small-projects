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
    Pred = 150;
    Pgreen = 150;
    Pblue = 150;
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
    if (mouseOver()){
      red = Pred + 50;
      green = Pgreen + 50;
      blue = Pblue + 50;
    }
    else {
      red = Pred;
      green = Pgreen;
      blue = Pblue;
    }
    
    fill (red, green, blue);
    rect(xPos, yPos, x, y);
    
  }
  
  void pressed(){
    if (mousePressed && !mouseDown
    && mouseX > xPos && mouseX < x + xPos
    && mouseY > yPos && mouseY < y + yPos){
      mouseDown = true;
    }
  }
  
  boolean released(){
    pressed();   
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