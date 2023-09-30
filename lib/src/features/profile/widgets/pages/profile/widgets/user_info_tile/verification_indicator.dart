import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class UserVerificationIndicator extends StatelessWidget {
  final bool isVerified;

  const UserVerificationIndicator.verified({super.key}) : isVerified = true;

  const UserVerificationIndicator.unverified({super.key}) : isVerified = false;

  LinearGradient get _gradient => isVerified ? $GreenGradient : $OrangeGradient;

  String _getLabel(BuildContext context) {
    if (isVerified) return context.locales.profile_verify_user;

    return context.locales.profile_verified_user;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(kRadiusS),
              gradient: _gradient,
            ),
            child: VectorPicture.asset(
              Assets.icons.exclamationMark,
              height: 12,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(width: kSpacingXS),
        Flexible(
          child: Text(
            _getLabel(context),
            style: context.bodyStyles.m.copyWith(
              color: context.textColors.secondary,
            ),
          ),
        )
      ],
    );
  }
}
