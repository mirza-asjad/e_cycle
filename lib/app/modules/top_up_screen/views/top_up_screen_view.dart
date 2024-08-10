import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/top_up_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:e_cycle/config/app_images.dart';

class TopUpScreenView extends GetView<TopUpScreenController> {
  const TopUpScreenView({Key? key}) : super(key: key);

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
              _buildEmptyContentContainer(screenHeight, screenWidth),
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
            'Top Up',
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

  Widget _buildEmptyContentContainer(double screenHeight, double screenWidth) {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 56.0, horizontal: 18.0),
          child: Column(
            children: [
              _buildCardRow(screenWidth, ['\$5', '\$10'], 0),
              const SizedBox(height: 24),
              _buildCardRow(screenWidth, ['\$20', '\$50'], 2),
              const SizedBox(height: 24),
              _buildPaymentTile(), // Add the ListTile here
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardRow(
      double screenWidth, List<String> amounts, int activeIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: amounts.asMap().entries.map((entry) {
        int index = entry.key;
        String amount = entry.value;
        return _buildCard(amount, index == activeIndex);
      }).toList(),
    );
  }

  Widget _buildCard(String amount, bool isActive) {
    return Container(
      decoration: isActive
          ? BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2AF598),
                  Color(0xFF009EFD),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(18.0),
            )
          : null,
      padding: const EdgeInsets.all(
          3.0), // Added padding to make the gradient visible
      child: Container(
        height: 121,
        width: 163,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
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
            Center(
              child: Text(
                amount,
                style: TextStyle(
                  color: AppColors.BUTTON_COLOR,
                  fontSize: 32,
                  fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.w200,
                ),
              ),
            ),
            if (isActive)
              Positioned(
                bottom: 4,
                right: 4,
                child: Image.asset(
                  AppImages.TICK_IMAGE,
                  width: 24,
                  height: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0x80F7F7F7),
        ),
        child: Center(
          child: ListTile(
            title: const Text(
              'MasterCard',
              style: TextStyle(
                fontSize: 18,
                fontFamily: AppFonts.MONTSERRAT_REGULAR,
                fontWeight: FontWeight.w400,
                color: AppColors.BUTTON_COLOR,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    AppImages.MASTER_LOGO,
                    width: 44,
                    height: 44,
                    fit: BoxFit.contain,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.BUTTON_COLOR,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
