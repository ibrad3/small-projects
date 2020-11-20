int margin = 5;
int windowSizeX = 600;
int windowSizeY = 800;
int cellSize = 10;
float scrollX = 218;
boolean started = false;
boolean gameStarted = false;
boolean mouseDown = false;
int speed = 60; //change this to change simulation rate
int iteration = 0;
int neighbours = 0;
int xPos = 0;
int yPos = 0;
color aliveColor = color(255);
color deadColor = color(100);
//int xSize = (width)/(cellSize+margin);
int ySize = (windowSizeY-110)/(cellSize+margin);
int xSize = (windowSizeX)/(cellSize+margin);
boolean[][] deadOrAlive = new boolean[xSize][ySize];
int[][] neighbourCount = new int[xSize][ySize];

drop[] Drop = new drop[1000];

void setup(){
  size(600,800);
  frameRate(60);
  clear();
  fill (150);
  for (int i = 0; i < Drop.length;i++){
   Drop[i] = new drop();
 }
}
void draw(){  
  background(50);
  if (gameStarted){
    mouseCheck();  //<>//
    mouseOver();
    fill(255);
    buttons();  
    if (started && iteration == speed){
      checkNeighbours();
      theMainGame();
      iteration = 0;
    }else if(iteration == speed){
      iteration = 0;
    }else if(iteration > frameRate){
      iteration = 0;
    }
    else{
      iteration ++;
    }
  }
  else{
    //THE RAIN
    strokeWeight(3);
    for (int i = 0; i < Drop.length;i++){
   stroke(0,0,255);
   line(Drop[i].x,Drop[i].y,Drop[i].x,Drop[i].y + 20);
   
   if (Drop[i].y+20 > height){
   Drop[i].y=random(height*-2,0);
   Drop[i].speed=random(1,3);
   }
   Drop[i].speed+=Drop[i].grav;
   Drop[i].y+=Drop[i].speed;
 }
 noStroke();
    drawMenu();
  }
}
void drawMenu(){
  if (mouseX>width/2-150 && mouseX<width/2+150 &&
        mouseY>height/2-50 && mouseY<height/2+50){
          fill(150,255,150);
        }
        else{
          fill(0,255,0);
        }
  rectMode(CENTER);
  rect(width/2,height/2,300,100);
  
  if (mouseX>width/2-150 && mouseX<width/2+150 &&
        mouseY>height - height/4-50 && mouseY<height - height/4+50){
          fill(255,150,150);
        }
        else{
          fill(255,0,0);
        }
  rectMode(CENTER);
  rect(width/2,height - height/4,300,100);
  
  fill(255);
  textAlign(CENTER);
  textSize(64);
  text("START",width/2,height/2+20);
  textAlign(CENTER);
  
  
  textSize(64);
  text("EXIT",width/2,(height - height/4)+20);
  
  textAlign(CENTER);
  textSize(64);
  text("Game Of Life",width/2,height/4+20);
  
  textAlign(CENTER);
  textSize(64);
  text("Conway's",width/2,height/4+20-64-margin*2);
  rectMode(CORNER);
  if(mouseX>width/2-150 && mouseX<width/2+150 &&
        mouseY>height/2-50 && mouseY<height/2+50){
    if (mouseButton == LEFT && mousePressed && mouseX>width/2-150 && mouseX<width/2+150 &&
          mouseY>height/2-50 && mouseY<height/2+50){
      mouseDown=true;
    }else if(mouseDown && !mousePressed && mouseX>width/2-150 && mouseX<width/2+150 &&
          mouseY>height/2-50 && mouseY<height/2+50){
      gameStarted = true;
      mouseDown = false;
    }else{
      mouseDown = false;
    }
  }
  if (mouseX>width/2-150 && mouseX<width/2+150 &&
        mouseY>(height - height/4)-50 && mouseY<(height - height/4)+50){
    if (mouseButton == LEFT && mousePressed && mouseX>width/2-150 && mouseX<width/2+150 &&
          mouseY>(height - height/4)-50 && mouseY<(height - height/4)+50){
      mouseDown=true;
    }else if(mouseDown && !mousePressed && mouseX>width/2-150 && mouseX<width/2+150 &&
          mouseY>(height - height/4)-50 && mouseY<(height - height/4)+50){
      exit();
      mouseDown = false;
    }else{
      mouseDown = false;
    }
  }
}
void theMainGame(){
  for(int i = 0;i<xSize;i++){
    for(int j = 0;j<ySize;j++){
      if (neighbourCount[i][j]<2){
        deadOrAlive[i][j]=false;
      }
      if(neighbourCount[i][j]>3){
        deadOrAlive[i][j]=false;
      }
      /*if (neighbourCount[i][j]==6){ //only re-enable for the "high life"
        deadOrAlive[i][j]=true;
      }*/
      if (neighbourCount[i][j]==3){
        deadOrAlive[i][j]=true;
      }
    }
  }
}
void checkNeighbours(){
  for(int i = 0;i<xSize;i++){
    for(int j = 0;j<ySize;j++){
      neighbours = 0;
      if (i-1>0&&j-1>0){ 
        if (deadOrAlive[i-1][j-1]){
          neighbours++;
        }
      }
      if (i-1>0){
        if (deadOrAlive[i-1][j]){
          neighbours++;
        }
      }
      if (i-1>0&&j+1<ySize){
        if (deadOrAlive[i-1][j+1]){
          neighbours++;
        }
      }
      if (j-1>0){
        if (deadOrAlive[i][j-1]){
          neighbours++;
        }
      }
      if (j+1<ySize){
        if (deadOrAlive[i][j+1]){
          neighbours++;
        }
      }
      if (i+1<xSize&&j-1>0){
        if (deadOrAlive[i+1][j-1]){
          neighbours++;
        }
      }
      if (i+1<xSize){
        if (deadOrAlive[i+1][j]){
          neighbours++;
        }
      }
      if (i+1<xSize&&j+1<ySize){
        if (deadOrAlive[i+1][j+1]){
          neighbours++;
        }
      }
      neighbourCount[i][j]=neighbours;
    }
  }
}
void Clear(){
  for(int i = 0;i<xSize;i++){
    for(int j = 0;j<ySize;j++){
      deadOrAlive[i][j] = false; 
  }
  }
}
boolean clearCheck(){
  for(int i = 0;i<xSize;i++){
    for(int j = 0;j<ySize;j++){
      if (deadOrAlive[i][j]){
        return true;
      }
  }
  }
  return false;
}
void buttons(){
  // play button
  if ((!started) && mouseX>margin && mouseX<margin+100 &&
        mouseY>height-100-margin && mouseY<height-margin){
    fill(150,255,150);
    if (mousePressed){
      started=true;
    }
  }
  else{
  fill(0,255,0);
  }  
  // drawing of play button
  ellipse(margin+50,height-margin-50,100,100);
  
  // stop button
  if (started && mouseX>margin*2+100 && mouseX<margin*2+100*2 &&
        mouseY>height-100-margin && mouseY<height-margin){
    fill(255,150,150);
    if (mousePressed){
      started=false;
    }
  
  }else{
    fill(255,0,0);
  } 
  //drawing of stop button
  ellipse(margin*2+100+50,height-margin-50,100,100);
  
  //drawing of scroll bar back
  fill(225);
  rect(margin*3+100*2,height-105,width-220,20);
  
  fill(100);
  //scroll bar
  if(mousePressed && mouseX>margin*3+100*2+10 && mouseX<width-margin-10 &&
      mouseY<height-105+17 && mouseY>height-105+3){
        
    rect(mouseX-7,height-105+3,14,14);
    scrollX=mouseX-7;
    if (width-scrollX-23 > 224){
      speed = 60;
    }else if (width-scrollX-23 > 208){
      speed = 56;
    }else if (width-scrollX-23 > 192){
      speed = 52;
    }else if (width-scrollX-23 > 176){
      speed = 48;
    }else if (width-scrollX-23 > 160){
      speed = 44;
    }else if (width-scrollX-23 > 144){
      speed = 40;
    }else if (width-scrollX-23 > 128){
      speed = 36;
    }else if (width-scrollX-23 > 112){
      speed = 32;
    }else if (width-scrollX-23 > 96){
      speed = 28;
    }else if (width-scrollX-23 > 80){
      speed = 24;
    }else if (width-scrollX-23 > 64){
      speed = 20;
    }else if (width-scrollX-23 > 48){
      speed = 16;
    }else if (width-scrollX-23 > 32){
      speed = 12;
    }else if (width-scrollX-23 > 16){
      speed = 8;
    }else if (width-scrollX-23 > 0){
      speed = 4;
    }
  }
  else{
    rect(scrollX,height-105+3,14,14);
  }
  //clear button
  if (!clearCheck() && mouseX>margin*3+100*2 && mouseX<(width-220)+margin*3+100*2 &&
        mouseY>(height-110+40)-10 && mouseY<(height-(windowSizeX-margin-40)-80)+(height-110+40)-10){
    fill(150,150,255);
    if (mousePressed){
      gameStarted=false;
    }
  }
   else if (clearCheck() && mouseX>margin*3+100*2 && mouseX<(width-220)+margin*3+100*2 &&
        mouseY>(height-110+40)-10 && mouseY<(height-(windowSizeX-margin-40)-80)+(height-110+40)-10){
    fill(150,150,255);
    if (mousePressed){
      mouseDown = true;
    }else if(mouseDown && !mousePressed){
      started=false;
      Clear();
      mouseDown = false;
    }
  }
  else{
  fill(0,0,255);
  }  
  //drawing of clear button
  rect(margin*3+100*2,(height-110+40)-10,width-220,height-(windowSizeX-margin-40)-80);
}

