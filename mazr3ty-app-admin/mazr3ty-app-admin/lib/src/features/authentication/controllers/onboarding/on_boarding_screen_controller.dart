import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazra3ty_app_admin/src/features/authentication/screens/welcome/welcome_screen.dart';



/*class OnBoardingController extends GetxController {
  final controller = LiquidController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: OnBoardingStart,
        Title: tOnBoardingTitleStart,
        SubTitle: tOnBoardingSubTitleStart,
        CounterText: tOnBoardingCounter1,
        bgColor: OnBourdingPageStart,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: OnBoarding1,
        Title: tOnBoardingTitle1,
        SubTitle: tOnBoardingSubTitle1,
        CounterText: tOnBoardingCounter2,
        bgColor: OnBourdingPage1,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: OnBoarding2,
        Title: tOnBoardingTitle2,
        SubTitle: tOnBoardingSubTitle2,
        CounterText: tOnBoardingCounter3,
        bgColor: OnBourdingPage2,
      ),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
        image: OnBoarding3,
        Title: tOnBoardingTitle3,
        SubTitle: tOnBoardingSubTitle3,
        CounterText: tOnBoardingCounter4,
        bgColor: OnBourdingPage3,
      ),
    ),
  ];

  skip(context) => {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: const WelcomeScreen(),
          ),
        ),
      };
  animateToNextSlide(context) {
    int nextPage = controller.currentPage + 1;
    if (nextPage == 4) {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: const WelcomeScreen(),
        ),
      );
    } else {
      controller.animateToPage(page: nextPage);
    }
  }

  onPageChangedCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
}*/
class OnBoardingController extends GetxController {
  static OnBoardingController get instance =>Get.find();

  ///Variables
  final pageController =PageController();
  Rx<int>currentPageIndex=0.obs;


  /// Update Current Index when Page Scroll
  void updatePageIndicator (index)=> currentPageIndex.value=index;

  ///Jump to the specific dot selected page
  void dotNavigationClick(index){
    currentPageIndex.value=index;
    pageController.jumpTo(index);
  }

  ///Update Current Index & jump to next page
  void nextPage(){
    if(currentPageIndex.value==3){
      Get.to(const WelcomeScreen());
    }
    else{
      int page=currentPageIndex.value+1;
      pageController.jumpToPage(page);
    }


  }

  ///Update Current Index & jump to the last Page
  void skipPage(){
    currentPageIndex.value=3;
    pageController.jumpToPage(3);
  }

}




