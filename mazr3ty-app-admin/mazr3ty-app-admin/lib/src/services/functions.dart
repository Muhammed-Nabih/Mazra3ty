import 'package:shared_preferences/shared_preferences.dart';

class Functions {
  Future<dynamic> getUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('access_token');
    final userId = sharedPreferences.getString('userId');
    final role = sharedPreferences.getString('role');

    return  {
      "accessToken": accessToken,
      "userId": userId,
      "role": role,
    };
  }
}
