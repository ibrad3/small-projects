Button[] codepad = new Button[10];
int size = 100, margin = 10;
IntList numberPool;
IntList guess;
IntList code;
void setup(){
  size(230,670);
  for (int i = 0; i < codepad.length; i++){
    int x = i/5;
    int y = i%5;
    codepad[i] = new Button(x+size*x+(x+1)*margin,y+size*y+(y+1)*margin,size,size);
  }
  reset();
}
void draw(){
  for (int i = 0; i < codepad.length; i++){
    codepad[i].show();
    int x = i/5;
    int y = i%5;
    fill(200);
    textSize(32);
    textAlign(CENTER,CENTER);
    text(i,(x+size*x+(x+1)*margin)+size/2,(y+size*y+(y+1)*margin)+size/2);
    if (codepad[i].pressed()){
      guess.appendUnique(i);
      guess.sort();
      //print(i);
      println(guess);
    }
    if (code.toString() == guess.toString()){
      println("ACCESS GRANTED");
    }else {
      println("ACCESS DENIED");

    }
  }
}

void numberPoolReset(){
  numberPool = new IntList();
  
 for (int i = 0; i < 10; i++){
   numberPool.set(i,i);
 }
}

void reset(){
    numberPoolReset();
    code = new IntList();
    for (int i = 0; i < 4; i++){
      numberPool.shuffle();
      code.set(i,numberPool.get(0));
      numberPool.remove(0);
    }
    code.sort();
    println(code);
    guess = new IntList();
}