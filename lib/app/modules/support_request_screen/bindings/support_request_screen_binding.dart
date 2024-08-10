import 'package:get/get.dart';

import '../controllers/support_request_screen_controller.dart';

class SupportRequestScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportRequestScreenController>(
      () => SupportRequestScreenController(),
    );
  }
}
