import 'package:get/get.dart';

import 'group_split_controller.dart';

class GroupSplitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupSplitController>(
      () => GroupSplitController(),
    );
  }
}
