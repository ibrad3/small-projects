Rectangle[][] r;
Button save, createNew;
int count;
PrintWriter out;
BufferedReader in;
void setup(){
  size(400,400);
  noStroke();
  in = createReader("count.txt");
  try {
  count = int(in.readLine());
  } catch (IOException e){
    e.printStackTrace();
  }
  r = new Rectangle[2][2];
  save = new Button(10,10,80,80,color(0));
  createNew = new Button(10,110,80,80,color(255));
  reDraw();
}

void draw(){
  for (int i = 0; i < 2; i++){
    for (int j = 0; j < 2; j++){
      r[i][j].show();
    }
  }
  if (save.released()){
    save("Colour Scheme "+(count+1)+".png");
    reDraw();
    count++;
    out = createWriter("count.txt");
    out.println(count);
    out.flush();
    out.close();
  }
  if (createNew.released()){
    reDraw();
  }
  save.show();
  createNew.show();
}

void reDraw(){
  for (int i = 0; i < 2; i++){
    for (int j = 0; j < 2; j++){
      r[i][j] = new Rectangle(i*200,j*200,200,200);
    }
  }
}

class Rectangle{
  int x, y, w, h;
  color col;
  Rectangle(int x1,int y1,int w1,int h1){
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    
    col = color(random(255),random(255),random(255));
  }
  
  void show(){
    fill(col);
    rect(x, y, w, h);
  }
}