//for the main game
int sum;
Button[] numberButtons = new Button[9];
int buttonSize = 100;
String message = "player 1's turn";
boolean player = true;
//for the menu
PVector startSize = new PVector(300,100);
Button start, replay, back;
boolean gameStarted = false, gameOver = false;

void setup(){
  colorMode(RGB);
  size(400,600);
  frameRate(60);
  
  //for the main game
  sum = 0;
  int x = 25;
  int y = 225;
  for (int i = 0; i < numberButtons.length; i++){
    numberButtons[i] = new Button(x,y,buttonSize,color(255,0,0),""+(i+1));
    numberButtons[i].sizeOfText(48);
    x += 125;
    if (i%3 == 2){
      y+=125;
      x = 25;
    }
  }
  
  // for the menu
  start = new Button((width-int(startSize.x))/2,(height-int(startSize.y))/2,int(startSize.x),int(startSize.y),color(0,255,0),"START");
  replay = new Button((width-int(startSize.x))/2,(height-int(startSize.y))*1/2,int(startSize.x),int(startSize.y),color(0,255,0),"REPLAY");
  back = new Button((width-int(startSize.x))/2,(height-int(startSize.y))*4/5,int(startSize.x),int(startSize.y),color(255,0,0),"BACK");
}



void mainGame(){
  drawBoard();
  if (sum>=100){
    sum = 0;
    gameOver = true;
    if (player){
      message = "Player 2 Wins";
    }else {
      message = "Player 1 Wins";
    }
    for(int j = 0; j < numberButtons.length; j++){
      numberButtons[j].Pblue = 0;
      numberButtons[j].Pred = 255;
    }
    player = true;
  }
  text(sum, width/2, 75);
  text(message, width/2, 150);
}

void drawBoard(){
  for (int i = 0; i < numberButtons.length; i++){
    numberButtons[i].show();
    if (numberButtons[i].released()){
      message = "";
      sum+=i+1;
      if (player){
        message = "player 2's turn ";
        for(int j = 0; j < numberButtons.length; j++){
          numberButtons[j].Pblue = 255;
          numberButtons[j].Pred = 0;
        }
      } else {
        message = "player 1's turn ";
        for(int j = 0; j < numberButtons.length; j++){
          numberButtons[j].Pblue = 0;
          numberButtons[j].Pred = 255;
        }    
      }
      player = !player;
    }
  }
}

void gameOver(){
  textSize(48);
  text("GAME OVER\n"+message, width/2, height/5);
  replay.sizeOfText(48);
  back.sizeOfText(48);
  replay.show();
  back.show();
  if (replay.released()){
    gameOver = false;
    message = "";
  }
  if (back.released()){
    gameStarted = false;
    message = "";
  }
}

void menu(){
  textSize(48);
  text("The Counting\nGame", width/2, height/5);
  start.sizeOfText(48);
  start.show();
  textSize(24);
  text("The first person\n to get to 100\nwill win!!!", width/2, height*4/5);
}

void keyPressed(){
  if (key == BACKSPACE){
    gameStarted = false;
    gameOver = false;
  }
}

void draw(){
  background(225);
  if (gameStarted){
    if (gameOver){
      gameOver();
    } else {
      mainGame();
    }
  } else {
    menu();
  }
  if (start.released()){
    gameStarted = true;
    gameOver = false;
  }
}