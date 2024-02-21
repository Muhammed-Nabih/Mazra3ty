// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/Home/screens/home_view.dart';
import '../../features/authentication/screens/welcome/welcome_screen.dart';
import '../../utils/api/token-manager.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 2000));
    dynamic accessToken = await TokenManager.getAccessToken();
    dynamic role = await TokenManager.getRole();

    Get.off(
      // Get.off Instead of Get.offAll()
      () => check(accessToken, role),
      //OnBoardingScreen(),
      duration: const Duration(milliseconds: 1000), //Transition Time
      transition: Transition.fadeIn, //Screen Switch Transition
    );
  }

//Can be used to animate In after calling the next screen.
  Future animationIn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }

//Can be used to animate Out before calling the next screen.
  Future animationOut() async {
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 100));
  }

  Widget check(accessToken, role) {
    if (accessToken != null && role == "farmer") {
      return const HomeView();
    } else {
      return const WelcomeScreen();
    }
  }
}
