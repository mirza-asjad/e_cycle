import 'package:flutter/material.dart';
import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.BUTTON_COLOR,
          fontFamily: AppFonts.MONTSERRAT_REGULAR,
          fontSize: 18,
        ),
        border: InputBorder.none,
      ),
      style: const TextStyle(
        color: AppColors.BUTTON_COLOR,
        fontFamily: AppFonts.MONTSERRAT_REGULAR,
        fontSize: 16,
      ),
    );
  }
}
