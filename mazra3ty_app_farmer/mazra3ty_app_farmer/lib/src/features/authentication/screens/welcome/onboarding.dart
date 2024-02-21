import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_farmer/src/constants/image_strings.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/welcome/widgets/onboarding_dot_navigation.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/welcome/widgets/onboarding_next_button.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/welcome/widgets/onboarding_page.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/screens/welcome/widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(children: [
        // Horizontal Scrollable Pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: const [
            OnBoardingPage(
              image: tOnBoardingImage2,
              title: 'Welcome to Mazra3ty',
              subTitle:
                  'Welcome to the Smart Farming Program, where technology meets agriculture to enhance productivity and quality of life!.',
            ),
            OnBoardingPage(
              image: tOnBoardingImage4,
              title: 'Humidity and Statistics',
              subTitle:
                  'You can recogonize the humditiy in your farm and the temperature.',
            ),
            OnBoardingPage(
              image: tOnBoardingImage3,
              title: 'Remotely Controlling',
              subTitle:
                  'You can control overall your farm through your wifi and phone.',
            ),
            OnBoardingPage(
              image: tOnBoardingImage1,
              title: 'Changeable Settings',
              subTitle:
                  'You can change the settings of the appplication that controls the farm.',
            ),
            OnBoardingPage(
              image: tOnBoardingImage5,
              title: 'Rain Recognition',
              subTitle:
                  'The application recognizw the rain when it is here and let you know about it.',
            ),
            OnBoardingPage(
              image: tOnBoardingImage6,
              title: 'Irrigation and the weather',
              subTitle:
                  'Through this application yoou can know eveything about the irrigation and P.S.I and the weather.',
            ),
          ],
        ),

        // Skip Button
        const OnBoardingSkip(),

        // Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),
        // Circular Button
        const OnBoardingNextBButton()
      ]),
    );
  }
}
