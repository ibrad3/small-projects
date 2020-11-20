Button[] numButtons = new Button [10];
Button equals, plus, minus, multiply, divide, point;
Button clear;

int wid, high, ypos=0, xpos = 0;
int textsize = 48;
float value1 = 0;
float value2 = 0;
float tempVal = 0;

color numCol = color(150, 150, 150), opCol = color(255, 153, 0);

String display = "0";

boolean opPlus, opMinus, opMultiply, opDivide, secVal;
void setup() {

  //fullScreen();
  size(400, 600);
  
  wid = width/4;
  high = height/6;

  for (int i = 0; i < numButtons.length; i++) {
    if (i != 0) {

      numButtons[i] = new Button(xpos, ypos+high*2, wid, high, numCol);
      xpos += wid;

      if ((i) % 3 == 0) {
        ypos += high;
        xpos = 0;
      }
    } else {
      numButtons[i] = new Button(0, height-high, wid*2, high, numCol);
    }
  }

  point = new Button(wid*2, height-high, wid, high, numCol);
  equals = new Button(wid*3, height-high, wid, high, opCol);
  plus = new Button(wid*3, height-high*2, wid, high, opCol);
  minus = new Button(wid*3, height-high*3, wid, high, opCol);
  multiply = new Button(wid*3, height-high*4, wid, high, opCol);
  divide = new Button(wid*3, height-high*5, wid, high, opCol);
  clear = new Button(0, height-high*5, wid, high);
}

void draw() {
  background(50);

  textSize(textsize);
  
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].show();
    fill(0);
    text(i, (numButtons[i].xPos+numButtons[i].x/2)-textsize/2, numButtons[i].yPos+numButtons[i].y/2+textsize/2);
    if (numButtons[i].released()) {
      if (!secVal) {
        value1 *= 10;
        value1 += i;
        display = str(int(value1));
      } else {
        value2 *= 10;
        value2 += i;
        display = str(int(value2));
      }
    }
  }
  point.show();
  fill(0);
  text(".", (point.xPos+point.x/2)-textsize/2, point.yPos+point.y/2+textsize/2);
  if (point.released()) {
    if (!secVal) {
      //value1 += ".";
      println(value1);
    } else {
      //value2 += ".";
      println(value2);
    }
  }
  equals.show();
  fill(0);
  text("=", (equals.xPos+point.x/2)-textsize/2, equals.yPos+point.y/2+textsize/2);
  if (equals.released()) {
    display = str(int(calculate(value1, value2)));
    tempVal = value1;
    value1 = calculate(value1, value2);
    value2 = tempVal;
  }
  plus.show();
  fill(0);
  text("+", (plus.xPos+point.x/2)-textsize/2, plus.yPos+point.y/2+textsize/2);
  if (plus.released()) {
    display = "+";
    secVal = true;
    opPlus = true;
    opMinus = false;
    opMultiply = false;
    opDivide = false;
  }
  minus.show();
  fill(0);
  text("-", (minus.xPos+point.x/2)-textsize/2, minus.yPos+point.y/2+textsize/2);
  if (minus.released()) {
    display = "-";
    secVal = true;
    opPlus = false;
    opMinus = true;
    opMultiply = false;
    opDivide = false;
  }
  multiply.show();
  fill(0);
  text("x", (multiply.xPos+point.x/2)-textsize/2, multiply.yPos+point.y/2+textsize/2);
  if (multiply.released()) {
    display = "x";
    secVal = true;
    opPlus = false;
    opMinus = false;
    opMultiply = true;
    opDivide = false;
  }
  divide.show();
  fill(0);
  text("÷", (divide.xPos+point.x/2)-textsize/2, divide.yPos+point.y/2+textsize/2);
  if (divide.released()) {
    display = "÷";
    secVal = true;
    opPlus = false;
    opMinus = false;
    opMultiply = false;
    opDivide = true;
  }
  clear.show();
  fill(0);
  text("C", (clear.xPos+point.x/2)-textsize/2, clear.yPos+point.y/2+textsize/2);
  if (clear.released()) {
    Clear();
  }
  fill(255);
  textSize(80);
  text(display,0,high-20);
}

void Clear() {
  value1 = 0;
  value2 = 0;
  display = "0";
  secVal = false;
  opPlus = false;
  opMinus = false;
  opMultiply = false;
  opDivide = false;
}

float calculate(float v1, float v2) {
  secVal = false;
  if (opPlus) {
    return v1+v2;
  } else if (opMinus) {
    return v1-v2;
  } else if (opMultiply) {
    return v1*v2;
  } else if (opDivide) {
    return v1/v2;
  } else {
    return v1;
  }  
}