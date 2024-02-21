const int analogInPin = A2;
int sensorValue = 0;

void setup() {
  // declare pin  to be an output:
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
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
}