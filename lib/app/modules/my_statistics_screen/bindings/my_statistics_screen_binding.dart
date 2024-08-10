import 'package:get/get.dart';

import '../controllers/my_statistics_screen_controller.dart';

class MyStatisticsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyStatisticsScreenController>(
      () => MyStatisticsScreenController(),
    );
  }
}
