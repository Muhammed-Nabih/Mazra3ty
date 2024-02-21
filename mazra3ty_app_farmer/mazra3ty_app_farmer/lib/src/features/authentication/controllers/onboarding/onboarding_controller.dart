import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/welcome/welcome_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs; // obs : observable

  // Update current page index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specified dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut); // Animation
    // pageController.jumpTo(index);
  }

  // Update Current Index & Jump to next page
  void nextPage() {
    if (currentPageIndex.value == 5) {
      Get.to(const WelcomeScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    }
  }

  // Update Current Index & Jump to the last page
  void skipPage() {
    // currentPageIndex.value = 5;
    // pageController.animateToPage(5,
    //     duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    Get.to(const WelcomeScreen());
  }
}
