class Platform{
  PVector pos, size;
  Platform(int x, int y, int w, int h){
    pos = new PVector(x,y);
    size = new PVector(w,h);
  }
  void show(){
    noStroke();
    fill(255);
    rect(pos.x,pos.y,size.x,size.y);
  }
}