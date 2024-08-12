import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/messages_screen_controller.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';

class MessagesScreenView extends GetView<MessagesScreenController> {
  const MessagesScreenView({Key? key}) : super(key: key);

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
            'Messages',
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
        child: Column(
          children: [
            // Placeholder for message list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                children: [
                  _buildMessageBubble(
                      "Hi, there is a problem related to the cycle charges. Charges that i paid are more than what asked, i want the extra payment back. Help me for this",
                      "10:30 AM",
                      true),
                  _buildMessageBubble(
                      "Thankyou for contact! Provide location and cycle information with payment receipt",
                      "10:32 AM",
                      false),
                  _buildMessageBubble(
                      "Here are my attached details", "10:39 AM", true),
                  _buildMessageBubble("Ok! Let me check.", "10:52 AM", false),
                  // Add more messages here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message, String time, bool isSentByUser) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 250, // Adjust the max width as needed
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isSentByUser
              ? const LinearGradient(
                  colors: [
                    Color(0xFF2AF598),
                    Color(0xFF009EFD),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: isSentByUser ? null : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isSentByUser ? Colors.white : Colors.black,
                fontFamily: AppFonts.MONTSERRAT_REGULAR,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: TextStyle(
                  color: isSentByUser
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black.withOpacity(0.7),
                  fontFamily: AppFonts.MONTSERRAT_REGULAR,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
