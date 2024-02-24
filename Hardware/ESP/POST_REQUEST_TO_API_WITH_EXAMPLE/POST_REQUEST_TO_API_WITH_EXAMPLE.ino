

 /************************************** Mazra3ty **************************************/

 /*
     This is the post request Code to the API to send the values of the Farm Sensors
     and an example with soil moisture

     Backend Uploaded to a server  https://mazr3ty-back.onrender.com
*/

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "Error 404";
const char* password = "Error404_there_is_no_password&";
const char* server = "mazr3ty-back.onrender.com";
const int port = 443; // HTTPS port

WiFiClientSecure client;

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
    //Check WiFi connection status
    if (WiFi.status() == WL_CONNECTED) {
        Serial.println("\n\nPerforming HTTP POST Request\n");

        // Read soil moisture value from sensor
        int soilMoistureValue = analogRead(A0);

        // Create a JSON document
        DynamicJsonDocument jsonDocument(200);
        jsonDocument["outputPercentage"] = String(map(soilMoistureValue, 0, 1023, 0, 100));

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
            delay(5000);
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


 /************************************** WIFI SETUP **************************************/

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

 /************************************** SendPostRequest Function **************************************/

int sendPostRequest(String jsonPayload) {
    // Make a POST request to the specified endpoint
    HTTPClient http;
    http.begin(client, server, port, "/api/sensor/soil-moisture");
    http.addHeader("Content-Type", "application/json");
    int httpResponseCode = http.POST(jsonPayload);
    http.end();

    return httpResponseCode;
}

