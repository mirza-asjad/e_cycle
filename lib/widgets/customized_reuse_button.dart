
import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';

class ReuseButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ReuseButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Make the button span the full width
      height: 70, // Set the height of the button
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2AF598), Color(0xFF009EFD)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(35), // Rounded corners
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors
              .transparent, // Make button background transparent to show gradient
          shadowColor: Colors.transparent, // Remove shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35), // Match border radius
          ),
        ),
        child: Text(text,
            style: AppTextStyles.labelMediumRegular.copyWith(fontSize: 21)),
      ),
    );
  }
}
