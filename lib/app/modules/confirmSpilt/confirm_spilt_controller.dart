import 'package:get/get.dart';

import '../../data/model/split_bill_item.dart';

class ConfirmSpiltController extends GetxController {
  final members = <String>[].obs;
  final items = <SplitBillItem>[].obs;

  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);
  double get equalShare => members.isEmpty ? 0 : totalAmount / members.length;

  final count = 0.obs;
  @override
  void onInit() {
    loadManual(120.0, ['Anastasia', 'Karina', 'Tania', 'Olia']);
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

  void loadManual(double amount, List<String> memberList) {
    members.assignAll(memberList);
    items.assignAll([
      SplitBillItem(
        name: 'Manual Entry',
        quantity: 1,
        pricePerUnit: amount,
        assignedMembers: List.from(memberList),
      ),
    ]);
  }
}
