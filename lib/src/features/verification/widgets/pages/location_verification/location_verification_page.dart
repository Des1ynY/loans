import 'package:flutter/material.dart';
import 'package:loans/src/features/verification/widgets/pages/location_verification/widgets/verification_form/location_verification_form.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class LocationVerificationPage extends StatelessWidget {
  const LocationVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.sizeOf(context).height / 2.5,
            child: Image.asset(Assets.images.passport.path),
          ),
          Positioned.fill(
            top: null,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: kRadiusM, topRight: kRadiusM),
                color: context.surfaceColors.primary,
              ),
              child: Column(
                children: [
                  Text(
                    context.locales.location_verification_page_title,
                    style: context.headerStyles.h1.copyWith(color: context.textColors.primary),
                  ),
                  const SizedBox(height: kSpacingXL),
                  const LocationVerificationForm(),
                  const SizedBox(height: kSpacingXL),
                  Button.large(
                    onPressed: () {},
                    caption: context.locales.location_verification_submit,
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
