import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_wallet_screen_controller.dart';

import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:e_cycle/config/app_images.dart';

class MyWalletScreenView extends GetView<MyWalletScreenController> {
  const MyWalletScreenView({Key? key}) : super(key: key);

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
              icon: Icon(
                Icons.arrow_back_rounded,
                color: AppColors.BUTTON_COLOR,
                size: 32,
              ),
              onPressed: () {
                Get.offNamed(Routes.HOME_SCREEN);
              },
            ),
          ),
          const Spacer(),
          Text(
            'My Wallet',
            style: TextStyle(
              fontSize: 21,
              fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
              fontWeight: FontWeight.bold,
              color: AppColors.BUTTON_COLOR.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(width: 52),
        ],
      ),
    );
  }

  Widget _buildMiddleContainer(double screenHeight, double screenWidth) {
    return Positioned(
      top: (screenHeight * 0.60) / 2 - 112, // Adjusted to center the container
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: Container(
        width: 350,
        height: 224,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Image on the left side taking up 50% of the container width
            Positioned(
              left: -100, // Adjust to match the width of the gradient section
              right: 0,
              top: 0,
              bottom: 0,
              child: Row(
                children: [
                  Container(
                    width: 315, // 50% of 350
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages
                            .CIRCULAR_GRADIENT), // Replace with actual image path
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                      ),
                    ),
                  ),
                  // Content on the right side
                ],
              ),
            ),
            // Positioned image for manual adjustment
            Positioned(
              top: 62, // Adjust vertical position
              left: 10, // Adjust horizontal position
              child: Container(
                width: 159, // Adjust size as needed
                height: 134, // Adjust size as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages
                        .RIDER_IMAGE), // Replace with actual image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Weekly Pass text
            Positioned(
              right: 15, // Adjust to position the text
              top: 5, // Adjust vertical position
              child: Container(
                width: 130, // Adjust width as needed
                height: 100, // Adjust height as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Weekly Pass',
                      style: TextStyle(
                        color: AppColors.BUTTON_COLOR,
                        fontSize: 14,
                        fontFamily: AppFonts.MONTSERRAT_LIGHT,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$24.99',
                      style: TextStyle(
                        color: AppColors.BUTTON_COLOR,
                        fontSize: 20,
                        fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Purchase button with gradient
            Positioned(
              right: 10, // Adjust to position the button
              bottom: 15, // Adjust vertical position
              child: Container(
                width: 131, // Adjust width as needed
                height: 40, // Adjust height as needed
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF2AF598), // Gradient color
                      Color(0xFF009EFD), // Gradient color
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text(
                    'Purchase',
                    style: TextStyle(
                      color: AppColors.BUTTON_COLOR,
                      fontSize: 15,
                      fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
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
            SizedBox(
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                // Background color for the ListTile
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0x80F7F7F7),
                ),

                child: ListTile(
                  title: Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.BUTTON_COLOR, // Title text color
                    ),
                  ),
                  subtitle: Text(
                    '\$24.99',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: AppFonts.MONTSERRAT_BOLD,
                      color: AppColors.BUTTON_COLOR, // Title text color
                    ),
                  ),
                  trailing: Container(
                    width: 114, // Adjust width as needed
                    height: 40, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: Color(0x1FB0B0B0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: Text(
                        'Top Up',
                        style: TextStyle(
                          color: AppColors.BUTTON_COLOR, // Button text color
                          fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
                          fontWeight: FontWeight.w800,
                          fontSize: 15, // Adjust font size as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  // Background color for the ListTile
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0x80F7F7F7),
                  ),

                  child: ListTile(
                    title: Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: AppFonts.MONTSERRAT_REGULAR,
                        fontWeight: FontWeight.w400,
                        color: AppColors.BUTTON_COLOR, // Title text color
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.PAYMENT_SCREEN);
                        },
                        icon: Icon(
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
