import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazra3ty_app_farmer/src/utils/api/api-constants.dart';

import '../../../../services/api.service.dart';
import '../../../../utils/api/token-manager.dart';
import '../../models/user_model.dart';
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

    if (response.statusCode == 200) {
      User user = User.fromJson(responseDecoded['data']);
      String accessToken = responseDecoded['tokens']['access']['token'];
      String refreshToken = responseDecoded['tokens']['refresh']['token'];
      await TokenManager.saveTokens(accessToken, refreshToken, user.role);
      if (user.role == "farmer") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errorMessage: "This is the farmer application"));
      }
    } else if (response.statusCode == 400) {
      print(responseDecoded['message']);
      emit(LoginFailure(errorMessage: responseDecoded['message']));
      throw Exception(responseDecoded['message']);
    } else {
      emit(LoginFailure(errorMessage: responseDecoded['errors'][0]['msg']));
    }
  }
}
