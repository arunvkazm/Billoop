import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/extensions/extensions.dart';
import 'package:spiltify/app/gen/assets.gen.dart';
import 'package:spiltify/app/routes/app_pages.dart';

import '../../theme/app_colors.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_image.dart';
import '../../widgets/common_text.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CurvedClipper(),
                  child: CommonImage.asset(
                    controller.onboardingData[controller.currentPage.value]["image"]!,
                    width: double.infinity,
                    height: context.height * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            SizedBox(height: context.height * 0.02),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText.semiBold(
                    controller.onboardingData[controller
                        .currentPage
                        .value]["title"]!,
                    size: 23,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: context.height * 0.01),
                  CommonText.regular(
                    controller.onboardingData[controller
                        .currentPage
                        .value]["description"]!,
                    size: 14,
                    color: onSurfaceClr.withValues(alpha: 0.5),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),

            ///Indicator
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  controller.onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    width: controller.currentPage.value == index ? 20 : 12,
                    height: controller.currentPage.value == index ? 12 : 6,
                    decoration: BoxDecoration(
                      color:
                          controller.currentPage.value == index
                              ? Colors.transparent
                              : outlineClr,
                      shape: BoxShape.circle,
                    ),
                    child:
                        controller.currentPage.value == index
                            ? Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 20,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: primaryClr,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            )
                            : null,
                  ),
                ),
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CommonButton(
                    gradientColors: [Colors.white, Colors.white],
                    textClr: onSurfaceClr.withValues(alpha: 0.3),
                    mPadding: 0,
                    onPressed: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    text: "Skip",
                  ).marginOnly(right: 24),
                ),

                Spacer(flex: 2,),

                Flexible(
                  child: CommonButton(
                    onPressed: () {
                      controller.nextPage();
                    },
                    mPadding: 20,

                    child: Assets.svgLeftArrow.svg(
                      colorFilter: surfaceClr.toSvgColor(),
                    ),
                  ).marginSymmetric(horizontal: 12),
                ),
              ],
            ),
            SizedBox(height: context.mediaQueryPadding.bottom + 10),
          ],
        ),
      );
    });
  }
}

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from the top-left corner
    path.lineTo(0, size.height);

    // Create a smooth quadratic curve
    path.quadraticBezierTo(
      size.width * 0.5, // Control point (middle of width)
      size.height, // Peak of the curve
      size.width, // End point (bottom-right corner)
      size.height * 0.75, // Same height as start
    );

    // Continue to top-right corner
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CurvedClipper oldClipper) => false;
}
