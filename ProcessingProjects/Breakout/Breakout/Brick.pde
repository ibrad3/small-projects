class Brick{
  int level = int(random(1,4));
  int x, y, xSize = 50, ySize = 25;
  boolean shown = true;
  boolean xPlane, yPlane;
  Brick(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void show(){
    if (shown){
      if (level == 3){
        fill(255,0,0);
      }else if (level == 2){
        fill(0,0,255);
      }else if (level == 1){
        fill(0,255,0);
      }    
    rect(x,y,xSize,ySize);
    fill (255);
    }
  }
}