import 'package:e_cycle/config/app_text_style.dart';
import 'package:e_cycle/widgets/customized_reuse_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/my_statistics_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_images.dart';

class MyStatisticsScreenView extends GetView<MyStatisticsScreenController> {
  const MyStatisticsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2AF598),
                Color(0xFF009EFD),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              _buildHeader(),
              _buildEmptyContentContainer(screenHeight),
              _buildMiddleContainer(screenHeight, screenWidth, 0.65,
                  AppImages.CLOCK_ICON, 'Duration', '28', ' mins'),
              _buildMiddleContainer(screenHeight, screenWidth, 1.0,
                  AppImages.FIRE_ICON, 'Calories', '34', ' cal'),
              _buildMiddleContainer(screenHeight, screenWidth, 1.35,
                  AppImages.DISTANCE_ICON, 'Distance', '3752', ' m'),
              _buildMiddleContainer(screenHeight, screenWidth, 1.70,
                  AppImages.PATH_ICON, 'Path', '6', ' oz'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 75,
      left: 0,
      right: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.BUTTON_COLOR,
                size: 32,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          const Spacer(),
          Text(
            'My Statistics',
            style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 21),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const SizedBox(width: 52),
        ],
      ),
    );
  }

  Widget _buildMiddleContainer(
      double screenHeight,
      double screenWidth,
      double screenHeightfortop,
      String imageName,
      String text,
      String subtext,
      String subtitletext) {
    return Positioned(
      top: (screenHeight * screenHeightfortop) / 2 - 112,
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: Container(
        width: 350,
        height: 116,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Light black shadow
              spreadRadius: 1,
              blurRadius: 12, // Increased blur radius
              offset:
                  const Offset(0, 6), // Slight offset to position the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Image.asset(
                imageName, // Replace with your image asset
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12), // Spacing between image and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style:
                        AppTextStyles.labelMediumRegular.copyWith(fontSize: 18),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline
                        .alphabetic, // Ensure alignment by text baseline
                    children: [
                      Baseline(
                        baseline:
                            32, // Adjust this value to match the height of 'subtext'
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          subtext,
                          style: AppTextStyles.labelMediumSemiBold
                              .copyWith(fontSize: 32),
                        ),
                      ),
                      const SizedBox(
                          width: 4), // Adjust spacing between texts if needed
                      Baseline(
                        baseline:
                            32, // Ensure this matches the baseline of 'subtext'
                        baselineType: TextBaseline.alphabetic,
                        child: Text(
                          subtitletext,
                          style: AppTextStyles.labelMediumSemiBold
                              .copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyContentContainer(double screenHeight) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: screenHeight * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            ReuseButtonWidget(text: 'Share', onPressed: () {}),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
