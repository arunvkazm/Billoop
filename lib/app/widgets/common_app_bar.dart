
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';
import '../theme/app_colors.dart';
import 'common_image.dart';
import 'common_text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final bool isBackIconVisible;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? backIconClr;
  final Color? titleClr;
  final double elevation;
  final PreferredSizeWidget? bottom;

  const CommonAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.isBackIconVisible = true,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.backgroundColor,
    this.backIconClr,
    this.titleClr,
    this.elevation = 0,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(
    bottom == null ? kToolbarHeight : kToolbarHeight + bottom!.preferredSize.height,
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? CommonText.semiBold(title!,size: 20,color: titleClr??onSurfaceClr,) : null,
      centerTitle: centerTitle,

      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: isBackIconVisible? automaticallyImplyLeading
          ? IconButton(
        icon: CommonImage.svg(
          Assets.svgRightArrow.path,
          color:backIconClr?? onSurfaceClr,
        ),
        onPressed: () => Get.back(),
      )
          : null:null,
      actions: actions,
      backgroundColor: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      elevation: elevation,
      bottom: bottom,
    );
  }
}
