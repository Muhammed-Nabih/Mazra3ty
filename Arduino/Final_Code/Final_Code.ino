//  water level //
const int analogInPin = A2;
int sensorValue = 0;


// water pump && Soil Moisture //
#include <LiquidCrystal_I2C.h>
#define an A1
#include <Wire.h>
#include<LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);
int sensor_pin = A1;       //Sensor Pin
int relay_pin = 5;         //Relay Pin
int value=0,moisture=0;

// Flame //

const int buzzerPin = 12;
const int flamePin = 11;
int Flame = HIGH;



void setup() {
  // declare pin  to be an output:
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  lcd.init();
  lcd.backlight();
  lcd.setBacklight(HIGH);
  pinMode(an, INPUT);
  pinMode(relay_pin, OUTPUT);
  pinMode(buzzerPin , OUTPUT);
  pinMode(flamePin , INPUT);

  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

/**************************  Water Level  **************************/

  sensorValue = analogRead(analogInPin);
  Serial.print("sensor = ");
  Serial.print(sensorValue);
  Serial.print("\n");
  delay(2);
  if((sensorValue>=100)&&(sensorValue<=600)){
    delay(50);
    }
  else if((sensorValue>=601)&&(sensorValue<=625)){
    delay(50);
    }  
  else if((sensorValue>=626)&&(sensorValue<=700)){
    digitalWrite(3,LOW);
    delay(50);
    }
  else{
    digitalWrite(3,HIGH);
    delay(50);
    }


/**************************  Flame  **************************/

    Flame = digitalRead(flamePin);
    if (Flame== LOW)
    {
      digitalWrite(buzzerPin, HIGH);
    }
    else
    {
      digitalWrite(buzzerPin, LOW);
    }

/**************************  Soil Moisture  **************************/

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