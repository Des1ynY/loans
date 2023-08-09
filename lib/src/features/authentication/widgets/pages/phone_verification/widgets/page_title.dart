import 'package:flutter/widgets.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/phone_verification_page_scope.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class PhoneVerificationPageTitle extends StatefulWidget {
  const PhoneVerificationPageTitle({super.key});

  @override
  State<PhoneVerificationPageTitle> createState() => _PhoneVerificationPageTitleState();
}

class _PhoneVerificationPageTitleState extends State<PhoneVerificationPageTitle> {
  late String phone;

  @override
  void didChangeDependencies() {
    phone = PhoneVerificationPageScope.phoneOf(context);
    super.didChangeDependencies();
  }

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
          style: context.bodyStyles.m.copyWith(color: context.textColors.secondary),
        ),
      ],
    );
  }
}
