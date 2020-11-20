int i = 0;
void setup(){
   fullScreen();
}

void draw(){
    if (i == 0){
      background(0);
      i = 1;
    }else if (i == 1){
     background(255);
     i = 0;
    }
}