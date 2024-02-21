import 'dart:convert';
import 'package:http/http.dart';
import '../../models/user_model.dart';



class API {
  static String _BASE_URL = 'http://10.0.2.2:3000';
  static String url='$_BASE_URL/api/user/create';
  static Future<UserModel> createUser(String name,String phone ,String email,String password,String confirmPassword ,String role) async {
    final Response response = await post(Uri.parse(url) ,
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',

        },
        body: jsonEncode(<String, String>{
          "name": name,
          "phone":phone,
          "email":email,
          "password":password,
          "confirmPassword":confirmPassword,
          "role":role
        }));
    if (response.statusCode == 200) {
      //print(response.body);
      return UserModel.fromJson(json.decode(response.body));
    } else {
      ///print('Error');
      throw Exception("Can't load User");
    }
  }
  static String url2 = '$_BASE_URL/api/user/list-user/admin';
  static Future<List<UserModel>> getAdminUsers() async {

    //business logic to send data to server
    final Response response = await get(Uri.parse(url2));

    if (response.statusCode == 200) {
      print(response.body);
      //parse json into list of objects
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<UserModel>((item) => UserModel.fromJson(item)).toList();
    } else {
      //print('Error');
      throw Exception("Can't load Users");
    }
  }
  static String url3 = '$_BASE_URL/api/user/delete/id';
  static Future<Response> deleteUser(int id) async {
    //business logic to send data to server
    final Response response = await delete(Uri.parse(url3),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        });

    if (response.statusCode == 200) {
      //print(response.body);
      return response;
    } else {
      //print('Error');
      throw Exception("Can't load user");
    }
  }
  static String url4 = '$_BASE_URL/api/user/delete/id';
  // static Future<void> updateAuthor(User user) async {
  //   try {
  //     final Response response = await put(
  //       Uri.parse(url4),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json;charset=UTF-8',
  //       },
  //       body: jsonEncode(user.toJson()),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       // Parse response body or handle success if needed
  //     } else {
  //       // Handle specific HTTP status codes
  //       if (response.statusCode == 404) {
  //         throw Exception("user not found");
  //       } else {
  //         // Handle other status codes or generic error message
  //         throw Exception("Failed to update user: ${response.statusCode}");
  //       }
  //     }
  //   } catch (e) {
  //     // Handle network-related errors
  //     throw Exception("Error updating user: $e");
  //   }
  // }
}
