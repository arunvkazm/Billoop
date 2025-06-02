import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'common_image.dart';
import 'common_text.dart';

Widget buildGradientIcon(Widget icon, bool isFocused) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors:
            isFocused
                ? [gradClr1, gradClr2] // Gradient when focused
                : [Colors.grey, Colors.grey], // Default color when not focused
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(bounds);
    },
    blendMode: BlendMode.srcIn,
    child: icon,
  );
}

Widget _buildActionButton({
  required String text,
  required String icon,
  required VoidCallback onPressed,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: surfaceClr.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: surfaceClr, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage.svg(icon, color: surfaceClr),
          const SizedBox(width: 10),
          CommonText.regular(text, size: 12, color: surfaceClr),
        ],
      ),
    ),
  );
}

Widget buildGradientText(String text) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return const LinearGradient(
        colors: [gradClr1, gradClr2],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 1.0],
      ).createShader(bounds);
    },
    child: CommonText.semiBold(
      text,
      color: surfaceClr,
      textAlign: TextAlign.center,
      size: 12,
    ),
  );
}

Widget socialLoginButton({
  required String svgIcon,
  required VoidCallback onPressed,
  double iconSize = 24,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: IconButton(
      onPressed: onPressed,
      icon: CommonImage.svg(svgIcon, width: iconSize, height: iconSize),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(surfaceClr),
        padding: WidgetStateProperty.all(EdgeInsets.all(16)),
        shape: WidgetStateProperty.all(
          CircleBorder(
            side: BorderSide(
              color: outlineClr.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildTermConditionView({required BuildContext context}) {
  return Text.rich(
    TextSpan(
      text: 'By Continuing Sign Up agree to the following',
      style: GoogleFonts.spaceGrotesk(
        color: outlineClr,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      children: [
        TextSpan(
          text: ' Terms & Conditions',
          style: GoogleFonts.spaceGrotesk(
            color: onSurfaceClr,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: ' without Reservation ',
          style: GoogleFonts.spaceGrotesk(
            color: outlineClr,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
