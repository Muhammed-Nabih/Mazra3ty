import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:mazra3ty_app_admin/src/constants/text_strings.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/controllers/onboarding/on_boarding_screen_controller.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/on_boarding/widgets/onboarding_dot_navigation.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/on_boarding/widgets/onboarding_next_button.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/on_boarding/widgets/onboarding_page.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/on_boarding/widgets/onboarding_skip.dart';
import '../../../../constants/image_strings.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          ///Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children:const [
              OnBoardingPage(
                image: TImages.OnBoardingStart,
                title: TTexts.tOnBoardingTitleStart,
                subTitle: TTexts.tOnBoardingSubTitleStart,
              ),
              OnBoardingPage(
                image: TImages.OnBoarding1,
                title: TTexts.tOnBoardingTitle1,
                subTitle: TTexts.tOnBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.OnBoarding2,
                title: TTexts.tOnBoardingTitle2,
                subTitle: TTexts.tOnBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.OnBoarding3,
                title: TTexts.tOnBoardingTitle3,
                subTitle: TTexts.tOnBoardingSubTitle3,
              ),
            ],
          ),

          ///Skip Button
          const OnBoardingSkip(),
          ///Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          ///Circular Button
          const OnBoardingNextButton()
          
        ],
      ),
    );
    /* body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
              pages:obcontroller.pages,
            enableSideReveal:true ,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios) ,
            waveType: WaveType.circularReveal,

          ),
          Positioned(
            bottom:40.0,
              child: OutlinedButton(

                onPressed: ()=>obcontroller.animateToNextSlide(context),
                style:ElevatedButton.styleFrom(
                  side:const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20.0),
                  foregroundColor: Colors.white,
                ) ,
                child: Container(
                  padding:const EdgeInsets.all(20.0),
                  decoration:const BoxDecoration(
                    color:tDarkColor,shape: BoxShape.circle ) ,
                  child: const Icon(Icons.arrow_forward_ios),
                ),

              )
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                onPressed: () => obcontroller.skip(context),

                child: const Text("Skip",style: TextStyle(color: Colors.grey),),
              )

          ),
          Obx(
              ()=> Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: obcontroller.currentPage.value,
                  effect: const WormEffect(
                    activeDotColor: Color(0xff272727),
                    dotHeight: 5.0,
                  ),
            )),
          )

        ],
      ),
    );
  }*/
  }
}


