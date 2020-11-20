Button[][] buttons = new Button[11][11];
void setup() {
  size (610, 610);
  background(255);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i] = initialise(buttons[i], i);
  }
}

void draw() {
  for (int i = 0; i < buttons.length; i++) {
    show(buttons[i]);
  }
}
Button[] initialise(Button[] buttons, int num) {
  for (int i = 0; i < buttons.length; i++) {
    buttons [i] = new Button(i*50+i*5+5, num*50+num*5+5, 50, 50, color(0, 0, 0));
  }
  return buttons;
}
void show(Button[] buttons) {
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].show();
    if (buttons[i].pressed()) {
      buttons[i].Pgreen = 255;
      buttons[i].Pred = 255;
      buttons[i].Pblue = 255;
      for (int j = 0; j < buttons.length; j++) {
        if (i!=j) {
          buttons[j].Pgreen = 0;
          buttons[j].Pred = 0;
          buttons[j].Pblue = 0;
        }
      }
    }
  }
}