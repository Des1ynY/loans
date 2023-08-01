import 'package:flutter/material.dart' hide IconButton, ButtonStyle;

import '../../../../constants.dart';
import '../../../../spacing.dart';
import '../../../theme/theme.dart';
import '../../buttons/button.dart';

typedef DialogAction = ({String caption, VoidCallback callback});

class BaseDialog extends StatelessWidget {
  final String? title;
  final String? message;

  final Widget? icon;
  final List<Widget> actions;

  final VoidCallback? onClose;

  const BaseDialog({
    this.title,
    this.message,
    this.icon,
    this.actions = const <Widget>[],
    this.onClose,
    super.key,
  });

  bool get _hasDisplayContent => title != null || message != null || icon != null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(kRadiusM),
          border: Border(top: BorderSide(color: context.borderColors.primary)),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                if (title != null) ...[
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 48),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style:
                          context.bodyStyles.mSemiBold.copyWith(color: context.textColors.primary),
                    ),
                  ),
                  const SizedBox(height: kSpacingXL),
                ],
                if (icon != null) ...[
                  icon!,
                  const SizedBox(height: kSpacingL),
                ],
                if (message != null) ...[
                  Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: context.headerStyles.h3.copyWith(color: context.textColors.primary),
                  ),
                ],
                if (_hasDisplayContent) const SizedBox(height: kSpacingXXL),
                ...actions,
              ],
            ),
            if (_hasDisplayContent && onClose != null) ...[
              IconButton.medium(
                onPressed: onClose,
                style: ButtonStyle.tertiary,
                icon: const Icon(Icons.close, size: 24),
              )
            ],
          ],
        ),
      ),
    );
  }
}
