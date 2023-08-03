import 'package:flutter/material.dart' hide ButtonStyle;

import '../../../../constants.dart';
import '../../../theme/theme.dart';
import 'button_style.dart';

class IconButtonBase extends StatelessWidget {
  final VoidCallback? onPressed;

  final Widget? icon;

  final ButtonStyle style;
  final ButtonSize size;

  const IconButtonBase({
    required this.onPressed,
    required this.style,
    required this.size,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    final backgroundColor = context.colors.backgroundColorFrom(style, disabled: isDisabled);

    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      constraints: size.buttonConstraints,
      fillColor: backgroundColor,
      splashColor: context.colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(kRadiusM)),
      child: icon,
    );
  }
}
