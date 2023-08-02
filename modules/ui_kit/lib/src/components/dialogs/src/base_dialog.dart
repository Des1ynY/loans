import 'dart:ui';

import 'package:flutter/material.dart' hide IconButton, ButtonStyle;

import '../../../../constants.dart';
import '../../../../spacing.dart';
import '../../../theme/theme.dart';

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
    return _DialogBackground(
      child: Padding(
        padding: const EdgeInsets.all(kSpacingM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null) ...[
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Center(
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: context.bodyStyles.mSemiBold.copyWith(color: context.textColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: kSpacingL),
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
      ),
    );
  }
}

class _DialogBackground extends StatelessWidget {
  final Widget child;

  const _DialogBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      shape: _shape,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: _shape,
              color: context.surfaceColors.tertiary,
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  static const _shape = RoundedRectangleBorder(borderRadius: BorderRadius.all(kRadiusM));
}
