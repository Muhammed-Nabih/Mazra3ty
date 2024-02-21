import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazra3ty_app_farmer/src/utils/api/api-constants.dart';

import '../../../../services/api.service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> home() async {
    emit(HomeLoading());

    final response = await Api().get(url: ApiConstants.statistics);

    final responseDecoded = jsonDecode(response.body);
    print(responseDecoded);
    if (response.statusCode == 200) {
      emit(HomeSuccess(homeStatistics: responseDecoded));
    } else if (response.statusCode == 400) {
      emit(HomeFailure(errorMessage: responseDecoded['message']));
      throw Exception(responseDecoded['message']);
    } else {
      emit(HomeFailure(errorMessage: responseDecoded['errors'][0]['msg']));
    }
  }
}
