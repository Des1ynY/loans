import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/verification/widgets/bordered_text.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class VerificationOfferPage extends StatelessWidget {
  const VerificationOfferPage({super.key});

  void _proceedToVerification(BuildContext context) {
    context.router.go('/profile/verification/user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            bottom: MediaQuery.sizeOf(context).height / 2.5,
            child: Image.asset(Assets.images.passport.path, fit: BoxFit.cover),
          ),
          Positioned.fill(
            top: null,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: kRadiusM, topRight: kRadiusM),
                color: context.surfaceColors.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(kSpacingL),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.locales.verification_offer_page_title,
                      style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
                    ),
                    const SizedBox(height: kSpacingM),
                    Text(
                      context.locales.verification_offer_subtitle,
                      style: context.bodyStyles.l.copyWith(color: context.textColors.secondary),
                    ),
                    const SizedBox(height: kSpacingM),
                    BorderedText(context.locales.verification_offer_warning),
                    const SizedBox(height: kSpacingXL),
                    Button.large(
                      onPressed: () => _proceedToVerification(context),
                      caption: context.locales.verification_offer_start,
                    ),
                    const SizedBox(height: 8),
                    Button.large(
                      onPressed: () => context.router.pop(),
                      caption: context.locales.verification_offer_skip,
                      style: ButtonStyle.tertiary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
