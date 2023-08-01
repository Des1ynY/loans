import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class PhoneVerificationPageTitle extends StatelessWidget {
  final String phone;

  const PhoneVerificationPageTitle({required this.phone, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.locales.phone_verification_page_title,
          textAlign: TextAlign.center,
          style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
        ),
        const SizedBox(height: kSpacingS),
        Text(
          context.locales.phone_verification_page_subtitle(phone),
          textAlign: TextAlign.center,
          style: context.bodyStyles.m.copyWith(color: context.textColors.primary),
        ),
      ],
    );
  }
}
