const int senmin = 0;
const int senmax = 1024;
int led = 13; 
int sensory = A1;
int i;
void setup() {
  Serial.begin (9600);
  pinMode(led, OUTPUT);
}

void loop() {
  int sensor = analogRead(sensory);
  int range = map(sensor, senmin, senmax, 0, 3);

  switch (range)
  {
    case 0:
      Serial.println("raining");
      digitalWrite(led, HIGH);
     
      break;
   
    case 1:
      Serial.println("not raining");
      digitalWrite(led,LOW);
  }
  delay(500);

}