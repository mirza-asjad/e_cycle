import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:e_cycle/widgets/customized_phone_number_widget.dart';
import 'package:e_cycle/widgets/customized_reuse_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../controllers/auth_screen_controller.dart';

class AuthScreenView extends GetView<AuthScreenController> {
  const AuthScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final TextEditingController phoneController = TextEditingController();
    PhoneNumber initialNumber = PhoneNumber(isoCode: 'PK'); // Adjust as needed

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
              _buildContentContainer(context, phoneController, initialNumber),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Positioned(
      top: 100,
      left: 25,
      right: 0,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.isLogin.value = true,
            child: Obx(() => _buildTab(
                  'Log in',
                  isActive: controller.isLogin.value,
                )),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => controller.isLogin.value = false,
            child: Obx(() => _buildTab(
                  'Sign up',
                  isActive: !controller.isLogin.value,
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, {required bool isActive}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: isActive ? 36 : 21,
            fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w300,
            color: isActive
                ? AppColors.BUTTON_COLOR.withOpacity(0.8)
                : AppColors.BUTTON_COLOR,
          ),
          textAlign: TextAlign.center,
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 6,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
      ],
    );
  }

  Widget _buildContentContainer(BuildContext context,
      TextEditingController phoneController, PhoneNumber initialNumber) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(75.0),
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.8,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: controller.isLogin.value
                        ? _buildLoginContent(phoneController, initialNumber)
                        : _buildSignUpContent(phoneController, initialNumber),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginContent(
      TextEditingController phoneController, PhoneNumber initialNumber) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          PhoneNumberInputWidget(
            controller: phoneController,
            initialNumber: initialNumber,
            onInputChanged: (number) {
              print('Login phone number changed: ${number.phoneNumber}');
            },
            onInputValidated: (isValid) {
              print('Login phone number valid: $isValid');
            },
            onSaved: (number) {
              print('Login phone number saved: $number');
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Login with your phone number',
            style: AppTextStyles.labelMediumRegular,
          ),
          const SizedBox(height: 120),
          ReuseButtonWidget(
            text: 'Log in',
            onPressed: () {
              Get.toNamed(Routes.VERIFY_OTP_SCREEN);
              print('Log in button pressed');
            },
          )
        ],
      ),
    );
  }

  Widget _buildSignUpContent(
      TextEditingController phoneController, PhoneNumber initialNumber) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          PhoneNumberInputWidget(
            controller: phoneController,
            initialNumber: initialNumber,
            onInputChanged: (number) {
              print('Sign up phone number changed: ${number.phoneNumber}');
            },
            onInputValidated: (isValid) {
              print('Sign up phone number valid: $isValid');
            },
            onSaved: (number) {
              print('Sign up phone number saved: $number');
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Sign up with your phone number',
            style: AppTextStyles.labelMediumRegular,
          ),
          const SizedBox(height: 120),
          ReuseButtonWidget(
            text: 'Sign up',
            onPressed: () {
              Get.toNamed(Routes.VERIFY_OTP_SCREEN);
              print('Sign up button pressed');
            },
          )
        ],
      ),
    );
  }
}
