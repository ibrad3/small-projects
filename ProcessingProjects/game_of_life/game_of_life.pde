float margin = 5;
float window_size = 485;
float cell_size = 10;
float scrollX;
boolean[][] DorA = new boolean[32][32];
boolean started = false;
int xPos=0;
int yPos=0;

void setup(){
  size(485,595);
  noStroke();
  frameRate(60);
  for(int i = 0;i<32;i++){
    for(int j = 0;j<32;j++){
      DorA[i][j] = false; 
  }
  }
  fill (150);
}
void draw(){
  background(50);
  mouseCheck();  //<>//
  mouseOver();
  fill(255);
  rect(0,window_size,window_size,1);
  buttons();
  
}
void theMainGame(){
  
}
void checkNeighbours(){
  
}
void buttons(){
  if ((!started) && mouseX>margin && mouseX<margin+100 &&
        mouseY>height-100-margin && mouseY<height-margin){
    fill(150,255,150);
    if (mousePressed){
      println("Start");
      started=true;
    }
  }
  else{
  fill(0,255,0);
  }  
  ellipse(margin+50,height-margin-50,100,100);
  
  if (started && mouseX>margin*2+100 && mouseX<margin*2+100*2 &&
        mouseY>height-100-margin && mouseY<height-margin){
    fill(255,150,150);
    if (mousePressed){
      println("Stop");
      started=false;
    }
  }
  else{
  fill(255,0,0);
  }  
  ellipse(margin*2+100+50,height-margin-50,100,100);
  
  fill(225);
  rect(margin*3+100*2,height-105,width-220,20);
  
  fill(100);
  if(mousePressed && mouseX>margin*3+100*2+10 && mouseX<width-margin-10 &&
      mouseY>height- && mouseY<width-margin-10){
    rect(mouseX-7,height-105+3,14,14);
    scrollX=mouseX-7;
  }
  else{
    rect(scrollX,height-105+3,14,14);
  }
  
   if (mouseX>margin*3+100*2 && mouseX<(width-220)+margin*3+100*2 &&
        mouseY>(height-110+40)-10 && mouseY<(height-(window_size-margin-40)-80)+(height-110+40)-10){
    fill(150,150,255);
    if (mousePressed){
      println("Cleared");
      started=false;
    }
  }
  else{
  fill(0,0,255);
  }  
  rect(margin*3+100*2,(height-110+40)-10,width-220,height-(window_size-margin-40)-80);
}

void mouseOver(){
  for(int y = 0; y < window_size - margin - cell_size;y += margin + cell_size){
    for(int x = 0; x < window_size - margin - cell_size;x += margin + cell_size){
      if (mouseX>x+margin && mouseX<x+cell_size+margin &&
        mouseY>y+margin && mouseY<y+cell_size+margin){
          fill (200);
          rect (x+margin,y+margin,cell_size,cell_size);
        }
    }
  }
}
    
void mouseCheck(){
  for(int y = 0; y < window_size - margin - cell_size;y += margin + cell_size){
    for(int x = 0; x < window_size - margin - cell_size;x += margin + cell_size){
      if ((!DorA[xPos][yPos]) && mouseButton == LEFT && mousePressed && mouseX>x+margin && mouseX<x+cell_size+margin &&
        mouseY>y+margin && mouseY<y+cell_size+margin) {
          fill (255);
          DorA [xPos][yPos] = true;
          rect (x+margin,y+margin,cell_size,cell_size);
          println(xPos+1,yPos+1,"Added");
      }
      else if((DorA[xPos][yPos]) && mouseButton == RIGHT && mousePressed && mouseX>x+margin && mouseX<x+cell_size+margin &&
        mouseY>y+margin && mouseY<y+cell_size+margin){
          fill (100);
          DorA [xPos][yPos] = false;
          rect (x+margin,y+margin,cell_size,cell_size);
          println(xPos+1,yPos+1,"Removed");
      }
      else if(!DorA[xPos][yPos]){
        fill (100);
        rect (x+margin,y+margin,cell_size,cell_size);
      }
      else if(DorA[xPos][yPos]){
        fill (255);
        rect (x+margin,y+margin,cell_size,cell_size);
      }
      xPos++;
    }
    xPos = 0;
    yPos++;
  }
  yPos = 0;
}