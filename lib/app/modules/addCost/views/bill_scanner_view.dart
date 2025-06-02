import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/modules/addCost/add_cost_controller.dart';

class BillScannerView extends GetView<AddCostController> {
  const BillScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BillScannerView'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => Column(
          children: [
            ElevatedButton(
              onPressed: controller.scanReceipt,
              child: Text('Scan Receipt'),
            ),
            SizedBox(height: 20),
            controller.isLoading.value
                ? CircularProgressIndicator()
                : Expanded(
              child: SingleChildScrollView(
                child: Text(controller.scannedText.value),
              ),
            ),
          ],
        )),
      ),
    );
  }
}