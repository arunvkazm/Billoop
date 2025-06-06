import 'package:get/get.dart';

import 'confirm_spilt_controller.dart';

class ConfirmSpiltBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmSpiltController>(
      () => ConfirmSpiltController(),
    );
  }
}
