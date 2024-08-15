import 'package:e_cycle/app/routes/app_pages.dart';
import 'package:e_cycle/config/app_images.dart';
import 'package:e_cycle/config/app_text_style.dart';
import 'package:e_cycle/widgets/customized_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2AF598), // Green at the top
              Color(0xFF009EFD), // Blue at the bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            const SizedBox(
              height: 50,
            ),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildGreetingText(),
            const SizedBox(height: 30),
            _buildWeatherCard(),
            const SizedBox(height: 20),
            _buildNearbySection(),
            const SizedBox(height: 20),
            _buildCardList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 99,
          height: 99,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white, // Background color for the circle
            image: const DecorationImage(
              image: AssetImage(
                  AppImages.ONBOARDING_UNLOCK), // Replace with your image
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white, // Border color
              width: 4, // Border width
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.SEARCH_SCREEN),
          child: Hero(
            tag: 'searchIconHero',
            child: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(AppImages.SEARCH_ICON),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGreetingText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello John,',
          style: AppTextStyles.labelMediumSemiBold.copyWith(fontSize: 32),
        ),
        Text(
          'Wanna take a ride today?',
          style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildWeatherCard() {
    return Card(
      color: const Color(0xB2FFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.25),
      child: SizedBox(
        height: 190,
        width: double.infinity,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 48),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.CLOUDS_IMAGE,
                    width: 125,
                    height: 95,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '18°',
                              style: AppTextStyles.labelMediumRegular.copyWith(
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              ' Cloudy',
                              style: AppTextStyles.labelMediumRegular.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Marbella Dr',
                          style: AppTextStyles.labelMediumRegular.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFFD1FFEF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text(
                    '28 September, Wednesday',
                    style: AppTextStyles.labelMediumRegular.copyWith(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Near You',
          style: AppTextStyles.labelMediumSemiBold.copyWith(
            fontSize: 21,
          ),
        ),
        Row(
          children: [
            Text(
              'Browse Map',
              style: AppTextStyles.labelMediumRegular.copyWith(
                fontSize: 18,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ],
    );
  }

  Widget _buildCardList() {
    return SizedBox(
      height: 384,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Number of cards
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 16),
            width: 322,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    AppImages.CYCLE_IMAGE, // Replace with actual image
                    width: 232,
                    height: 132,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Action for 'Distance 150 M'
                          },
                          child: Container(
                            height: 56, // Set the height of the button
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF2AF598), // Green at the top
                                  Color(0xFF009EFD), // Blue at the bottom
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(
                                  24), // Set border radius
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Distance ',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.labelMediumRegular
                                        .copyWith(
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    '150 M',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.labelMediumSemiBold
                                        .copyWith(
                                      fontSize: 21,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 10), // Space between button and text
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16), // Match padding of button
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Haibike Sduro FullSeven',
                                style: AppTextStyles.labelSmallRegular
                                    .copyWith(fontSize: 16),
                              ),
                              SizedBox(height: 4), // Space between lines
                              Text(
                                '2 Available',
                                style:
                                    AppTextStyles.labelMediumSemiBold.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
