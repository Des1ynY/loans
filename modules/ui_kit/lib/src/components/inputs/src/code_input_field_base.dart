import 'package:flutter/material.dart';

import '../../../../spacing.dart';
import '../../../../theme.dart';
import 'adaptive_underline_border.dart';
import 'text_input_field_base.dart';

class CodeInputFieldBase extends StatefulWidget {
  final int codeLength;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;

  final bool autofocus;

  const CodeInputFieldBase({
    required this.codeLength,
    this.controller,
    this.keyboardType,
    this.inputAction,
    this.autofocus = false,
    super.key,
  });

  @override
  CodeInputFieldBaseState createState() => CodeInputFieldBaseState();
}

class CodeInputFieldBaseState extends State<CodeInputFieldBase> {
  late final List<TextEditingController> _cellControllers;
  late final List<FocusNode> _cellsFocuses;
  late final TextEditingController _controller;

  void requestFocus() {
    final currentIndex = _controller.text.length;
    final nextCell = _cellsFocuses.elementAtOrNull(currentIndex) ?? _cellsFocuses.last;

    FocusScope.of(context).requestFocus(nextCell);
  }

  void clear() {
    FocusScope.of(context).unfocus();
    for (final controller in _cellControllers) {
      controller.clear();
    }
    _controller.clear();
  }

  void _updateActiveCell() {
    final currentIndex = _controller.text.length;

    if (currentIndex == 0) return;

    final nextCell = _cellsFocuses.elementAtOrNull(currentIndex);

    if (nextCell != null) FocusScope.of(context).requestFocus(nextCell);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _cellControllers = List.generate(widget.codeLength, (index) => TextEditingController());
    _cellsFocuses = List.generate(widget.codeLength, (index) => FocusNode());

    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_updateActiveCell);

    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) => requestFocus());
    }
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
          child: AbsorbPointer(
            absorbing: _controller.text.length != index,
            child: _CodeSymbolCell(
              key: ValueKey(index),
              controller: _cellControllers[index],
              focusNode: _cellsFocuses[index],
              onChanged: (value) => _controller.text += value ?? '',
              keyboardType: widget.keyboardType,
              inputAction:
                  index != widget.codeLength - 1 ? TextInputAction.none : widget.inputAction,
            ),
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

    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }
}

class _CodeSymbolCell extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputCallback<void> onChanged;

  final TextInputType? keyboardType;
  final TextInputAction? inputAction;

  const _CodeSymbolCell({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    this.keyboardType,
    this.inputAction,
    super.key,
  });

  Widget? _buildCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        cursorWidth: 1,
        keyboardType: keyboardType,
        textInputAction: inputAction,
        buildCounter: _buildCounter,
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
          border: AdaptiveUnderlineBorder(context.colors, controller),
          contentPadding: const EdgeInsets.only(bottom: kSpacingS),
        ),
      ),
    );
  }
}
