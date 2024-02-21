import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_admin/src/constants/colors.dart';
import 'package:mazra3ty_app_admin/src/constants/image_strings.dart';
import 'package:mazra3ty_app_admin/src/constants/sizes.dart';
import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../../../helpers/helper_functions.dart';

class SplashScreen extends StatelessWidget{
   SplashScreen({Key? key}):super(key: key);

  final splashController = Get.put(FadeInAnimationController());



  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    FadeInAnimationController.find.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
          durationInMs: 1000,
          animate: TAnimatePosition(
              topBefore: 0,
              topAfter: -20,
              leftAfter: -20,
              leftBefore: 0),
            child: const Image(image: AssetImage(TImages.tSplashTopIcon)),
      ),


          TFadeInAnimation(
                durationInMs: 1000,
                animate: TAnimatePosition(bottomBefore: 50,bottomAfter:220,rightBefore:0 ,rightAfter:20),
                child: const Image(image: AssetImage(TImages.tSplashImage)),

              ),
          TFadeInAnimation(
                durationInMs: 1000,
                animate: TAnimatePosition(bottomBefore: 0,bottomAfter: 60,rightBefore: TSizes.tDefaultSize,rightAfter: TSizes.tDefaultSize),
                child: Container(
                  width: TSizes.tSplashContainerSize,
                  height: TSizes.tSplashContainerSize,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: dark? TColors.primary:TColors.secondary  ,
                  ),
              ),


        ),
        ],
      ),
    );
  }
}

