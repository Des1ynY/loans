import 'package:flutter/material.dart';
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/verification/widgets/bordered_text.dart';
import 'package:loans/src/features/verification/widgets/close_verification_button.dart';
import 'package:loans/src/features/verification/widgets/pages/passport_verification/widgets/verification_form/passport_verification_form.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class PassportVerificationPage extends StatelessWidget {
  const PassportVerificationPage({super.key});

  void _proceedToLocationVerification(BuildContext context) {
    context.router.go('/profile/verification/location');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.sizeOf(context).height / 1.5,
            child: Image.asset(Assets.images.passport.path, fit: BoxFit.cover),
          ),
          Positioned(
            top: MediaQuery.viewPaddingOf(context).top,
            child: const CloseVerificationButton(),
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.7,
            initialChildSize: 0.7,
            builder: (context, scrollController) => DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: kRadiusM, topRight: kRadiusM),
                color: context.surfaceColors.primary,
              ),
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(kSpacingL),
                children: [
                  Text(
                    context.locales.passport_verification_page_title,
                    style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
                  ),
                  const SizedBox(height: kSpacingXL),
                  const PassportVerificationForm(),
                  const SizedBox(height: kSpacingXL),
                  BorderedText(context.locales.passport_verification_warning),
                  const SizedBox(height: kSpacingXL),
                  Button.large(
                    onPressed: () => _proceedToLocationVerification(context),
                    caption: context.locales.passport_verification_submit,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}