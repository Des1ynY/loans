import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../spacing.dart';
import '../../../../theme.dart';
import 'adaptive_underline_border.dart';

typedef TextInputCallback<T> = T Function(String? value);

class TextInputFieldBase extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputType? keyboardType;
  final TextCapitalization capitalization;
  final TextInputAction? inputAction;
  final List<TextInputFormatter> formatters;

  final int minLines;
  final int? maxLines;

  final bool autofocus;
  final bool enabled;

  final TextInputCallback<String?>? validator;
  final TextInputCallback<void>? onSubmitted;

  final String? hintText;
  final EdgeInsets scrollPadding;

  const TextInputFieldBase({
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.capitalization = TextCapitalization.none,
    this.inputAction,
    this.formatters = const <TextInputFormatter>[],
    this.minLines = 1,
    this.maxLines = 1,
    this.autofocus = false,
    this.enabled = true,
    this.validator,
    this.onSubmitted,
    this.hintText,
    this.scrollPadding = const EdgeInsets.only(bottom: kSpacingL),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final defaultHintTextColor = context.textColors.tertiary;
    final hintTextColor = enabled
        ? defaultHintTextColor
        : defaultHintTextColor.withAlpha(defaultHintTextColor.alpha ~/ 2);

    return TextFormField(
      enabled: enabled,
      autofocus: autofocus,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textCapitalization: capitalization,
      textInputAction: inputAction,
      inputFormatters: formatters,
      keyboardAppearance: context.theme.brightness,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      cursorWidth: 1,
      cursorColor: context.surfaceColors.invert,
      scrollPadding: scrollPadding,
      style: context.bodyStyles.xl.copyWith(color: context.textColors.primary, height: 1),
      decoration: InputDecoration(
        isDense: true,
        border: AdaptiveUnderlineBorder(context.colors, controller),
        contentPadding: const EdgeInsets.only(bottom: kSpacingS),
        hintText: hintText,
        hintStyle: context.bodyStyles.xl.copyWith(color: hintTextColor),
        errorStyle: context.bodyStyles.m.copyWith(color: context.textColors.danger),
      ),
    );
  }
}
