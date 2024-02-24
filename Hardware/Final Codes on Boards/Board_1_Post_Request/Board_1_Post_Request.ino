#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "Error 404";
const char* password = "Error404_there_is_no_password&";
const char* server = "mazr3ty-back.onrender.com";
const int port = 443; // HTTPS port

WiFiClientSecure client;

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

    // Initialize pins
    pinMode(relay_pin, OUTPUT);
    pinMode(flamePin, INPUT);
    pinMode(buzzerPin, OUTPUT);
    pinMode(rainSensorPin, INPUT);
}

void loop() {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
        Serial.println("\n\nPerforming HTTP POST Request\n");

        // Read soil moisture sensor value and Motor State
        int moistureValueSensor = analogRead(analogSoilPin);
        int moistureValue = map(moistureValueSensor,1017,100,0,100);
        bool motorStatus = getMotorStatus(moistureValue);

        // Read flame sensor value
        bool fireStatus = detectFire();

        // Read rain sensor value
        bool rainStatus = detectRain();

        // Create a JSON document
        DynamicJsonDocument jsonDocument(200);
        jsonDocument["outputPercentage"] = moistureValue;
        jsonDocument["motorStatus"] = motorStatus;
        jsonDocument["fireStatus"] = fireStatus;
        jsonDocument["rainStatus"] = rainStatus;

        // Serialize JSON to a String
        String jsonString;
        serializeJson(jsonDocument, jsonString);

        // Send HTTP POST request
        int httpResponseCode = sendPostRequest(jsonString);
        Serial.print("HTTP Response code: ");
        Serial.println(httpResponseCode);

        // Check HTTP response code
        if (httpResponseCode == HTTP_CODE_OK) {
            // Request successful
            Serial.println("Request successful");
        } else {
            // Request failed
            Serial.print("Error code: ");
            Serial.println(httpResponseCode);

            // Retry the request after a delay
            delay(5000);
        }
    } else {
        // Wi-Fi disconnected, attempt reconnection
        Serial.println("WiFi Disconnected, attempting reconnection");
        setup_wifi();
        delay(5000);
    }
}

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

int sendPostRequest(String jsonPayload) {
    // Make a POST request to the specified endpoint
    HTTPClient http;
    http.begin(client, server, port, "/api/sensor/data");
    http.addHeader("Content-Type", "application/json");
    int httpResponseCode = http.POST(jsonPayload);
    http.end();

    return httpResponseCode;
}
