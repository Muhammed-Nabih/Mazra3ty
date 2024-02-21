import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/api/api-constants.dart';
import '../utils/api/token-manager.dart';

class Api {
  static String? accessToken;

  Future<dynamic> get({required String url}) async {
    accessToken = await TokenManager.getAccessToken();

    http.Response response = await http.get(
      Uri.parse(ApiConstants.baseUrl + url),
      headers: {
        'Accpet': 'application/json',
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json"
      },
    );

    return response;
  }

  Future<dynamic> post({required String url, required var data}) async {
    accessToken = await TokenManager.getAccessToken();
 
    http.Response response = await http.post(
      Uri.parse(ApiConstants.baseUrl + url),
      body: jsonEncode(data),
      headers: {
        'Accpet': 'application/json',
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json"
      },
    );

    return response;
  }

  Future<dynamic> put({required String url, required var data}) async {
    accessToken = await TokenManager.getAccessToken();

    http.Response response = await http.put(
      Uri.parse(ApiConstants.baseUrl + url),
      body: jsonEncode(data),
      headers: {
        'Accpet': 'application/json',
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json"
      },
    );

    return response;
  }

  Future<dynamic> putch({required String url, required dynamic data}) async {
    accessToken = await TokenManager.getAccessToken();

    http.Response response = await http.patch(
      Uri.parse(ApiConstants.baseUrl + url),
      body: jsonEncode(data),
      headers: {
        'Accpet': 'application/json',
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json"
      },
    );

    return response;
  }

  Future<dynamic> delete({required String url, required dynamic data}) async {
    accessToken = await TokenManager.getAccessToken();
    http.Response response = await http.delete(
      Uri.parse(ApiConstants.baseUrl + url),
      body: jsonEncode(data),
      headers: {
        'Accpet': 'application/json',
        "Authorization": "Bearer $accessToken",
        "Content-Type": "application/json"
      },
    );

    return response;
  }
}
