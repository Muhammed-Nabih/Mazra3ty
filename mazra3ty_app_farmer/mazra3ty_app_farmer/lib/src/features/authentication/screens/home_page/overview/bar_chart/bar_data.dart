import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/overview/bar_chart/individual_bar.dart';

class BarData {
  final double low;
  final double optimal;
  final double high;
  BarData({
    required this.low,
    required this.optimal,
    required this.high,
  });
  List<IndividualBar> barData = [];

  // intialize bar data
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: low),
      IndividualBar(x: 1, y: optimal),
      IndividualBar(x: 2, y: high),
    ];
  }
}
