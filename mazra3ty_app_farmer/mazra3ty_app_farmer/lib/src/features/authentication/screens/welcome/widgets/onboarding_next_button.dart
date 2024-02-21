import 'package:flutter/material.dart';
import 'package:mazra3ty_app_farmer/src/constants/color.dart';
import 'package:mazra3ty_app_farmer/src/constants/size.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mazra3ty_app_farmer/src/utils/device/device_utility.dart';
import 'package:mazra3ty_app_farmer/src/utils/helpers/helper_function.dart';

class OnBoardingNextBButton extends StatelessWidget {
  const OnBoardingNextBButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      right: TSize.defaultSection,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          backgroundColor: dark ? TColors.light : TColors.dark,
        ),
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(
          Icons.arrow_forward_ios,
          color: dark ? TColors.dark : TColors.light,
        ),
      ),
    );
  }
}