import 'package:get/get.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:mazra3ty_app_admin/src/features/home/screens/home_view.dart';

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
    var accessToken = await TokenManager.getAccessToken();
    if (accessToken != null) {
      Get.off(
        () => const HomeView(),
        duration: const Duration(milliseconds: 1000), //Transition Time
        transition: Transition.fadeIn, //Screen Switch Transition
      );
    } else {
      Get.off(
        () => const OnBoardingScreen(),
        duration: const Duration(milliseconds: 1000), //Transition Time
        transition: Transition.fadeIn, //Screen Switch Transition
      );
    }
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
}
