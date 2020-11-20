class Ball {
  float d = 16, x, y, xSpeed, ySpeed = 5;

  Ball() {
  }
  void move() {
    x+=xSpeed;
    y+=ySpeed;
  }
  void hitPaddle(Paddle p) {
    if (y+d/2>p.y && x+d/2 > p.x && x-d/2 < p.x+p.xSize ) {
      if (!Breakout.ballMove)
        y -= d/2;
      ySpeed = -ySpeed;
      if (x < p.x+p.xSize*0.25) {
        xSpeed = -3;
      } else if (x > p.x+p.xSize*0.25 && x <= p.x+p.xSize*0.5) {
        xSpeed = -1.5;
      } else if (x > p.x+p.xSize*0.5 && x <= p.x+p.xSize*0.75) {
        xSpeed = 1.5;
      } else if (x > p.x+p.xSize*0.75) {
        xSpeed = 3;
      }
    }
    //if (Breakout.aiOn && y > height-200) {
      //p.x = int(x-p.xSize/2);
      p.x = int(lerp(p.x, x-p.xSize/2, 0.1));
    //}
  }
  void hitBrick(Brick b) {   
    if (x>b.x-d/2 && x<b.x+b.xSize+d/2 &&
      y>b.y-d/2 && y<b.y+b.ySize+d/2) {
      if (b.xPlane) {
        ySpeed = -ySpeed;
      }
      if (b.yPlane) {
        xSpeed = -xSpeed;
      }
      if (!b.xPlane && !b.yPlane) {
        ySpeed = -ySpeed;
        xSpeed = -xSpeed;
      }
      b.level-=1;
    }
    b.xPlane = x>b.x-d/2 && x<b.x+b.xSize+d/2;
    b.yPlane = y>b.y-d/2 && y<b.y+b.ySize+d/2;
  }
  void hitBoundry(float w) {
    if (x-d/2 <  0) {
      xSpeed = -xSpeed;
      x += xSpeed;
    }
    if (x+d/2 > w) {
      xSpeed = -xSpeed;
      x += xSpeed;
    }
    if (y-d/2 < 0) {
      ySpeed = -ySpeed;
    }
  }
  void show() {
    ellipse(x, y, d, d);
  }
}