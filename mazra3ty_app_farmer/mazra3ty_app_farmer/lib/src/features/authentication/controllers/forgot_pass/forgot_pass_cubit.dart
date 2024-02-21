import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazra3ty_app_farmer/src/utils/api/api-constants.dart';

import '../../../../services/api.service.dart';
import '../../../../utils/api/token-manager.dart';
import 'forgot_pass_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPassState> {
  ForgotPasswordCubit() : super(ForgotPassInitial());

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPassLoading());

    final response = await Api().post(
      url: ApiConstants.sendOtpToEmailUrl,
      data: {'email': email},
    );

    final responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      emit(ForgotPassSuccess());
    } else if (response.statusCode == 400) {
      emit(ForgotPassFailure(errorMessage: responseDecoded['message']));
      throw Exception(responseDecoded['message']);
    } else {
      emit(
          ForgotPassFailure(errorMessage: responseDecoded['errors'][0]['msg']));
    }
  }

  Future<void> sendOtp({required String otp}) async {
    emit(OtpForgotPassLoading());

    final response = await Api().post(
      url: ApiConstants.checkOtpUrl,
      data: {'otp': otp},
    );

    final responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await TokenManager.saveTokenOTP(responseDecoded["token"]);
      emit(OtpForgotPassSuccess());
    } else if (response.statusCode == 400) {
      emit(OtpForgotPassFailure(errorMessage: responseDecoded['message']));
      throw Exception(responseDecoded['message']);
    } else {
      emit(OtpForgotPassFailure(errorMessage: responseDecoded['errors'][0]['msg']));
    }
  }
}


//bj1V9y