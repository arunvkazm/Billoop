import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/routes/app_pages.dart';
import 'package:spiltify/app/theme/app_colors.dart';
import 'package:spiltify/app/widgets/common_app_bar.dart';
import 'package:spiltify/app/widgets/common_button.dart';
import 'package:spiltify/app/widgets/common_text.dart';
import 'package:spiltify/app/widgets/common_text_input_field.dart';

import 'add_cost_controller.dart';

class AddCostView extends GetView<AddCostController> {
  const AddCostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Add Cost", centerTitle: true),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(16),
          child:
              controller.isManual.value
                  ? _buildManualView(context)
                  : _buildScannedView(context),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: context.mediaQueryPadding.bottom + 24,
          left: 16,
          right: 16,
        ),
        child: CommonButton(
          onPressed: () {
            var from = controller.isManual.value ? "custom" : "scan";
            Get.toNamed(Routes.GROUP_SPLIT, arguments: {"from": from});
          },
          text: "Next",
        ),
      ),
    );
  }

  Widget _buildManualView(BuildContext context) {
    return Column(
      children: [
        CommonTextField(
          controller: controller.descController,
          hintText: "Description",
          bgColor: Colors.grey.shade100,
          borderWidth: 0,
          keyboardType: TextInputType.text,
          prefixIcon: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.shopping_bag_outlined, color: primaryClr),
          ),
        ).marginOnly(bottom: 8),
        CommonTextField(
          controller: controller.costController,
          hintText: "₹ ${controller.amount.value}",
          bgColor: Colors.grey.shade100,
          borderWidth: 0,
          borderColor: Colors.grey.shade100,
          keyboardType: TextInputType.number,
          prefixIcon: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.money, color: primaryClr),
          ),
        ).marginOnly(bottom: 8),
        CommonTextField(
          controller: controller.dateController,
          hintText: controller.selectedDate.value.toString().substring(0, 16),
          bgColor: Colors.grey.shade100,
          borderWidth: 0,
          isReadOnly: true,
          keyboardType: TextInputType.none,
          onTap: () {
            controller.pickDate(context);
          },
          prefixIcon: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.calendar_today, color: primaryClr),
          ),
        ).marginOnly(bottom: 8),

        Spacer(),

        CommonButton(
          onPressed: () {
            controller.isManual.value = false;
            Get.toNamed(Routes.BILL_SCANNER);
          },
          gradientColors: [
            outlineClr.withValues(alpha: 0.3),
            outlineClr.withValues(alpha: 0.3),
          ],
          mPadding: 18,
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, size: 24, color: primaryClr),
              CommonText.medium("Scan the bill", size: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScannedView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText.semiBold("New bill", size: 18),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: controller.billItems.length,
            itemBuilder: (_, index) {
              final item = controller.billItems[index];
              return ListTile(
                title: CommonText.medium(item.name, size: 14),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () => controller.updateQuantity(index, -1),
                    ),
                    SizedBox(
                      width: 30, // fixed width for quantity
                      child: Center(
                        child: CommonText.medium("${item.quantity}"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => controller.updateQuantity(index, 1),
                    ),
                    SizedBox(width: 8),
                    CommonText.medium(
                      "₹ ${(item.total).toStringAsFixed(2)}",
                      size: 13,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        CommonText.semiBold(
          "Total: ₹ ${controller.total.toStringAsFixed(2)}",
          size: 15,
        ),
        SizedBox(height: 8),
        CommonTextField(
          controller: controller.dateController,
          hintText: controller.selectedDate.value.toString().substring(0, 16),
          bgColor: Colors.grey.shade100,
          borderWidth: 0,
          isReadOnly: true,
          keyboardType: TextInputType.none,
          onTap: () {
            controller.pickDate(context);
          },
          prefixIcon: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.calendar_today, color: primaryClr),
          ),
        ),
        const SizedBox(height: 12),
        TextButton.icon(
          onPressed: () => controller.isManual.value = true,
          icon: Icon(Icons.edit, color: primaryClr),
          label: CommonText.medium("Add costs manually", size: 16),
        ),
      ],
    );
  }
}
