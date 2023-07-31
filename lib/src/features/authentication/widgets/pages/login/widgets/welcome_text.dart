import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/theme.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.locales.welcome_first_row,
          textAlign: TextAlign.center,
          style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
        ),
        if (context.locales.welcome_second_row.isNotEmpty) ...[
          Text(
            context.locales.welcome_second_row,
            textAlign: TextAlign.center,
            style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
          ),
        ],
        if (context.locales.welcome_third_row.isNotEmpty) ...[
          Text(
            context.locales.welcome_third_row,
            textAlign: TextAlign.center,
            style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
          ),
        ],
      ],
    );
  }
}
