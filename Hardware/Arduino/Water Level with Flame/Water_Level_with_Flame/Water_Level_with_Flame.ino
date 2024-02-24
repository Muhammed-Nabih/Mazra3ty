const int analogInPin = A2;
int sensorValue = 0;
const int buzzerPin = 8;
const int flamePin = 11;
int Flame = HIGH;
int redled = 7;
int greenled = 6;

void setup() {
  // declare pin  to be an output:
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(buzzerPin, OUTPUT);
  pinMode(redled, OUTPUT);
  pinMode(greenled, OUTPUT);

  pinMode(flamePin, INPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {

  /****************************** WATER LEVEL ****************************/

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
  
    /*************************** FLAME *************************************/
    Flame = digitalRead(flamePin);
  if (Flame== LOW)
  {
    digitalWrite(buzzerPin, HIGH);
    digitalWrite(redled, HIGH);
    digitalWrite(greenled, LOW);
  }
  else
  {
    digitalWrite(buzzerPin, LOW);
    digitalWrite(greenled, HIGH);
    digitalWrite(redled, LOW);
  // }
  /*******************************************************************************/
  }
  }