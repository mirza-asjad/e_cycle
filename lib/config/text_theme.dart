import 'package:e_cycle/config/app_text_style.dart';
import 'package:flutter/material.dart';

/// Styles class holding app text theming information
class TextThemes {
  /// Main text theme
  static TextTheme get textTheme {
    return const TextTheme(
      labelLarge: AppTextStyles.labelMediumBold, // Updated
      labelMedium: AppTextStyles.labelMediumRegular, // Updated
      labelSmall: AppTextStyles.labelSmallBold, // Updated
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      displaySmall: AppTextStyles.displaySmall,
    );
  }

  /// Dark text theme
  static TextTheme get darkTextTheme {
    return const TextTheme(
      labelLarge: AppTextStyles.labelMediumBold, // Updated
      labelMedium: AppTextStyles.labelMediumRegular, // Updated
      labelSmall: AppTextStyles.labelSmallBold, // Updated
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      displaySmall: AppTextStyles.displaySmall,
    );
  }

  /// Light text theme
  static TextTheme get lightTextTheme {
    return const TextTheme(
      labelLarge: AppTextStyles.labelMediumBold, // Updated
      labelMedium: AppTextStyles.labelMediumRegular, // Updated
      labelSmall: AppTextStyles.labelSmallBold, // Updated
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      displaySmall: AppTextStyles.displaySmall,
    );
  }
}
