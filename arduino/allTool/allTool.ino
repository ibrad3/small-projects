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

int screenPos = 1;

void loop() {
  switch (screenPos){
    case 1:
      showTempHum();
      break;
    case 2:
      showTimer();
      break;
    case 3:
      showStopwatch();
      break;
    default:
      break;
  }
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

long hour_T = 0;
long min_T = 5;
long sec_T = 0;
long prevT_T = 0;
long T_T = 0;
bool timerDone = false;
bool flash = false;

void showTimer(){
  // Time Data
  String hourStr;
  String minStr;
  String secStr;

  if (hour_T < 10){
    hourStr = "0" + String(hour_T);
  } else {
    hourStr = String(hour_T);
  }

  if (min_T < 10){
    minStr = "0" + String(min_T);
  } else {
    minStr = String(min_T);
  }

  if (sec_T < 10){
    secStr = "0" + String(sec_T);
  } else {
    secStr = String(sec_T);
  }
  
  if (flash){
    setLCD("     Timer      ", "                 ");
  } else {
    setLCD("     Timer      ", "    " + hourStr + ":" + minStr + ":" + secStr + "    ");
  }

  
  if (timerDone) {
    prevT_T = T_T;
    T_T = millis() % (500);
    if (prevT_T > T_T){
      flash = !flash;
    }
  } else {
    prevT_T = T_T;
    T_T = millis() % (1000);
    if (prevT_T > T_T){
      sec_T--;
    }
    if (sec_T < 0){
      sec_T = 59;
      min_T--;
    }
    if (min_T < 0){
      min_T = 59;
      hour_T--;        
    }

    if (hour_T == 0 && min_T == 0 && sec_T == 0){
      timerDone = true;
    }
  }  
}

long hour_SW = 0;
long min_SW = 0;
long sec_SW = 0;
long prevT_SW = 0;
long T_SW = 0;

void showStopwatch(){
  // Time Data
  String hourStr;
  String minStr;
  String secStr;
  String TStr;

  if (hour_SW < 10){
    hourStr = "0" + String(hour_SW);
  } else {
    hourStr = String(hour_SW);
  }

  if (min_SW < 10){
    minStr = "0" + String(min_SW);
  } else {
    minStr = String(min_SW);
  }

  if (sec_SW < 10){
    secStr = "0" + String(sec_SW);
  } else {
    secStr = String(sec_SW);
  }

  if (T_SW < 10){
    TStr = "00" + String(T_SW);
  } else if (T_SW < 100){
    TStr = "0" + String(T_SW);    
  } else {
    TStr = String(T_SW);
  }
  setLCD("   Stopwatch    ", "  " + hourStr + ":" + minStr + ":" + secStr + "." + TStr + "  ");

  prevT_SW = T_SW;
  T_SW = millis() % (1000);
  if (prevT_SW > T_SW){
    sec_SW++;
  }
  if (sec_SW > 60){
    sec_SW = 0;
    min_SW++;
  }
  if (min_SW > 60){
    min_SW = 0;
    hour_SW++;        
  }
}

float temperature = 0;
float humidity = 0;

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
