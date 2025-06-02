import 'package:flutter/widgets.dart';

extension ResponsiveText on num {
  double sp(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).size.width / 428;
    return this * scaleFactor;
  }
}

bool? isResponseBlank(dynamic value) {
  if (value is String) {
    return value.toString().trim().isEmpty;
  }
  if (value is Iterable || value is Map) {
    return value.isEmpty as bool?;
  }
  return false;
}

extension ColorFilterExtension on Color {
  ColorFilter toSvgColor() {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}
