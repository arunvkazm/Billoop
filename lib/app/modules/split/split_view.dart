import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/routes/app_pages.dart';
import 'package:spiltify/app/widgets/common_app_bar.dart';
import 'package:spiltify/app/widgets/common_button.dart';

import '../../theme/app_colors.dart';
import '../../widgets/common_text.dart';
import 'split_controller.dart';

class SplitView extends GetView<SplitController> {
  const SplitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "How we split"),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.grey[300],
                color: secondaryClr,
              ),
              SizedBox(height: 16),
              _buildGroupName(context),
              const SizedBox(height: 12),
              Expanded(child: _equalSplitView()),
            ],
          ),
        );
      }),
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
                  Get.toNamed(Routes.CONFIRM_SPILT);
                },
                text: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _splitToggle() {
    if (controller.mode.value == BillEntryMode.manual) return const SizedBox();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Split equally among everyone"),
        Switch(
          value: controller.splitEqually.value,
          onChanged: (val) => controller.splitEqually.value = val,
        ),
      ],
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

  Widget _manualSplitView() {
    return ListView(
      children:
          controller.items.map((item) {
            return Card(
              child: ListTile(
                title: Text("${item.name} (${item.quantity}×)"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      item.assignedMembers.map((m) => Text("- $m")).toList(),
                ),
                trailing: Text(
                  "${item.total.toStringAsFixed(2)} ${controller.currency.value}",
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildGroupName(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: outlineClr.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CommonText.medium("Group 1", size: 14),
      ),
    );
  }

  Widget _buildSwitch(bool value, Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:
              value
                  ? const LinearGradient(
                    colors: [primaryClr, primaryClr],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                  : LinearGradient(
                    colors: [Colors.grey[300]!, Colors.grey[500]!],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
