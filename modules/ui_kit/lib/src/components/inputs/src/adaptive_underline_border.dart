import 'package:flutter/material.dart';

import '../../../../theme.dart';

class AdaptiveUnderlineBorder extends MaterialStateUnderlineInputBorder {
  final ColorsScheme _colors;
  final TextEditingController? _controller;

  const AdaptiveUnderlineBorder(
    ColorsScheme colors, [
    TextEditingController? controller,
  ])  : _colors = colors,
        _controller = controller;

  @override
  InputBorder resolve(Set<MaterialState> states) {
    final BorderSide borderSide;

    if (states.contains(MaterialState.disabled)) {
      final color = _colors.border.primary;

      borderSide = BorderSide(color: color.withAlpha(color.alpha ~/ 2));
    } else if (states.contains(MaterialState.focused) || (_controller?.text.isNotEmpty ?? false)) {
      borderSide = BorderSide(color: _colors.surface.invert);
    } else {
      borderSide = BorderSide(color: _colors.border.primary);
    }

    return UnderlineInputBorder(borderSide: borderSide);
  }
}
