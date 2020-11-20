class Paddle {
  int w, x = 0, y, xSize = 70, ySize = 10;
  boolean xPlane, yPlane;
  Paddle(int w_){
    w = w_;
  }
  void show(){
    if (!Breakout.aiOn){
      x=mouseX-xSize/2;
    }
    x = constrain(x,0,w-xSize);
    rect(x,y,xSize,ySize);
  }
}