import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/data/data_source/shared_pref_secure_storage.dart';

class OnboardingPageController extends GetxController {
  final List<String> pathImage = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  PageController pageController = PageController();
  Rx<int> currentPage = 0.obs;

  int onboarding = 0;

  void changePage({int currentIdx = 0, bool jump = false}) {
    currentPage.value = currentIdx; //< 2 ? currentIdx++ : currentIdx;
    jump
        ? pageController.jumpToPage(currentIdx)
        : pageController.animateToPage(currentIdx,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  void onInit() {
    SharedPrefSecureStorage.getInstance()!.setPrefOnBoarding(1);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
