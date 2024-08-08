import 'package:get/get.dart';

import '../modules/auth_screen/bindings/auth_screen_binding.dart';
import '../modules/auth_screen/views/auth_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import '../modules/onboarding_screen/views/onboarding_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/verify_otp_screen/bindings/verify_otp_screen_binding.dart';
import '../modules/verify_otp_screen/views/verify_otp_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING_SCREEN,
      page: () => const OnboardingScreenView(),
      binding: OnboardingScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_SCREEN,
      page: () => const AuthScreenView(),
      binding: AuthScreenBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_OTP_SCREEN,
      page: () => const VerifyOtpScreenView(),
      binding: VerifyOtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () => const HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
  ];
}
