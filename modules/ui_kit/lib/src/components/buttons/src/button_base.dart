import 'package:flutter/material.dart' hide ButtonStyle;

import '../../../../constants.dart';
import '../../../../spacing.dart';
import '../../../theme/theme.dart';
import 'button_style.dart';

class ButtonBase extends StatelessWidget {
  final VoidCallback? onPressed;

  final String? caption;
  final Widget? leading;
  final Widget? trailing;

  final ButtonStyle style;
  final ButtonSize size;

  final Color? backgroundColor;
  final Color? captionColor;

  const ButtonBase({
    required this.onPressed,
    required this.style,
    required this.size,
    this.caption,
    this.leading,
    this.trailing,
    this.backgroundColor,
    this.captionColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    final backgroundColor = context.colors.backgroundColorFrom(style, disabled: isDisabled);
    final captionColor = context.colors.foregroundColorFrom(style, disabled: isDisabled);
    final captionStyle = context.texts.captionStyleFrom(size);

    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      constraints: size.buttonConstraints,
      fillColor: this.backgroundColor ?? backgroundColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(kRadiusM)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
          ],
          if (caption != null) ...[
            const SizedBox(width: kSpacingXS),
            Text(caption!, style: captionStyle.copyWith(color: this.captionColor ?? captionColor)),
            const SizedBox(width: kSpacingXS),
          ],
          if (trailing != null) ...[
            trailing!,
          ],
        ],
      ),
    );
  }
}
