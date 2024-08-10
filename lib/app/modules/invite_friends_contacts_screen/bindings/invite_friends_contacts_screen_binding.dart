import 'package:get/get.dart';

import '../controllers/invite_friends_contacts_screen_controller.dart';

class InviteFriendsContactsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InviteFriendsContactsScreenController>(
      () => InviteFriendsContactsScreenController(),
    );
  }
}
