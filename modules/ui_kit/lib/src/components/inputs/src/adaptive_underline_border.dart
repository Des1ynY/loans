import 'package:flutter/material.dart';

import '../../../../theme.dart';

class AdaptiveUnderlineBorder extends MaterialStateUnderlineInputBorder {
  final ColorsScheme _colors;

  const AdaptiveUnderlineBorder(ColorsScheme colors) : _colors = colors;

  @override
  InputBorder resolve(Set<MaterialState> states) {
    final BorderSide borderSide;

    if (states.contains(MaterialState.disabled)) {
      final color = _colors.border.primary;

      borderSide = BorderSide(color: color.withAlpha(color.alpha ~/ 2));
    } else if (states.contains(MaterialState.focused)) {
      borderSide = BorderSide(color: _colors.surface.invert);
    } else {
      borderSide = BorderSide(color: _colors.border.primary);
    }

    return UnderlineInputBorder(borderSide: borderSide);
  }
}
