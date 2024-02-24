#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "Error 404";
const char* password = "Error404_there_is_no_password&";
const char* server = "mazr3ty-back.onrender.com";
const int port = 443; // HTTPS port

WiFiClientSecure client;
const int sensorValue = A0; // Water level sensor pin

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

}

void loop() {
    // Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
        Serial.println("\n\nPerforming HTTP POST Request\n");

        // Read water level sensor value
        int waterLevelValue = analogRead(sensorValue);
        String waterLevelStatus = getWaterLevel(waterLevelValue);

        // Create a JSON document
        DynamicJsonDocument jsonDocument(200);
        jsonDocument["percentage"] = waterLevelStatus;

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



String getWaterLevel(int sensorValue) {
    String level;
    if (sensorValue >= 700) {
        level = "High";
    } else if (sensorValue >= 600) {
        level = "Medium";
    } else {
        level = "Low";
    }
    return level;
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
