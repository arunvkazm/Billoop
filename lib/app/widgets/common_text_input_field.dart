import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscure;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? _fieldKey;
  final ValueChanged<String>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int minLines;
  final double? mPadding;
  final List<TextInputFormatter> inputFormatters;
  final bool isReadOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final BoxConstraints iconConstraints;
  final String obscuringCharacter;
  final Iterable<String>? autofillHints;
  final bool isCanSee;
  final double? borderRadius;
  final double? borderWidth;
  final Widget Function(
    BuildContext, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  })?
  buildCounter;
  final TextCapitalization? textCapitalization;

  final Color? borderColor;
  final Color? focusBorderClr;

  final Color? bgColor;

  const CommonTextField({
    required this.controller,
    this.labelText = "",
    GlobalKey<FormFieldState>? globalKey,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputAction = TextInputAction.next,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines = 1,
    this.isReadOnly = false,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.onTap,
    this.iconConstraints = const BoxConstraints(maxWidth: 160),
    super.key,
    this.obscuringCharacter = '•',
    this.autofillHints,
    this.isCanSee = false,
    this.buildCounter,
    this.mPadding,
    this.borderRadius,
    this.textCapitalization,
    this.borderColor = outlineClr,
    this.focusBorderClr = primaryClr,
    this.bgColor = surfaceClr,
    this.borderWidth,
  }) : _fieldKey = globalKey;

  @override
  Widget build(BuildContext context) {
    var borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      borderSide: BorderSide(
        color: borderColor!.withValues(alpha: 0.5),
        width: borderWidth ?? 1,
      ),
    );

    var errorBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      borderSide: BorderSide(
        color: errorClr.withValues(alpha: 0.5),
        width: borderWidth ?? 1,
      ),
    );

    var focusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      borderSide: BorderSide(
        color: focusBorderClr ?? secondaryClr,
        width: borderWidth ?? 1,
      ),
    );

    var errorFocusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 12),
      borderSide: BorderSide(color: errorClr, width: borderWidth ?? 1),
    );

    return TextFormField(
      onTap: onTap,
      key: _fieldKey,
      validator: validator,
      obscuringCharacter: obscuringCharacter,
      textInputAction: inputAction,
      onFieldSubmitted: fieldSubmitted,
      controller: controller,
      focusNode: focus,
      obscureText: obscure,
      onChanged: onChanged,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      buildCounter: buildCounter,
      style: GoogleFonts.spaceGrotesk(
        color: onSurfaceClr,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      minLines: minLines,
      readOnly: isReadOnly,
      cursorColor: primaryClr,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(mPadding ?? 16),
        hintText: hintText,
        prefix: prefix,
        suffix: suffix,
        errorMaxLines: 4,
        hintTextDirection: TextDirection.ltr,
        hintStyle: GoogleFonts.spaceGrotesk(
          color: outlineClr.withValues(alpha: 0.6),
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        errorStyle: GoogleFonts.spaceGrotesk(
          color: errorClr,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        border: borderStyle,
        errorBorder: errorBorderStyle,
        focusedBorder: focusedBorderStyle,
        focusedErrorBorder: errorFocusedBorderStyle,
        enabledBorder: borderStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: bgColor ?? surfaceClr,
        filled: true,
        prefixIconConstraints: iconConstraints,
        suffixIconConstraints: iconConstraints,
      ),
    );
  }
}
