Ball ball, ball2, ball3;

void setup(){
  size(600,400);
  //frameRate(240);
  ball = new Ball(height, width);
  ball2 = new Ball(height*0.5, width*0.5);
  ball3 = new Ball(height*0.75, width*0.75);
}

void draw(){
  background(0);
  fill(255);
  ball.move();
  ball.show();
  ball2.move();
  ball2.show();
  fill (255,0,0);
  ball3.move();
  ball3.show();
}