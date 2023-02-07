#include <LiquidCrystal.h>
#include <dht_nonblocking.h>

#define DHT_SENSOR_TYPE DHT_TYPE_11

LiquidCrystal lcd(6, 7, 2, 3, 4, 5); // RS, E, DB4, DB5, DB6, DB7
static const int DHT_SENSOR_PIN = 13;
DHT_nonblocking dht_sensor( DHT_SENSOR_PIN, DHT_SENSOR_TYPE );

int LCDWidth = 16, LCDHeight = 2;

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

float temperature = 0;
float humidity = 0;
float prevTemperature = 0;
float prevHumidity = 0;

byte a[] = {
  B10000,
  B10000,
  B10000,
  B10000,
  B10000,
  B10000,
  B10000,
  B00000
};

byte b[] = {
  B11000,
  B11000,
  B11000,
  B11000,
  B11000,
  B11000,
  B11000,
  B00000
};

byte c[] = {
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B00000
};

byte d[] = {
  B11110,
  B11110,
  B11110,
  B11110,
  B11110,
  B11110,
  B11110,
  B00000
};

byte e[] = {
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B00000
};




void setup() {
  // put your setup code here, to run once:
  lcd.begin(LCDWidth, LCDHeight);
  lcd.createChar(0, a);
  lcd.createChar(1, b);
  lcd.createChar(2, c);
  lcd.createChar(3, d);
  lcd.createChar(4, e);
}

void loop() {
  float prevTemperature = temperature;
  float prevHumidity = humidity;
  measure_environment(&temperature, &humidity);

  lcd.setCursor(0, 0);
  lcd.print("  " + String((int)humidity) + "% humidity  ");
  drawNumber((millis()%1000)/10);
}

void clearLCD(){
  lcd.setCursor(0, 0);
  lcd.print("                ");
  lcd.setCursor(0, 1);
  lcd.print("                ");
}

void drawNumber(int number){
  number = number/2;
  if (number > 0){
    for (int i = 0; i < LCDWidth; i++){
      if (number - 5 >= 0){
        lcd.setCursor(i+3, 1);
        lcd.write(byte(4));
        number = number - 5;
      } else if (number > 0){
        lcd.setCursor(i+3, 1);
        lcd.write(byte(number-1));
        number = 0;
      } else {
        lcd.setCursor(i+3, 1);
        lcd.write(' ');
      }
    }
  }
}