import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/api.service.dart';
import '../../../../utils/api/api-constants.dart';
import '../../../../utils/api/token-manager.dart';
import '../../../home/models/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> login(
      {String? email, String? phone, required String password}) async {
    emit(LoginLoading());
    dynamic data = email == null
        ? {'phone': phone, 'password': password}
        : {'email': email, 'password': password};

    final response = await Api().post(
      url: ApiConstants.loginUrl,
      data: data,
    );

    final responseDecoded = jsonDecode(response.body);
    print(responseDecoded);
    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(responseDecoded['data']);
      String accessToken = responseDecoded['tokens']['access']['token'];
      String refreshToken = responseDecoded['tokens']['refresh']['token'];
      await TokenManager.saveTokens(accessToken, refreshToken, user.role);
      print(accessToken);
      print(refreshToken);

      if (user.role == "admin") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errorMessage: "This is the admin application"));
      }
    } else if (response.statusCode == 400) {
      emit(LoginFailure(errorMessage: responseDecoded['message']));
      throw Exception(responseDecoded['message']);
    } else {
      emit(LoginFailure(errorMessage: responseDecoded['errors'][0]['msg']));
    }
  }
}
