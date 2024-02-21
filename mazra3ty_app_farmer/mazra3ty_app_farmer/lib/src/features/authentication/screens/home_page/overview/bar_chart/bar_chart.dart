import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/overview/bar_chart/bar_data.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/overview/bar_chart/individual_bar.dart';

class MyBarChart extends StatelessWidget {
  final List soilMoisture;

  const MyBarChart({Key? key, required this.soilMoisture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      low: soilMoisture[0],
      optimal: soilMoisture[1],
      high: soilMoisture[2],
    );
    barData.initializeBarData();

    return BarChart(
      _buildBarChartData(barData.barData),
    );
  }

  BarChartData _buildBarChartData(List<IndividualBar> barData) {
    return BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles:
              SideTitles(showTitles: true, getTitlesWidget: _getBottomTitle),
        ),
      ),
      barGroups: _buildBarGroups(barData),
    );
  }

  List<BarChartGroupData> _buildBarGroups(List<IndividualBar> barData) {
    return barData.map((data) {
      return BarChartGroupData(
        x: data.x,
        barRods: [
          BarChartRodData(
            toY: data.y,
            color: _getBarColor(data.y),
            width: 35,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 100,
              color: const Color(0xffE0E0E0),
            ),
          ),
        ],
      );
    }).toList();
  }

  Color _getBarColor(double y) {
    if (y < 30) {
      return const Color(0xffF5A623);
    } else if (y < 70) {
      return const Color(0xff7ED321);
    } else {
      return const Color(0xffD0021B);
    }
  }

  Widget _getBottomTitle(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontSize: 10,
    );
    late Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text('Low', style: style);
        break;
      case 1:
        text = Text('Optimal', style: style);
        break;
      case 2:
        text = Text('High', style: style);
        break;
      default:
        text = Text('', style: style);
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
