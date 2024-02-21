// import 'package:flutter/material.dart';
// import '../../../../constants/colors.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_core/core.dart';
//
// import '../../../../helpers/helper_functions.dart';
//
//
// class HomeModel extends StatefulWidget {
//   const HomeModel({Key? key}) : super(key: key);
//
//   @override
//   State<HomeModel> createState() => _HomeBodyState();
// }
//
// List<Map<String, dynamic>> sensors = [
//   {"color": TColors.b, "name": 'OnLine'},
//   {"color": TColors.secondary, "name": 'Low Battery'},
//   {"color": Colors.red.withOpacity(0.4), "name": 'OffLine'},
//   {"color": TColors.primary, "name": 'David'}
// ];
//
// List<Map<String, dynamic>> products = [
//   {"color": TColors.primary, "name": 'Overview'},
//   {"color": TColors.lightContainer, "name": 'Corn'},
//   {"color": TColors.lightContainer, "name": 'Wheat'},
//   {"color": TColors.lightContainer, "name": 'Corn'}
// ];
//
// class _HomeBodyState extends State<HomeModel> {
//   final List<ChartData> chartData = [
//     ChartData('David', 25, TColors.a),
//     ChartData('Steve', 38, TColors.b),
//     ChartData('Jack', 34, TColors.c),
//     ChartData('Others', 52, TColors.d),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Column(
//       children: [
//         Container(
//           height: 60,
//           decoration:BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: dark?TColors.darkContainer :TColors.lightContainer
//           ) ,
//           child: Padding(
//
//
//             padding: const EdgeInsets.only(top: 5),
//             child: SizedBox(
//               height: 60, // Set a height for the container
//               child: HorizontalList(
//                 height: 50,
//                 width: 120,
//                 items: products,
//                 color: Colors.black,
//
//               ),
//             ),
//           ),
//         ),
//
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8,),
//           child: Row(
//
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                  "Sensors",
//                   style: TextStyle(
//                       fontSize: 18,
//                       color:dark? TColors.lightContainer:TColors.darkContainer,
//                     fontWeight: FontWeight.w400 ,
//                   ),
//
//
//
//               ),
//               TextButton(onPressed: (){},
//                   child:Text(
//                     "All Sensors",
//                     style: TextStyle(color: TColors.secondary,)
//                   ) ,
//                 style: TextButton.styleFrom(
//                   backgroundColor: TColors.lightContainer.withOpacity(0.5),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 5, bottom: 15),
//           child: SizedBox(
//             height: 120, // Set a height for the container
//             child: HorizontalList(
//               height: 120,
//               width: 140,
//               items: sensors,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             color: TColors.lightContainer,
//             child: Center(
//               child: SizedBox(
//                 height: 300, // Adjust the height as needed
//                 child: SfCircularChart(
//                   series: <CircularSeries>[
//                     PieSeries<ChartData, String>(
//                       dataSource: chartData,
//                       pointColorMapper: (ChartData data, _) => data.color,
//                       xValueMapper: (ChartData data, _) => data.x,
//                       yValueMapper: (ChartData data, _) => data.y,
//                       dataLabelSettings:  DataLabelSettings(
//                         isVisible: true,
//                         color:dark? TColors.primary:TColors.secondary,
//                         labelPosition: ChartDataLabelPosition.outside,
//                       ),
//                       enableTooltip: true,
//                       explode: true,
//                       explodeIndex: 3,
//                       animationDuration: 1000,
//                       selectionBehavior: SelectionBehavior(enable: true),
//                       sortingOrder: SortingOrder.ascending,
//                       legendIconType: LegendIconType.seriesType,
//
//
//                       // initialSelectedDataIndexes: [1, 4],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class ChartData {
//   ChartData(this.x, this.y, this.color);
//   final String x;
//   final double y;
//   final Color color;
// }
//
// class HorizontalList extends StatelessWidget {
//   final double height;
//   final double width;
//   final List<Map<String, dynamic>> items;
//   final Color color;
//
//   const HorizontalList({
//     Key? key,
//     required this.items,
//     required this.height,
//     required this.width,
//     required this.color,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return Container(
//           width: width,
//           height: height,
//           // decoration: BoxDecoration(
//           //   borderRadius: BorderRadius.circular(10.0),
//           // ),
//           margin: const EdgeInsets.all(8.0),
//           color: item['color'],
//           child: Center(
//             child: Text(
//               item['name'],
//               style: TextStyle(color: color),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
