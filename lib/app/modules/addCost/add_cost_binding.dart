import 'package:get/get.dart';

import 'add_cost_controller.dart';

class AddCostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCostController>(
      () => AddCostController(),
    );
  }
}
