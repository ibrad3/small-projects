class drop{
  float x;
  float y;
  float speed;
  float grav;
  drop(){
   grav = .1;
   x=random(0,width);
   y=random(height*-5,0);
   speed = random(1,2);
  }
}