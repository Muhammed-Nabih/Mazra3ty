const int analogInPin = A0;
int sensorValue = 0;
String level = "Low";

void setup() {
  // declare pin  to be an output:
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
String WaterLevel(){
   sensorValue = analogRead(analogInPin);
  delay(2);
  if((sensorValue>=100)&&(sensorValue<=600)){
    delay(50);
    level = "LOW";
    }
  else if((sensorValue>=601)&&(sensorValue<=625)){
    delay(50);
    level = "Medium";
    }  
  else if((sensorValue>=626)&&(sensorValue<=700)){
    digitalWrite(3,LOW);
    delay(50);
    level = "High";
    }
    return level;
}

void loop() {
  WaterLevel();
}