import 'package:get/get.dart';

class HomeController extends GetxController {


  var myCosts = 0.0.obs;
  var totalCosts = 0.0.obs;

  double get owed => totalCosts.value - myCosts.value;

  void addCost(double amount) {
    myCosts.value += amount;
    totalCosts.value += amount;
  }

  final count = 0.obs;
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
