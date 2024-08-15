import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_images.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({Key? key}) : super(key: key);

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
          Hero(
            tag: 'searchHeroTag',
            child: Text(
              'Search',
              style: AppTextStyles.labelMediumSemiBold.copyWith(
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          SizedBox(width: 52),
        ],
      ),
    );
  }

  Widget _buildMiddleContainer(double screenHeight, double screenWidth) {
    return Positioned(
      top: (screenHeight * 0.60) / 2 -
          100, // Adjust this to better position the container
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: Container(
        width: 382, // Set the width of the container
        height: 148, // Set the height of the container
        padding: const EdgeInsets.all(16.0),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRowItem(
              icon: AppImages.PIN_ICON,
              text: 'Marbella Dr',
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Divider(
                  color: Colors.grey.withOpacity(0.3), // Very light color
                  thickness: 1, // Thickness of the divider
                ),
              ),
            ),
            _buildRowItem(
              icon: AppImages.NAVIGATION_ICON,
              text: 'Ab',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem({required String icon, required String text}) {
    return Row(
      children: [
        Container(
          height: 29,
          width: 29,
          child: Image.asset(icon),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppTextStyles.labelMediumRegular.copyWith(
            fontSize: 21,
          ),
        ),
      ],
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
        child: const Center(
          child: Text('', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
