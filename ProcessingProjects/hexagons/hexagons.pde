// game
Board board;
boolean playing, fine = false;
// main menu
Button play, plus, minus, easy, medium, hard;
float[] difficultyVals = {0.2f, 0.25f, 0.3f};
int sideLength, min, max, difficulty;
int timeStart, timeNow, timeEnd;
// in game menu
Button newBoard, back;
public void setup(){
  fullScreen();
  sideLength = 10;
  max = 20;
  min = 3;
  difficulty = 0;
  /* size commented out by preprocessor */;
  playing = false;
  play = new Button(width/2-125, (int) (height*0.70f), 250, 50, color(127), "PLAY");
  plus = new Button(width/2+125-50, (int) (height*0.60f), 50, color(127), "+");
  minus = new Button(width/2-125, (int) (height*0.60f), 50, color(127), "-");
  easy = new Button(width/2-125, (int) (height*0.30f), 250, 50, color(0,200,0), "EASY");
  medium = new Button(width/2-125, (int) (height*0.40f), 250, 50, color(200,200,0), "MEDIUM");
  hard = new Button(width/2-125, (int) (height*0.50f), 250, 50, color(200,0,0), "HARD");
  
  back = new Button(width-370, 100, 250, 50, color(200,0,0), "BACK");
  newBoard = new Button(width-370, 160, 250, 50, color(0,200,0), "NEW BOARD");
}

public void draw(){
  if (playing){
    play();
  } else {
    showMenu();
  }
}

public void play(){
  if (!fine){
    checkFullOpen();
  }
  board.show(fine);
  back.show();
  newBoard.show();
  
  fill(200, 0, 0);
  ellipseMode(CENTER);
  circle(100, 100, 40);
  fill(0, 200, 0);
  ellipseMode(CENTER);
  circle(100, 160, 40);
  
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(150);
  text("BOMB", 200, 100-5);
  text("FLAG", 200, 160-5);
  
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(150);
  if (board.won){
    timeEnd = timeNow - timeStart;
    int timeDiff = (timeEnd)/1000;
    String timeDiffMill = "" + (timeEnd + 1000);
    text("TIME: " + timeDiff/60 + ":" + (timeDiff%60 < 10 ? "0" : "") + timeDiff%60 + "." + timeDiffMill.substring(timeDiffMill.length() - 3), width/2, height-50);
  } else {
    timeNow = millis();
    int timeDiff = (timeNow - timeStart)/1000;
    String timeDiffMill = "" + (timeNow - timeStart + 1000);
    if (fine){
      text("TIME: " + timeDiff/60 + ":" + (timeDiff%60 < 10 ? "0" : "") + timeDiff%60 + "." + timeDiffMill.substring(timeDiffMill.length() - 3), width/2, height-50);
    }
  }
  if (back.released()){
    playing = false;
  }
  if (newBoard.released()){
    createNewBoard();
    timeStart = millis();
  }
}

public void showMenu(){  
  background(51);
  play.show();
  plus.show();
  minus.show();
  easy.show();
  medium.show();
  hard.show();
  
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(150);
  text("" + sideLength, width/2, (int) (height*0.60f)+15);
  text("HEXAGONS", width/2, (int) (height*0.20f)+15);
  
  float diff;
  if (difficulty == 0){
    diff = 0.30f;
  } else if (difficulty == 1){
    diff = 0.40f;
  } else if (difficulty == 2){
    diff = 0.50f;
  } else {
    diff = 0.30f;
  }
  fill(127);
  ellipseMode(CENTER);
  circle(width/2 + 125 + 40, (int) height * diff + 25, 40);
  
  if (plus.released() && sideLength < max){
    sideLength++;
  }
  if (minus.released() && sideLength > min){
    sideLength--;
  }
  if (play.released()){
    playing = true;
    createNewBoard();
    board.show(true);
    timeStart = millis();
  }
  if (easy.released()){
    difficulty = 0;
  }
  if (medium.released()){
    difficulty = 1;
  }
  if (hard.released()){
    difficulty = 2;   
  }
}

public void createNewBoard(int sl){
  board = new Board(sl, difficultyVals[difficulty]);
}

public void createNewBoard(){
  board = new Board(sideLength, difficultyVals[difficulty]);
  fine = false;
  timeStart = millis();
}

public void checkFullOpen(){
  int count = 0;
  int index = 0;
  int finalIndex = 0;
  for (Circle c : board.circles){
    if ((c.open || c.text == 'B' && c.open) && !fine){
      count++;
      finalIndex = index;
    }
    index++;
  }
  if (count == 1 || (!fine && board.exploded)){
    createNewBoard();
    timeStart = millis();
    board.circles[finalIndex].open();
    checkFullOpen();
    fine = true;
  } if (count > 1 && !board.exploded){
    fine = true;
  }
}

public void keyPressed() {
    if (key == 'r'){
      createNewBoard();
    }
  }
