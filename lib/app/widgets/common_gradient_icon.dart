import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'common_image.dart';

class GradientIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final double size;
  final double padding;
  final Color iconBaseColor;

  const GradientIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = 50.0,
    this.padding = 0.0,
    this.iconBaseColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradClr1.withValues(alpha: 0.1),
            gradClr2.withValues(alpha: 0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 1.0],
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        iconSize: size * 0.6,
        onPressed: onPressed,
        icon: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [gradClr1, gradClr2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 1.0],
            ).createShader(bounds);
          },
          child: CommonImage.svg(
            icon,
            width: size * 0.4,
            height: size * 0.4,
            color: iconBaseColor,
          ),
        ),
      ),
    );
  }
}
