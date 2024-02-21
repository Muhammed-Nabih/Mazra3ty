import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SensorData {
  final String name;
  final double value;

  SensorData({
    required this.name,
    required this.value,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      name: json['name'],
      value: double.parse(json['value']),
    );
  }
}

class ApiService {
  Future<SensorData> fetchSensorData(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return SensorData.fromJson(jsonData);
    } else {
      print("#####Error############");
      throw Exception('Failed to load sensor data');
    }
  }
}
