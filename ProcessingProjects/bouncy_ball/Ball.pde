class Ball{
  float x, y, r = 20;
  float speed, grav = 1;
  
  Ball(float h, float w){
    x = w/2;
    y = h/10;
  }
  boolean collide(){
    if (y>height-r){
      return true;
    }else {
     return false; 
    }
  }
  void move(){
    speed += grav;
    if (collide()){
      speed -= grav;
      speed = -speed+0.1;
    }
    y += speed;
  }
  void show(){
    //fill(255);
    ellipse(x, y, r*2, r*2); 
  }
  
}