import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/payment_screen_controller.dart';

import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_images.dart';

class PaymentScreenView extends GetView<PaymentScreenController> {
  const PaymentScreenView({Key? key}) : super(key: key);
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
              _buildMiddleContainer(screenHeight,
                  screenWidth), // Place this last to bring it on top
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
            'Payment',
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
            Positioned(
              bottom: 16, // Adjust the bottom position
              left: 16, // Adjust the left position
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Balance',
                    style:
                        AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
                  ),
                  Text(
                    '\$10.50',
                    style: AppTextStyles.labelMediumSemiBold
                        .copyWith(fontSize: 32),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 24, // Adjust the top position
              right: 8, // Adjust the right position
              child: Container(
                child: Image.asset(AppImages.MASTER_LOGO),
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
        height: screenHeight * 0.70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                // Background color for the ListTile
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0x80F7F7F7),
                ),
                child: ListTile(
                  title: Text(
                    'Apple Pay',
                    style:
                        AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
                  ),
                  trailing: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Minimize the size of the Row
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            right:
                                8.0), // Add some spacing between image and text
                        child: Image.asset(
                          AppImages.APPLE_LOGO,
                          width: 27, // Adjust width as needed
                          height: 37, // Adjust height as needed
                          fit: BoxFit.contain,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.BUTTON_COLOR,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // Background color for the ListTile
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0x80F7F7F7),
                  ),

                  child: ListTile(
                    title: Text(
                      'Payment Options',
                      style: AppTextStyles.labelMediumRegular
                          .copyWith(fontSize: 21),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.BUTTON_COLOR,
                        )),
                  ),
                )), // You can add more widgets here if needed
          ],
        ),
      ),
    );
  }
}
