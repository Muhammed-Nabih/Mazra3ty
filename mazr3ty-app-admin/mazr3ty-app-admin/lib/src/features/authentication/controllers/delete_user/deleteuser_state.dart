abstract class DeleteUserState {}

class DeleteUserInitial extends DeleteUserState {}

class DeleteUserLoading extends DeleteUserState {}

class DeleteUserSuccess extends DeleteUserState {}

class DeleteUserFailure extends DeleteUserState {
  String errorMessage;
  DeleteUserFailure({required this.errorMessage});
}
