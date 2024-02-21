abstract class GetUserByRoleState {}

class GetUserByRoleInitial extends GetUserByRoleState {}

class GetUserByRoleLoading extends GetUserByRoleState {}

class GetUserByRoleSuccess extends GetUserByRoleState {
  var posts;
  GetUserByRoleSuccess({required this.posts});
}

class GetUserByRoleFailure extends GetUserByRoleState {
  String errorMessage;
  GetUserByRoleFailure({required this.errorMessage});
}
