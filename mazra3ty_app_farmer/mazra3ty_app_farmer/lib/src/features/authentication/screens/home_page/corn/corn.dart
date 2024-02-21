import 'package:flutter/material.dart';
import 'package:mazra3ty_app_farmer/src/constants/size.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Cron extends StatelessWidget {
  Cron({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PieData> chartData = [
      PieData('N/A', 22.5, Color.fromARGB(255, 219, 128, 116)),
      PieData('Water Level', 50, Color.fromARGB(255, 123, 210, 221)),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 450,
                  width: 400,
                  child: SfCircularChart(
                    title: ChartTitle(
                        text: 'Amount Of Water',
                        textStyle: const TextStyle(
                            fontSize: TSize.fontSizeLg,
                            fontWeight: FontWeight.w500)),
                    legend: const Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap,
                      position: LegendPosition.bottom,
                      textStyle: TextStyle(
                          fontSize: TSize.fontSizeMd,
                          fontWeight: FontWeight.w500),
                    ),
                    series: <CircularSeries>[
                      PieSeries<PieData, String>(
                        dataSource: chartData,
                        xValueMapper: (PieData data, _) => data.category,
                        yValueMapper: (PieData data, _) => data.value,
                        pointColorMapper: (PieData data, _) => data.color,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                        ),
                        enableTooltip: true,
                        explode: true,
                        explodeIndex: 4,
                        animationDuration: 1000,
                        selectionBehavior: SelectionBehavior(enable: true),
                        sortingOrder: SortingOrder.ascending,
                        legendIconType: LegendIconType.seriesType,
                      ),
                    ],
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      format: 'point.x : point.y%',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PieData {
  final String category;
  final double value;
  final Color color;

  PieData(this.category, this.value, this.color);
}
