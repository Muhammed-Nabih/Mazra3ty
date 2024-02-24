/******************************** PIR Detection ************************************/


/******************************** Solar Tracking ************************************/
#include <Servo.h>
#define LDR1 A1
#define LDR2 A2
#define error 10
int Spoint =  90;
Servo servo;
/******************************** Lights In Darkness ************************************/
int analogport = A0;
int sensorvalue = 0;
int led =7;

void setup() {
    Serial.begin(9600);
    pinMode(led,OUTPUT);
/*************************************************/
    servo.attach(11);
//Set the starting point of the servo
    servo.write(Spoint);
    delay(1000);

}

void loop() {

/******************************** Lights In Darkness ************************************/

    sensorvalue = analogRead(analogport);
    Serial.print("Analog Value : ");
    Serial.print(sensorvalue);
    if(sensorvalue <500) {
      digitalWrite(led,HIGH);
    }
    else {
      digitalWrite(led,LOW);
    }
    delay(1000);

 /******************************** Solar Tracking ************************************/

  int ldr1 = analogRead(LDR1);
//Get the LDR sensor value
  int ldr2 = analogRead(LDR2);

//Get the difference of these values
  int value1 = abs(ldr1 - ldr2);
  int value2 = abs(ldr2 - ldr1);

//Check these values using a IF condition
  if ((value1 <= error) || (value2 <= error)) {

  } else {
    if (ldr1 > ldr2) {
      Spoint = --Spoint;
    }
    if (ldr1 < ldr2) {
      Spoint = ++Spoint;
    }
  }
//Write values on the servo motor
  servo.write(Spoint);
  delay(80);




  /******************************** PIR Detection ************************************/



  
}
