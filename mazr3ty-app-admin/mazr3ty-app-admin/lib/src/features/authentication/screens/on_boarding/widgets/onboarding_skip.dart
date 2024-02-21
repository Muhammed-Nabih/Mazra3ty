import 'package:flutter/material.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/controllers/onboarding/on_boarding_screen_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../helpers/helper_functions.dart';
class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Positioned(
        top: kToolbarHeight,
        right: TSizes.defaultSpace,
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle:const TextStyle(fontSize: (14),),
          ),
          onPressed: ()=>OnBoardingController.instance.skipPage(),
          child:  Text('Skip',style: TextStyle(color:dark? TColors.primary:TColors.secondary),),
        )
    );
  }
}




