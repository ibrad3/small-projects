class Board{
  // generating hexagon
  float sideStep, downStep;
  int sideLength;
  float size = 400.0f/sideLength;
  float gap = 500.0f;
  float startX, startY;
  int number = sideLength*(sideLength*2-1)+((sideLength-1)*(sideLength-1));
  Circle[] circles = new Circle[number]; 
  
  // game stuff
  int bombs;
  int flags;
  boolean exploded;
  boolean won = false;
  Board(int sideLength, float difficulty){
    this.sideLength = sideLength;
    size = 400.0f/sideLength;
    gap = 500.0f;
    number = sideLength*(sideLength*2-1)+((sideLength-1)*(sideLength-1));
    circles = new Circle[number];
    
    sideStep = 1.0f/sideLength;
    downStep = sqrt(3.0f)/(sideLength*2.0f-1.0f);
    startX = (width/2.0f)-(sideStep*(sideLength/2.0f-0.5f)*gap);
    startY = (height/2.0f)-(downStep*(sideLength-1.0f)*gap);
    float maxX = sideLength;
    float xIt = 0, yIt = 0;
    float x = startX, y = startY;
    for (int i = 0; i < number; i++){
       circles[i] = new Circle(x, y);
       x += gap*sideStep;
       xIt++;
       if (xIt >= maxX){
         xIt = 0;
         yIt ++;
         y += gap*downStep;
         if (yIt < sideLength){
           startX = startX - (gap*sideStep)/2;
           maxX ++;
         } else {
           startX = startX + (gap*sideStep)/2;
           maxX --;
         }
         x = startX;
       }
    }
    
    // game
    bombs = (int) (number * difficulty);
    int currentBombs = 0;
    while (currentBombs < bombs){
      int randomNumber = (int) random(0, number);
      if (circles[randomNumber].text != 'B'){
        circles[randomNumber].text = 'B';
        currentBombs++;
      }
    }
    
    for (Circle c : circles){
      c.addNeighbours(circles, size);
    }
    exploded = false;
  }
  
  public void show(boolean fine){
    background(51);
    int flags = 0;
    won = true;
    for (Circle c : circles){
      c.show(size, exploded);
      flags += c.flag ? 1 : 0;
      exploded = exploded || (c.open && c.text == 'B');
      won = won && ((!(c.text == 'B') && c.open) || c.text == 'B');
    }
    colorMode(RGB);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    if (exploded && fine) {
      text("BETTER LUCK NEXT TIME :(", width/2, 40);
      for (Circle c : circles){
        c.open = true;
      }
    } else if (won){ 
      for (Circle c : circles){
        if (!c.open){
          c.flag = true;
        }
      }
      text("YOU WIN!", width/2, 40);
    } else {
      text("" + flags + "/" + bombs, width/2, 40);
    }
  }
}
