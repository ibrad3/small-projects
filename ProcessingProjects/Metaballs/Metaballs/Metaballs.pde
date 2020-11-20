Ball[] ball = new Ball[10];
void setup(){
  fullScreen();
  for (int i = 0; i < ball.length; i++){
    ball[i] = new Ball(5, width, height);
  }
  frameRate(240);
  noStroke();
}

void draw(){
  //background(0);
  loadPixels();
  for (int x = 0; x < width; x++){
      for (int y = 0; y < height; y++){
        int index = x + y * width;
        float d = 0;
        float sum = 0;
           for (int i = 0; i < ball.length; i++){
        d = dist(x,y,ball[i].pos.x,ball[i].pos.y);
        sum += 3500 / d;
           }
            pixels[index] = color(sum);
        }
        
        
      }
       updatePixels();
  
  for (int i = 0; i < ball.length; i++){
    ball[i].update();
    fill(0);
    //ball[i].show();
  }
  }



 