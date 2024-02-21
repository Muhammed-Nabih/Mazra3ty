import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/api.service.dart';
import '../../../../utils/api/api-constants.dart';
import 'getUser_state.dart';

class GetUserCubit extends Cubit<GetUserByRoleState> {
  GetUserCubit() : super(GetUserByRoleInitial());
  Future<void> getUserByRole({
    required String role,
  }) async {
    emit(GetUserByRoleLoading());
    final response = await Api().get(
      url: ApiConstants.getUserByRole + role,
    );
    final responseDecoded = jsonDecode(response.body);
    print(responseDecoded);
    if (response.statusCode == 200) {
      print(
          "Hendawy@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      print(responseDecoded['data']);
      emit(GetUserByRoleSuccess(posts: responseDecoded['data']));
    } else if (response.statusCode == 400) {
      emit(GetUserByRoleFailure(errorMessage: responseDecoded['message']));
      throw Exception(responseDecoded['message']);
    } else {
      emit(GetUserByRoleFailure(
          errorMessage: responseDecoded['errors'][0]['msg']));
    }
  }
}
