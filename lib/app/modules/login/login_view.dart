import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spiltify/app/extensions/keyboard_extension.dart';
import 'package:spiltify/app/routes/app_pages.dart';
import 'package:spiltify/app/theme/app_colors.dart';
import 'package:spiltify/app/widgets/common_button.dart';
import 'package:spiltify/app/widgets/common_text.dart';
import 'package:spiltify/app/widgets/common_text_input_field.dart';

import '../../gen/assets.gen.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.hideKeyboard();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                CommonText.semiBold("SPLITTY", size: 32, color: onSurfaceClr),
                SizedBox(height: 40),
                CommonTextField(
                  controller: controller.emailController,
                  hintText: "arunvkazm@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                ),
                SizedBox(height: 20),
                CommonButton(
                  onPressed: () {
                    Get.toNamed(Routes.OTP_VERIFICATION);
                  },
                  text: "Log in",
                ),
                SizedBox(height: 20),
                Divider(color: Colors.white24),
                SizedBox(height: 10),
                CommonButton(
                  gradientColors: [
                    outlineClr.withValues(alpha: 0.3),
                    outlineClr.withValues(alpha: 0.3),
                  ],
                  onPressed: () {},
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svgGoogle.svg(width: 28, height: 28),
                      CommonText.medium(
                        "Log in with Gmail",
                        color: onSurfaceClr,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CommonText.regular(
                  "By registering you accept the terms of the privacy policy and the terms and conditions.",
                  color: onSurfaceClr.withValues(alpha: 0.8),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
