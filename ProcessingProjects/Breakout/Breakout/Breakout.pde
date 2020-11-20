Paddle paddle;
int x = 5, y = 10;
Brick[][] brick;
Ball ball = new Ball();
int gap, lives = 3, brickAmount = x*y, textSize;
static boolean ballMove = false
  , gameStarted = false
  , aiOn = false;
Button playButton, exitButton, aiButton;

void setup() {  
  noStroke();
  size(400, 600);
  surface.setResizable(false);
  //fullScreen();
  paddle = new Paddle(width);
  aiButton = new Button(5, 5, 50, 50, color(255, 0, 0));
  playButton = new Button(width/2-137, height/2-50, 275, 100, color(0, 255, 0));
  exitButton = new Button(width/2-137, int(height*0.75-50), 275, 100, color(255, 0, 0));
  gap = (width-50*x)/(x+1);
  brickGen();
}

void draw() {
  background(51);
  if (gameStarted) {
    startGame();
  } else {
    menu();
  }
}
void keyPressed() {
  if (key == BACKSPACE) {
    reset();
  }
}
void menu() {
  aiButton.show();
  playButton.show();
  exitButton.show();
  fill(255);
  textSize = 85;
  textSize(textSize);
  text("START", width/2-playButton.x/2+3, height/2-playButton.y/2+textSize-5);
  text("EXIT", width/2-exitButton.x/2+45, height*0.75-exitButton.y/2+textSize-5); 
  text("Breakout!", width/2-195, height/4);
  textSize = 40;
  textSize(textSize);
  text("AI", 10, textSize+5);
  if (aiButton.pressed()) {
    aiOn = !aiOn;
    if (aiOn){
      aiButton.Pgreen = 255;
      aiButton.Pred = 0;
    }else {
      aiButton.Pgreen = 0;
      aiButton.Pred = 255;
    }
  }
  if (playButton.pressed()) {
    gameStarted=true;
  }
  if (exitButton.pressed()) {
    exit();
  }
}
void startGame() {  
  if (ball.y+ball.d/2 > height) {
    lives--;
    ballMove = false;
    ball = new Ball();
  }
  if (lives == 0) {
    reset();
  }
  stroke(255);
  textSize = 24;
  textSize(textSize);
  text("Lives: " + lives, 0, textSize);
  noStroke();
  if (mousePressed) {
    ballMove=true;
  }
  if (ballMove) {
    ball.move();
  } else {
    ball.x = constrain(paddle.x+paddle.xSize/2, paddle.xSize/2, width-paddle.xSize/2);
    ball.y = paddle.y;
  }
  for (int i = 0; i < x; i++) {
    for (int j = 0; j < y; j++) {
      if (brick[i][j].shown) {
        brick[i][j].show();
        ball.hitBrick(brick[i][j]);
        if (brick[i][j].level == 0) {
          brick[i][j].shown = false;
          brickAmount--;
        }
      }
    }
  }
  if (allBricksHit()) {
    reset();
  }
  paddle.y = height - 25;
  paddle.show();
  ball.hitBoundry(width);
  ball.hitPaddle(paddle);
  ball.show();
}
boolean allBricksHit() {
  for (int i = 0; i < x; i++) {
    for (int j = 0; j < y; j++) {
      if (brick[i][j].shown) {
        return false;
      }
    }
  }
  return true;
}
void reset() {
  lives = 3;
  gameStarted = false;
  ballMove = false;
  ball = new Ball();
  brickGen();
}
void brickGen() {
  brick = new Brick[x][y];
    for (int i = 0; i < x; i++) {
      for (int j = 0; j < y; j++) {
        brick[i][j] = new Brick(
          gap+(50*i+i*gap), 
          gap+(25*j+j*gap));
        brick[i][j].level = (i+j)%3+1;
      }
    }
}