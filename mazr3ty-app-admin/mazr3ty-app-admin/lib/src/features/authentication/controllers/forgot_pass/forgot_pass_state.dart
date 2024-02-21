abstract class ForgotPassState {}

class ForgotPassInitial extends ForgotPassState {}

class ForgotPassLoading extends ForgotPassState {}

class ForgotPassSuccess extends ForgotPassState {}

class ForgotPassFailure extends ForgotPassState {
  String errorMessage;
  ForgotPassFailure({required this.errorMessage});
}

class OtpForgotPassLoading extends ForgotPassState {}

class OtpForgotPassSuccess extends ForgotPassState {}

class OtpForgotPassFailure extends ForgotPassState {
  String errorMessage;
  OtpForgotPassFailure({required this.errorMessage});
}
