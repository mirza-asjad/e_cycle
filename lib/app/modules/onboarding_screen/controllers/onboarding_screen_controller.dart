import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingScreenController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void goToPage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void nextPage() {
    if (currentPage.value < 2) {
      currentPage.value++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToNextScreen() {
    // Implement navigation to the next screen here
    getStarted();
  }

  void getStarted() {
    // Implement the action when 'Get Started' is pressed
    Get.offNamed(Routes.AUTH_SCREEN);
  }
}
