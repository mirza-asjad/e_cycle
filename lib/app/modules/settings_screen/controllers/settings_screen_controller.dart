import 'package:get/get.dart';

class SettingsScreenController extends GetxController {
  //TODO: Implement SettingsScreenController

  final count = 0.obs;

  RxBool isNotificationSwitchOn = false.obs;
  RxBool isTrafficSwitchOn = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
