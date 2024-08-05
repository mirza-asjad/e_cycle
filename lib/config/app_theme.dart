import 'package:e_cycle/config/app_colors.dart';
import 'package:e_cycle/config/text_theme.dart';
import 'package:flutter/material.dart';

/// Font family string
const String fontFamily = 'Montserrat';

/// Styles class holding app theming information
class AppThemes {
  /// Dark theme data of the app
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.lightTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(
            allowEnterRouteSnapshotting: false,
          ),
        },
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.ORANGE_COLOR,
      useMaterial3: true,
      //dialogBackgroundColor: AppColors.whiteColor,
      //scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.lightTextTheme,
      colorScheme: const ColorScheme.light(
          //primary: AppColors.primaryColor,
          //secondary: AppColors.primaryLightColor,
          ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        //backgroundColor: AppColors.whiteColor,
        scrolledUnderElevation: 0.0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(
            allowEnterRouteSnapshotting: false,
          ),
        },
      ),
    );
  }
}
