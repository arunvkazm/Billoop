import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text.dart';
import 'confirm_spilt_controller.dart';

class ConfirmSpiltView extends GetView<ConfirmSpiltController> {
  const ConfirmSpiltView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Who paid"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: 1,
              backgroundColor: Colors.grey[300],
              color: secondaryClr,
            ),
            Expanded(child: _equalSplitView()),

            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: outlineClr.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: CommonText.semiBold(
                "Total: ₹ ${controller.equalShare.toStringAsFixed(2)}",
                size: 15,
              ),
            ),


          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
        child: Row(
          children: [
            Expanded(
              child: CommonButton.outline(
                onPressed: () {
                  Get.back();
                },
                text: "Back",
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CommonButton(
                onPressed: () {
                  //Get.toNamed(Routes.CONFIRM_SPILT);
                },
                text: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _equalSplitView() {
    return ListView(
      children:
          controller.members.map((member) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              title: CommonText.semiBold(member, size: 14),
              trailing: CommonText.medium(
                "₹ ${controller.equalShare.toStringAsFixed(2)}",
              ),
            );
          }).toList(),
    );
  }
}
