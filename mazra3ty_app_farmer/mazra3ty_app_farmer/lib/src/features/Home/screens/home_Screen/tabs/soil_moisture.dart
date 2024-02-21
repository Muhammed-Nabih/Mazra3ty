import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mazra3ty_app_farmer/src/constants/colors.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/controllers/home/home_cubit.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/controllers/home/home_state.dart';
import 'package:mazra3ty_app_farmer/src/features/Home/screens/home_Screen/home_model.dart';
import 'package:mazra3ty_app_farmer/src/utils/widgets/custom_snack_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SoilMoisture extends StatefulWidget {
  const SoilMoisture({Key? key});

  @override
  State<SoilMoisture> createState() => _SoilMoistureState();
}

class _SoilMoistureState extends State<SoilMoisture> {
  late Map<String, dynamic> homeStatistics;
  var soilMoisture;

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
        soilMoisture = newMessage['data']['outputPercentage'];
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
            soilMoisture =
                homeStatistics['data']['soilMoisture']['outputPercentage'];
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 1200,
                  percent: 0.5, // This value will be overridden by soilMoisture
                  center: Text(
                    // Use soilMoisture here instead of the hardcoded value
                    soilMoisture != null ? '$soilMoisture%' : '0%',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: TColors.secondary,
                ),
                SizedBox(
                  height: 50,
                ), // Add padding between CircularPercentIndicator and Text
                const Text(
                  "Soil Moisture",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: TColors.secondary),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

  


/*Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              animationDuration: 1200,
              percent: 0.5,
              center: const Text(
                "50.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: TColors.secondary,
            ),
            SizedBox(
              height: 50,
            ), // Add padding between CircularPercentIndicator and Text
            const Text(
              "Soil Moisture",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: TColors.secondary),
            ),
          ],
        ),
      ),
    ); */