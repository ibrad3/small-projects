int light = 3;
int sensor = 1;
bool bright = true;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(light, OUTPUT);
  pinMode(sensor, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (bright){
    analogWrite(light, 255);
  } else {
    analogWrite(light, 0);
  }
  if (analogRead(sensor) > 500){
    bright = true;
  }
  if (analogRead(sensor) < 300){
    bright = false;
  }


  Serial.println(analogRead(sensor));
}
