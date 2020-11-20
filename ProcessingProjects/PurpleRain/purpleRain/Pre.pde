class Pre {
  int type;
  PVector pos, vel;
  float thickness, len;
  color col;
  Pre(int t) {
    type = t;
    len = 5;
    vel = new PVector();
    if (type == HAIL){
      thickness = random(random(random(0.1, width/40)));
    }else {
      thickness = random(random(random(random(0.1, width/40))));
    }
    pos = new PVector(random(-width, 2*width), -100);
    colorise();
  }

  void colorise() {
    if (type == SNOW) {
      col = color(255); //white
    } else if (type == RAIN) {

      colorMode(HSB);
      //col = color(random(255), 255, 255, 750/thickness); //rainbow

      colorMode(RGB);
      col = color(0, 0, 255, 750/thickness); //blue
      //col = color(120, 0, 120, 750/thickness); //purple
      //col = color(0, 120, 0, 750/thickness); //green
    } else if (type == HAIL) {
      col = color(100, 100, 255);
    }
  }
  void fall(float g, PVector w) {
    int xStrength, yStrength;
    if (type == SNOW) {
      xStrength = 5;
      yStrength = 30;
      g /= 10;
      
    } else if (type == HAIL) {
      g *= 1.5;
      yStrength = xStrength = 20;
    } else {
      yStrength = xStrength = 20;
    }
    vel.add(0, g);
    vel.set(vel.x + w.x*thickness/xStrength, vel.y + w.y*thickness/yStrength);
    pos.add(vel.x, vel.y*thickness);
  }

  boolean offScreen() {
    return pos.y > (height + len)*(thickness+1);
  }
  void show() {
    fill (col);    
    stroke(col);

    float visThick = thickness + 0.5;

    if (type == SNOW || type == HAIL) {
      noStroke();
      ellipse(pos.x, pos.y, visThick, visThick);
    } else if (type == RAIN) {
      strokeWeight(visThick);
      line(pos.x, pos.y, pos.x, pos.y + len * visThick);
    }
  }
}