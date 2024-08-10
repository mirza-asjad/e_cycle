import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/widgets/reuse_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/invite_friends_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:e_cycle/config/app_images.dart';

class InviteFriendsScreenView extends GetView<InviteFriendsScreenController> {
  const InviteFriendsScreenView({Key? key}) : super(key: key);

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
              _buildMiddleContainer(
                screenHeight,
                screenWidth,
              ),
              // Add more _buildMiddleContainer widgets if needed
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
            'Invite Friends',
            style: TextStyle(
              fontSize: 21,
              fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
              fontWeight: FontWeight.bold,
              color: AppColors.BUTTON_COLOR.withOpacity(0.8),
            ),
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
      top: (screenHeight * 0.70) / 2 - 112, // Adjust as needed
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: Container(
        width: 350,
        height: 392,
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
            // Center-left image
            Positioned(
              top: (392 - 200) /
                  2, // Center vertically within the container height
              left: (350 - 200) / 2 -
                  50, // Position slightly to the left of center
              child: Container(
                width: 100, // Width of the container
                height: 105, // Height of the container
                decoration: BoxDecoration(
                  color:
                      Colors.transparent, // Background color of the container
                ),
                child: Image.asset(
                  AppImages.RIDER_IMAGE, // Replace with your image path
                  width: 40, // Width of the image
                  height: 40, // Height of the image
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Center-right image
            Positioned(
              top: (392 - 200) /
                  2, // Center vertically within the container height
              left: (350 - 225) / 2 +
                  50, // Position slightly to the right of center
              child: Container(
                width: 164, // Width of the container
                height: 160, // Height of the container
                decoration: BoxDecoration(
                  color:
                      Colors.transparent, // Background color of the container
                ),
                child: Image.asset(
                  AppImages.RIDER_MALE_IMAGE, // Replace with your image path
                  width: 80, // Width of the image
                  height: 80, // Height of the image
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Text at the bottom
            const Positioned(
              bottom: 16, // Adjust the bottom position
              left: 30, // Adjust the left position
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Invitation Code',
                      style: TextStyle(
                        color: AppColors.BUTTON_COLOR, // Adjust text color
                        fontSize: 21, // Adjust text size
                        fontFamily: AppFonts.MONTSERRAT_REGULAR,
                        fontWeight:
                            FontWeight.w200, // Adjust text weight if needed
                      ),
                    ),
                    Text(
                      'KD08CS2006',
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
            const Spacer(),
            ReuseButtonWidget(text: 'E-mail', onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            ReuseButtonWidget(text: 'Contacts', onPressed: () {
              Get.toNamed(Routes.INVITE_FRIENDS_CONTACTS_SCREEN);
            }),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
