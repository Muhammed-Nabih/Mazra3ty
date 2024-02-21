abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserLoading extends UpdateUserState {}

class UpdateUserSuccess extends UpdateUserState {}

class UpdateUserFailure extends UpdateUserState {
  String errorMessage;
  UpdateUserFailure({required this.errorMessage});
}
