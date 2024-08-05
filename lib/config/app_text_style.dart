import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle extraTitleLarge = TextStyle(
      fontSize: 32,
      fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
      color: AppColors.BUTTON_COLOR,
      fontWeight: FontWeight.bold);
  static const TextStyle titleLarge = TextStyle(
      color: AppColors.BUTTON_COLOR,
      fontSize: 21,
      fontFamily: AppFonts.MONTSERRAT_REGULAR,
      fontWeight: FontWeight.normal);
  static const TextStyle titleMedium = TextStyle(
      fontSize: 18,
      fontFamily: AppFonts.MONTSERRAT_REGULAR,
      fontWeight: FontWeight.normal);

  static const TextStyle labelLarge = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.MONTSERRAT_REGULAR,
      color: AppColors.BUTTON_COLOR);

  static const TextStyle labelsmallLarge = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.MONTSERRAT_REGULAR,
      color: AppColors.BUTTON_COLOR);
  static const TextStyle labelLargeBold = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.MONTSERRAT_EXTRABOLD,
      color: AppColors.BUTTON_COLOR);
  static const TextStyle labelMedium =
      TextStyle(fontSize: 13, fontFamily: AppFonts.MONTSERRAT_REGULAR);
  static const TextStyle labelSmall =
      TextStyle(fontSize: 13, fontFamily: AppFonts.MONTSERRAT_BOLD);

  static const TextStyle displaySmall =
      TextStyle(fontSize: 11, fontFamily: AppFonts.MONTSERRAT_SEMIBOLD);
}
