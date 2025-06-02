import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/extensions/extensions.dart';
import 'package:spiltify/app/gen/assets.gen.dart';
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
            const SizedBox(height: 64),
            Assets.svgOnboard2.svg(height: context.height * 0.18),
            const SizedBox(height: 10),
            CommonText.regular("Click the button below to add costs"),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 8),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Transform.rotate(
                  angle: 70 * 3.14 / 120,
                  child: Assets.svgCurlyArrow.svg(height: context.height * 0.1),
                ),
              ),
            ),
            const Spacer(),
            CommonButton(onPressed: () {}, text: "Add Cost"),
            SizedBox(height: context.mediaQueryPadding.bottom + 10),
          ],
        ),
      ),
    );
  }
}
