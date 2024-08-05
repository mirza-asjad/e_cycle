import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_images.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2AF598), // Green at the top
              Color(0xFF009EFD), // Blue at the bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppImages.SHAPE_ICON, // Update the path accordingly
                      width: 201, // Set the desired width
                      height: 171, // Set the desired height
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 350,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.ONBOARDING_SCREEN);
                    },
                    child: const Text(
                      'Get Started',
                      style: AppTextStyles.titleLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    text: 'Already have an account? ',
                    style: AppTextStyles.labelLarge,
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: AppTextStyles.labelLargeBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}
