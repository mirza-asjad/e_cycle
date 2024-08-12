import 'package:get/get.dart';

import '../controllers/messages_screen_controller.dart';

class MessagesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesScreenController>(
      () => MessagesScreenController(),
    );
  }
}
