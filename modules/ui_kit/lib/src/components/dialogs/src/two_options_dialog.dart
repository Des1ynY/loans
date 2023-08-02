import 'package:flutter/widgets.dart';

import '../../../../spacing.dart';
import '../../buttons/src/button_base.dart';
import '../../buttons/src/button_style.dart';
import 'base_dialog.dart';
import 'dialog_icon.dart';

class TwoOptionsDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final IconData? icon;

  final DialogAction? action;
  final DialogAction? cancel;

  final Color? accentColor;
  final Color? captionColor;

  const TwoOptionsDialog({
    this.title,
    this.message,
    this.icon,
    this.action,
    this.cancel,
    this.accentColor,
    this.captionColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: title,
      message: message,
      onClose: cancel?.callback,
      icon: icon != null ? DialogIcon(icon: icon!, backgroundColor: accentColor) : null,
      actions: [
        if (action != null) ...[
          ButtonBase(
            onPressed: action!.callback,
            style: ButtonStyle.primary,
            size: ButtonSize.large,
            caption: action!.caption,
            backgroundColor: accentColor,
            captionColor: captionColor,
          ),
          if (cancel != null) const SizedBox(height: kSpacingS)
        ],
        if (cancel != null) ...[
          ButtonBase(
            onPressed: cancel!.callback,
            style: ButtonStyle.tertiary,
            size: ButtonSize.large,
            caption: cancel!.caption,
          ),
        ],
      ],
    );
  }
}
