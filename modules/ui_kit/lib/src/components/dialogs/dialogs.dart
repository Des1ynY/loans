import 'package:flutter/material.dart' hide ButtonStyle;

import '../../../components.dart';
import '../../../spacing.dart';
import '../../theme/theme.dart';

export 'src/base_dialog.dart' show DialogAction;
export 'src/dialog_icon.dart';
export 'src/two_options_dialog.dart';

class SuccessDialog extends TwoOptionsDialog {
  const SuccessDialog._({
    super.title,
    super.message,
    super.icon,
    super.action,
    super.cancel,
    super.accentColor,
    super.captionColor,
  });

  static Future<T?> show<T extends Object?>(
    BuildContext context, {
    String? title,
    String? message,
    IconData? icon,
    DialogAction? action,
    DialogAction? cancel,
    bool dismissable = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissable,
      barrierColor: context.surfaceColors.quaternary,
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(kSpacingS),
          child: SuccessDialog._(
            title: title,
            message: message,
            icon: icon,
            action: action,
            cancel: cancel,
            accentColor: context.surfaceColors.success,
            captionColor: context.textColors.primary,
          ),
        ),
      ),
    );
  }
}

class WarningDialog extends TwoOptionsDialog {
  const WarningDialog._({
    super.title,
    super.message,
    super.icon,
    super.action,
    super.cancel,
    super.accentColor,
    super.captionColor,
  });

  static Future<T?> show<T extends Object?>(
    BuildContext context, {
    String? title,
    String? message,
    IconData? icon,
    DialogAction? action,
    DialogAction? cancel,
    bool dismissable = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissable,
      barrierColor: context.surfaceColors.quaternary,
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(kSpacingS),
          child: WarningDialog._(
            title: title,
            message: message,
            icon: icon,
            action: action,
            cancel: cancel,
            accentColor: context.surfaceColors.danger,
            captionColor: context.textColors.primary,
          ),
        ),
      ),
    );
  }
}

class LoaderDialog extends LoadingIndicator {
  const LoaderDialog({
    super.foregroundColor,
    super.backgroundColor,
    super.size,
    super.strokeWidth,
    super.repeatDuration,
    super.key,
  });

  static const largeSize = 108.0;
  static const mediumSize = 64.0;
  static const smallSize = LoadingIndicator.defaultSize;

  static void show(
    BuildContext context, {
    Color? foregroundColor,
    Color? backgroundColor,
    double size = LoaderDialog.largeSize,
    double strokeWidth = LoadingIndicator.defaultStrokeWidth,
    Duration repeatDuration = LoadingIndicator.defaultRepeatDuration,
    bool dismissable = false,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: dismissable,
      barrierColor: context.surfaceColors.quaternary,
      builder: (context) => LoaderDialog(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        size: size,
        strokeWidth: strokeWidth,
        repeatDuration: repeatDuration,
      ),
    );
  }
}
