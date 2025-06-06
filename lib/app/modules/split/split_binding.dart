import 'package:get/get.dart';

import 'split_controller.dart';

class SplitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplitController>(
      () => SplitController(),
    );
  }
}
