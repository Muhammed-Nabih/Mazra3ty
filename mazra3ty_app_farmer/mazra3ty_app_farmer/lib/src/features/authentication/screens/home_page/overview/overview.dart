import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/controllers/home/home_state.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/overview/bar_chart/bar_chart.dart';
// import 'package:mazra3ty_app_farmer/src/features/authentication/screens/home_page/overview/bar_chart/bar_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../../../../constants/image_strings.dart';
import '../../../../../utils/widgets/custom_snack_bar.dart';
import '../../../../Home/controllers/home/home_cubit.dart';
import '../../../../Home/screens/home_Screen/home_model.dart';

class Overview extends StatefulWidget {
  Overview({Key? key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  var weather = 25;
  var soilTemp = 22;
  var humidity = 5;
  var wind = 6;
  var precipitation = 0;
  late Map<String, dynamic> homeStatistics;
  var soilMoisturea;
  var percentage;
  List<double> soilMoisture = [80, 50, 80];

  get timer => null;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
    getStatistics();
    socket.on('Statistics', (newMessage) {
      print('####################### ');
      print(newMessage);
      print('####################### ');
      setState(() {
        soilMoisturea = newMessage['data']['outputPercentage'];
        // percentage = newMessage['data']['percentage'];
      });
    });
  }

  Future<void> getStatistics() async {
    await BlocProvider.of<HomeCubit>(context).home();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
        if (state is HomeLoading) {
          setState(() {
            timer?.cancel();
            EasyLoading.show(
              status: 'loading',
              maskType: EasyLoadingMaskType.custom,
            );
          });
        } else if (state is HomeSuccess) {
          setState(() {
            timer?.cancel();
            EasyLoading.showSuccess('Done');
            homeStatistics = state.homeStatistics;
            soilMoisturea =
                homeStatistics['data']['soilMoisture']['outputPercentage'];
            percentage = homeStatistics['data']['waterLevel']['percentage'];
          });
        } else if (state is HomeFailure) {
          setState(() {
            timer?.cancel();
            EasyLoading.showError(state.errorMessage);
          });
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  margin: const EdgeInsets.all(25),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffe0e0e0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.ac_unit,
                            size: 30,
                            color: Colors.black54,
                          ),
                          const Text(
                            "Weather",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            tWeatherImage,
                            height: 50,
                            width: 50,
                          ),
                          Text(
                            "25\u00B0C",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.thermostat,
                                size: 30,
                                color: Colors.black54,
                              ),
                              Text(
                                "+$soilMoisturea\u00B0C",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Soil Moisture",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.water_drop,
                                size: 30,
                                color: Colors.black38,
                              ),
                              Text(
                                "$percentage",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Water Level",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.air,
                                size: 30,
                                color: Colors.black38,
                              ),
                              Text(
                                "$wind m/s",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Wind",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.cloudy_snowing,
                                size: 30,
                                color: Colors.black38,
                              ),
                              Text(
                                "$precipitation mm",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Precipitation",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "6:00 AM",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Sunrise",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Image(
                              image: AssetImage(tPrograssSun),
                              height: 50,
                              width: 150,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "6:00 PM",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              const Text(
                                "Sunset",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 410,
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xffe0e0e0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Soil Moisture",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                          const Spacer(),
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xffebece5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Today",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black38,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.date_range,
                                    size: 30,
                                    color: Colors.black38,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         const SizedBox(height: 10),
                      //         SizedBox(
                      //           height: 150,
                      //           child: MyBarChart(
                      //             soilMoisture: soilMoisture,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // ----------------------------------------------------------
                      // Center(
                      //   child: SfCartesianChart(
                      //     // Chart title

                      //     // Primary X axis
                      //     primaryXAxis: CategoryAxis(),

                      //     // Primary Y axis
                      //     primaryYAxis: NumericAxis(
                      //       isVisible: false,
                      //     ),

                      //     // Add StepAreaSeries to the series property
                      //     series: <ChartSeries>[
                      //       StepAreaSeries<ChartData, String>(
                      //         dataSource: <ChartData>[
                      //           ChartData('Low', 20, Color(0xffd34f53)),
                      //           ChartData('Optimal', 30, Color(0xff1c9a73)),

                      Center(
                        child: SfCartesianChart(
                          primaryXAxis:
                              CategoryAxis(), // Category Axis for X-axis
                          series: <ChartSeries>[
                            ColumnSeries<dynamic, String>(
                              dataSource: <Map<String, dynamic>>[
                                {'x': 'Low', 'y': 22.5},
                                {'x': 'Optimal', 'y': 30.5},
                                {'x': 'High', 'y': 50},
                              ],
                              xValueMapper: (dynamic data, _) =>
                                  data['x'].toString(),
                              yValueMapper: (dynamic data, _) => data['y'],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class ChartData {
//   ChartData(this.x, this.y, this.color);
//   final String x;
//   final double y;
//   final Color color; // Color property for ChartData
// }
