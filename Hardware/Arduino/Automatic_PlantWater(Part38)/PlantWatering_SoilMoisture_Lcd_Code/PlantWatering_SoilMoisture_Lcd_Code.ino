//YouTube | Tech at Home
#define an A0
#include<LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,16,2);

int sensor_pin = A0;       //Sensor Pin
int relay_pin = 7;         //Relay Pin
int value=0,moisture=0;

void setup()
{
  Serial.begin(9600);
  lcd.begin(16,2);
  lcd.backlight();
  lcd.setBacklight(HIGH);
  pinMode(an, INPUT);
  pinMode(relay_pin, OUTPUT);
}

void loop()
{
    value=analogRead(an);
    moisture=map(value,1017,100,0,100);
   
  
  if(moisture <20)
  {
     Serial.print("Soil Moisture  = ");
    Serial.print(moisture);
    Serial.println("%");
    Serial.println("Soil Dry");
    Serial.println("Motor ON");
    digitalWrite(relay_pin,LOW);
    lcd.setCursor(0,0);
    lcd.print("Soil Dry  ");
    lcd.setCursor(0,1);
    lcd.print("Motor ON ");
  }
  else if(moisture >= 40 && moisture <= 70)
  {
    Serial.print("Soil Moisture  = ");
    Serial.print(moisture);
    Serial.println("%");
    Serial.println("Soil Medium");
    Serial.println("Motor OFF");
    digitalWrite(relay_pin, HIGH);
    lcd.setCursor(0,0);
    lcd.print("Soil Medium");
    lcd.setCursor(0,1);
    lcd.print("Motor OFF");
  }
  else if(moisture > 40)
  {
     Serial.print("Soil Moisture = ");
    Serial.print(moisture);
    Serial.println("%");
    Serial.println("Soil Wet");
    Serial.println("Motor OFF");
    digitalWrite(relay_pin, HIGH);
    lcd.setCursor(0,0);
    lcd.print("Soil Wet   ");
    lcd.setCursor(0,1);
    lcd.print("Motor OFF");
  }

  delay(1000);
}
