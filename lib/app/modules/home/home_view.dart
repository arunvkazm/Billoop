import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spiltify/app/extensions/extensions.dart';
import 'package:spiltify/app/gen/assets.gen.dart';
import 'package:spiltify/app/routes/app_pages.dart';
import 'package:spiltify/app/theme/app_colors.dart';
import 'package:spiltify/app/widgets/common_button.dart';
import 'package:spiltify/app/widgets/common_text.dart';

import '../../widgets/common_image.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {},
            icon: Assets.svgNotification.svg(
              width: 24,
              height: 24,
              colorFilter: primaryClr.toSvgColor(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
              ),
              child: Container(
                width: 56,
                height: 56,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CommonImage.network(
                  "https://avatar.iran.liara.run/public/boy?username=Ash",
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Row(
              spacing: 8,
              children: [
                Flexible(
                  child: DropdownButtonFormField<String>(
                    hint: CommonText.regular(
                      "Select Group",
                      color: outlineClr.withValues(alpha: 0.6),
                      size: 13,
                    ),
                    value: null,
                    dropdownColor: surfaceClr,
                    focusNode: controller.groupFocus,
                    padding: const EdgeInsets.symmetric(vertical: 2.5),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryClr,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryClr,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: outlineClr.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: errorClr.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: errorClr, width: 1),
                      ),

                      contentPadding: const EdgeInsets.all(14),
                    ),
                    onChanged: (val) {
                      controller.groupController.text = val ?? "";
                    },
                    isExpanded: true,
                    items: List<DropdownMenuItem<String>>.generate(
                      controller.groupList.length,
                      (index) {
                        return DropdownMenuItem<String>(
                          value: controller.groupList[index],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: CommonText.medium(
                              controller.groupList[index],
                              color: onSurfaceClr,
                              size: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // FloatingActionButton(
                //   onPressed: () {},
                //   elevation: 0,
                //   shape: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(8),
                //     borderSide: BorderSide(
                //       color: outlineClr.withValues(alpha: 0.3),
                //     ),
                //   ),
                //   backgroundColor: surfaceClr,
                //   child: Icon(Icons.add, color: primaryClr),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () => Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: secondaryClr,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText.medium("I'm owed", size: 18),
                        CommonText.bold(
                          "₹ ${controller.owed.toStringAsFixed(2)}",
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText.medium("My costs", size: 18),
                              CommonText.bold(
                                "₹ ${controller.myCosts.toStringAsFixed(2)}",
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: primaryClr, width: 0.5),
                          ),
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText.medium("Total costs", size: 18),
                              CommonText.bold(
                                "₹ ${controller.totalCosts.toStringAsFixed(2)}",
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 64),
            const SizedBox(height: 24),
            // _buildMembersRow(),
            // const SizedBox(height: 12),
            _buildTabBar(),
           // Assets.svgOnboard2.svg(height: context.height * 0.18),
           // const SizedBox(height: 10),
           // CommonText.regular("Click the button below to add costs"),
           //  Padding(
           //    padding: const EdgeInsets.only(left: 40.0, top: 8),
           //    child: Align(
           //      alignment: AlignmentDirectional.centerStart,
           //      child: Transform.rotate(
           //        angle: 70 * 3.14 / 120,
           //        child: Assets.svgCurlyArrow.svg(height: context.height * 0.1),
           //      ),
           //    ),
           //  ),
           // const Spacer(),
            Expanded(child: _buildTabContent()),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: context.mediaQueryPadding.bottom,
          left: 16,
          right: 16,
        ),
        child: CommonButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_COST);
          },
          text: "Add Cost",
        ),
      ),
    );
  }

  Widget _buildMembersRow() {
    return Obx(
      () => Row(
        children:
            controller.members.map((m) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CommonImage.network(m.avatar,width: 32,height: 32,),
              );
            }).toList(),
      ),
    );
  }
  Widget _buildTabBar() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: SummaryTab.values.map((tab) {
        final isSelected = controller.selectedTab.value == tab;
        return GestureDetector(
          onTap: () => controller.changeTab(tab),
          child: Column(
            children: [
              Text(
                tab.name.capitalizeFirst!,
                style: GoogleFonts.lato(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              if (isSelected) Container(height: 2, width: 24, color: Colors.black),
            ],
          ),
        );
      }).toList(),
    ));
  }
  Widget _buildTabContent() {
    switch (controller.selectedTab.value) {
      case SummaryTab.debts:
        return _buildDebtsList();
      case SummaryTab.balance:
        return _buildBalanceList();
      case SummaryTab.transactions:
        return _buildTransactionsList();
    }
  }
  Widget _buildDebtsList() {
    return ListView(
      children: [
        _debtTile("Karina", "Anastasia", 45.0),
        _debtTile("Tania", "Anastasia", 45.0),
        _debtTile("Roma", "Anastasia", 45.0),
      ],
    );
  }

  Widget _debtTile(String from, String to, double amount) {
    return ListTile(
      title: CommonText.semiBold("$from → $to",size: 15),
      trailing: CommonText.medium("₹ ${amount.toStringAsFixed(2)}",size: 13),
    );
  }
  Widget _buildBalanceList() {
    return Obx(() => ListView(
      padding: const EdgeInsets.all(16),
      children: controller.members.map((m) {
        return ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(m.avatar)),
          title: Text(m.name),
          subtitle: Text("Spent: €${m.spent.toStringAsFixed(2)}"),
          trailing: Text(
            "Balance: €${m.balance.toStringAsFixed(2)}",
            style: TextStyle(
              color: m.balance >= 0 ? Colors.green : Colors.red,
            ),
          ),
        );
      }).toList(),
    ));
  }

  Widget _buildTransactionsList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text("Restaurant"),
          subtitle: Text("09.02.2023, 18:00"),
          trailing: Text("€270.00"),
        ),
        ListTile(
          leading: Icon(Icons.restaurant),
          title: Text("Restaurant \"House\""),
          subtitle: Text("20.02.2023, 18:00"),
          trailing: Text("€430.00"),
        ),
      ],
    );
  }
}
