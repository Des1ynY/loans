import 'package:flutter/material.dart';

import '../../../../spacing.dart';
import '../../../../theme.dart';
import 'adaptive_underline_border.dart';
import 'text_input_field_base.dart';

class CodeInputFieldBase extends StatefulWidget {
  final int codeLength;
  final TextInputCallback<void>? onSubmitted;

  const CodeInputFieldBase({
    required this.codeLength,
    this.onSubmitted,
    super.key,
  });

  @override
  State<CodeInputFieldBase> createState() => _CodeInputFieldBaseState();
}

class _CodeInputFieldBaseState extends State<CodeInputFieldBase> {
  late final List<TextEditingController> _cellControllers;
  late final List<FocusNode> _cellsFocuses;

  final _controller = TextEditingController();

  void _updateActiveCell() {
    final currentIndex = _controller.text.length;

    if (currentIndex == 0) return;

    final nextCell = _cellsFocuses.elementAtOrNull(currentIndex);

    if (nextCell != null) return FocusScope.of(context).requestFocus(nextCell);

    widget.onSubmitted?.call(_controller.text);
    FocusScope.of(context).unfocus();
    for (final conroller in _cellControllers) {
      conroller.clear();
    }
    _controller.clear();
  }

  @override
  void initState() {
    super.initState();
    _cellControllers = List.generate(widget.codeLength, (index) => TextEditingController());
    _cellsFocuses = List.generate(widget.codeLength, (index) => FocusNode());
    _controller.addListener(_updateActiveCell);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.codeLength,
        (index) => Padding(
          padding: EdgeInsets.only(right: index != widget.codeLength - 1 ? kSpacingXS : 0),
          child: _CodeSymbolCell(
            controller: _cellControllers[index],
            focusNode: _cellsFocuses[index],
            onChanged: (value) => _controller.text = _controller.text + (value ?? ''),
            key: ValueKey(index),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.codeLength; i++) {
      _cellControllers[i].dispose();
      _cellsFocuses[i].dispose();
    }

    _controller.dispose();
    super.dispose();
  }
}

class _CodeSymbolCell extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputCallback<void> onChanged;

  const _CodeSymbolCell({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        cursorWidth: 1,
        textAlign: TextAlign.center,
        cursorColor: context.surfaceColors.invert,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 48,
          fontFamily: $MainFontFamily,
          fontWeight: FontWeight.w800,
          letterSpacing: -3,
          height: 1,
          color: context.textColors.primary,
        ),
        decoration: InputDecoration(
          isDense: true,
          border: AdaptiveUnderlineBorder(context.colors),
          contentPadding: const EdgeInsets.only(bottom: kSpacingS),
        ),
      ),
    );
  }
}
