Button[][] colours;
Button exitMenu;
int x, y;
boolean menuOpen;
void setup() {
  size(400, 600);
  colours = new Button[2][2];
  for (int i = 0; i < colours.length; i++) {
    for (int j = 0; j < colours[i].length; j++) {
      colours[i][j] = new Button(i*200, j*200, 200, 200);
    }
  }
  exitMenu = new Button(width-25,5,20,20,color(100));
}

void draw() {
  background(200);
  if (!menuOpen) {
  outer:
    for (int i = 0; i < colours.length; i++) {
      for (int j = 0; j < colours[i].length; j++) {
        colours[i][j].show();
        if (colours[i][j].released()) {
          menuOpen = true;
        }
        if (menuOpen) {
          x = i;
          y = j;
          break outer;
        }
      }
    }
  } else {
    textSize(25);
    fill(0);
    text("Red: "+red(colours[x][y].pCol), 145, 200);
    text("Green: "+green(colours[x][y].pCol), 135, 250);
    text("Blue: "+blue(colours[x][y].pCol), 145, 300);
    exitMenu.show();
    if (exitMenu.released()){
      menuOpen = false;
    }
  }
}