
import 'package:flutter/cupertino.dart';
import 'package:mazra3ty_app_farmer/src/constants/color.dart';
import 'package:mazra3ty_app_farmer/src/constants/size.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mazra3ty_app_farmer/src/utils/device/device_utility.dart';
import 'package:mazra3ty_app_farmer/src/utils/helpers/helper_function.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSize.defaultSection,
      child: SmoothPageIndicator(
          count: 6,
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark,
            dotHeight: 6,
          )),
    );
  }
}
