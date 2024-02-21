import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../../../../commen_widgets/fade_in_animation/animation_design.dart';
import '../../../../commen_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../commen_widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final splashController = Get.put(FadeInAnimationController());

  @override
  Widget build(BuildContext context) {
    FadeInAnimationController.find.startSplashAnimation();
    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1000,
            animate: TAnimatePosition(
                topBefore: 0, topAfter: -20, leftAfter: -20, leftBefore: 0),
            child: const Image(image: AssetImage(tSplashTopIcon)),
          ),
          TFadeInAnimation(
              durationInMs: 1000,
              animate: TAnimatePosition(
                  topBefore: 80,
                  topAfter: 80,
                  leftAfter: TSizes.tDefaultSize,
                  leftBefore: -80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.displayLarge,
                  )
                ],
              )),
          TFadeInAnimation(
            durationInMs: 1000,
            animate: TAnimatePosition(
              bottomBefore: 30,
              bottomAfter: 130,
              rightBefore: 0,
              rightAfter: 25,
            ),
            child: const Image(image: AssetImage(tSplashImage)),
          ),
          TFadeInAnimation(
            durationInMs: 1000,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 60,
              rightBefore: TSizes.tDefaultSize,
              rightAfter: TSizes.tDefaultSize,
            ),
            child: Container(
              width: TSizes.tSplashContainerSize,
              height: TSizes.tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                color: TColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
