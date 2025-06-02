import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final Color textClr;
  final double mPadding;
  final double textSize;
  final double borderRadius;

  // Outline-specific parameters
  final bool isOutline;
  final double borderWidth;

  // Default constructor for gradient button
  const CommonButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.gradientColors = const [gradClr1, gradClr1],
    this.textClr = surfaceClr,
    this.mPadding = 14,
    this.textSize = 20,
    this.borderRadius = 10,
    this.isOutline = false,
    this.borderWidth = 1.0,
  }) : assert(
         text != null || child != null,
         "Either text or child must be provided",
       );

  // Named constructor for outline button with gradient border
  const CommonButton.outline({
    super.key,
    required this.onPressed,
    this.text,
    this.textClr = surfaceClr,
    this.child,
    this.mPadding = 14,
    this.textSize = 16,
    this.borderRadius = 10,
    this.borderWidth = 1.0,
    this.gradientColors = const [gradClr1, gradClr1],
  }) : isOutline = true;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter:
          isOutline
              ? GradientBorderPainter(gradientColors, borderRadius, borderWidth)
              : null,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          gradient:
              isOutline
                  ? null
                  : LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.0, 1.0],
                  ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            overlayColor: primaryClr.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.symmetric(vertical: mPadding),
          ),
          child:
              child ??
              (isOutline ? _buildGradientText(text!) : _buildNormalText(text!)),
        ),
      ),
    );
  }

  /// Method to create normal text (for filled button)
  Widget _buildNormalText(String text) {
    return CommonText.medium(text, color: textClr, size: textSize);
  }

  /// Method to create gradient-colored text (for outline button)
  Widget _buildGradientText(String text) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: gradientColors).createShader(bounds);
      },
      child: CommonText.medium(text, color: textClr, size: textSize),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final List<Color> gradientColors;
  final double borderRadius;
  final double borderWidth;

  GradientBorderPainter(
    this.gradientColors,
    this.borderRadius,
    this.borderWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..shader = LinearGradient(
            colors: gradientColors,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke;

    final RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        borderWidth / 2,
        borderWidth / 2,
        size.width - borderWidth,
        size.height - borderWidth,
      ),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
