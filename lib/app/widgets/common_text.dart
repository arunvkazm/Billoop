import 'package:spiltify/app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final Color color, underLineClr;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isItalic;
  final double? height;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final VoidCallback? onTap;
  final bool isUnderLine;
  final bool isGradientColor;

  const CommonText(
    this.text, {
    this.size = 12,
    this.color = onSurfaceClr,
    this.underLineClr = secondaryClr,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isItalic = false,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
    this.onTap,
    this.isUnderLine = false,
    this.isGradientColor = false,
    super.key,
  });

  factory CommonText.extraBold(
    String text, {
    double size = 12,
    Color color = onSurfaceClr,
    Color underLineClr = secondaryClr,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool isItalic = false,
    double? height,
    double? letterSpacing,
    VoidCallback? onTap,
    bool isUnderLine = false,
    bool isGradientColor = false,
  }) {
    return CommonText(text,
        size: size,
        color: color,
        underLineClr: underLineClr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        isItalic: isItalic,
        height: height,
        letterSpacing: letterSpacing,
        onTap: onTap,
        isUnderLine: isUnderLine,
        isGradientColor: isGradientColor,
        fontWeight: FontWeight.w900);
  }

  factory CommonText.bold(
    String text, {
    double size = 12,
    Color color = onSurfaceClr,
    Color underLineClr = secondaryClr,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
    bool isItalic = false,
    double? height,
    double? letterSpacing,
    VoidCallback? onTap,
    bool isUnderLine = false,
    bool isGradientColor = false,
  }) {
    return CommonText(text,
        size: size,
        color: color,
        underLineClr: underLineClr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        isItalic: isItalic,
        height: height,
        letterSpacing: letterSpacing,
        onTap: onTap,
        isGradientColor: isGradientColor,
        isUnderLine: isUnderLine,
        fontWeight: FontWeight.w700);
  }

  factory CommonText.semiBold(String text,
      {double size = 12,
      Color color = onSurfaceClr,
      Color underLineClr = secondaryClr,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      bool isItalic = false,
      double? height,
      double? letterSpacing,
      VoidCallback? onTap,
      bool isGradientColor = false,
      bool isUnderLine = false}) {
    return CommonText(text,
        size: size,
        color: color,
        underLineClr: underLineClr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        isItalic: isItalic,
        height: height,
        letterSpacing: letterSpacing,
        onTap: onTap,
        isUnderLine: isUnderLine,
        isGradientColor: isGradientColor,
        fontWeight: FontWeight.w600);
  }

  factory CommonText.medium(String text,
      {double size = 12,
      Color color = onSurfaceClr,
      Color underLineClr = secondaryClr,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      bool isItalic = false,
      double? height,
      double? letterSpacing,
      VoidCallback? onTap,
      bool isGradientColor = false,
      bool isUnderLine = false}) {
    return CommonText(text,
        size: size,
        color: color,
        underLineClr: underLineClr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        isItalic: isItalic,
        height: height,
        letterSpacing: letterSpacing,
        onTap: onTap,
        isGradientColor: isGradientColor,
        isUnderLine: isUnderLine,
        fontWeight: FontWeight.w500);
  }

  factory CommonText.regular(String text,
      {double size = 12,
      Color color = onSurfaceClr,
      Color underLineClr = secondaryClr,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      bool isItalic = false,
      double? height = 1.5,
      double? letterSpacing,
      VoidCallback? onTap,
      bool isGradientColor = false,
      bool isUnderLine = false}) {
    return CommonText(text,
        size: size,
        color: color,
        underLineClr: underLineClr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        isItalic: isItalic,
        height: height,
        letterSpacing: letterSpacing,
        onTap: onTap,
        isGradientColor: isGradientColor,
        isUnderLine: isUnderLine,
        fontWeight: FontWeight.w400);
  }

  factory CommonText.light(String text,
      {double size = 12,
      Color color = onSurfaceClr,
      Color underLineClr = secondaryClr,
      TextAlign? textAlign,
      TextOverflow? overflow,
      int? maxLines,
      bool isItalic = false,
      double? height = 1.5,
      double? letterSpacing,
      VoidCallback? onTap,
      bool isGradientColor = false,
      bool isUnderLine = false}) {
    return CommonText(text,
        size: size,
        color: color,
        underLineClr: underLineClr,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        isItalic: isItalic,
        height: height,
        letterSpacing: letterSpacing,
        onTap: onTap,
        isUnderLine: isUnderLine,
        isGradientColor: isGradientColor,
        fontWeight: FontWeight.w300);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: isGradientColor
          ? ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  gradClr1,
                  gradClr2
                ], // Gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text(
                text,
                textAlign: textAlign,
                overflow: overflow,
                maxLines: maxLines,
                style: GoogleFonts.spaceGrotesk(
                  fontSize: size.sp(context),
                  fontStyle: isItalic ? FontStyle.italic : null,
                  fontWeight: fontWeight,
                  height: height,
                  letterSpacing: letterSpacing,
                  decoration: isUnderLine ? TextDecoration.underline : null,
                  decorationThickness: 1,
                  decorationColor: underLineClr,
                  color: Colors.white, // Must be white for ShaderMask effect
                ),
              ),
            )
          : Text(
              text,
              textAlign: textAlign,
              overflow: overflow,
              maxLines: maxLines,
              style: GoogleFonts.spaceGrotesk(
                color: color,
                fontSize: size.sp(context),
                fontStyle: isItalic ? FontStyle.italic : null,
                fontWeight: fontWeight,
                height: height,
                letterSpacing: letterSpacing,
                decoration: isUnderLine ? TextDecoration.underline : null,
                decorationThickness: 1,
                decorationColor: underLineClr,
              ),
            ),
    );
  }
}
