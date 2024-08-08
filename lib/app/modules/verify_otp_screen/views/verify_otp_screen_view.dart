import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:e_cycle/widgets/reuse_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

import '../controllers/verify_otp_screen_controller.dart';

class VerifyOtpScreenView extends GetView<VerifyOtpScreenController> {
  const VerifyOtpScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2AF598).withOpacity(0.7), // Gradient color for OTP field
            Color(0xFF009EFD).withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.transparent), // Border is transparent
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.WHITE_COLOR),
      borderRadius: BorderRadius.circular(40),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

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
              _buildBackButton(context),
              _buildHeader(),
              _buildContentContainer(context, screenHeight, defaultPinTheme,
                  focusedPinTheme, submittedPinTheme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 50,
      left: 5,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.BUTTON_COLOR,
          size: 32, // Increased size for a bolder look
        ),
        onPressed: () {
          Get.offNamed(Routes.AUTH_SCREEN);
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 100,
      left: 25,
      child: Text(
        'Verification',
        style: TextStyle(
          fontSize: 36,
          fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
          fontWeight: FontWeight.bold,
          color: AppColors.BUTTON_COLOR.withOpacity(0.8),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildContentContainer(
      BuildContext context,
      double screenHeight,
      PinTheme defaultPinTheme,
      PinTheme focusedPinTheme,
      PinTheme submittedPinTheme) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final containerHeight = screenHeight * 0.8 - keyboardHeight;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: containerHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    keyboardType: TextInputType.number,
                    submittedPinTheme: submittedPinTheme,
                    length: 6,
                    validator: (s) {
                      return s!.length == 6 ? null : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Enter the code sent to your device to verify your identity.',
                  style: AppTextStyles.labelSmall.copyWith(
                      fontSize: 16, color: AppColors.LIGHT_BLACK_COLOR),
                ),
                const SizedBox(height: 20),
                Text(
                  '+91 9876543210',
                  style: AppTextStyles.labelSmall
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xFF2AF598), Color(0xFF009EFD)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.AUTH_SCREEN);
                        print('Resend code');
                      },
                      child: Text(
                        'Didn\'t receive the code?',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontSize: 16,
                          color: Colors
                              .white, // Text color should be white or transparent
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                ReuseButtonWidget(
                  text: 'Verify',
                  onPressed: () {
                    Get.toNamed(Routes.HOME_SCREEN);
                    print('Verify button pressed');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
