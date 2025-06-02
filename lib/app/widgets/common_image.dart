import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_colors.dart';

class CommonImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;
  final VoidCallback? onTap;

  const CommonImage._({
    required this.imagePath,
    this.width = 24,
    this.height = 24,
    this.fit = BoxFit.cover,
    this.color,
    this.onTap,
  });

  factory CommonImage.asset(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    VoidCallback? onTap,
  }) {
    return CommonImage._(
      imagePath: path,
      width: width,
      height: height,
      fit: fit,
      color: color,
      onTap: onTap,
    );
  }

  factory CommonImage.network(
    String url, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    VoidCallback? onTap,
  }) {
    return CommonImage._(
      imagePath: url,
      width: width,
      height: height,
      fit: fit,
      color: color,
      onTap: onTap,
    );
  }

  factory CommonImage.svg(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Color? color,
    VoidCallback? onTap,
  }) {
    return CommonImage._(
      imagePath: path,
      width: width,
      height: height,
      fit: fit,
      color: color,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imagePath.endsWith('.svg')) {
      imageWidget = SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    } else if (imagePath.startsWith('http')) {
      imageWidget = CachedNetworkImage(
        imageUrl: imagePath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        progressIndicatorBuilder: (m, url, prog) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child:
                    Platform.isIOS
                        ? const CircularProgressIndicator.adaptive(
                          backgroundColor: primaryClr,
                        )
                        : const CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        },
        errorWidget: (context, url, error) => const Icon(Icons.broken_image),
      );
    } else {
      imageWidget = Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }

    return GestureDetector(onTap: onTap, child: imageWidget);
  }
}
