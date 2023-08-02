import 'package:flutter/widgets.dart';

import '../../../theme/theme.dart';

class DialogIcon extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;

  const DialogIcon({
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 56,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: backgroundColor ?? context.surfaceColors.invert,
        ),
        child: Center(
          child: Icon(
            icon,
            size: 36,
            color: iconColor ?? context.surfaceColors.primary,
          ),
        ),
      ),
    );
  }
}
