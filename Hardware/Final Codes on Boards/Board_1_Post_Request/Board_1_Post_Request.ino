#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "Error 404";
const char* password = "Error404_there_is_no_password&";
const char* server = "mazr3ty-back.onrender.com";
const int port = 443; // HTTPS port

WiFiClientSecure client;

const char* email = "abdalrahmanhendawy@gmail.com";
const char* pass = "123456789";

String accessToken; // Store the access token

const int analogSoilPin = A0;   // Soil moisture sensor pin
const int relay_pin = D1;       // Motor relay pin
const int flamePin = D2;        // Flame sensor pin
const int buzzerPin = D3;       // Buzzer pin
const int rainSensorPin = D4;   // Rain sensor pin

void setup() {
    Serial.begin(9600);
    delay(100);

    // Connect to Wi-Fi
    WiFi.begin(ssid, password);
    Serial.print("Connecting to WiFi");
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("Connected to WiFi");

    // Set the root CA certificate
    client.setInsecure();

    // Authenticate user
    if (!authenticateUser()) {
        Serial.println("\nAuthentication failed! You don't have access to Login to send or get data");
        return;
    }
    else {
        Serial.println("\nWelcome Mohamed Nabih.. Just a second and i will Send the Requests ♥ ");
    }


    // Initialize pins
    pinMode(relay_pin, OUTPUT);
    pinMode(flamePin, INPUT);
    pinMode(buzzerPin, OUTPUT);
    pinMode(rainSensorPin, INPUT);
}

void loop() {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
        Serial.println("\nPerforming HTTP POST Request\n");

        // Read soil moisture sensor value and Motor State
        int moistureValueSensor = analogRead(analogSoilPin);
        int moistureValue = map(moistureValueSensor,1017,100,0,100);
        bool motorStatus = getMotorStatus(moistureValue);

        // Read flame sensor value
        bool fireStatus = detectFire();

        // Read rain sensor value
        bool rainStatus = detectRain();

        // Create a JSON document for soil moisture
        DynamicJsonDocument soilMoistureJson(200);
        soilMoistureJson["outputPercentage"] = moistureValue;
        String soilMoisturePayload;
        serializeJson(soilMoistureJson, soilMoisturePayload);

        // Create a JSON document for motor status
        DynamicJsonDocument motorStatusJson(200);
        motorStatusJson["motorStatus"] = motorStatus;
        String motorStatusPayload;
        serializeJson(motorStatusJson, motorStatusPayload);

        // Create a JSON document for flame status
        DynamicJsonDocument flameStatusJson(200);
        flameStatusJson["fireStatus"] = fireStatus;
        String flameStatusPayload;
        serializeJson(flameStatusJson, flameStatusPayload);

        // Create a JSON document for rain status
        DynamicJsonDocument rainStatusJson(200);
        rainStatusJson["rainStatus"] = rainStatus;
        String rainStatusPayload;
        serializeJson(rainStatusJson, rainStatusPayload);



        if (authenticateUser()) {
            
            int soilMoistureResponse = sendPostRequest("/api/sensor/soil-moisture", soilMoisturePayload);
            int motorStatusResponse = sendPostRequest("/api/sensor/pump", motorStatusPayload);
            int flameStatusResponse = sendPostRequest("/api/sensor/flame", flameStatusPayload);
            int rainStatusResponse = sendPostRequest("/api/sensor/rain-drop", rainStatusPayload);

            // Print responses
          if(soilMoistureResponse==HTTP_CODE_OK && motorStatusResponse == HTTP_CODE_OK && flameStatusResponse == HTTP_CODE_OK && rainStatusResponse == HTTP_CODE_OK) {
              Serial.print("Soil Moisture HTTP Response code: ");
              Serial.println(soilMoistureResponse);
              Serial.println("Sent Successfuly");
              Serial.print("Motor Status HTTP Response code: ");
              Serial.println(motorStatusResponse);
              Serial.println("Sent Successfuly");
              Serial.print("Flame Status HTTP Response code: ");
              Serial.println(flameStatusResponse);
              Serial.println("Sent Successfuly");
              Serial.print("Rain Status HTTP Response code: ");
              Serial.println(rainStatusResponse);
              Serial.println("Sent Successfuly");
          }
        }


        
    } else {
        // Wi-Fi disconnected, attempt reconnection
        Serial.println("WiFi Disconnected, attempting reconnection");
        setup_wifi();
        
    }
    delay(5000);
}

/******************** Auth ******************/
bool authenticateUser() {
    DynamicJsonDocument loginJson(200);
    loginJson["email"] = email;
    loginJson["password"] = pass;

    String loginPayload;
    serializeJson(loginJson, loginPayload);

    HTTPClient http;
    String urll = String("https://") + server + ":" + port + "/api/auth/login";
    http.begin(client, urll);
    http.addHeader("Content-Type", "application/json");

    int loginResponse = http.POST(loginPayload);

    if (loginResponse == HTTP_CODE_OK) {
        // Authentication successful, parse access token
        String response = http.getString();
        DynamicJsonDocument authResponseJson(1024);
        deserializeJson(authResponseJson, response);
        accessToken = authResponseJson["tokens"]["access"]["token"].as<String>();
        http.end(); // Close the connection
        return true;
    } else {
        // Authentication failed
        http.end(); // Close the connection
        return false;
    }
}


/**************** Sensors ****************/

bool getMotorStatus(int moistureValue) {
    if (moistureValue < 40) {
        digitalWrite(relay_pin, LOW);
        return true; // Motor ON
    } else {
        digitalWrite(relay_pin, HIGH);
        return false; // Motor OFF
    }
}

bool detectFire() {
    int flameState = digitalRead(flamePin);
    if (flameState == LOW) {
        digitalWrite(buzzerPin, HIGH);
        return true; // Fire detected
    } else {
        digitalWrite(buzzerPin, LOW);
        return false; // No fire detected
    }
}

bool detectRain() {
    int rainState = digitalRead(rainSensorPin);
    return rainState == LOW; // Return true if raining, false otherwise
}

void setup_wifi() {
    // Connect to Wi-Fi
    WiFi.begin(ssid, password);
    Serial.print("Connecting to WiFi");
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("Connected to WiFi");
}

int sendPostRequest(String endpoint, String jsonPayload) {
    // Make a POST request to the specified endpoint
    HTTPClient http;
    String url = String("https://") + server + ":" + port + endpoint;
    http.begin(client, url);
    http.addHeader("Content-Type", "application/json");
    http.addHeader("Authorization", "Bearer " + accessToken);
    int httpResponseCode = http.POST(jsonPayload);
    http.end();

    return httpResponseCode;
}

