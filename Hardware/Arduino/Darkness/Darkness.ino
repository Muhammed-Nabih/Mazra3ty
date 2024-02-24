int analogport = A0;
int sensorvalue = 0;
int led =7;
void setup() {
Serial.begin(9600);
pinMode(led,OUTPUT);
}
void loop() {
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
}