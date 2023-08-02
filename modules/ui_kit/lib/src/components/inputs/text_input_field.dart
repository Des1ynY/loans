import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../spacing.dart';
import '../../../theme.dart';
import 'src/code_input_field_base.dart';
import 'src/text_input_field_base.dart';

export 'src/text_input_field_base.dart' show TextInputCallback;

// Code inputs

class CodeInputField extends CodeInputFieldBase {
  const CodeInputField({
    required super.codeLength,
    super.controller,
    super.keyboardType,
    super.inputAction,
    super.autofocus,
    super.key,
  });

  @override
  CodeInputFieldState createState() => CodeInputFieldState();
}

class CodeInputFieldState extends CodeInputFieldBaseState {}

// Text inputs

class TextInputField extends TextInputFieldBase {
  const TextInputField({
    super.controller,
    super.focusNode,
    super.keyboardType,
    super.capitalization,
    super.inputAction,
    super.formatters,
    super.minLines,
    super.maxLines,
    super.autofocus,
    super.enabled,
    super.validator,
    super.onSubmitted,
    super.hintText,
    super.scrollPadding,
    super.key,
  });

  const factory TextInputField.labeled({
    required String label,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization capitalization,
    TextInputAction? inputAction,
    List<TextInputFormatter> formatters,
    int minLines,
    int? maxLines,
    bool autofocus,
    bool enabled,
    TextInputCallback<String?>? validator,
    TextInputCallback<void>? onSubmitted,
    String? hintText,
    EdgeInsets scrollPadding,
    Key? key,
  }) = _LabeledTextInputField;
}

class _LabeledTextInputField extends TextInputField {
  final String label;

  const _LabeledTextInputField({
    required this.label,
    super.controller,
    super.focusNode,
    super.keyboardType,
    super.capitalization,
    super.inputAction,
    super.formatters,
    super.minLines,
    super.maxLines,
    super.autofocus,
    super.enabled,
    super.validator,
    super.onSubmitted,
    super.hintText,
    super.scrollPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
          style: context.bodyStyles.m.copyWith(color: context.textColors.tertiary),
        ),
        const SizedBox(height: kSpacingM),
        super.build(context),
      ],
    );
  }
}
