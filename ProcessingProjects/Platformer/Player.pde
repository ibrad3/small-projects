class Player{
  PVector pos, vel;
  float size = 15, grav = 0.1, speed = 3;
  Player(){
    pos = new PVector(20,20);
    vel = new PVector();
  }
  void update (boolean col){
    move(col);
  }
  boolean collides(Platform p){
    return pos.x+size/2>p.pos.x && 
           pos.x-size/2<p.size.x+p.pos.x &&
           pos.y+size/2>p.pos.y && 
           pos.y-size/2<p.size.y+p.pos.y;
    
  }
  void show(){
    noStroke();
    fill(255,0,0);
    ellipse(pos.x,pos.y,size,size);
  }
  void move(boolean col){
    if (col){
      gravity();
    }
    pos.add(vel);
  }
  void gravity(){
    vel.add(0,grav);
  }
}