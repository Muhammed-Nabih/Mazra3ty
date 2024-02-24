// // Rain drop
// const int senmin = 0;
// const int senmax = 1024;
// int led = 0; 
// int sensory = A0;
// int i;



// Water pump and soil moisture
#include <LiquidCrystal_I2C.h>

//YouTube | Tech at Home
#define an A1
#include <Wire.h>
#include<LiquidCrystal_I2C.h>


LiquidCrystal_I2C lcd(0x27, 16, 2);

int sensor_pin = A1;       //Sensor Pin
int relay_pin = 1;         //Relay Pin
int value=0,moisture=0;



// // Water level with flame
// const int analogInPin = A2;
// int sensorValue = 0;
// const int buzzerPin = 12;
// const int flamePin = 11;
// int Flame = HIGH;
// int redled = 7;
// int greenled = 6;












void setup() {
  // put your setup code here, to run once:


// // Rain drop 
// Serial.begin (9600);
//   pinMode(led, OUTPUT);



//  water level with flame
  // pinMode(2,OUTPUT);
  // pinMode(3,OUTPUT);
  // pinMode(4,OUTPUT);
  // pinMode(5,OUTPUT);
  // pinMode(buzzerPin, OUTPUT);
  // pinMode(redled, OUTPUT);
  // pinMode(greenled, OUTPUT);

  // pinMode(flamePin, INPUT);
  // Serial.begin(9600);




// Water pump and soil moisture and lcd
  Serial.begin(9600);
  //lcd.begin(16,2);
  lcd.init();
  lcd.backlight();
  lcd.setBacklight(HIGH);
  pinMode(an, INPUT);
  pinMode(relay_pin, OUTPUT);





}

void loop() {
  // put your main code here, to run repeatedly:



// // Rain drop 
//   int sensor = analogRead(sensory);
//   int range = map(sensor, senmin, senmax, 0, 3);

//   switch (range)
//   {
//     case 0:
//       Serial.println("raining");
//       digitalWrite(led, HIGH);
     
//       break;
   
//     case 1:
//       Serial.println("not raining");
//       digitalWrite(led,LOW);
//   }
//   delay(500);



// water level and flame
// declare pin  to be an output:
  // pinMode(2,OUTPUT);
  // pinMode(3,OUTPUT);
  // pinMode(4,OUTPUT);
  // pinMode(5,OUTPUT);
  // pinMode(buzzerPin, OUTPUT);
  // pinMode(redled, OUTPUT);
  // pinMode(greenled, OUTPUT);

  // pinMode(flamePin, INPUT);
  // Serial.begin(9600);


// the loop routine runs over and over again forever:




// water level and flame

  // sensorValue = analogRead(analogInPin);
  // Serial.print("sensor = ");
  // Serial.print(sensorValue);
  // Serial.print("\n");
  // delay(2);
  // if((sensorValue>=100)&&(sensorValue<=600)){
  //   digitalWrite(2,LOW);
  //   delay(100);
  //   }
  // else if((sensorValue>=601)&&(sensorValue<=625)){
  //   digitalWrite(3,LOW);
  //   delay(100);
  //   }  
  // else if((sensorValue>=626)&&(sensorValue<=700)){
  //   digitalWrite(4,LOW);
  //   digitalWrite(5,LOW);
  //   delay(100);
  //   }
  // else{
  //   digitalWrite(2,HIGH);
  //   digitalWrite(3,HIGH);
  //   digitalWrite(4,HIGH);
  //   digitalWrite(5,HIGH);
  //   delay(100);
  //   }
  
  //   /*************************** FLAME *************************************/
  //   Flame = digitalRead(flamePin);
  // if (Flame== LOW)
  // {
  //   digitalWrite(buzzerPin, HIGH);
  //   digitalWrite(redled, HIGH);
  //   digitalWrite(greenled, LOW);
  // }
  // else
  // {
  //   digitalWrite(buzzerPin, LOW);
  //   digitalWrite(greenled, HIGH);
  //   digitalWrite(redled, LOW);
  // }
  /*******************************************************************************/







// water pump and soil moisture and lcd

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
    
  }
  else if(moisture >= 40 && moisture <= 70)
  {
    Serial.print("Soil Moisture  = ");
    Serial.print(moisture);
    Serial.println("%");
    Serial.println("Soil Medium");
    Serial.println("Motor OFF");
    digitalWrite(relay_pin, HIGH);
   
  }
  else if(moisture > 40)
  {
     Serial.print("Soil Moisture = ");
    Serial.print(moisture);
    Serial.println("%");
    Serial.println("Soil Wet");
    Serial.println("Motor OFF");
    digitalWrite(relay_pin, HIGH);
    
  }

  delay(1000);




}
