// import 'dart:convert';
// import 'package:http/http.dart';
// import '../../models/user_model.dart';
//
//
//
// class API {
//   static String _BASE_URL = 'http://10.0.2.2:3000';
//   static String url='$_BASE_URL/api/user/create';
//   static Future<UserModel> createUser(String name,String phone ,String email,String password,String confirmPassword ,String role) async {
//     final Response response = await post(Uri.parse(url) ,
//         headers: <String, String>{
//           'Content-Type': 'application/json;charset=UTF-8',
//
//         },
//         body: jsonEncode(<String, String>{
//           "name": name,
//           "phone":phone,
//           "email":email,
//           "password":password,
//           "confirmPassword":confirmPassword,
//           "role":role
//         }));
//     if (response.statusCode == 200) {
//       //print(response.body);
//       return UserModel.fromJson(json.decode(response.body));
//     } else {
//       ///print('Error');
//       throw Exception("Can't load User");
//     }
//   }
// }
