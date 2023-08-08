import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:loans/src/features/verification/widgets/bordered_text.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class VerificationOfferPage extends StatelessWidget {
  const VerificationOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            bottom: MediaQuery.sizeOf(context).height / 2,
            child: Image.asset(
              Assets.images.passport.path,
              fit: BoxFit.cover,
            ),
          ),
          DecoratedBox(
            decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: kRadiusM,
                  topRight: kRadiusM,
                ),
              ),
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
                    onPressed: () {},
                    caption: context.locales.verification_offer_start,
                  ),
                  const SizedBox(height: 8),
                  Button.large(
                    onPressed: () {},
                    caption: context.locales.verification_offer_skip,
                    style: ButtonStyle.tertiary,
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
