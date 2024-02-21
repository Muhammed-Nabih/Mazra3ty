abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  late Map<String, dynamic> homeStatistics;
  HomeSuccess({required this.homeStatistics});
}

class HomeFailure extends HomeState {
  String errorMessage;
  HomeFailure({required this.errorMessage});
}
