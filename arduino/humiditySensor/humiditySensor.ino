// include the library code:
#include <LiquidCrystal.h>
#include <dht_nonblocking.h>

#define DHT_SENSOR_TYPE DHT_TYPE_11


// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(6, 7, 2, 3, 4, 5); // RS, E, DB4, DB5, DB6, DB7
static const int DHT_SENSOR_PIN = 13;
DHT_nonblocking dht_sensor( DHT_SENSOR_PIN, DHT_SENSOR_TYPE );

int LCDWidth = 16, LCDHeight = 2;

void setup() {
  Serial.begin(9600);
  // set up the LCD's number of columns and rows:
  lcd.begin(LCDWidth, LCDHeight);
  clearLCD();
  delay(200);
  writeLogo(100);
  scrollLeft(50);
  clearLCD();
  showTempHum();
  scrollRight(50);
}

static bool measure_environment( float *temp, float *hum )
{
  static unsigned long measurement_timestamp = millis( );

  /* Measure once every four seconds. */
  if( millis( ) - measurement_timestamp > 3000ul )
  {
    if( dht_sensor.measure( temp, hum ) == true )
    {
      measurement_timestamp = millis( );
      return( true );
    }
  }

  return( false );
}


float temperature = 21;
float humidity = 65;

// Time Stuff
long hour = 8;
long min = 21; // 3sec 6:01 2.5ms in the second
long sec = 0;
long prevAcc = 0;
long acc = 0;

// Date Stuff
int day = 22;
int month = 1;
int year = 2023;


void loop() {
  // Time Data
  String hourStr;
  String minStr;
  String secStr;

  if (hour < 10){
    hourStr = "0" + String(hour);
  } else {
    hourStr = String(hour);
  }

  if (min < 10){
    minStr = "0" + String(min);
  } else {
    minStr = String(min);
  }

  if (sec < 10){
    secStr = "0" + String(sec);
  } else {
    secStr = String(sec);
  }

 // Date Data
  String dayStr;
  String monthStr;
  String yearStr = String(year);

  if (day < 10){
    dayStr = "0" + String(day);
  } else {
    dayStr = String(day);
  }

  if (month < 10){
    monthStr = "0" + String(month);
  } else {
    monthStr = String(month);
  }

  // Environment Data
  String tempStr;
  String humiStr;

  measure_environment( &temperature, &humidity);

  if (temperature < 10){
    tempStr = " " + String((int)temperature);
  } else {
    tempStr = String((int)temperature);
  }

  if (humidity < 10){
    humiStr = " " + String((int)humidity);
  } else {
    humiStr = String((int)humidity);
  }


  setLCD(" " + hourStr + ":" + minStr + ":" + secStr + "   " + tempStr + "\337C", dayStr + "/" + monthStr + "/" + yearStr + "   " + humiStr + "%");
  prevAcc = acc;
  acc = millis() % (1000-4);
  if (prevAcc > acc){
    sec++;
  }
  if (sec > 59){
    min++;
    sec = 0;
  }
  if (min > 59){
    hour++;
    min = 0;
  }
  if (hour > 23){
    hour = 0;
    day++;
  }
  if (day > checkDaysInMonth(month)){
    day = 1;
    month ++;
  }
  if (month > 12){
    month = 1;
    year++;
  }
}

int checkDaysInMonth(int month){
  switch (month){
    case 1:
      return 31;
    case 2:
      if (isLeapYear(year)){
        return 29;
      } else {
        return 28;
      }
    case 3:
      return 31;
    case 4:
      return 30;
    case 5:
      return 31;
    case 6:
      return 30;
    case 7:
      return 31;
    case 8:
      return 31;
    case 9:
      return 30;
    case 10:
      return 31;
    case 11:
      return 30;
    case 12:
      return 31;
    default:
      return 0;
  }
}

bool isLeapYear(int y){
  return y%4 == 0 && y%100 != 0 || y%400 == 0;
}

void setLCD(String line1, String line2){
  lcd.setCursor(0, 0);
  lcd.print(line1);
  lcd.setCursor(0, 1);
  lcd.print(line2);
}

void clearLCD(){
  lcd.setCursor(0, 0);
  lcd.print("                ");
  lcd.setCursor(0, 1);
  lcd.print("                ");
}

void scrollLeft(int del){
  for(int i = 0; i < LCDWidth; i++){
    lcd.scrollDisplayLeft();
    delay(del);
  }
}

void scrollRight(int del){
  for(int i = 0; i < LCDWidth; i++){
    lcd.scrollDisplayRight();
    delay(del);
  }
}

void writeLogo(int del){
  int wait = 1000;
  int sOff = 1;
  int iOff = 4;
  lcd.setCursor(0+sOff, 0);
  lcd.print("S");
  delay(del);
  lcd.setCursor(1+sOff, 0);
  lcd.print("t");
  delay(del);
  lcd.setCursor(2+sOff, 0);
  lcd.print("e");
  delay(del);
  lcd.setCursor(3+sOff, 0);
  lcd.print("v");
  delay(del);
  lcd.setCursor(4+sOff, 0);
  lcd.print("e");
  delay(del);
  lcd.setCursor(5+sOff, 0);
  lcd.print("n");
  delay(del);
  lcd.setCursor(6+sOff, 0);
  lcd.print("s");
  delay(del);
  lcd.setCursor(7+sOff, 0);
  lcd.print("o");
  delay(del);
  lcd.setCursor(8+sOff, 0);
  lcd.print("n");
  delay(del);

  
  lcd.setCursor(0+iOff, 1);
  lcd.print("I");
  delay(del);
  lcd.setCursor(1+iOff, 1);
  lcd.print("n");
  delay(del);
  lcd.setCursor(2+iOff, 1);
  lcd.print("d");
  delay(del);
  lcd.setCursor(3+iOff, 1);
  lcd.print("u");
  delay(del);
  lcd.setCursor(4+iOff, 1);
  lcd.print("s");
  delay(del);
  lcd.setCursor(5+iOff, 1);
  lcd.print("t");
  delay(del);
  lcd.setCursor(6+iOff, 1);
  lcd.print("r");
  delay(del);
  lcd.setCursor(7+iOff, 1);
  lcd.print("i");
  delay(del);
  lcd.setCursor(8+iOff, 1);
  lcd.print("e");
  delay(del);
  lcd.setCursor(9+iOff, 1);
  lcd.print("s");
  delay(wait);  
}
void showTempHum(){
  /* Measure temperature and humidity.  If the functions returns
     true, then a measurement is available. */
  measure_environment( &temperature, &humidity);
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  lcd.setCursor(0, 0);
  if (temperature > 9){
    lcd.print("Temperature:" + String((int)temperature) + "\337C");
  } else {
    lcd.print("Temperature: " + String((int)temperature) + "\337C");
  }
  lcd.setCursor(0, 1);
  lcd.print("Humidity: " + String((int)humidity) + "%");
  
}