void mouseOver(){
  for(int y = 0; y < height - margin - cellSize - 110;y += margin + cellSize){
    for(int x = 0; x < width - margin - cellSize - margin;x += margin + cellSize){
      if (mouseX>x+margin && mouseX<x+cellSize+margin &&
        mouseY>y+margin && mouseY<y+cellSize+margin){
          fill (200);
          rect (x+margin,y+margin,cellSize,cellSize);
        }
    }
  }
}
    
void mouseCheck(){
  for(int y = 0; y < margin*ySize + cellSize*(ySize-1);y += margin + cellSize){
    for(int x = 0; x < margin*xSize + cellSize*(xSize-1);x += margin + cellSize){
      if ((!deadOrAlive[xPos][yPos]) && mouseButton == LEFT && mousePressed && mouseX>x+margin && mouseX<x+cellSize+margin &&
        mouseY>y+margin && mouseY<y+cellSize+margin) {
          fill (255);
          deadOrAlive [xPos][yPos] = true;
          rect (x+margin,y+margin,cellSize,cellSize);
      }
      else if((deadOrAlive[xPos][yPos]) && mouseButton == RIGHT && mousePressed && mouseX>x+margin && mouseX<x+cellSize+margin &&
        mouseY>y+margin && mouseY<y+cellSize+margin){
          fill (deadColor);
          deadOrAlive [xPos][yPos] = false;
          rect (x+margin,y+margin,cellSize,cellSize);
      }
      else if(!deadOrAlive[xPos][yPos]){
        fill (deadColor);
        rect (x+margin,y+margin,cellSize,cellSize);
      }
      else if(deadOrAlive[xPos][yPos]){
        fill (aliveColor);
        rect (x+margin,y+margin,cellSize,cellSize);
      }
      xPos++;
    }
    xPos = 0;
    yPos++;
  }
  yPos = 0;
}