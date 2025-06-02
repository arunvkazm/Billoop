import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:spiltify/app/routes/app_pages.dart';
import 'package:spiltify/app/widgets/common_app_bar.dart';
import 'package:spiltify/app/widgets/common_text.dart';

import '../../theme/app_colors.dart';
import 'otp_verification_controller.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: null),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonText.semiBold(
              "Enter the code",
              size: 32,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            CommonText.medium(
              "We have just sent a code to your email:",
              textAlign: TextAlign.center,
              size: 16,
            ),
            CommonText.bold("arunvkazm@gmail.com", size: 14),
            SizedBox(height: 40),
            Center(
              child: Pinput(
                controller: controller.otpController,
                focusNode: controller.otpFocus,
                length: 4,
                defaultPinTheme: PinTheme(
                  height: 56,
                  width: 56,
                  textStyle: GoogleFonts.spaceGrotesk(
                    fontSize: 16,
                    color: onSurfaceClr,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: BoxDecoration(
                    color: surfaceClr,
                    border: Border.all(
                      color: outlineClr.withValues(alpha: 0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                focusedPinTheme: PinTheme(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: surfaceClr,
                    border: Border.all(color: primaryClr),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onCompleted: (val){
                  Get.toNamed(Routes.HOME);
                },
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: CommonText.medium("Resend the code", size: 14,isUnderLine: true,underLineClr: primaryClr)
            ),
          ],
        ),
      ),
    );
  }
}
