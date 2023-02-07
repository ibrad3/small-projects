class Circle {
  float x, y;
  char text;
  int bombs = 0, flags = 0;
  ArrayList<Circle> neighbours;
  boolean open;
  boolean flag;
  boolean ready;
  boolean hover;
  public Circle(float x, float y){
    this.x = x;
    this.y = y;
    neighbours = new ArrayList<Circle>();
    open = false;
    ready = true;
    text = ' ';
  }
  
  public void show(float size, boolean exploded){
    float distance = dist(x,y,mouseX,mouseY);
    if (!mousePressed){
      hover = false;
    }
    if (distance < size/2.0f && !exploded){
      colorMode(RGB);
      fill(127);
      if (mousePressed && mouseButton == LEFT && !keyPressed && !flag){
        open();
        if (bombs > 0 && flags == bombs){
          for (Circle c : neighbours){
            if (!c.open && !c.flag && text != 'B'){
              c.open();
            }
          }
        } else if (bombs > 0){
          hover();
        }
      }
      if (mousePressed && (mouseButton == RIGHT || keyCode == CONTROL && keyPressed) && ready && !open){
        flag = !flag;
        ready = false;
        for (Circle c : neighbours){
          if (flag){
            c.flags++;
          } else {
            c.flags--;
          }
        }
      } 
      if (!mousePressed && !ready){
        ready = true;
      }
    } else {
      noFill();
    }
    stroke(127);
    circle(x, y, size);
    if (open){
      if (text == 'B'){
        colorMode(RGB);
        fill(255,0,0);
        circle(x, y, size);
      } else {
        if (bombs > 0){
          colorMode(RGB);
          fill(255);
          textAlign(CENTER, CENTER);
          textSize(size);
          text("" + bombs, x, y-size/5);
        }
        noFill();
      }
    } else {
      if (flag){
        fill(0,255,0);
      } else {
        fill(distance < size/2 || hover ? 127 : 255);
      }
      circle(x, y, size);
    }
  }
  
  // checks bombs and adds neighbours
  public void addNeighbours(Circle[] circles, float size){
    for (Circle c : circles){
      float distance = dist(this.x, this.y, c.x, c.y);
      if (distance > 0 && distance < size*2){
        neighbours.add(c);
      } 
    }
    for (Circle c : neighbours){
      if (c.text == 'B'){
        bombs++;
      }
    }
  }
  public void open(){
    open = true;
    for (Circle c : neighbours){
      if (bombs == 0 && !c.flag && text != 'B'){
        if (c.bombs == 0 && !c.open && c.text != 'B'){
          c.open();
        }
        if (!c.open && c.text != 'B'){
          c.open = true;
        }
      }
    }
  }
  public void hover(){
    for (Circle c : neighbours){
      if (open && !c.open){
        c.hover = true;
      }
    }
  }
}
