import 'package:flutter/material.dart';
import 'package:mazra3ty_app_farmer/src/constants/size.dart';
import 'package:mazra3ty_app_farmer/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:mazra3ty_app_farmer/src/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppbarHeight(),
        right: TSize.defaultSection,
        child: TextButton(
            onPressed: () => OnBoardingController.instance.skipPage(),
            child: const Text("Skip",
                style: TextStyle(fontSize: TSize.fontSizeMd))));
  }
}
