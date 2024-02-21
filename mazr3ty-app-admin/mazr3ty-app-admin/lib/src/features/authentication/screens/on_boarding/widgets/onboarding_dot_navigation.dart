import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/controllers/onboarding/on_boarding_screen_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;
    final dark=THelperFunctions.isDarkMode(context);
    return Positioned(
        bottom: kBottomNavigationBarHeight +25 ,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          count: 4,
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(activeDotColor:dark?TColors.primary :TColors.secondary,dotHeight: 6),
        )
    );
  }
}



