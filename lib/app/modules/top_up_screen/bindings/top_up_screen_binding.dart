import 'package:get/get.dart';

import '../controllers/top_up_screen_controller.dart';

class TopUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopUpScreenController>(
      () => TopUpScreenController(),
    );
  }
}
