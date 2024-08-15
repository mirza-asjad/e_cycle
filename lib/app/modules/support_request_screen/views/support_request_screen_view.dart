import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/support_request_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_images.dart';

class SupportRequestScreenView extends GetView<SupportRequestScreenController> {
  const SupportRequestScreenView({Key? key}) : super(key: key);

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
              _buildMiddleContainer(screenHeight, screenWidth, 0.65),
              _buildMiddleContainer(screenHeight, screenWidth, 1.00),
              _buildMiddleContainer(screenHeight, screenWidth, 1.35),
              _buildMiddleContainer(screenHeight, screenWidth, 1.70),
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
            'Support Request',
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
      double screenHeight, double screenWidth, double screenHeightoftop) {
    return Positioned(
      top: (screenHeight * screenHeightoftop) / 2 - 112,
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: InkWell(
        onTap: () => Get.toNamed(Routes.MESSAGES_SCREEN),
        child: Container(
          width: 350,
          height: 114,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Left Top Corner - Image
              Positioned(
                top: 8,
                left: 16,
                child: Image.asset(
                  AppImages.MAIL_ICON, // Replace with your image path
                  width: 25, // Adjust width as needed
                  height: 25, // Adjust height as needed
                  fit: BoxFit.contain,
                ),
              ),
              // Right Top Corner - Date
              Positioned(
                top: 8,
                right: 16,
                child: Text(
                  '11 Aug 2024',
                  style:
                      AppTextStyles.labelMediumRegular.copyWith(fontSize: 13),
                ),
              ),
              // Center Left - Text
              Positioned(
                left: 16, // Adjust to provide space for the image
                top: 47, // Center vertically within the container
                right: 16, // Provide some padding on the right
                child: SizedBox(
                  width: screenWidth * 0.6,
                  child: const Text(
                      'This is the main text that will be displayed in two lines if it\'s too long.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.labelMediumRegular),
                ),
              ),
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
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
