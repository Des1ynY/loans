import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/theme.dart';

class LoginPageTitle extends StatelessWidget {
  const LoginPageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.locales.login_page_title_first_row,
          textAlign: TextAlign.center,
          style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
        ),
        if (context.locales.login_page_title_second_row.isNotEmpty) ...[
          Text(
            context.locales.login_page_title_second_row,
            textAlign: TextAlign.center,
            style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
          ),
        ],
        if (context.locales.login_page_title_third_row.isNotEmpty) ...[
          Text(
            context.locales.login_page_title_third_row,
            textAlign: TextAlign.center,
            style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
          ),
        ],
      ],
    );
  }
}
