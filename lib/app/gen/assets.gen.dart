/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class Assets {
  const Assets._();

  /// File path: assets/svg/about.svg
  static const SvgGenImage svgAbout = SvgGenImage('assets/svg/about.svg');

  /// File path: assets/svg/curly_arrow.svg
  static const SvgGenImage svgCurlyArrow = SvgGenImage(
    'assets/svg/curly_arrow.svg',
  );

  /// File path: assets/svg/dash_arrow.svg
  static const SvgGenImage svgDashArrow = SvgGenImage(
    'assets/svg/dash_arrow.svg',
  );

  /// File path: assets/svg/google.svg
  static const SvgGenImage svgGoogle = SvgGenImage('assets/svg/google.svg');

  /// File path: assets/svg/left_arrow.svg
  static const SvgGenImage svgLeftArrow = SvgGenImage(
    'assets/svg/left_arrow.svg',
  );

  /// File path: assets/svg/logout.svg
  static const SvgGenImage svgLogout = SvgGenImage('assets/svg/logout.svg');

  /// File path: assets/svg/mail.svg
  static const SvgGenImage svgMail = SvgGenImage('assets/svg/mail.svg');

  /// File path: assets/svg/message.svg
  static const SvgGenImage svgMessage = SvgGenImage('assets/svg/message.svg');

  /// File path: assets/svg/notification.svg
  static const SvgGenImage svgNotification = SvgGenImage(
    'assets/svg/notification.svg',
  );

  /// File path: assets/svg/onboard1.svg
  static const SvgGenImage svgOnboard1 = SvgGenImage('assets/svg/onboard1.svg');

  /// File path: assets/svg/onboard2.svg
  static const SvgGenImage svgOnboard2 = SvgGenImage('assets/svg/onboard2.svg');

  /// File path: assets/svg/onboard3.svg
  static const SvgGenImage svgOnboard3 = SvgGenImage('assets/svg/onboard3.svg');

  /// File path: assets/svg/onboard4.svg
  static const SvgGenImage svgOnboard4 = SvgGenImage('assets/svg/onboard4.svg');

  /// File path: assets/svg/onboarding5.svg
  static const SvgGenImage svgOnboarding5 = SvgGenImage(
    'assets/svg/onboarding5.svg',
  );

  /// File path: assets/svg/payment_history.svg
  static const SvgGenImage svgPaymentHistory = SvgGenImage(
    'assets/svg/payment_history.svg',
  );

  /// File path: assets/svg/phone.svg
  static const SvgGenImage svgPhone = SvgGenImage('assets/svg/phone.svg');

  /// File path: assets/svg/profile.svg
  static const SvgGenImage svgProfile = SvgGenImage('assets/svg/profile.svg');

  /// File path: assets/svg/recieve_money.svg
  static const SvgGenImage svgRecieveMoney = SvgGenImage(
    'assets/svg/recieve_money.svg',
  );

  /// File path: assets/svg/right_arrow.svg
  static const SvgGenImage svgRightArrow = SvgGenImage(
    'assets/svg/right_arrow.svg',
  );

  /// File path: assets/svg/search.svg
  static const SvgGenImage svgSearch = SvgGenImage('assets/svg/search.svg');

  /// File path: assets/svg/send_money.svg
  static const SvgGenImage svgSendMoney = SvgGenImage(
    'assets/svg/send_money.svg',
  );

  /// List of all assets
  static List<SvgGenImage> get values => [
    svgAbout,
    svgCurlyArrow,
    svgDashArrow,
    svgGoogle,
    svgLeftArrow,
    svgLogout,
    svgMail,
    svgMessage,
    svgNotification,
    svgOnboard1,
    svgOnboard2,
    svgOnboard3,
    svgOnboard4,
    svgOnboarding5,
    svgPaymentHistory,
    svgPhone,
    svgProfile,
    svgRecieveMoney,
    svgRightArrow,
    svgSearch,
    svgSendMoney,
  ];
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
