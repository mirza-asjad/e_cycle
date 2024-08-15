import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/invite_friends_contacts_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';

import 'package:e_cycle/config/app_images.dart';

class InviteFriendsContactsScreenView
    extends GetView<InviteFriendsContactsScreenController> {
  const InviteFriendsContactsScreenView({super.key});

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
            'Invite Contacts',
            style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 21),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const SizedBox(width: 52),
        ],
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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            _buildContactSection('A', [
              _buildContactTile('Asjad', AppImages.PATTERN),
              _buildContactTile('Awais', AppImages.PATTERN),
            ]),
            Divider(color: Colors.grey.withOpacity(0.3)),
            _buildContactSection('B', [
              _buildContactTile('Bashart', AppImages.PATTERN),
              // Add more contact tiles as needed
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildContactSection(String heading, List<Widget> contactTiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 26, left: 10),
          child: Text(
            heading,
            style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 21),
          ),
        ),
        const SizedBox(height: 12), // Add spacing between heading and contacts
        ...contactTiles,
      ],
    );
  }

  Widget _buildContactTile(String name, String imagePath) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        radius: 32, // Adjusted radius to 64x64 size
      ),
      title: Text(
        name,
        style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 18),
      ),
      trailing: GestureDetector(
        onTap: () {
          // Define the action for the 'Send' button
        },
        child: Container(
          height: 32,
          width: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF2AF598), // Example gradient color 1
                Color(0xFF009EFD), // Example gradient color 2
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            'Send',
            style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
