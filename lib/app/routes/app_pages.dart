import 'package:get/get.dart';

import '../modules/auth_screen/bindings/auth_screen_binding.dart';
import '../modules/auth_screen/views/auth_screen_view.dart';
import '../modules/home_screen/bindings/home_screen_binding.dart';
import '../modules/home_screen/views/home_screen_view.dart';
import '../modules/invite_friends_contacts_screen/bindings/invite_friends_contacts_screen_binding.dart';
import '../modules/invite_friends_contacts_screen/views/invite_friends_contacts_screen_view.dart';
import '../modules/invite_friends_screen/bindings/invite_friends_screen_binding.dart';
import '../modules/invite_friends_screen/views/invite_friends_screen_view.dart';
import '../modules/my_statistics_screen/bindings/my_statistics_screen_binding.dart';
import '../modules/my_statistics_screen/views/my_statistics_screen_view.dart';
import '../modules/my_wallet_screen/bindings/my_wallet_screen_binding.dart';
import '../modules/my_wallet_screen/views/my_wallet_screen_view.dart';
import '../modules/onboarding_screen/bindings/onboarding_screen_binding.dart';
import '../modules/onboarding_screen/views/onboarding_screen_view.dart';
import '../modules/payment_screen/bindings/payment_screen_binding.dart';
import '../modules/payment_screen/views/payment_screen_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';
import '../modules/settings_screen/bindings/settings_screen_binding.dart';
import '../modules/settings_screen/views/settings_screen_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/support_request_screen/bindings/support_request_screen_binding.dart';
import '../modules/support_request_screen/views/support_request_screen_view.dart';
import '../modules/support_screen/bindings/support_screen_binding.dart';
import '../modules/support_screen/views/support_screen_view.dart';
import '../modules/top_up_screen/bindings/top_up_screen_binding.dart';
import '../modules/top_up_screen/views/top_up_screen_view.dart';
import '../modules/verify_otp_screen/bindings/verify_otp_screen_binding.dart';
import '../modules/verify_otp_screen/views/verify_otp_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

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
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_WALLET_SCREEN,
      page: () => const MyWalletScreenView(),
      binding: MyWalletScreenBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SCREEN,
      page: () => const PaymentScreenView(),
      binding: PaymentScreenBinding(),
    ),
    GetPage(
      name: _Paths.TOP_UP_SCREEN,
      page: () => const TopUpScreenView(),
      binding: TopUpScreenBinding(),
    ),
    GetPage(
      name: _Paths.MY_STATISTICS_SCREEN,
      page: () => const MyStatisticsScreenView(),
      binding: MyStatisticsScreenBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_FRIENDS_SCREEN,
      page: () => const InviteFriendsScreenView(),
      binding: InviteFriendsScreenBinding(),
    ),
    GetPage(
      name: _Paths.INVITE_FRIENDS_CONTACTS_SCREEN,
      page: () => const InviteFriendsContactsScreenView(),
      binding: InviteFriendsContactsScreenBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT_SCREEN,
      page: () => const SupportScreenView(),
      binding: SupportScreenBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORT_REQUEST_SCREEN,
      page: () => const SupportRequestScreenView(),
      binding: SupportRequestScreenBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS_SCREEN,
      page: () => const SettingsScreenView(),
      binding: SettingsScreenBinding(),
    ),
  ];
}
