import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';

class SettingsScreenView extends GetView<SettingsScreenController> {
  const SettingsScreenView({Key? key}) : super(key: key);

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
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              _buildHeader(),
              _buildContentContainer(screenHeight),
              // Place this last to bring it on top
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
            'Settings',
            style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 21),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const SizedBox(width: 52),
        ],
      ),
    );
  }

  Widget _buildContentContainer(double screenHeight) {
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
        child: Column(
          children: [
            const SizedBox(height: 32),
            _firstTile('Phone Number', '406 765 43 92'),
            _firstTile('Favourite Address', 'Marbella'),
            _firstTile('Language', 'English'),
            const SizedBox(height: 16),
            _settingsTile('Payment', controller.isNotificationSwitchOn),
            _settingsTile('Traffic', controller.isTrafficSwitchOn),
          ],
        ),
      ),
    );
  }

  Widget _firstTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: ListTile(
          title: Text(
            title,
            style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 21),
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.BUTTON_COLOR.withOpacity(0.5),
              )),
        ),
      ),
    );
  }

  Widget _settingsTile(String title, RxBool switchValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        child: ListTile(
          title: Text(
            title,
            style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
          ),
          trailing: Obx(
            () => Switch(
              value: switchValue.value,
              onChanged: (bool value) {
                switchValue.value = value;
              },
              activeColor: Colors.white,
              activeTrackColor: const Color.fromARGB(255, 118, 214, 166),
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
