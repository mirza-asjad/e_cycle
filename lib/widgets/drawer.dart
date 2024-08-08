import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:e_cycle/config/app_images.dart';
import 'package:get/get.dart'; // Import GetX for routing

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Gradient section (30% of the height)
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(86)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2AF598), // Green at the top
                  Color(0xFF009EFD), // Blue at the bottom
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                      image: AssetImage(AppImages
                          .ONBOARDING_UNLOCK), // Replace with your image
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Space between image and text
                const Text(
                  'John Doe',
                  style: TextStyle(
                    color: AppColors.BUTTON_COLOR,
                    fontFamily: AppFonts.MONTSERRAT_REGULAR,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          // White section (70% of the height) with border radius on the top-left corner
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    // Drawer items
                    _buildDrawerTile('My Wallet', '\$10.50'),
                    const SizedBox(height: 16), // Space between tiles
                    _buildDrawerTile('My Statics', ''),
                    const SizedBox(height: 16), // Space between tiles
                    _buildDrawerTile('Invite Friends', ''),
                    const SizedBox(height: 16), // Space between tiles
                    _buildDrawerTile('Support', ''),
                    const SizedBox(height: 16), // Space between tiles
                    _buildDrawerTile('Settings', ''),
                    // Add more items if needed

                    // Logout section
                    const Spacer(), // Pushes the logout button to the bottom
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Container(
                        width: 296,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            AppImages
                                .LOGOUT_ICON, // Replace with your logout icon image
                            width: 24,
                            height: 24,
                          ),
                          title: const Text(
                            'Logout',
                            style: TextStyle(
                              color: AppColors.BUTTON_COLOR,
                              fontFamily: AppFonts.MONTSERRAT_REGULAR,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          onTap: () {
                            // Handle logout action
                            Get.toNamed(Routes.SPLASH_SCREEN);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerTile(String title, String trailingText) {
    return Container(
      width: 296,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.BUTTON_COLOR,
            fontFamily: AppFonts.MONTSERRAT_REGULAR,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
        trailing: trailingText.isNotEmpty
            ? Text(
                trailingText,
                style: TextStyle(
                    color: AppColors.BUTTON_COLOR,
                    fontFamily: AppFonts.MONTSERRAT_REGULAR,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            : null,
        onTap: () {
          // Handle navigation
        },
      ),
    );
  }
}
