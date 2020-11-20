class Ball{
  float d, x, y, xSpeed=1, ySpeed=1, w, h;
  PVector pos=new PVector(), vel=new PVector();
  Ball(float r, float w1, float h1) {
    d = r*2;
    pos.x = random(15,w1-15);
    pos.y = random(15,h1-15);
    vel = PVector.random2D();
    vel.mult(random(2,4));
    w = w1;
    h = h1;
  }
  void move(){
   pos.add(vel);
  }
  void update(){
    if (hitX()){
      vel.x = -vel.x;
    }
    if (hitY()){
      vel.y = -vel.y;
    }
    move();
  }
  void show(){
    ellipse (pos.x,pos.y,d,d);
  }
  boolean hitX(){
    return (pos.x-d/2 < 0 || pos.x+d/2 > w);
  }
  boolean hitY(){
    return (pos.y-d/2 < 0 || pos.y+d/2 > h);
  }
}