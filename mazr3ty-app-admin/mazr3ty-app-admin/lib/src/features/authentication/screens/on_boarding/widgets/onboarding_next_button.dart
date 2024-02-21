import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/controllers/onboarding/on_boarding_screen_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../helpers/helper_functions.dart';
class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark =THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: kBottomNavigationBarHeight ,
      child: ElevatedButton(
        onPressed: ()=>OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape:const CircleBorder(),backgroundColor:dark? TColors.primary:TColors.secondary),
        child:const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}








