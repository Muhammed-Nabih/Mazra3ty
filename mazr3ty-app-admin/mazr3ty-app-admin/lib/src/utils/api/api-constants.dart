abstract class ApiConstants {
  // ! dashboard staging
  static const String stageHost = 'http://10.0.2.2:3000';
  static const String baseUrl = '$host/api';
  static const String host = stageHost;
  // ! api
  static const String v1 = host;
  // ! auth
  static const String registerUrl = '/auth/register';
  static const String loginUrl = '/auth/login';
  static const String sendOtpToEmailUrl = '/auth/forgot-password';
  static const String checkOtpUrl = '/auth/chech-otp';
  static const String resetPassUrl = '/auth/restore-password';


  // GET USERS
  static const String getUserByRole='/user/list-user/';

}
