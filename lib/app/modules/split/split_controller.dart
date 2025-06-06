import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/data/model/split_bill_item.dart';

class SplitController extends GetxController {
  TextEditingController groupController = TextEditingController();
  final groupName = ''.obs;
  final currency = '₹'.obs;
  final mode = BillEntryMode.manual.obs;
  final splitEqually = true.obs;

  var from = "";

  final members = <String>[].obs;
  final items = <SplitBillItem>[].obs;

  double get totalAmount => items.fold(0, (sum, item) => sum + item.total);

  double get equalShare => members.isEmpty ? 0 : totalAmount / members.length;

  Map<String, double> get memberWiseSplit {
    final map = <String, double>{};
    for (final member in members) {
      double total = 0;
      for (final item in items) {
        if (item.assignedMembers.contains(member)) {
          total += item.total / item.assignedMembers.length;
        }
      }
      map[member] = total;
    }
    return map;
  }

  void loadFromScanner(
    List<SplitBillItem> scannedItems,
    List<String> memberList,
  ) {
    mode.value = BillEntryMode.scanner;
    splitEqually.value = false;
    members.assignAll(memberList);
    items.assignAll(scannedItems);
  }

  void loadManual(double amount, List<String> memberList) {
    mode.value = BillEntryMode.manual;
    splitEqually.value = true;
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

  @override
  void onInit() {
    from = Get.arguments["from"];
    if (from == "scan") {
      loadFromScanner(
        [
          SplitBillItem(
            name: 'Pizza',
            quantity: 2,
            pricePerUnit: 12,
            assignedMembers: ['Anastasia'],
          ),
          SplitBillItem(
            name: 'Drink',
            quantity: 1,
            pricePerUnit: 6,
            assignedMembers: ['Karina', 'Tania'],
          ),
        ],
        ['Anastasia', 'Karina', 'Tania', 'Olia'],
      );
    } else {
      loadManual(120.0, ['Anastasia', 'Karina', 'Tania', 'Olia']);
    }
    super.onInit();
  }
}

enum BillEntryMode { scanner, manual }
