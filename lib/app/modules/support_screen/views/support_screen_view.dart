import 'package:e_cycle/config/app_text_style.dart';
import 'package:e_cycle/widgets/customized_textfield.dart';
import 'package:e_cycle/widgets/customized_reuse_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/support_screen_controller.dart'; // Update to match your controller
import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:e_cycle/config/app_images.dart';

class SupportScreenView extends GetView<SupportScreenController> {
  // Update the controller here
  const SupportScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              _buildHeader(),
              _buildEmptyContentContainer(screenHeight),
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
            'Support', // Updated title
            style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 21),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const SizedBox(width: 52),
        ],
      ),
    );
  }

  Widget _buildMiddleContainer(double screenHeight, double screenWidth) {
    return Positioned(
      top: (screenHeight * 0.60) / 2 - 112, // Adjust as needed
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: Container(
        width: 350,
        height: 224,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image:
                AssetImage(AppImages.PATTERN), // Replace with your image path
            fit: BoxFit.cover, // Adjust how the image should be fit
          ),
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
            const Positioned(
              bottom: 16, // Adjust the bottom position
              left: 16, // Adjust the left position
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Help Center', // Updated text
                    style: TextStyle(
                      color: AppColors.BUTTON_COLOR, // Adjust text color
                      fontSize: 21, // Adjust text size
                      fontFamily: AppFonts.MONTSERRAT_REGULAR,
                      fontWeight:
                          FontWeight.w400, // Adjust text weight if needed
                    ),
                  ),
                  Text(
                    '24/7 Support', // Updated text
                    style: TextStyle(
                      color: AppColors.BUTTON_COLOR, // Adjust text color
                      fontSize: 32, // Adjust text size
                      fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
                      fontWeight:
                          FontWeight.bold, // Adjust text weight if needed
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 24, // Adjust the top position
              right: 8, // Adjust the right position
              child: Container(
                child: Image.asset(
                    AppImages.MASTER_LOGO), // Update the image asset
              ),
            ),
          ],
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
        height: screenHeight * 0.80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0), // Adjust padding as needed
            child: ConstrainedBox(
              // Ensure content is tall enough to scroll
              constraints: BoxConstraints(
                minHeight: screenHeight * 0.84, // Set a minimum height
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Name',
                  ),
                  const Divider(
                    color: Colors.grey, // Light grey color for the divider
                    thickness: 0.1, // Thin divider
                    height: 32, // Space before and after the divider
                  ),
                  CustomTextField(
                    hintText: 'Email',
                  ),
                  const Divider(
                    color: Colors.grey, // Light grey color for the divider
                    thickness: 0.1, // Thin divider
                    height: 32, // Space before and after the divider
                  ),
                  CustomTextField(
                    hintText: 'Your Message',
                    maxLines: 4, // Adjust for multi-line input
                  ),
                  const Divider(
                    color: Colors.grey, // Light grey color for the divider
                    thickness: 0.1, // Thin divider
                    height: 32, // Space before and after the divider
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ReuseButtonWidget(
                      text: 'Send',
                      onPressed: () {
                        Get.toNamed(Routes.SUPPORT_REQUEST_SCREEN);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
