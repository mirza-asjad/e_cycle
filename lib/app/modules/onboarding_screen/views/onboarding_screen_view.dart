import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_images.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:e_cycle/widgets/onboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) {
                    controller.goToPage(index);
                  },
                  children: const [
                    OnboardingPage(
                      imagePath: AppImages.ONBOARDING_LOCATE,
                      heading: 'Locate',
                      description:
                          'Find nearby places with ease. Our app guides you to your destinations efficiently.',
                    ),
                    OnboardingPage(
                      imagePath: AppImages.ONBOARDING_UNLOCK,
                      heading: 'Unlock',
                      description:
                          'Unlock new opportunities by exploring features tailored to your needs.',
                    ),
                    OnboardingPage(
                      imagePath: AppImages.ONBOARDING_RIDE,
                      heading: 'Ride',
                      description:
                          'Share your location and plans with loved ones. Coordinate your adventures effortlessly.',
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color:
                  AppColors.WHITE_COLOR, // Background color for the bottom row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.skipToNextScreen();
                    },
                    child: Text(
                      'Skip',
                      style: AppTextStyles.labelMediumRegular,
                    ),
                  ),
                  Obx(() => Row(
                        children: List.generate(3, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: 12.0,
                            height: 12.0,
                            decoration: BoxDecoration(
                              color: controller.currentPage.value == index
                                  ? AppColors.BUTTON_COLOR
                                  : AppColors.GREY_COLOR.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      )),
                  Obx(() => TextButton(
                        onPressed: () {
                          if (controller.currentPage.value == 2) {
                            controller.getStarted();
                          } else {
                            controller.nextPage();
                          }
                        },
                        child: Text(
                          controller.currentPage.value == 2
                              ? 'Get Started'
                              : 'Next',
                          style: AppTextStyles.labelMediumSemiBold,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
